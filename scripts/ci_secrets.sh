#!/usr/bin/env bash
set -euo pipefail

# ci_secrets.sh
#
# Manage repository secret files: bundle them into a compressed tar.xz and
# encrypt/decrypt the bundle using GPG symmetric encryption. The list of
# tracked secret files lives in ./ci/secret_files.yaml
# All secret operations (including temporary files) occur inside ./ci.
#
# Usage (non-interactive):
#   scripts/ci_secrets.sh encrypt
#   scripts/ci_secrets.sh decrypt
#   scripts/ci_secrets.sh list
# Otherwise run with no arguments for an interactive menu.
#
# Environment variables:
#   SECRETS_PASSPHRASE  If set, provides the GPG passphrase non-interactively
#                       (CI friendly). Not echoed. If unset, GPG prompts.
#
# secret_files.yaml structure:
#   files:
#     - app/android/your_keystore.jks
#     - app/android/key.properties
# Lines starting with # or blank lines are ignored.
# Requires: gpg, tar, yq, xz

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd -- "${SCRIPT_DIR}/.." && pwd)"
CI_DIR="${REPO_ROOT}/ci"
ENCRYPTED_FILE="${CI_DIR}/secrets.enc"
TEMP_DIR="${CI_DIR}"
SECRET_FILES_YAML="${CI_DIR}/secret_files.yaml"

declare -a SECRET_FILES=()

load_secret_files() {
	if [[ ${#SECRET_FILES[@]} -gt 0 ]]; then
		return 0
	fi
	if [[ ! -f "${SECRET_FILES_YAML}" ]]; then
		echo "ERROR: Secret files YAML not found: ${SECRET_FILES_YAML}" >&2
		echo "Create it with contents like:" >&2
		echo "files:" >&2
		echo "  - app/android/your_keystore.jks" >&2
		echo "  - app/android/key.properties" >&2
		exit 1
	fi
	if ! command -v yq >/dev/null 2>&1; then
		echo "ERROR: yq not found in PATH (required to parse ${SECRET_FILES_YAML})." >&2
		echo "Install: https://github.com/mikefarah/yq#install" >&2
		exit 1
	fi
	local yaml_path
	yaml_path="$(_normalize_path "${SECRET_FILES_YAML}")"
	mapfile -t SECRET_FILES < <(yq -r '.files[]' "${yaml_path}" 2>/dev/null | sed 's#^\./##') || true
	if [[ ${#SECRET_FILES[@]} -eq 0 ]]; then
		echo "ERROR: No entries parsed from ${SECRET_FILES_YAML}." >&2
		echo "Ensure it contains a 'files:' key with a YAML list." >&2
		exit 1
	fi
}

ensure_tools() {
	local missing=0 t
	for t in gpg tar yq xz; do
		if ! command -v "$t" >/dev/null 2>&1; then
			missing=1
			case "$t" in
			gpg) echo "ERROR: gpg not found. Install GnuPG: https://gnupg.org/download/" >&2 ;;
			tar) echo "ERROR: tar not found in PATH." >&2 ;;
			yq) echo "ERROR: yq not found. Install: https://github.com/mikefarah/yq#install" >&2 ;;
			xz) echo "ERROR: xz not found (compression)." >&2 ;;
			esac
		fi
	done
	[[ $missing -eq 0 ]] || exit 1
}

_normalize_path() {
	local p="$1"
	if command -v cygpath >/dev/null 2>&1 && uname -s | grep -qi 'CYGWIN'; then
		cygpath -w "$p"
	else
		printf '%s' "$p"
	fi
}

_gpg_run_passphrase() {
	local mode="$1" in_file="$2" out_file="$3"
	local gpg_in gpg_out
	gpg_in="$(_normalize_path "$in_file")"
	gpg_out="$(_normalize_path "$out_file")"

	# Use environment variable or let GPG prompt
	local pass_source="${SECRETS_PASSPHRASE:-}"

	if [[ "$mode" == encrypt ]]; then
		if [[ -n "$pass_source" ]]; then
			printf '%s\n' "$pass_source" | gpg --batch --yes --quiet --cipher-algo AES256 --symmetric --no-symkey-cache --passphrase-fd 0 --output "$gpg_out" "$gpg_in"
		else
			gpg --cipher-algo AES256 --symmetric --no-symkey-cache --output "$gpg_out" "$gpg_in"
		fi
	else
		if [[ -n "$pass_source" ]]; then
			printf '%s\n' "$pass_source" | gpg --batch --yes --quiet --decrypt --no-symkey-cache --passphrase-fd 0 --output "$gpg_out" "$gpg_in"
		else
			gpg --decrypt --no-symkey-cache --output "$gpg_out" "$gpg_in"
		fi
	fi
}

_gpg_encrypt_passphrase() { _gpg_run_passphrase encrypt "$@"; }
_gpg_decrypt_passphrase() { _gpg_run_passphrase decrypt "$@"; }

secure_delete() {
	local f="$1"
	[[ -f "$f" ]] || return 0
	if command -v shred >/dev/null 2>&1; then
		shred -u "$f" || rm -f "$f"
	else
		rm -f "$f"
	fi
}

_mktemp_file() {
	local ext ts rand suffix
	ext="${1:-}"
	mkdir -p "${TEMP_DIR}"
	ts="$(date +%s 2>/dev/null || echo 0)"
	rand="${RANDOM:-0}"
	suffix="secrets_${$}_${ts}_${rand}${ext}"
	echo "${TEMP_DIR}/${suffix}"
}

list_files() {
	ensure_tools
	load_secret_files
	echo "Tracked secret files:" >&2
	for f in "${SECRET_FILES[@]}"; do
		local status
		if [[ -f "${REPO_ROOT}/${f}" ]]; then status="OK"; else status="MISSING"; fi
		printf "  - %s (%s)\n" "$f" "$status"
	done
}

encrypt_secrets() {
	ensure_tools
	load_secret_files
	mkdir -p "${CI_DIR}"
	list_files
	local missing=0 f
	for f in "${SECRET_FILES[@]}"; do
		if [[ ! -f "${REPO_ROOT}/${f}" ]]; then
			echo "ERROR: Missing file: $f" >&2
			missing=1
		fi
	done
	if [[ $missing -eq 1 ]]; then
		echo "Aborting due to missing files." >&2
		exit 1
	fi
	if [[ -f "${ENCRYPTED_FILE}" ]]; then
		read -r -p "Encrypted file exists. Overwrite? [y/N] " ans
		[[ ${ans:-} =~ ^[Yy]$ ]] || {
			echo "Abort."
			return
		}
	fi
	local tmp_archive out_tmp
	tmp_archive=$(_mktemp_file ".tar.xz")
	rm -f "$tmp_archive"
	(
		cd "${REPO_ROOT}" && XZ_OPT="-9e" tar -c --xz -f "$tmp_archive" "${SECRET_FILES[@]}"
	)
	echo "Archive created (tar --xz, XZ_OPT='-9e')." >&2
	echo "Encrypting with GPG (symmetric encryption)." >&2
	out_tmp="${ENCRYPTED_FILE}.tmp"
	rm -f "$out_tmp"
	if ! _gpg_encrypt_passphrase "$tmp_archive" "$out_tmp"; then
		echo "ERROR: GPG symmetric encryption failed." >&2
		secure_delete "$tmp_archive"
		rm -f "$out_tmp"
		exit 1
	fi
	mv "$out_tmp" "$ENCRYPTED_FILE"
	secure_delete "$tmp_archive"
	echo "Created: ${ENCRYPTED_FILE}" >&2
}

decrypt_secrets() {
	ensure_tools
	load_secret_files
	if [[ ! -f "${ENCRYPTED_FILE}" ]]; then
		echo "ERROR: Encrypted file not found: ${ENCRYPTED_FILE}" >&2
		exit 1
	fi
	local tmp_archive
	tmp_archive=$(_mktemp_file ".tar.xz")
	rm -f "$tmp_archive"
	echo "Decrypting with GPG (symmetric decryption)." >&2
	if ! _gpg_decrypt_passphrase "${ENCRYPTED_FILE}" "$tmp_archive"; then
		echo "ERROR: GPG decryption failed (wrong passphrase or corrupt file)." >&2
		secure_delete "$tmp_archive"
		exit 1
	fi
	echo "Decrypting into repo root..." >&2
	(
		cd "${REPO_ROOT}" || exit 1
		tar -x --xz -f "$tmp_archive"
	)
	secure_delete "$tmp_archive"
	echo "Secrets restored." >&2
}

menu() {
	while true; do
		echo
		echo "CI Secrets Manager (GPG)"
		echo "========================"
		echo "1) Encrypt & bundle secrets"
		echo "2) Decrypt & restore secrets"
		echo "3) List tracked secret files"
		echo "4) Exit"
		read -r -p "Choose an option: " choice
		case "$choice" in
		1) encrypt_secrets ;;
		2) decrypt_secrets ;;
		3) list_files ;;
		4) exit 0 ;;
		*) echo "Invalid option" >&2 ;;
		esac
	done
}

main() {
	cd "$REPO_ROOT"
	local cmd="${1:-}"
	case "$cmd" in
	encrypt) encrypt_secrets ;;
	decrypt) decrypt_secrets ;;
	list) list_files ;;
	"") menu ;;
	*)
		echo "Unknown command: $cmd" >&2
		echo "Usage: $0 [encrypt|decrypt|list]" >&2
		echo "       $0                        (interactive menu)" >&2
		echo "" >&2
		echo "To provide passphrase non-interactively, use:" >&2
		echo "  SECRETS_PASSPHRASE='your_passphrase' $0 encrypt" >&2
		exit 1
		;;
	esac
}

main "$@"

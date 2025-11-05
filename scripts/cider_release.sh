#!/usr/bin/env bash

# Release helper script: bumps the version using cider and can create
# a release commit + annotated tag after an interactive review.
#
# Features:
#   - Interactive mode (run with no arguments) to choose part & prerelease id
#   - Non-interactive mode: pass <part> and optional --pre=<id>
#   - Ensures CHANGELOG.md and pubspec.yaml are changed before tagging
#   - Safe guards: required tools check, tag existence check
#
# Exit codes: non‑zero on validation or tooling errors.

set -euo pipefail

PROJECT_APP_DIR="./app"
CHANGELOG_FILE="app/CHANGELOG.md"
PUBSPEC_FILE="app/pubspec.yaml"

PART=""
PRE_VALUE=""
INTERACTIVE=0

parts_list=(breaking major minor patch build pre release)

# Internal state variables
FIRST_RELEASE=0
NEW_VERSION=""

color_yellow="\033[33m"
color_green="\033[32m"
color_red="\033[31m"
color_dim="\033[2m"
color_reset="\033[0m"

# Ensure workspace is in a clean state before performing a bump.
# Conditions:
#   - Staging area must be empty (no staged changes)
#   - Required files must exist
#   - Required files must have no unstaged/staged/untracked modifications
preflight_clean_checks() {
	# 1. Staging area empty
	if ! git diff --cached --quiet; then
		die "Git staging area not empty. Please unstage or commit changes first."
	fi

	# 2. pubspec must exist & be clean
	[ -f "$PUBSPEC_FILE" ] || die "Required file '$PUBSPEC_FILE' not found"
	if [[ -n "$(git status --porcelain -- "$PUBSPEC_FILE")" ]]; then
		die "File '$PUBSPEC_FILE' has local changes. Please commit/stash/reset before running release script."
	fi

	# 3. changelog: if present it must be clean (created automatically on first release if missing)
	if [ -f "$CHANGELOG_FILE" ]; then
		if [[ -n "$(git status --porcelain -- "$CHANGELOG_FILE")" ]]; then
			die "File '$CHANGELOG_FILE' has local changes. Please commit/stash/reset before running release script."
		fi
	fi
}

usage() {
	cat <<USAGE
Usage (non-interactive): $0 <part> [--pre <id> | --pre=<id>]
Or run with no arguments for interactive mode.

Parts:
	breaking  (bump y for 0.y.z, bump x for x.y.z)
	major
	minor
	patch
	build
	pre       (pre-release bump)
	release   (remove pre-release qualifier)

Examples:
	$0 minor --pre=alpha
	$0 patch
	$0            (interactive)
USAGE
}

err() { echo -e "${color_red}Error:${color_reset} $*" >&2; }
die() {
	err "$*"
	exit 1
}

require_cmd() {
	command -v "$1" >/dev/null 2>&1 || die "Required command '$1' not found in PATH"
}

get_version() { yq e '.version' "$PROJECT_APP_DIR/pubspec.yaml" | xargs; }

has_build_part() {
	local version
	version="$(get_version)"
	[[ "$version" == *"+"* ]]
}

validate_part() {
	local p="$1"
	for x in "${parts_list[@]}"; do [ "$x" = "$p" ] && return 0; done
	return 1
}

select_part_interactive() {
	echo "Select part to bump:"
	local i=1
	for p in "${parts_list[@]}"; do
		printf "  [%d] %s\n" "$i" "$p"
		i=$((i + 1))
	done
	local sel
	while true; do
		read -r -p "Enter number or name: " sel
		if validate_part "$sel"; then
			PART="$sel"
			break
		fi
		if [[ "$sel" =~ ^[0-9]+$ ]] && [ "$sel" -ge 1 ] && [ "$sel" -le ${#parts_list[@]} ]; then
			PART="${parts_list[$((sel - 1))]}"
			break
		fi
		echo "Invalid selection."
	done
}

prompt_pre_value() {
	read -r -p "Enter prerelease identifier (blank for none): " PRE_VALUE || true
	PRE_VALUE="${PRE_VALUE// /}" # trim spaces
}

handle_first_release() {
	echo -e "${color_yellow}This appears to be the first release (no build number detected).${color_reset}"
	current_version="$(get_version)"
	echo "Skipping part selection for first release."

	prompt_pre_value

	# Calculate the exact new version string
	if [ -n "$PRE_VALUE" ]; then
		NEW_VERSION="${current_version}-${PRE_VALUE}+1"
		echo "Will create first pre-release: ${NEW_VERSION}"
	else
		NEW_VERSION="${current_version}+1"
		echo "Will create first release: ${NEW_VERSION}"
	fi

	# Mark this as a first release for the version bump logic
	FIRST_RELEASE=1
}

parse_args() {
	if [ "$#" -eq 0 ]; then
		INTERACTIVE=1
		return 0
	fi
	PART="$1"
	shift || true
	validate_part "$PART" || {
		usage
		die "Invalid part: $PART"
	}
	while [ "$#" -gt 0 ]; do
		case "$1" in
		--pre=*)
			PRE_VALUE="${1#*=}"
			shift
			;;
		--pre)
			shift
			[ "$#" -gt 0 ] || die "--pre requires a value"
			PRE_VALUE="$1"
			shift
			;;
		-h | --help)
			usage
			exit 0
			;;
		*) die "Unknown option: $1" ;;
		esac
	done
}

confirm() { # usage: confirm "message"; returns 0 if yes
	local ans
	read -r -p "$1 (type \"yes\" to accept): " ans || true
	[[ "$ans" == "yes" ]]
}

create_release_commit_and_tag() {
	local version tag
	version="$(get_version)" || die "Failed to obtain version"
	[ -n "$version" ] || die "Version empty"
	tag="v$version"
	echo "Detected version: $version"
	if git rev-parse -q --verify "refs/tags/$tag" >/dev/null; then
		die "Tag $tag already exists"
	fi

	# pubspec MUST be changed
	if [[ -z "$(git status --porcelain -- "$PUBSPEC_FILE")" ]]; then
		die "Required release file unchanged: $PUBSPEC_FILE"
	fi

	# Changelog: include if it exists and has changes (auto-created on first release)
	local add_files=("$PUBSPEC_FILE")
	if [ -f "$CHANGELOG_FILE" ] && [[ -n "$(git status --porcelain -- "$CHANGELOG_FILE")" ]]; then
		add_files+=("$CHANGELOG_FILE")
	fi

	local release_msg="release $tag"
	local commit_msg="chore: $release_msg"
	echo "Creating commit: $commit_msg"
	git add "${add_files[@]}"
	git commit -m "$commit_msg"
	git tag -a "$tag" -m "$release_msg"
	echo -e "${color_green}Created annotated tag $tag${color_reset}"
	git --no-pager log -1 --decorate --oneline
}

main() {
	require_cmd yq
	require_cmd cider
	require_cmd git

	# Run preflight cleanliness checks before parsing args & interactive selection
	preflight_clean_checks

	parse_args "$@"

	if [ "$INTERACTIVE" -eq 1 ]; then
		echo -e "${color_dim}Interactive mode${color_reset}"
		# Show current version to give context before selecting bump part
		current_version="$(get_version || true)"
		if [ -n "$current_version" ]; then
			echo "Current version: $current_version"
		else
			echo "Current version: (unavailable)"
		fi

		# Check if this is a first release (no build part)
		if ! has_build_part; then
			handle_first_release
		else
			select_part_interactive
			prompt_pre_value
		fi
	fi

	# Build prerelease args
	local pre_args=()
	if [ -n "$PRE_VALUE" ]; then
		pre_args=("--pre=$PRE_VALUE")
	fi

	local old_version new_version
	old_version="$(get_version)"
	[ -n "$old_version" ] || die "Could not read current version"

	# Track whether changelog existed beforehand for potential rollback
	local CHANGELOG_EXISTED_BEFORE=0
	[ -f "$CHANGELOG_FILE" ] && CHANGELOG_EXISTED_BEFORE=1

	if [ "$FIRST_RELEASE" -eq 1 ]; then
		# First release: use cider version to set exact version
		echo "Setting version directly to: $NEW_VERSION"
		cider version --project-root="$PROJECT_APP_DIR" "$NEW_VERSION"
	else
		# Subsequent releases: use cider bump
		echo "Running cider bump ($PART) ..."
		cider bump --project-root="$PROJECT_APP_DIR" "$PART" "${pre_args[@]}" --bump-build
	fi

	cider release --project-root="$PROJECT_APP_DIR"
	new_version="$(get_version)"

	echo -e "${color_yellow}Version updated: $old_version -> $new_version${color_reset}"

	if [ "$INTERACTIVE" -eq 1 ]; then
		echo
		echo "Review changes in:"
		if [ -f "$CHANGELOG_FILE" ]; then
			echo "  - $CHANGELOG_FILE"
		fi
		echo "  - $PUBSPEC_FILE"
		echo
		if confirm "Proceed with creating the release commit and tag?"; then
			create_release_commit_and_tag
			echo
			echo -e "${color_green}Release commit and tag created, run ${color_yellow}git push --follow-tags${color_green} to publish${color_reset}"
			echo
		else
			echo -e "${color_dim}Aborted creating commit/tag. Reverting version bump changes...${color_reset}"
			# Revert pubspec.yaml
			git restore -- "$PUBSPEC_FILE" || true
			# Handle changelog: if it existed, restore; if newly created remove
			if [ "$CHANGELOG_EXISTED_BEFORE" -eq 1 ]; then
				git restore -- "$CHANGELOG_FILE" 2>/dev/null || true
			else
				[ -f "$CHANGELOG_FILE" ] && rm -f "$CHANGELOG_FILE"
			fi
			echo -e "${color_dim}Reverted local changes.${color_reset}"
		fi
	fi
}

main "$@"

exit 0

#!/usr/bin/env bash

set -euo pipefail

# Normalize paths for Cygwin: convert to Windows style but keep forward slashes
_normalize_path_windows() {
	local p="$1"
	if command -v cygpath >/dev/null 2>&1 && uname -s | grep -qi 'CYGWIN'; then
		cygpath -w -a "$p" | tr '\\' '/'
	else
		printf '%s' "$p"
	fi
}

# Create a gzipped tarball from a list of relative paths
# Usage: create_tarball <output.tar.gz> <path1> [path2] [path3] ...
create_tarball() {
	if [[ $# -lt 2 ]]; then
		echo "ERROR: create_tarball requires at least 2 arguments: output file and at least one path" >&2
		echo "Usage: create_tarball <output.tar.gz> <path1> [path2] [path3] ..." >&2
		return 1
	fi

	local output="$1"
	shift
	local paths=("$@")

	# Validate that all input paths exist
	local missing_paths=()
	for path in "${paths[@]}"; do
		if [[ ! -e "$path" ]]; then
			missing_paths+=("$path")
		fi
	done

	if [[ ${#missing_paths[@]} -gt 0 ]]; then
		echo "ERROR: The following paths do not exist:" >&2
		printf "  - %s\n" "${missing_paths[@]}" >&2
		return 1
	fi

	# Ensure output directory exists
	local output_dir
	output_dir="$(dirname "$output")"
	mkdir -p "$output_dir"

	# Create tarball with temporary file for atomic operation
	local temp_output="${output}.tmp"

	echo "Creating tarball: $output" >&2
	echo "Including paths:" >&2
	printf "  - %s\n" "${paths[@]}" >&2

	if tar -czf "$temp_output" "${paths[@]}"; then
		mv "$temp_output" "$output"
		echo "Successfully created: $output" >&2
	else
		echo "ERROR: Failed to create tarball" >&2
		rm -f "$temp_output"
		return 1
	fi
}

# OUTPUT_ARTIFACTS_DIR is the root directory for build artifacts
OUTPUT_ARTIFACTS_DIR="build_artifacts"
ANDROID_OUTPUT_ARTIFACTS_DIR="$OUTPUT_ARTIFACTS_DIR/android"

flutter_build() {
	local build_target="$1"
	local output_dir="$2"

	# Use 'fvm flutter' when FVM is available, otherwise fall back to system 'flutter'.
	local flutter_cmd="fvm flutter"
	if ! command -v fvm >/dev/null 2>&1; then
		echo "INFO: 'fvm' not found, using system 'flutter'" >&2
		flutter_cmd="flutter"
	fi

	(
		cd "./app" || exit 1
		$flutter_cmd build $build_target \
			--obfuscate \
			--split-debug-info="$output_dir/symbols" \
			--extra-gen-snapshot-options=--save-obfuscation-map="$output_dir/map.json"
	)
}

build_android() {
	local windows_absolute_path=$(_normalize_path_windows "$ANDROID_OUTPUT_ARTIFACTS_DIR")
	local build_dir="./app/build/app/outputs"
	local tarball="android_build_artifacts.tar.gz"

	mkdir -p "$ANDROID_OUTPUT_ARTIFACTS_DIR"

	# Remove everything in ANDROID_OUTPUT_ARTIFACTS_DIR except the top-level symbols/ directory and map.json
	# https://github.com/flutter/flutter/issues/124141
	find "$ANDROID_OUTPUT_ARTIFACTS_DIR" -mindepth 1 -maxdepth 1 ! -name 'symbols' ! -name 'map.json' -exec rm -rf -- {} +

	# Remove existing tarball if it exists
	rm -f "$OUTPUT_ARTIFACTS_DIR/$tarball"
	rm -f "$OUTPUT_ARTIFACTS_DIR/$tarball.tmp"

	flutter_build "appbundle" "$windows_absolute_path"
	flutter_build "apk" "$windows_absolute_path"

	ln "$build_dir/bundle/release/app-release.aab" "$windows_absolute_path/app-release.aab"
	ln "$build_dir/flutter-apk/app-release.apk" "$windows_absolute_path/app-release.apk"
	ln "$build_dir/mapping/release/mapping.txt" "$windows_absolute_path/mapping.txt"

	(
		cd "$OUTPUT_ARTIFACTS_DIR" &&
			create_tarball "$tarball" android
	)
}

build_android

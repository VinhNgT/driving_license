#!/bin/bash

# Wrapper for the `cider` CLI to append a changelog entry for the Flutter app
# located in ./app.

set -e

#############################################
# Interactive helpers
#############################################

TYPES=(added changed deprecated fixed removed security)

print_usage() {
	cat <<USAGE
Usage:
  $0 <type> <description>
  $0 <type>              (will prompt for description if TTY)
  $0                     (fully interactive mode if TTY)

type must be one of:
	added        Add a new feature to the changelog
	changed      Add a new change to the changelog
	deprecated   Add a new deprecation to the changelog
	fixed        Add a new bug fix to the changelog
	removed      Add a new removal to the changelog
	security     Add a new security fix to the changelog

description should be a short text describing the change (can contain spaces).

Interactive modes:
  No args: choose type & enter description.
  One arg (type only): just prompted for description.
Non-interactive contexts require both arguments.
USAGE
}

is_valid_type() {
	local t="$1"
	for allowed in "${TYPES[@]}"; do
		[ "$t" = "$allowed" ] && return 0
	done
	return 1
}

ask_description() {
	while :; do
		read -r -p "Short description: " DESCRIPTION
		[ -n "$DESCRIPTION" ] && break
		echo "Description cannot be empty." >&2
	done
}

interactive_mode() {
	echo "Entering interactive mode (no arguments provided)." >&2
	echo
	echo "Select change type:" >&2
	local index=1
	for t in "${TYPES[@]}"; do
		printf '  %d) %s\n' "$index" "$t" >&2
		index=$((index + 1))
	done

	local choice
	while :; do
		read -r -p "Type number (1-${#TYPES[@]}): " choice
		# Allow entering the literal string as well
		if is_valid_type "$choice"; then
			CHANGE_TYPE="$choice"
			break
		fi
		if [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -ge 1 ] && [ "$choice" -le ${#TYPES[@]} ]; then
			CHANGE_TYPE="${TYPES[$((choice - 1))]}"
			break
		fi
		echo "Invalid selection. Try again." >&2
	done

	echo "Selected change type: $CHANGE_TYPE" >&2
	ask_description
}

PROJECT_APP_DIR="./app"

case "$#" in
0)
	if [ -t 0 ] && [ -t 1 ]; then
		interactive_mode
	else
		print_usage
		exit 1
	fi
	;;
1)
	if [ -t 0 ] && [ -t 1 ]; then
		CHANGE_TYPE="$1"
		if ! is_valid_type "$CHANGE_TYPE"; then
			echo "Invalid type: $CHANGE_TYPE" >&2
			print_usage
			exit 1
		fi
		echo "Selected change type: $CHANGE_TYPE" >&2
		ask_description
	else
		# Non-interactive environment needs both args
		print_usage
		exit 1
	fi
	;;
*)
	:
	;;
esac

if [ -z "$CHANGE_TYPE" ]; then
	CHANGE_TYPE="$1"
	shift || true
fi
if [ -z "$DESCRIPTION" ]; then
	DESCRIPTION="$*"
fi

case "$CHANGE_TYPE" in
added | changed | deprecated | fixed | removed | security) ;;
*)
	printf 'Invalid type: %s\n\n' "$CHANGE_TYPE"
	printf 'Allowed types: added, changed, deprecated, fixed, removed, security\n'
	exit 1
	;;
esac

cider log --project-root="$PROJECT_APP_DIR" "$CHANGE_TYPE" "$DESCRIPTION"
echo -e "\033[32mAdded changelog entry: [$CHANGE_TYPE] $DESCRIPTION\033[0m"

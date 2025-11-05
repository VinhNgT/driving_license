#!/bin/bash
set -e

# Check if required commands are installed.
for cmd in fvm uv; do
    if ! command -v $cmd &>/dev/null; then
        echo "$cmd is not installed. Please install $cmd before running this script."
        exit 1
    fi
done

# FVM configuration.
echo "Configuring FVM..."
fvm use

# Python configuration (uv)
echo "Configuring Python environment with uv..."
uv venv --clear
uv sync

# Git configuration
# echo "Configuring Git hooks..."
# git config core.hooksPath .githooks

# Cleanup
echo -e "\033[32mBootstrapping done!\033[0m"

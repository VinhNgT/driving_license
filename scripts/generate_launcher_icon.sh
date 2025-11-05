#!/usr/bin/env bash

set -euo pipefail

cd app

# Please configure flutter_launcher_icons.yaml and flutter_native_splash.yaml
# before running this script.

echo "Running icons_launcher:create..."
dart run icons_launcher:create
# echo
# echo "Running flutter_native_splash..."
# dart run flutter_native_splash:create

#!/bin/bash

set -e

cd app
dart run slang
# dart run slang analyze --split --full
dart run slang normalize

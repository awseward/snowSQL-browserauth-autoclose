#!/usr/bin/env bash

# Outputs a tampermonkey userscript with a minified body to STDOUT.

set -euo pipefail

./build.sh

temp="$(mktemp)"
yuicompressor ./dist/main.js > "$temp"
cat "$temp" > ./dist/main.js

dhall text < UserScript.dhall

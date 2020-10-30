#!/usr/bin/env bash

# Outputs a tampermonkey userscript with a minified body to STDOUT.

set -euo pipefail

./build.sh

dhall text < UserScript.dhall

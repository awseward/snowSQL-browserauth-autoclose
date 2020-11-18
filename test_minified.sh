#!/usr/bin/env bash

set -euo pipefail

nim js --outdir:.test/ main.nim

temp="$(mktemp)"
yuicompressor .test/main.js > "$temp"
cat "$temp" > .test/main.js

open .test/index.html

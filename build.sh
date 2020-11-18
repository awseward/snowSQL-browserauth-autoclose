#!/usr/bin/env bash

set -euo pipefail

nim js --outdir:dist/ main.nim
echo 'main();' >> ./dist/main.js

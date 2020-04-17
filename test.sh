#!/usr/bin/env bash

set -euo pipefail

nim js --outdir:.test/ main.nim && open .test/index.html

nim_main := main.nim
temp_dir := $(shell mktemp -d)
temp_js  := ${temp_dir}/main.js

# ---

dist_dir := ./dist
dist_js  := ${dist_dir}/main.js

export USERSCRIPT_VERSION = $(shell date -u +%Y%m%d%H%M%S)_$(shell git rev-parse HEAD)

print-minified: ${dist_js}
	yuicompressor "${dist_js}" > "${temp_js}" && cat "${temp_js}" > "${dist_js}"
	dhall text < UserScript.dhall

print: ${dist_js}
	dhall text < UserScript.dhall

${dist_js}:
	nim js --outdir:${dist_dir} ${nim_main}
	echo 'main();' >> ${dist_js}

# ---

test_dir  := .test
test_html := ${test_dir}/index.html
test_js   := ${test_dir}/main.js

test-minified: ${test_js}
	yuicompressor "${test_js}" > "${temp_js}" && cat "${temp_js}" > "${test_js}"
	open "${test_html}"

test: ${test_js}
	open "${test_html}"

${test_js}: .FORCE
	nim js --outdir:${test_dir} ${nim_main}

.FORCE:

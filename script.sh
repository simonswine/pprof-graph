#!/usr/bin/env bash
#

set -e
set -u
set -o pipefail


# create new checkout of pprof
CHECKOUT_PATH=$(mktemp -d)

git clone git@github.com:google/pprof.git "${CHECKOUT_PATH}"

# move into directory
cd "${CHECKOUT_PATH}"

# filter to graph package
git filter-repo --subdirectory-filter internal/graph/
git filter-repo --path graph.go --path graph_test.go

bash

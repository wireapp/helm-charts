#!/usr/bin/env bash

set -xeo pipefail

USAGE="$0 <chart-name> <repo-name>"
chart_name=${1:?$USAGE}
repo_name=${2:?$USAGE}

cd "charts/$chart_name"

helm dependency build
helm package .
helm s3 push --relative "$tgz" "$PUBLIC_DIR"

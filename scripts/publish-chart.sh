#!/usr/bin/env bash

set -xeo pipefail

USAGE="$0 <chart-name> <chart-version> <s3-url>"
chart_name=${1:?$USAGE}
chart_version=${2:?$USAGE}
s3_url=${3:?$USAGE}

./scripts/set-chart-version.sh "$chart_name" "$chart_version"

helm repo add "job-chart-repo" "$s3_url"

cd "charts/$chart_name"
helm dependency update
rm ./*.tgz &> /dev/null || true
helm package .
tarball=$(ls "${chart_name}"-*.tgz)

helm s3 push --relative "$tarball" "job-chart-repo"

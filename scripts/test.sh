#!/usr/bin/env bash
#!/usr/bin/env bash

s3_url="s3://public.wire.com/charts-stefan"
./scripts/publish-chart.sh databases-ephemeral 1.0.2 "$s3_url"

#!/bin/sh 
curl -i \
        -H "Private-Token: $METRICS_ACCESS_TOKEN" \
        -H "Content-type: text/plain" \
        -d @.metrics.json \
        "https://nightly.metrics.ca/api/v1/lintConfig"

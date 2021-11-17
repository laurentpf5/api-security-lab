#/bin/bash
KIBANA_URL=http://localhost:5601
jq -s . false-positives-dashboards.ndjson | jq '{"objects": . }' | curl -k --location --request POST "$KIBANA_URL/api/kibana/dashboards/import"     --header 'kbn-xsrf: true'     --header 'Content-Type: text/plain' -d @-     | jq
jq -s . overview-dashboard.ndjson | jq '{"objects": . }' | curl -k --location --request POST "$KIBANA_URL/api/kibana/dashboards/import"     --header 'kbn-xsrf: true'     --header 'Content-Type: text/plain' -d @-     | jq

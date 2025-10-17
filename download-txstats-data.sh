#!/bin/bash


#declare -a FILES=(
  # use in https://luke.dashjr.org/programs/bitcoin/files/charts/historical.html
  # format: timestamp, listening nodes, total nodes
#  "history.txt"
#)
curl $'https://txstats.com/api/datasources/proxy/1/query?db=p2shinfo&q=SELECT%20mean(%22high%22)%20FROM%20%22fee_estimations%22%20WHERE%20(%22source%22%20\u0021%3D%20%27btc.com%27)%20AND%20time%20%3E%3D%201662785773175ms%20and%20time%20%3C%3D%201662805170102ms%20GROUP%20BY%20time(1h)%2C%20%22source%22%20fill(null)&epoch=ms' \
  -H 'Accept: application/json, text/plain, */*' \
  -H 'Accept-Language: de-DE,de;q=0.9,en-US;q=0.8,en;q=0.7,und;q=0.6,vi;q=0.5' \
  -H 'Cache-Control: no-cache' \
  -H 'Connection: keep-alive' \
  -H 'Cookie: grafana_sess=b42d87d441415207' \
  -H 'DNT: 1' \
  -H 'Pragma: no-cache' \
  -H 'Referer: https://txstats.com/dashboard/db/fee-estimation?panelId=3&fullscreen&orgId=1&from=1662785773175&to=1662805170102' \
  -H 'Sec-Fetch-Dest: empty' \
  -H 'Sec-Fetch-Mode: cors' \
  -H 'Sec-Fetch-Site: same-origin' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.134 Safari/537.36' \
  -H 'X-Grafana-Org-Id: 1' \
  --compressed > file.json
cat file.json | jq '[.results[].series[] | [ { name: .tags.source, time: .values[][0], value: .values[][1] } ] ]'


#for file in ${FILES[@]}; do
#  wget -O $file $URL/$file
#done

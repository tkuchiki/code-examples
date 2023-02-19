echo "[" $(echo {1..1000000} | tr ' ' ',') "]" > /tmp/array.json
echo '{"array": null}' | jq --slurpfile array /tmp/array.json '.array = $array[0]'

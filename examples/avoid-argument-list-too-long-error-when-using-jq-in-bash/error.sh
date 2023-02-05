array=$(echo "[" $(echo {1..1000000} | tr ' ' ',') "]")
echo '{"array": null}' | jq --arg array "${array}" '.array = $array'

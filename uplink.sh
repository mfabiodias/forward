#! /bin/bash 
# Usage: ./lora-uplink-emulator [interaction quantity]
# You may have to change dev_eui

mqtt_url=mosquitto
mqtt_auth=123
dev_eui=3aa1dd2da13c67a7
encoded_dev_eui=`echo $dev_eui | xxd -r -p | base64`
for ((i=0; i < $1; i++))
  do 
    timestamp=$(date +%s)
    published_at=$(date -u '+%Y-%m-%dT%H:%M:%S%z' -d "@$timestamp")
    payload=$(openssl rand -base64 21)
    mosquitto_pub \
    -h ''$mqtt_url'' \
    -p '1883' \
    -u ''$mqtt_auth'' \
    -t accounting/private-cloud/''$dev_eui''/event/up \
    -m '{"applicationID":"51","applicationName":"homologation-617715-a-1468-d-3906-c-0380-ebc","deviceName":"twtg","devEUI":"'$encoded_dev_eui'","rxInfo":[{"gatewayID":"cHb/Aqyy/wA=","time":"2021-11-19T20:35:10.762203Z","timeSinceGPSEpoch":null,"rssi":-53,"loRaSNR":10,"channel":3,"rfChain":0,"board":3,"antenna":0,"location":{"latitude":-23.1696208,"longitude":-47.0695212,"altitude":700,"source":"UNKNOWN","accuracy":0},"fineTimestampType":"NONE","context":"IujWGw==","uplinkID":"'$(uuidgen)'","crcStatus":"CRC_OK"},{"gatewayID":"AACAApzHji4=","time":null,"timeSinceGPSEpoch":null,"rssi":-47,"loRaSNR":11.8,"channel":3,"rfChain":0,"board":0,"antenna":0,"location":{"latitude":-24.7300224,"longitude":-48.108265,"altitude":300,"source":"UNKNOWN","accuracy":0},"fineTimestampType":"NONE","context":"7k9Eww==","uplinkID":"uHbWQsmuS8K3ebKz8koEaA==","crcStatus":"CRC_OK"}],"txInfo":{"frequency":915800000,"modulation":"LORA","loRaModulationInfo":{"bandwidth":125,"spreadingFactor":7,"codeRate":"4/5","polarizationInversion":false}},"adr":true,"dr":5,"fCnt":0,"fPort":15,"data":"'$payload'","objectJSON":"","tags":{},"confirmedUplink":true,"devAddr":"4HVmyg==","publishedAt":"'$published_at'"}'
    echo ''$i' - uplink: '$dev_eui', published_at: '$published_at', payload: '$payload''
    sleep 2
done;
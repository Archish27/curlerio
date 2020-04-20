#!/bin/bash
start=$(date +%s)
if $1; then
    URL=http://archishthakkar2:698xhfyLX7zieapewH4f@hub-cloud.browserstack.com/wd/hub
    CAP='{"desiredCapabilities":{"browserName":"Chrome","os_version":"High Sierra","browser_version":"65.0","os":"OS X"}}'
    sessionId=$(curl -X POST "${URL}/session" -d "${CAP}" | jq -r '.sessionId')
else
  URL=http://127.0.0.1:4444/wd/hub
  CAP='{"desiredCapabilities":{"browserName":"chrome","platform":"MAC"}}'
  sessionId=$(curl -X POST "${URL}/session" -d "${CAP}" | jq -r '.value.sessionId')
fi
echo $URL

echo "Opening Session Id :  ${sessionId}"

echo $(curl -H 'Content-Type:application/json' -X POST $URL/session/$sessionId/url -d '{"url":"https://www.whatsmyip.org/"}')
if $1; then 
  elementId1=$(curl -X POST $URL/session/$sessionId/element -d '{"using":"css selector","value":"span#hostname"}'  | jq -r '.value.ELEMENT')
  ip=$(curl $URL/session/$sessionId/element/$elementId1/attribute/innerHTML | jq -r '.value')
  
else
  elementId1=$(curl -X POST $URL/session/$sessionId/element -d '{"using":"css selector","value":"span#hostname"}'  | sed 's/.*":"\(.*\)".*/\1/g')
  ip=$(curl $URL/session/$sessionId/element/$elementId1/attribute/innerHTML | jq -r '.value')
fi

stop_session=$(curl -X DELETE $URL/session/$sessionId)
duration=$(echo "$(date +%s) - $start" | bc)
execution_time=`printf "%.2f seconds" $duration`
echo "IP Address: $ip"
echo "RTT: $execution_time"

#!/bin/bash

if $1; then
  URL=http://archishthakkar2:698xhfyLX7zieapewH4f@hub-cloud.browserstack.com/wd/hub
  CAP='{"desiredCapabilities":{"browserName":"Chrome","os_version":"High Sierra","browser_version":"65.0","os":"OS X"}}'
  sessionId=$(curl -X POST "${URL}/session" -d "${CAP}" | tee /dev/tty | jq -r '.sessionId')
else
  URL=http://127.0.0.1:4444/wd/hub
  CAP='{"desiredCapabilities":{"browserName":"chrome","platform":"MAC"}}'
  sessionId=$(curl -X POST "${URL}/session" -d "${CAP}" | tee /dev/tty | jq -r '.value.sessionId')
fi

echo $URL

echo "Opening Session Id :  ${sessionId}"

echo $(curl -H 'Content-Type:application/json' -X POST $URL/session/$sessionId/url -d '{"url":"http://google.com"}')
if $1; then 
  elementId=$(curl -X POST $URL/session/$sessionId/element -d '{"using":"name","value":"q"}'  | jq -r '.value.ELEMENT')
  echo $(curl -X POST $URL/session/$sessionId/element/$elementId/value -d '{"value":["Archish Thakkar\n"]}')
else
  elementId=$(curl -X POST $URL/session/$sessionId/element -d '{"using":"css selector","value":"input.gLFyf.gsfi"}'  | sed 's/.*":"\(.*\)".*/\1/g')
  echo $(curl -X POST $URL/session/$sessionId/element/$elementId/value -d '{"text":"Archish Thakkar\n"}')
fi

title=$(curl $URL/session/$sessionId/title | jq -r '.value')
echo $title

stop_session=$(curl -X DELETE $URL/session/$sessionId)

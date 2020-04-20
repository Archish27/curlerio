JAVA=/usr/bin/java
SELENIUM_PATH=./bin/selenium-server-standalone-3.141.59.jar
CHROME_DRIVER=./bin/chromedriver
NODE_CONFIG=node.json

$JAVA -Dwebdriver.chrome.driver=$CHROME_DRIVER -jar $SELENIUM_PATH -role node -nodeConfig $NODE_CONFIG
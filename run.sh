#!/bin/bash

# 1 -> ipCheck
# 2 -> browserstack
# 3 -> parallelThreads
parallelThreads=1
browserstack=false
ipCheck=false
while [ "${1:-}" != "" ]; do
    case "$1" in
      "-ip" | "--ip-check")
        ipCheck=true
        ;;
      "-b" | "--browserstack")
        browserstack=true
        ;;
      "-p" | "--parallel-threads")
        shift
        parallelThreads=$1;;
    esac
    shift
  done

echo "$ipCheck $browserstack $parallelThreads"

while [ $parallelThreads -gt 0 ]
do
  
  if $ipCheck; then
    echo "Running IP Check...."
    ./get_ip.sh $browserstack &
    echo "called"
  else
    echo "Running Opening Chrome...."
    ./open_chrome.sh $browserstack &
  fi
  parallelThreads=`expr $parallelThreads - 1`
done



#!/bin/bash
#Description: Monitor Host IP
#Writen by wen (superyngo@gmail.com)
varSwitch=$(cat ./switch)
until [ $varSwitch == 0 ] 
do
  varMaxLine=$(grep -c "" MonitorIPList.txt)
  for ((x=1;x<=$varMaxLine;x++))
  do
    ping -c 1 -A -W 2 $(sed -n ${x}p MonitorIPList.txt) &> /dev/null
    [ $? == 1 ] && echo -e "$(sed -n ${x}p MonitorIPList.txt)\t$(date)" >> DeadHost.log
  done
  varSwitch=$(cat ./switch)
done  
exit 0

#!/bin/bash
#Description: 3-2-5 請設計一個網路主機監控程式，可監控網內或網外任意數量主機，並常駐於系統中，當發現系統無回應時應發出聲響，並於螢幕顯示該主機，且於 log紀錄主機資訊與發生時間。
#Writen by wen (superyngo@gmail.com)
function check_ip() {
    if [[ $1 =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
    IFS=. read FIELD1 FIELD2 FIELD3 FIELD4 <<< $1
      if [ $FIELD1 -le 255 -a $FIELD2 -le 255 -a $FIELD3 -le 255 -a $FIELD4 -le 255 ]; then
          echo "IP $1 available."
        else
          read -p "IP $1 not available!"&& return 1
       fi
    else
      read -p "IP format error!" && return 1
    fi
}
varChoice=0
until [ $varChoice -eq 7 ]
do
  clear
  echo " HOST MONITORING SYSTEMM"
  echo "=========================================="
  echo " 1)Show current monitoring ip list"
  echo " 2)Add new host"
  echo " 3)Edit monitoring ip list"
  echo " 4)Start monitoring"
  echo " 5)Stop monitoring"
  echo " 6)Show dead host logs"
  echo " 7)Exit."
  echo "=========================================="
  read -p "Select: " varChoice
  case $varChoice in 
    1)
      cat ./MonitorIPList.txt
      read -p "continue..."
    ;;
    2)
      read -p "Host ip: " varHostIP
      check_ip $varHostIP
      [ $? == 0 ] && echo $varHostIP >> ./MonitorIPList.txt && read -p "Host added."
    ;;
    3)
      vim ./MonitorIPList.txt
    ;;
    4)
      echo "1" > switch
      sh ./MonitorIP.sh &
      read -p "Monitoring started..."
    ;;
    5)
      echo "0" > switch
      read -p "Monitoring Stoped..."
    ;;
    6)
      cat ./DeadHost.log
      read -p "continue..."
    ;;
    7)
      read -p "Thank you, good bye!"
    ;;
    *)
      read -p "No such option"
    ;;    
  esac
done
exit 0

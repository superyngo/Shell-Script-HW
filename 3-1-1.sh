#!/bin/bash
#Description: 3-1-9 請設計網段計算程式，使用 read 分別輸入一 IP 與 Netmask，分別傳入兩個function 計算該 IP 是否正確以及該 IP 網段為何。
#Write by wen (superyngo@gmail.com)

function check_ip() {
      if [[ $1 =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
            IFS=. read FIELD1 FIELD2 FIELD3 FIELD4 <<< $1
            #FIELD1=$(echo $1|cut -d. -f1)
            #FIELD2=$(echo $1|cut -d. -f2)
            #FIELD3=$(echo $1|cut -d. -f3)
            #FIELD4=$(echo $1|cut -d. -f4)
            if [ $FIELD1 -le 255 -a $FIELD2 -le 255 -a $FIELD3 -le 255 -a $FIELD4 -le 255 ]; then
                  echo "IP $1 available."
            else
                  echo "IP $1 not available!"&& return 1
            fi
            else
            echo "IP format error!" && return 1
      fi
}
function show_network_ip(){
      if [ $2 -le 32 -a $2 -ge 1 ];then
        ipcalc -n $1/$2
      else
        echo "Netmask Wrong!"
      fi
}

read -p "IP: " varIP
check_ip $varIP
[ $? -ne 1 ] && read -p "Netmask prefix(1-32)" varNetmask && show_network_ip $varIP $varNetmask


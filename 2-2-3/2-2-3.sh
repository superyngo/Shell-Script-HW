#!/bin/bash
#Description: cm square and ping convertion
# 2-2-9 使用 shell 的呼叫並傳遞參數設計平方公尺與坪的雙向面積轉換程式。
#Write by wen (superyngo@gmail.com)
varKey=0
while [ $varKey -ne "3" ]
 do
   clear
   echo "=========================="
   echo "     (1) m square to ping"
   echo "     (2) Ping to cm square"
   echo "     (3) Exit"
   echo "=========================="
   read -p "Please chose the function: " varKey
   case $varKey in
     1 )
      echo ""
      read -p "How many m square? " varC
      re='^[0-9]+.?[0-9]*$'
      ! [[ "$varC" =~ $re ]] && read -p "Warning:must be number!" && varKey=0 && continue 1
      sh ./2-2-3m.sh $varC
      ;;
     2 )
      echo ""
      read -p "How many ping? " varPing
      re='^[0-9]+.?[0-9]*$'
      ! [[ "$varPing" =~ $re ]] && read -p "Warning:must be number!" && varKey=0 && continue 1
      sh ./2-2-3Ping.sh $varPing
      ;;
     3 )
       varKey=3
       echo ""
       ;;
     "" )
       echo -e "\n\aWarning:emty value"
       varKey=0
       ;;
     * )
       echo -e "\n\aWarning:No function in $varKey"
       varKey=0
       ;;
   esac
   read -n 1 -p "Press any key to continue..."
 done

 exit 0

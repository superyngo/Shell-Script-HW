#!/bin/bash
#Description: 2-2-8 使用 shell 的呼叫並傳遞參數設計男、女鞋碼對照程式 ( JP、US、UK、TW、KR、CN )。
#Write by wen (superyngo@gmail.com)

varKey=0
until [ $varKey -eq 3 ]
do
	clear
	echo "=========================="
	echo "      (1) Male"
	echo "      (2) Female"
	echo "      (3) Exit"
	echo "=========================="
	read -p "Please chose your gender: " varKey
	case $varKey in
		[12] )	
			sh ./2-2-2count.sh $varKey
		;;
		3 )
			continue
		;;
		* )
			echo ""
			read -p "Warning:no such option"
    ;;
    "" )
      varKey=0
      echo ""
      read -p "Warning:empty vale"
	esac
done

exit 0

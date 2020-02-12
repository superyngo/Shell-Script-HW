#!/bin/bash
#Description: 請設計一個新學生輸入程式，各筆資料需有班級、座號、姓名、性別，當輸入到班級而未輸入時，套用上一個學生的班級，當未輸入座號時，套用上一個學生的座號 + 1，姓名或性別 (0為女,1為男) 應強制輸入，不可為空值，每筆資料確認後輸出於 StudentsList.txt。
#Writen by wen (superyngo@gmail.com)
varChoice=0
until [ $varChoice -eq 3 ]
do
  clear
  echo "      STUDENT LIST KEY IN SYSTEM"
  echo "=========================================="
  echo " 1)Show current list in StudentsLists.txt"
  echo " 2)Add new students."
  echo " 3)Exit."
  echo "=========================================="
  read -p "Select: " varChoice
  case $varChoice in 
    1 )
      cat ./StudentsList.txt
      read -p "continue..."
    ;;
    2 )
      varLast=$(tail -n 1 ./StudentsList.txt)
      read varLastClass varLastNumber varLastName varLastGender <<< $varLast
      read -p "Class:[$varLastClass] " varClass
      [ -z $varClass ] && varClass=$varLastClass
      read -p "Number:[$((varLastNumber+1))] " varNumber
      [ -z $varNumber ] && let varNumber=$varLastNumber+1
      read -p "Name:(no empty) " varName
      [ -z $varName ] && read -p "Wrong:empty value!" && continue 1
      read -p "Gender:(1 for male, 2 for female) " varGender
      ! [[ $varGender =~ [1-2] ]] && read -p "Must be 1(male) or 2(female)!" && continue 1
      read -p "Write in the data?(y/n) " varWrite
      case $varWrite in
        y)
          echo -e "$varClass\t$varNumber\t$varName\t$varGender" >> ./StudentsList.txt && read -p "done..."
        ;;
        n)
          read -p "Data not written."
        ;;
        *)
          read -p "Operation canceled."
        ;;
      esac
    ;;
    3)
      echo "Thank you, good bye!"
    ;;
    *)
      read -p "No such option"
    ;;
  esac
done
exit 0

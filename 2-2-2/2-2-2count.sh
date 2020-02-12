#!/bin/bash
#Description: 2-2-8 使用 shell 的呼叫並傳遞參數設計男、女鞋碼對照程式 ( JP、US、UK、TW、KR、CN )。(使用內插法)
#鞋碼使用表：http://www.shoesizes.co/
#Write by wen (superyngo@gmail.com)
#各國尺寸對照表     (cm   日    韓    美    英    台    中(歐洲))
declare -a arraMMin=(22.8 21.5  228   3.5   3     77.6  35)
declare -a arraMMax=(29.2 31.5  292   14    13.5  90.4  48.5)
declare -a arraFMin=(22.8 21    228   5     2.5   67.6  35.5)
declare -a arraFMax=(29.2 31    292   15.5  13    80.4  48)   
#設定男女變數
declare -a arraGender=(arraMMin arraMMax arraFMin arraFMax)
let varGenderIndex=($1-1)*2
#帶入男女不同尺寸
#舊寫法        
#        declare -a arraMax=(${$varGendrMax[*]})
#        declare -a arraMax=(${${arraGender[$(expr $varGender )]}[*]})
#        declare -a arraMin=(${${arraGender[$(expr $varGender + 1 )]}[*]})
#新寫法
varGenderMin=${arraGender[$varGenderIndex]}
varGenderMax=${arraGender[$(expr $varGenderIndex + 1 )]}
eval arraMin=\(\$\{$varGenderMin\[\*\]\}\)
eval arraMax=\(\$\{$varGenderMax\[\*\]\}\)
echo ""
    varUnit=7
    clear
echo ${arraMin[*]}
echo ${arraMax[*]}
    echo     "========================================="
    echo -e  "         unit\trecommend size range"
    echo -e  "     (0) cm\t  ${arraMin[0]}cm-${arraMax[0]}cm"
    echo -e  "     (1) Japan\t  ${arraMin[1]}-${arraMax[1]}"
    echo -e  "     (2) Korean\t  ${arraMin[2]}-${arraMax[2]}"
    echo -e  "     (3) US\t  ${arraMin[3]}-${arraMax[3]}"
    echo -e  "     (4) UK\t  ${arraMin[4]}-${arraMax[4]}"
    echo -e  "     (5) Taiwan\t  ${arraMin[5]}-${arraMax[5]}"
    echo -e  "     (6) China\t  ${arraMin[6]}-${arraMax[6]}"
    echo     "========================================="
  read -p "Choose your show size unit: " varUnit
  echo ""
  #判斷是否超出範圍 
[[ "$varUnit" != [0-6] ]] && read -p  "Warning:No such unit!" && exit 1
declare -a arraCountry=(cm Japan Korean US UK Taiwan China)
  read -p "What is your shoe size in ${arraCountry[$varUnit]} unit: " varSize
#判斷是否為實數
  re='^[0-9]+.?[0-9]*$'
! [[ "$varSize" =~ $re ]] && read -p  "Warning:must be number!" && exit 1
  #判斷是否超出範圍
[ $(echo "$varSize < ${arraMin[$varUnit]}"|bc -l) -eq 1 ] || [ $(echo "$varSize > ${arraMax[$varUnit]}"|bc -l) -eq 1 ] && echo "Warning:Your shoe size is over the recommended range."
echo ""
 for ((x=0;x<=6;x++))
   do
      #計算各國間距
      #基準間距值
      varBasicRange=$(echo "${arraMMax[$varUnit]}-${arraMMin[$varUnit]}" | bc -l)
      declare -a arraRange[$x]=$(echo "(${arraMax[$x]}-${arraMin[$x]})/$varBasicRange" | bc -l)
      #計算鞋碼公式: Basic間距 * 間距比值 + 各國基礎值
      declare -a arraSize[$x]=$(echo "($varSize-${arraMin[$varUnit]})*${arraRange[$x]}+${arraMin[$x]}" | bc -l)
      #顯示鞋碼計算到小數第一位     
      declare -a arraCountry=(cm Japan Korean US UK Taiwan China)
      printf "%-5s %-5s %-5s %-3s %-7s %-3s %5.1f\n" Your show size in ${arraCountry[$x]} is ${arraSize[$x]}
  done 
  read -p continue....
exit 0

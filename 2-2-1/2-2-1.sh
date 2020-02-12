#!/bin/bash
#DESCRIPTION count BMI
#Write by wen (superyngo@gmail.com)
#2-2-7使用shell 的呼叫並傳遞身高、體重參數計算身體質量指數 ( BMI ) 評估程式
#體重（公斤）除以身高（公尺）的平方
echo""
echo Hi, please let me know your height and weight.
echo ""
read -p "Height(cm)):" varHeight
re='^[0-9]+\.?[0-9]*$'
! [[ $varHeight =~ $re ]] && echo "Warning:must be number!" && exit 1
read -p "Weight(KG):" varWeight
! [[ $varWeight =~ $re ]] && echo "Warning:must be number!" && exit 1
sh ./2-2-1a.sh $varHeight $varWeight
exit 0

#Write by wen (superyngo@gmail.com)
#2-2-7 使用 shell 的呼叫並傳遞身高、體重參數計算身體質量指數 ( BMI ) 評估程式。
#體重（公斤）除以身高（公尺）的平方
[ -z $2 ] && echo "[EXAMPLES] $0 height(cm) weight(KG)" && exit 1
[ $1 -le $2 ] 2>/dev/null && echo "" && echo "Warning：Your weight is more than your height!incredible!"
echo ""
varHeight=$(echo "scale=2;$1/100"|bc)
varBMI=$(echo "scale=2; $2 / ($varHeight*$varHeight)"|bc)
echo "Your BMI is：$varBMI"
echo ""
exit 0

#!/bin/bash
#Description: 3-2-7 請設計一個 1A2B 遊戲，猜測完後須有提示，並計算猜測次數統計 (含猜測歷程紀錄)。
#Writen by wen (superyngo@gmail.com)
echo -e "0\n1\n2\n3\n4\n5\n6\n7\n8\n9" > numberbox
vAns=$(printf "%1i%1i%1i%1i" $(echo $(shuf ./numberbox) | cut -d' ' -f1-4))
# echo $vAns #顯示答案測試用
for ((x=0;x<=3;x++))
  do
  vAnsN[$x]=$(echo $vAns | cut -c $(($x+1)))
  done

vGuess=0  
until [ $vGuess -eq $vAns ]
  do
    read -p "Your guess(4 numbers, no repeat):" vGuess
    [[ $vGuess =~ ^[0-9]{4}$ ]] #限4個數字
    [ $? == 1 ] && echo "Warning:must only be 4 numbers!" && continue 1
    echo $vGuess | egrep -v '([0-9])[0-9]*\1' > /dev/null #禁止重複
    [ $? == 1 ] && echo "Warning:no repeated number!" && continue 1
    vGuessN[0]=$(echo $vGuess/1000 | bc);vGuessN[1]=$(echo $vGuess%1000/100 | bc);vGuessN[2]=$(echo $vGuess%1000%100/10 | bc);vGuessN[3]=$(echo $vGuess%1000%100%10 | bc)
    echo -n -e "$vGuess\t" >> ./guesslog
    vA=0;vB=0
    for ((i=0;i<=3;i++))
      do
        if [ ${vGuessN[$i]} -eq ${vAnsN[$i]} ];then
           let vA=$vA+1
        elif [[ ${vGuessN[$i]} =~ [$vAns] ]];then
           let vB=$vB+1
        fi
      done
    echo "${vA}A${vB}B" |tee -a ./guesslog
  done
echo "Congratulations!You guessed $(grep -c "" ./guesslog) times."
echo "This is your guess log:";cat ./guesslog
echo "Thank you, good bye!"
rm $(pwd)/guesslog $(pwd)/numberbox


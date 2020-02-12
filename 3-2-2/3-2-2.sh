#!/bin/bash
#Description: 3-2-6 請設計 49 選 6 大樂透的電腦選號投注程式，可自訂買一組或五組…等。
#Writen by wen (superyngo@gmail.com)

echo -e "01\n02\n03\n04\n05\n06\n07\n08\n09\n10\n11\n12\n13\n14\n15\n16\n17\n18\n19\n20\n21\n22\n23\n24\n25\n26\n27\n28\n29\n30\n31\n\
32\n33\n34\n35\n36\n37\n38\n39\n40\n41\n42\n43\n45\n46\n47\n48\n49" >BallBox
read -p "How many lotteries do you buy: " varAmount
re='^[0-9]+$'
! [[ $varAmount =~ $re ]] &&  echo "Warning:must be a number!" && exit 1
  for ((x=1;x<=varAmount;x++))
    do
      vBallBox=$(shuf ./BallBox)
      echo $vBallBox |cut -d' ' -f1-6
    done
rm BallBox
exit 0



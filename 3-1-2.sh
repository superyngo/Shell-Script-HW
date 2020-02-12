#!/bin/bash
#Description: 3-1-10 請設計一個次方計算輸入程式，使用者輸入 n 的以及次方數後，另呼叫次方計算程式，計算完畢後”將值傳回”，並以原次方輸入程式讀取其結果，並輸出如：[DONE] : 2^5 is 32 。
#Write by wen (superyngo@gmail.com)

function Exponentiation(){
  let "varAnswer=$1**$2"
  export varAnswer
  return 0
}

read -p "Number: " varNumber
read -p "Exponentiation: " varExponentiation
re='^[0-9]+$'
if ! [[ $varNumber =~ $re ]] || ! [[ $varExponentiation =~ $re ]]; then
  echo "error: Not a valid number!"  >&2;
else
  Exponentiation $varNumber $varExponentiation
  echo "[DONE]$varNumber^$varExponentiation=$varAnswer"
fi
exit 0

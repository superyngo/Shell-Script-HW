#ription: 3-2-7
# Writed by chi (hsinchitung@iiietc.ncu.edu.tw)
# Version: v1.00

declare -a aPuzzle=(0 1 2 3 4 5 6 7 8 9)
declare -a aGuess

guessCount=0
guessA=0
guessB=0

function newGame()
{
  read -p "Times of reflash puzzle (default 9): " reflashTimes

  for (( i=0 ; i < ${reflashTimes:-9} ; i++ ))
  do
    for j in {0..9}
    do
      temp=${aPuzzle[$j]}
      let temp2=$RANDOM*10/32767
      aPuzzle[$j]=${aPuzzle[$temp2]}
      aPuzzle[$temp2]=$temp
    done
  done
}

newGame

# show answer
#echo ${aPuzzle[*]}

echo "======== GAME 1A 2B ========"

until [ $guessA -eq 4 ]
do
  read -n 4 -p " Enter your guess: " varGuess
  echo -n " "
  let guessCount=$guessCount+1
  let aGuess[0]=$varGuess/1000
  let aGuess[1]=$varGuess%1000/100
  let aGuess[2]=$varGuess%1000%100/10
  let aGuess[3]=$varGuess%1000%100%10

  guessA=0
  guessB=0

  for i in {0..3}
  do
    if [ ${aGuess[$i]} -eq ${aPuzzle[$i]} ]
    then
      # check A
      let guessA=$guessA+1
    else
      # check B
      for j in {0..3}
      do
       [ ${aGuess[$i]} -eq ${aPuzzle[$j]} ] && let guessB=$guessB+1
      done
    fi
  done

  echo -e "${guessA}A${guessB}B"
done

echo "========= GAME END ========="
echo " Your guess count: $guessCount"

exit 0

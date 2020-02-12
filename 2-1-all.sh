#!/bin/bash
#Description: Homework1-2
#Write by wen (superyngo@gmail.com)
varKey=0
while [ $varKey -ne "4" ]
do
	clear
	echo "=========================="
	echo "     (1) Multiplication table"
	echo "     (2) Inverted triangle"
	echo "     (3) Triangle"
 	echo "     (4) EXIT"
	echo "=========================="
	read -n 1 -p "Please chose the homework nember: " varKey

	case $varKey in
		1 )
      echo ""
      echo ""
      read -p "How much do tou want multiply? " multKey
      re='^[0-9]+$'
      if ! [[ $multKey =~ $re ]] ; then
        echo ""
        echo "error: Not a number" >&2; 
      else          
        echo ""
        echo ""
        echo  "Here is your $multKey x $multKey table!"
        echo ""
        for (( x=1 ; x<=$multKey ; x++ ))
        do
          for (( y=1 ; y<=$multKey ; y++ ))
            do let count=$x*$y
          	echo -n -e "$x*$y=$count\t" 
            [ $y == $multKey ] && echo ""
            done
        done
      fi
 			;;
		2 )
      echo ""
      echo ""
      read -p "How big is the inverted triangle? " invTKey
      re='^[0-9]+$'
      if ! [[ $invTKey =~ $re ]] ; then
        echo ""
        echo "error: Not a number" >&2; 
      else          
        echo ""
        echo ""
        echo  "Here is your inverted triangle!"
        echo ""
          for (( nu=$invTKey ; nu>=1 ; nu--))
            do
              for star in `seq 1 $nu`
                do
                echo -n "*"
                done
               echo ""
            done
      fi
 			;;
		3 )
      echo ""  
      echo ""     
      read -p "How big is the triangle? " TKey
      re='^[0-9]+$'
      if ! [[ $TKey =~ $re ]] ; then
        echo ""
        echo "error: Not a number" >&2; 
      else          
        echo ""
        echo ""
        echo  "Here is your triangle!" 
        echo ""            
    			for (( nu=1 ; nu<=$TKey ; nu++ ))
            do
              let sp2=$TKey-$nu
              for (( sp=1 ; sp<=$sp2 ; sp++ ))
                 do
                 echo -n " "
                 done
              for (( star=1 ; star<=$nu ; star++))
                do
                let sp2=$TKey-$nu
                echo -n "*"
                done
            echo ""
            done
      fi
			;;
		4 )
      echo ""			
      echo "Googd Bye!"
      ;;
		* )
			echo -e "\n\aNo homework in $varKey"
			varKey=0	
			;;			
	esac
  echo ""
	read -n 1 -p "Press any key to continue..."
done

exit 0

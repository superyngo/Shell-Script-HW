#!/bin/bash
#Description: convers cm square to ping 
#1 m square = 0.3025 ping
#Write by wen (superyngo@gmail.com)
varCount=$(echo "scale=4;$1*0.3025"|bc)
echo "$1 m square = $varCount ping"
exit 0

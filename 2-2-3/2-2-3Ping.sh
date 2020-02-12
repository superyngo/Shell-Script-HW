#!/bin/bash
#Description: covert ping to m square
#1坪= 3.3058平方公尺
#Write by wen (superyngo@gmail.com)
varCount=$(echo "scale=4;$1*3.3058"|bc)
echo "$1 ping = $varCount m square"
exit 0

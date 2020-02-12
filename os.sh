#!/bin/bash
#Description: Homework1-2
#Writen by wen (superyngo@gmail.com)

read -p "filename:" varFilename
read -p "description:" varDescription

echo "#!/bin/bash
#Description: $varDescription
#Writen by wen (superyngo@gmail.com)" > $varFilename\.sh
chmod 770 $varFilename\.sh
vim $varFilename\.sh


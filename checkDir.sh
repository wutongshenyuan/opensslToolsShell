#!/usr/bin/bash
#保存为checkDir.sh
folder="openssl"
if [ ! -d "$folder" ]
then
mkdir $folder
fi
cd $folder
certfolder="demoCA/newcerts"
if [ ! -d "$certfolder" ]
then
mkdir -p $certfolder
fi

file="demoCA/index.txt"
if [ ! -f "$file" ]
then
touch $file
fi

#!/bin/bash

SOURCE_DIR=/home/ec2-user/logs
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if  [ -d $SOURCE_DIR ]
then
    echo -e "source dir $G exists $N"
else 
    echo -e "source dir  $R doesnt exist $N"
    exit 1
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +14)
echo "FILES:: $FILES"

while IFS= read -r line
do
    echo "deleting line : $line"
    rm -rf $line
done<<< $FILES
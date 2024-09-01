#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:14}

USAGE(){
    echo -e "USUAGE :: sh backup.sh <source> <destination> <days(optional)>"
}
#check the source and destination are provided

if [ $# -lt 2 ]
then 
    USAGE
fi

if [ ! -d $SOURCE_DIR ]
then 
    echo " $SOURCE_DIR doesnt exist please check"
fi

if [ ! -d $DEST_DIR ]
then 
    echo " $DEST_DIR doesnt exist please check"
fi

FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime +14)

if [ -n $FILES]
then 
    echo "files are found"
else
    echo "no files older than $DAYS"
fi
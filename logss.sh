#!/bin/bash

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIME_STAMP.log"
mkdir -p $LOGS_FOLDER

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo "$R Please run the script with root user privilageous $N" | tee -a $LOG_FILE
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2 is $R Failed.. $N" &>>$LOG_FILE | tee -a $LOG_FILE
        exit 1
    else
        echo -e "$2 is $G successful.. $N" &>>$LOG_FILE | tee -a $LOG_FILE
    fi
}

USAGE(){
    echo -e " $R USAGE:: $N sudo sh 01redirectors.sh package1 package2 .. "
    exit 1
}

echo "script started executing at : $(date)" | tee -a $LOG_FILE

CHECK_ROOT 

if [ $# -eq 0 ]
then 
    USAGE
fi
    
# sh loops.sh git mysql postfix nginx
for package in $@  # $@ -- all arguments passed to it
do
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]
    then 
        echo " Installing $package for u.." &>>$LOG_FILE | tee -a $LOG_FILE
        dnf install $package -y  &>>$LOG_FILE
        VALIDATE $? "$package"   
    else
        echo -e " $package  is already $Y installed  nothing to do $N" | tee -a $LOG_FILE
    fi
done
#!/bin/bash

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
USERID=$(id -u)

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then 
        echo -e "$R please run this script with root privileges $N" | tee -a $LOG_FILE
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 installation is $R FAILED..$N" | tee -a $LOG_FILE
        exit 1
    else
        echo -e "$2 installation is  $G SUCCESSFULL.. $N" | tee -a $LOG_FILE
    fi
}

USAGE(){
    echo -e "$R USAGE:: $N sudo sh man.sh package1 package2 .." | tee -a $LOG_FILE
    exit 1
}

echo "Script started executing at: $(date)" | tee -a $LOG_FILE
CHECK_ROOT 
if [ $# -eq 0 ]
then 
    USAGE
fi

for package in $@
do
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]
    then 
        echo -e "$package  $Y is not installed going to install it.. $N" | tee -a $LOG_FILE
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "Git"
    else
        echo -e "$package $Y is already installed nothing to do.. $N" | tee -a $LOG_FILE
    fi
done



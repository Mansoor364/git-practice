#!/bin/bash
LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIME_STAMP.log"
mkdir -p $LOGS_FILE

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[31m"

USAGE (){
    echo -e " $R USAGE:: sudo sh practice.sh package1 package2 $N " &>>$LOG_FILE
}

CHECK_ROOT
if [ $# -eq 0 ]
then 
    USAGE
fi

USERID=$(id -u)
CHECK_ROOT (){
    if [ $? -ne 0 ]
    then
        echo -e "$R Please run the script with root privilages $N"  &>>$LOG_FILE
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then  
        echo -e "$2 is not installed  $R failed $N check it.."  &>>$LOG_FILE
        exit 1
    else
        echo -e "$2 is installed $G successfully $N " &>>$LOG_FILE
    fi
}


for package in $@
do
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]
    then
        echo "$package is installing.."
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "$package"
    else
        echo -e "$package $Y is already installed $N " &>>$LOG_FILE
done

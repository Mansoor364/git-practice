#!/bin/bash

USERID=$(id -u)
VALIDATE (){
    if [ $1 -ne 0 ]
    then 
        echo "$2 is  Failed.."

    else
        echo "$2 is successful.."
    fi
}
if [ $USERID -ne 0 ]
then
    echo "Please run the script with root user privilageous"
    exit 1
fi

dnf list installed git
if [ $? -ne 0 ]
then 
    echo "Installing git for u.."
    dnf install git -y
    validate $? "Installing git"
else
    echo "Git is already installed"
fi

dnf list installed mysql
if [ $? -ne 0 ]
then 
    echo "MYSQL installation is in process"
    dnf install mysql -y
    validate $? "Installing mysql"
else
    echo "MYSQL is already installed"
fi
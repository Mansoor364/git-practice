#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then 
    echo "please run the script with root user privilages"
    exit 1
fi

dnf install mysql -y

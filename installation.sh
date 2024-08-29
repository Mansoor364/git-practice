#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then 
    echo "please run the script with root user privilages"
    exit 1
fi

dnf list installed git 
 if [ $? -ne 0 ]
 then
     echo "Git is not installed  going to install it.."
     dnf install Git -y
else 
    echo "Git is already installed nothing to do "
 fi
#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then 
    echo "please run the script with root user privilages"
    exit 1
fi

dnf list installed gitttt
 if [ $? -ne 0 ]
 then
     echo "Git is not installed  going to install it.."
     dnf install git -y
     if [ $? -ne 0 ]
     then 
         echo " Git installation is not successful check it.."
         exit 1
    else
        echo " Git is installed successfully "
    fi
else 
    echo "Git is already installed nothing to do "
 fi
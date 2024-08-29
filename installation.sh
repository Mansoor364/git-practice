#!/bin/bash

USERID=$(id -u)

VALIDATE () {
    if [ $1 -ne 0 ]
     then 
         echo " $2 installation is not successful check it.."
         exit 1
    else
        echo " $2 is installed successfully "
    fi
}
 

if [ $USERID -ne 0 ]
then 
    echo "please run the script with root user privilages"
    exit 1
fi

dnf list installed git
 if [ $? -ne 0 ]
 then
     echo "Git is not installed  going to install it.."
     dnf install git -y
     VALIDATE $? "git"
else 
    echo "Git is already installed nothing to do "
 fi

 dnf list installed mysql
 if [ $? -ne 0 ]
 then
     echo " Mysql is not installed going to install it.."
     dnf install mysql -y
     VALIDATE $? "Mysql"

else 
    echo " Mysql is already installed nothing to do"
 fi
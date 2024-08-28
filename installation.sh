#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
   echo "Please run the script with root user privilageous"
fi

dnf list installed git
if [ $? -ne 0 ]
then 
   echo "Installing git for u.."
   dnf install git -y
   if [ $? -ne 0 ]
   then
      echo "Git installation is not successfull"
      exit 1
   else
      echo "Git installtion is successfull.."
   fi
else
   echo "Git is already installed"
fi

dnf list installed mysql
if [ $? -ne 0 ]
then 
   echo "MYSQL installation is in process"
   dnf install mysql -y
   if [ $? -ne 0 ]
   then
      echo "MYSQL installation is not successfull"
      exit 1
   else      
      echo "MYSQL is successfully installed"
   fi
else
   echo "MYSQL is already installed "
fi
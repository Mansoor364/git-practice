#!/bin/bash

USERID=$(id -u)
#echo "USERID is : $USERID"

if [ $USERID -nt 0 ]
then
   echo " PLease run this script with root privilages"
   exit 1
fi

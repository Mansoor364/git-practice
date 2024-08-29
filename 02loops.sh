#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
then
    echo "Please run the script with root user privilageous"
    exit 1
fi
}
CHECK_ROOT 

VALIDATE (){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2 is $R Failed.. $N"

    else
        echo -e "$2 is $G successful.. $N"
    fi
}

# loops.sh git mysql postfix nginx
for package in $@  # $@ -- all arguments passed to it
do
    dnf list installed $package
    if [ $? -ne 0 ]
    then 
        echo "Installing $package for u.."
        dnf install $@ -y
        VALIDATE $? "$package"
    else
        echo "$package is already installed nothing to do "
    fi
done 
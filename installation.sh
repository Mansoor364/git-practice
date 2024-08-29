USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo " please run this script with root privilages "
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]
     then 
         echo "$2 installation is not success check it"
         exit 1
    else
        echo "$2 installation is success"
    fi
}

dnf list installed git
if [ $? -ne 0 ]
then
     echo "git is not installed going to install it"
     dnf install git -y
     validate $? "Git"
else
    echo "git is already installed nothing to do.."
fi


dnf list installed mysql
if [ $? -ne 0 ]
then
     echo "mysql is not installed going to install it"
     dnf install mysql -y
     validate $? "mysql"
else
    echo "mysql is already installed nothing to do.."
fi

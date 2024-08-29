R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo " please run this script with root privilages "
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
         echo -e "$2 installation is $R FAILED $N"
         exit 1
    else
        echo -e "$2 installation is $G SUCCESS $N"
    fi
}

dnf list installed git
if [ $? -ne 0 ]
then
     echo "git is not installed going to install it"
     dnf install git -y
     VALIDATE $? "git"
else
    echo "git is already installed nothing to do.."
fi


dnf list installed mysqlsss
if [ $? -ne 0 ]
then
     echo "mysql is not installed going to install it"
     dnf install mysqlsss -y
     VALIDATE $? "mysql"
else
    echo "mysql is already installed nothing to do.."
fi
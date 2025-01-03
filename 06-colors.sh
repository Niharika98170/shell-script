#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"

VALIDATE(){
     if [ $1 -ne 0 ] 
     then
         echo -e "$2...$R FAILURE"
         exit 1
    else
        echo " $2...$G SUCESS"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have sudo access to execute the script"
    exit 1 #other than 0
fi

dnf list installed mysql

if [ $? -ne 0 ] 
then #not installed
    dnf install mysql -y
    VALIDATE $? "Installing MYSQL"
else
   echo -e "MYSQL is already...$Y installed"
fi

dnf list installed GIT

if [ $? -ne 0 ]
then
    DNF install git -y
    VALIDATE $? "Installing GIT"
else
    echo -e "GIT already...$Y insatlled"
fi


#!/bin/bash

USERID=$(id -u)

VALIDATE(){
     if [ $1 -ne 0 ] 
     then
         echo "$2...FAILURE"
         exit 1
    else
        echo " $2g MYSQL...SUCESS"
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
   echo "MYSQL is already...installed"
fi

dnf list installed GIT

if [ $? -ne 0 ]
then
    DNF install git -y
    VALIDATE $? "Installing GIT"
else
    echo "GIT already...insatlled"
fi


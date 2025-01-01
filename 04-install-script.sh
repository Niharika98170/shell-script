#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have sudo access to execute the script"
    exit 1 #other than 0
fi

if [ $? -ne 0]
then
    echo "Installing MYSQL...FAILURE"
    exit 1
else
    echo " Installing MYSQL...SUCESS"
fi

dnf install mysql -y
dnf install git -y

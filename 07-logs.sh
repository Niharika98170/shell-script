#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
LOGS_FOLDER="/Var/logs/shell-script-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1 )
TIMESTAMP=$(date +%y-%m-%y-%H-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOGS_FILE/$TIMESTAMP.log"

VALIDATE(){
     if [ $1 -ne 0 ] 
     then
         echo -e "$2...$R FAILURE"
         exit 1
    else
        echo  -e " $2...$G SUCESS"
    fi
}

echo "script started executing at: $TIMESTAMP" &>>$LOG_FILE

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have sudo access to execute the script"
    exit 1 #other than 0
fi

dnf list installed mysql &>>$LOG_FILE

if [ $? -ne 0 ] 
then #not installed
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? "Installing MYSQL"
else
   echo -e "MYSQL is already...$Y installed"
fi

dnf list installed GIT &>>$LOG_FILE

if [ $? -ne 0 ]
then
    DNF install git -y &>>$LOG_FILE
    VALIDATE $? "Installing GIT"
else
    echo -e "GIT already...$Y insatlled"
fi


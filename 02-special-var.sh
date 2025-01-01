#!/bash/bin

echo "All variables are passed: $@"
echo "Number of variables passed: $#"
echo "Script name: $0"
echo "Present working directory: $PWD"
echo "Home directorty of current user: $HOME"
echo "Which user is running the script: $USER"
echo "Procees id of current script: $$"
sleep 60
echo "Process id of lasr command in background: $!"

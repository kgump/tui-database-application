#!/usr/bin/env bash

# Menu Options - Display

tput clear
tput cup 3 11
tput setaf 2
echo "TUI Database Application"
tput sgr0

tput cup 5 17
tput rev
echo " Main Menu "
tput sgr0

tput cup 7 15
echo "1. Manage Users"

tput cup 8 15
echo "2. Manage Group Objects"

tput cup 9 15
echo "3. Manage Passwords"

tput cup 10 15
echo "4. Exit"

tput bold
tput cup 12 0
read -p "Please Select an Option: " choice


tput clear
tput sgr0

# Script Block / Logic
#
# IOU - Try doing a while loop here to make sure the loop only ends when an available choice is made
# IOU - Prevent user input buildup by limiting the amount of input the script can take in at a time

# Choice 1 - User will start the game
if   [ $choice == 1 ]; then
	cd Users
	./menu.sh
# Choice 2 - User navigates to Group Search
elif [ $choice == 2 ]; then
	cd Groups
	./menu.sh
# Choice 3 - User exits the game
elif [ $choice == 3 ]; then
	cd Passwords
	./menu.sh
elif [ $choice == 4 ]; then
	jq '.Difficulty = "1"' ~/Groups/database.json > temp.json && mv temp.json ~/Groups/database.json
	tput clear
	tput sgr0
	exit 0
else
# Error condition for user input options that don't exist
	tput bold
	tput cup 12 0
	echo "Option Not Found"
	sleep 2
	clear
	./menu.sh
fi

# End of Script

tput clear
tput sgr0

exit 0

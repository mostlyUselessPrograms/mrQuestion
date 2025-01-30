#!/bin/bash
question=$1
answer="$2"
yesitIs() {
zenity --error --title="You got it right" --text="?" --icon-name=firefox
return 0
}
noitIsnt() {
zenity --error --title="*incorrect buzzing soung*" --text="Incorrect!, the answer was $answer"
return 1
}
menu(){
ent=$(zenity --list --column="" --text="$question" yes no)
if [[ "$ent" == $answer ]] 
then
	yesitIs
else 
	noitIsnt
fi
}
if [[ $1 == "--help" ]]
then
	echo USAGE: mrQuestion [question] [yes/no]
	echo note: use quotes for the question.
else
	menu
fi


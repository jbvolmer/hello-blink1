#!/bin/bash

# test funcs
good() 
{
	set -e
	true
	echo "ok"
}
typeset -fx good
bad() 
{
	set -e
	false
	echo "bad"
}
typeset -fx bad

function blink1-fb()
{
	if [ "$1" -eq "1" ]
	then
		blink1-tool --red --blink 5 2>&1 >/dev/null
	else
		blink1-tool --green 2>&1 >/dev/null
		sleep 5
	fi
	blink1-tool --off 2>&1 >/dev/null
}

# call good in subshell
echo "good" | bash
# check result
blink1-fb "$?"
# call bad func in subshell
echo "bad" | bash
# check result
blink1-fb "$?"




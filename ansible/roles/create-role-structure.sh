#!/bin/bash -e 
DIR_EXEC="$(pwd)"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROLE_NAME="$1"
cd "$DIR"

err_undo() {
    cd "$DIR"
    rm -rf "$ROLE_NAME"
    cd "$DIR_EXEC"
}

trap 'err_undo' ERR

if [ -n "$ROLE_NAME" ] && [ ! -d "$ROLE_NAME" ]; then
	printf "Creating role structure for $ROLE_NAME...\n"
	mkdir "$ROLE_NAME" && cd "$ROLE_NAME"
	mkdir tasks handlers templates files vars meta
	echo "---" > handlers/main.yml
	echo "---" > meta/main.yml
	echo "---" > tasks/main.yml
	echo "---" > vars/main.yml
	cd "$DIR_EXEC"
else
	printf "ERR: The role name exists or is empty\n"
	cd "$DIR_EXEC"
	exit 1
fi 
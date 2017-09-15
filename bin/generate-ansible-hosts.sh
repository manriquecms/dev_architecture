#!/bin/bash
#GET VAGRANT MACHINES
DIR_EXEC="$(pwd)"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR/.."

printf "Generating hosts for machines:\n"
LIST=$(vagrant status | grep running | cut -f1 -d' ')
printf "$LIST\n"

touch ansible/inventory/hosts;> ansible/inventory/hosts

MASTERS="\n[masters]"
AGENTS="\n[agents]"

for i in $LIST
do
	NAME="$i"
	KEY="$(vagrant ssh-config "$NAME" | grep IdentityFile | awk -F "IdentityFile " '{print $2}')"
	IP="$(vagrant ssh -c "hostname -I" 2>/dev/null "$NAME" | cut -f2 -d' ' 2>/dev/null)"
	KEY_IN_CONTAINER="/etc/ansible/machines/$NAME/virtualbox/private_key"
	printf "$NAME ansible_connection=ssh ansible_host=$IP ansible_user=vagrant ansible_ssh_private_key_file=$KEY_IN_CONTAINER\n" >> ansible/inventory/hosts
	if [[ $NAME == master* ]] ; then
		MASTERS="$MASTERS\n$NAME"
	fi
	if [[ $NAME == agent* ]] ; then
		AGENTS="$AGENTS\n$NAME"
	fi
done

printf "$MASTERS\n" >> ansible/inventory/hosts
printf "$AGENTS\n" >> ansible/inventory/hosts

for i in ansible/templates/*
do
	cat $i >> ansible/inventory/hosts	
done

cd "$DIR_EXEC"

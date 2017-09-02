#!/bin/bash
DIR_EXEC="$(pwd)"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ansible-playbook -i "localhost," -c local helloworld.yml


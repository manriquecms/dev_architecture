#!/bin/bash
DIR_EXEC="$(pwd)"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$DIR/.."
VERSION=$(cat VERSION)
ROOT_VOLUME=$(pwd)

source bin/generate-ansible-hosts.sh

sudo docker run -it -v "$ROOT_VOLUME":/dev-arch -v "$ROOT_VOLUME/ansible/ansible.cfg":/etc/ansible/ansible.cfg -v "$ROOT_VOLUME/ansible/inventory":/etc/ansible/inventory -v "$ROOT_VOLUME/.vagrant/machines":/etc/ansible/machines --name test-installation "test-installation:$VERSION"

cd "$DIR_EXEC"

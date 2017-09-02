#!/bin/bash
DIR_EXEC="$(pwd)"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$DIR/.."
VERSION=$(cat VERSION)

sudo docker build -t "test-installation:$VERSION" .

cd "$DIR_EXEC"
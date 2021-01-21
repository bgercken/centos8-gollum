#!/bin/bash
#
TAG="titan/centos8-gollum"
PORT=8080
if [[ $# -gt 0 ]]; then
 PORT=$1
fi
NAME="gollum-$$"

GIT_CONFIG=""

if [[ -e /etc/gitconfig ]]; then
  GIT_CONFIG="-v /etc/gitconfig:/etc/gitconfig"
fi

if [[ -e ${HOME}/.gitconfig ]]; then
  GIT_CONFIG="-v ${HOME}/.gitconfig:/etc/gitconfig"
fi

docker run -d --name $NAME -p $PORT:4567 --rm -v $(pwd):/usr/local/share/wikidata $GIT_CONFIG $TAG

echo
echo "Container name is: $NAME"
echo
echo "Connect to container at: 127.0.0.1:$PORT"
echo

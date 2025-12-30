#!/bin/bash

echo -n "Container name: "
read -r CONTAINER_NAME
echo -n "Project mount path: "
read -r PROJECT_PATH
echo -n "Image tag: "
read -r tag

docker create --name $CONTAINER_NAME --ipc host -it \
    -v $PROJECT_PATH:/home/ubuntu/yocto-project \
    $tag
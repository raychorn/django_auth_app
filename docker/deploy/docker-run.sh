#!/bin/bash

PWD=$(pwd)
if [ -d $PWD/workspaces ]; then
    echo "Workspaces directory found"
else
    mkdir -p $PWD/workspaces
fi
docker run -it --rm --volume $PWD/workspaces:/workspaces desktop-tcghl6h:5000/ubuntu_nginx_focal_all_pythons:latest-clean-3.9.6

#!/bin/bash

if [ `whoami` == "root" ]; then
    echo "Please run this script as a normal user"
    exit 1
fi

podman build -t fedora-toolbox-radical -f Dockerfile
distrobox create -i fedora-toolbox-radical:latest -n fedora

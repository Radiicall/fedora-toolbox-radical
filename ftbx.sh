#!/bin/sh
if [[ -z "${CONTAINER_NAME}" ]]; then
    CONTAINER_NAME="fedora"
fi

echo -e "\033[0;31m\033[1mMAKE SURE YOU HAVE PODMAN AND DISTROBOX INSTALLED BEFORE RUNNING!!\033[0m"
echo "Sleeping for 10 seconds before continuing"
sleep 10
mkdir /tmp/fedora-toolbox-radical
podman build --tag fedora-toolbox-radical --file https://raw.githubusercontent.com/Radiicall/fedora-toolbox-radical/main/Dockerfile /tmp/fedora-toolbox-radical
rmdir /tmp/fedora-toolbox-radical
distrobox create --image fedora-toolbox-radical:latest --name ${CONTAINER_NAME}
distrobox-enter -n ${CONTAINER_NAME} -- distrobox-export --app "Visual Studio Code"
distrobox-enter -n ${CONTAINER_NAME} -- distrobox-export --app nextcloud
echo -e "[Desktop Entry]\nType=Application\nExec=/usr/bin/distrobox-enter  -n $CONTAINER_NAME  --   alacritty --command tmux \nIcon=Alacritty\nTerminal=false\nCategories=System;TerminalEmulator;\n\nName=Alacritty\nGenericName=Terminal\nComment=A fast, cross-platform, OpenGL terminal emulator\nStartupNotify=true\nStartupWMClass=Alacritty\nActions=New;\nX-Desktop-File-Install-Version=0.26\n\n[Desktop Action New]\nName=New Terminal\nExec=/usr/bin/distrobox-enter  -n $CONTAINER_NAME  --   alacritty --command tmux " | tee ~/.local/share/applications/$CONTAINER_NAME-Alacritty.desktop

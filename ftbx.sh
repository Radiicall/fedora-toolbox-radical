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
distrobox-enter -n ${CONTAINER_NAME} -- distrobox-export --app alacritty
distrobox-enter -n ${CONTAINER_NAME} -- distrobox-export --app nextcloud
sed --in-place "s|/usr/bin/distrobox-enter  -n ${CONTAINER_NAME}  --   alacritty|/usr/bin/distrobox-enter  -n ${CONTAINER_NAME}  --   alacritty --command tmux|g" ~/.local/share/applications/fedora-Alacritty.desktop

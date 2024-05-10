#!/bin/sh
echo -e "\033[0;31m\033[1mMAKE SURE YOU HAVE PODMAN AND DISTROBOX INSTALLED BEFORE RUNNING!!\033[0m"
echo "Sleeping for 10 seconds before continuing"
sleep 10
podman build --tag fedora-toolbox-radical --file https://raw.githubusercontent.com/Radiicall/fedora-toolbox-radical/main/Dockerfile
distrobox create --image fedora-toolbox-radical:latest --name fedora
distrobox enter fedora
distrobox-export --app "Visual Studio Code"
distrobox-export --app alacritty
distrobox-export --app nextcloud
sed --in-place 's|/usr/bin/distrobox-enter  -n fedora  --   alacritty|/usr/bin/distrobox-enter  -n fedora  --   alacritty --command tmux|g' ~/.local/share/applications/fedora-Alacritty.desktop

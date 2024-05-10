# fedora-toolbox-radical
My general purpose fedora-toolbox for use in Fedora Atomic Workstation editions
It's made for use in distrobox, I personally didnt like how toolbx worked.

## Setup
I mainly use this image for everything so the exports are pretty minimal, 
no exports for any cli apps because I open use a terminal that is in the container.

```
$ git clone https://github.com/radiicall/fedora-toolbox-radical.git
$ cd fedora-toolbox-radical
$ ./create.sh
$ distrobox enter fedora
$ distrobox-export --app "Visual Studio Code"
$ distrobox-export --app alacritty
$ distrobox-export --app nextcloud
$ sed -i 's|/usr/bin/distrobox-enter  -n fedora  --   alacritty|/usr/bin/distrobox-enter  -n fedora  --   alacritty --command tmux|g' ~/.local/share/applications/fedora-Alacritty.desktop
```

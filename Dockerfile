FROM fedora-toolbox:40
LABEL org.opencontainers.image.authors="radical@radical.fun" version="1.0"

RUN rpm --import https://packages.microsoft.com/keys/microsoft.asc

RUN echo -e "[main]\ngpgcheck=True\nmax_parallel_downloads=10\ndefaultyes=True\ninstallonly_limit=3\nclean_requirements_on_remove=True\nbest=False\nskip_if_unavailable=True" | sudo tee /etc/dnf/dnf.conf
RUN echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo

RUN dnf install -y dnf5

RUN dnf5 update --refresh -y
RUN dnf5 install -y alacritty git vim tmux code nextcloud-client bat

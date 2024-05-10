FROM fedora-toolbox:40
LABEL org.opencontainers.image.authors="radical@radical.fun" version="1.0"

RUN rpm --import https://packages.microsoft.com/keys/microsoft.asc

COPY dnf.conf /etc/dnf/dnf.conf
COPY vscode.repo /etc/yum.repos.d/vscode.repo

RUN dnf update --refresh -y
RUN dnf install -y dnf5 alacritty git vim tmux code nextcloud-client bat

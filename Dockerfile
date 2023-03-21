FROM ubuntu:latest
RUN apt update -y
RUN apt install curl git -y
RUN curl -sL -o nix-installer https://install.determinate.systems/nix/nix-installer-x86_64-linux \
  && chmod +x nix-installer
RUN /nix-installer install linux --init none --no-confirm
ENV PATH="${PATH}:/nix/var/nix/profiles/default/bin"
ENV USER=root
RUN nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager \
  && nix-channel --update \
  && nix-shell '<home-manager>' -A install
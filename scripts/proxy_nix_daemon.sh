#!/bin/sh
hostip=$(cat /etc/resolv.conf | grep nameserver | awk '{ print $2 }')
wslip=$(hostname -I | awk '{print $1}')
port=7890

PROXY_HTTP="http://${hostip}:${port}"

sudo mkdir -p /etc/systemd/system/nix-daemon.service.d/
cat << EOF | sudo tee /etc/systemd/system/nix-daemon.service.d/override.conf >/dev/null
[Service]
Environment="http_proxy=${PROXY_HTTP}"
Environment="https_proxy=${PROXY_HTTP}"
Environment="all_proxy=${PROXY_HTTP}"
EOF
sudo systemctl daemon-reload
sudo systemctl restart nix-daemon
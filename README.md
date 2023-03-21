
```
ln -s /path/to/nixfiles ~/.config/nixpkfs
```

## Trouble Shooting
![](./imgs/nix_conflicts.png)

Solved by: https://github.com/nix-community/home-manager/issues/2995
```
nix-env --set-flag priority 0 nix-2.11.0
```

## Build Docker Image
Build docker image with nix and home-manager
```
docker build .
```

Build docker image using local proxy
```
docker build --build-arg http_proxy=http://proxy_url:port --build-arg https_proxy=http://proxy_url:port --network=host .
```

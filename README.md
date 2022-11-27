
```
ln -s /path/to/nixfiles ~/.config/nixpkfs
```

## Trouble Shooting
![](./imgs/nix_conflicts.png)

Solved by: https://github.com/nix-community/home-manager/issues/2995
```
nix-env --set-flag priority 0 nix-2.11.0
```

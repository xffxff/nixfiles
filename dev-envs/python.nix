# shell.nix
{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/refs/heads/nixos-22.11.tar.gz") {} }:
# { pkgs ? import <nixpkgs> {} }:
let
  my-python = pkgs.python3;
  python-with-my-packages = my-python.withPackages (p: with p; [
    poetry
    # other python packages you want
  ]);
in
pkgs.mkShell {
  packages = [
    python-with-my-packages
    # other dependencies
  ];

  shellHook = ''
  zsh
  '';
}

{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "zhoufan";
  home.homeDirectory = "/home/zhoufan";

  # Packages to install
  home.packages = [
    pkgs.bat
    pkgs.fd
    pkgs.zellij
  ];

  # Raw configuration files
  home.file.".vimrc".source = ./vimrc;
  home.file.".ssh/config".source = ./ssh-config;

  # Git config
  programs.git = {
    enable = true;
    userName = "XFFXFF";
    userEmail = "1247714429@qq.com";
    aliases = {
      st = "status";
    };
    extraConfig = {
      push = {
        default = "current";
      };
    };
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

{ config, lib, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "shiyue";

  # Set home directory based on the operating system
  home.homeDirectory = "/Users/shiyue";

  # Packages to install
  home.packages = [
    pkgs.vim
    pkgs.bat
    pkgs.fd
    pkgs.zellij
    pkgs.eza
    pkgs.ripgrep
    pkgs.direnv
    pkgs.htop
    pkgs.kubectl
    pkgs.kubectx
    pkgs.k9s
  ];

  # Raw configuration files
  home.file.".vimrc".source = ./vimrc;
  home.file."proxy.sh".source = ./scripts/proxy.sh;
  home.file.".cargo/config".source = ./cargo;
  home.file.".config/pypoetry/config.toml".source = ./poetry.config;
  # home.file.".config/nix/nix.conf".source = ./nix.conf;
  home.file.".config/zellij/config.kdl".source = ./config.kdl;

  # Git config
  programs.git = {
    enable = true;
    userName = "shiyue-loop";
    userEmail = "shiyue@01.ai";
    aliases = {
      st = "status";
      ck = "checkout";
      cm = "commit -m";
      a = "add";
    };
    extraConfig = {
      push = {
        default = "current";
      };
    };
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ls = "eza";
      ll = "eza -l";
      k = "kubectl";
    };
    initExtra = ''
      source <(kubectl completion zsh)
      PATH="$HOME/.krew/bin:$PATH"
    '';
    plugins = [
      # config powerlevel10k based on https://discourse.nixos.org/t/using-an-external-oh-my-zsh-theme-with-zsh-in-nix/6142/2
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = lib.cleanSource ./pkg-config;
        file = "p10k.zsh";
      }
    ];
  };

  # Fuzzy finder
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
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

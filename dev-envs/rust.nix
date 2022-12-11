{ nixpkgs ? import <nixpkgs> { }}:

let
  rustOverlay = builtins.fetchTarball "https://github.com/oxalica/rust-overlay/archive/master.tar.gz";
  pkgs = import <nixpkgs> {
    overlays = [ (import rustOverlay) ];
  };
in
  pkgs.mkShell {
    buildInputs = with pkgs; [
      (pkgs.rust-bin.stable.latest.default.override {
	    extensions = [ "rust-src" "cargo" "rustc" ];
      })
      pkgs.typos
      pkgs.zola
      pkgs.mdbook
      pkgs.mdbook-mermaid
      pkgs.mdbook-linkcheck
      pkgs.rust-analyzer
      pkgs.pkg-config
      pkgs.openssl
    ];

    shellHook = ''
    zsh
    '';

    NIX_ENFORCE_PURITY = 0;
    RUST_BACKTRACE = 1;
  }

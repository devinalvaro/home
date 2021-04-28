{ config, pkgs, ... }:

{
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
    }))
  ];

  programs.emacs = {
    enable = true;
    package = pkgs.emacsGcc;
    extraPackages = epkgs: [ epkgs.vterm ];
  };

  home.sessionPath = [ "${config.home.homeDirectory}/.emacs.d/bin" ];

  xdg.configFile.doom = {
    source = ./emacs;
    recursive = true;
  };
}

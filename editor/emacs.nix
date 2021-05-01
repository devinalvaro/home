{ config, pkgs, ... }:

{
  programs.emacs = {
    enable = true;
    extraPackages = epkgs: [ epkgs.vterm ];
  };

  home.sessionPath = [ "${config.home.homeDirectory}/.emacs.d/bin" ];

  home.packages = with pkgs; [
    sqlite # Required by org-roam.
  ];

  xdg.configFile.doom = {
    source = ./emacs;
  };
}

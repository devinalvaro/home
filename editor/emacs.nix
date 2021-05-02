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

  xresources.properties = {
    # Prevent white flash at startup.
    "emacs.Background" = "#2e3440";
    "emacs.Foreground" = "#d8dee9";
    "emacs.MenuBar" = 0;
  };

  xdg.configFile.doom = {
    source = ./emacs;
  };
}

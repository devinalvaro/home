{ config, ... }:

{
  programs.emacs = {
    enable = true;
    extraPackages = epkgs: [ epkgs.vterm ];
  };

  home.sessionPath = [ "${config.home.homeDirectory}/.emacs.d/bin" ];

  xdg.configFile.doom = {
    source = ./emacs;
    recursive = true;
  };
}

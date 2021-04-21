{
  programs.emacs = {
    enable = true;
    extraPackages = epkgs: [ epkgs.vterm ];
  };

  home.sessionPath = [
    "$HOME/.emacs.d/bin"
  ];

  xdg.configFile.doom = {
    source = ./emacs;
    recursive = true;
  };
}

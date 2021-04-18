{ config, pkgs, ... }:

{
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.03";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "devin";
  home.homeDirectory = "/home/devin";

  # Configure programs.
  programs = {
    # Desktop:
    rofi = import ./rofi;
    # Development:
    emacs = import ./emacs;
    # Document:
    zathura = import ./zathura;
    # Shell:
    fish = import ./fish;
    starship = import ./starship;
    # Terminal:
    alacritty = import ./alacritty;
    # Utilities:
    bat = import ./bat;
    git = import ./git;
    # Web:
    firefox = import ./firefox;
  };

  # Install packages.
  home.packages = with pkgs; [
    # Desktop:
    xbindkeys
    xsecurelock
    # Utilities:
    exa
    fd
    ripgrep
    sd
  ];

  # Session variables.
  home.sessionVariables = {
    EDITOR = "emacs";
  };

  # Session paths.
  home.sessionPath = [
    "$HOME/.emacs.d/bin"
    "$HOME/.local/bin"
  ];

  # Link files.
  home.file = {
    ".background-image" = {
      source = ./backgrounds/nord-underwater.png;
    };
    ".local/bin" = {
      source = ./scripts;
      recursive = true;
    };
  };

  # Link config files.
  xdg.configFile = {
    "doom" = {
      source = ./doom;
      recursive = true;
    };
    "spectrwm" = {
      source = ./spectrwm;
      recursive = true;
    };
  };
}

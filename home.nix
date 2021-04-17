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

  # Enable programs.
  programs.git = import ./git;
  programs.firefox = import ./firefox;

  # Install packages.
  home.packages = with pkgs; [
    # Desktop:
    rofi
    xsecurelock
    # Development:
    emacs
    neovim
    # Document:
    zathura
    # Shell:
    fish
    starship
    # Terminal:
    alacritty
    # Utilities:
    bat
    exa
    fd
    gitAndTools.delta
    ripgrep
    sd
    # Web:
    firefox
  ];

  # Link files.
  home.file.".local/bin" = {
    source = ./scripts;
    recursive = true;
  };
  home.file.".doom.d" = {
    source = ./doom;
    recursive = true;
  };
  home.file.".background-image" = {
    source = ./backgrounds/nord-underwater.png;
  };

  # Link config files.
  xdg.configFile."alacritty" = {
    source = ./alacritty;
    recursive = true;
  };
  xdg.configFile."bat" = {
    source = ./bat;
    recursive = true;
  };
  xdg.configFile."fish" = {
    source = ./fish;
    recursive = true;
  };
  xdg.configFile."rofi" = {
    source = ./rofi;
    recursive = true;
  };
  xdg.configFile."spectrwm" = {
    source = ./spectrwm;
    recursive = true;
  };
  xdg.configFile."zathura" = {
    source = ./zathura;
    recursive = true;
  };
}

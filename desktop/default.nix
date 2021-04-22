{ pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./backgrounds
    ./firefox.nix
    ./gammastep.nix
    ./rofi
    ./spectrwm.nix
    ./zathura.nix
  ];

  home.packages = with pkgs; [
    xbindkeys
    xsecurelock
  ];
}

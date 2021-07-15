{ pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./dropbox.nix
    ./firefox.nix
    ./gpg.nix
  ];

  home.packages = with pkgs; [
    okular
  ];
}

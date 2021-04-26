{ pkgs, ... }:

{
  imports = [
    ./bat.nix
    ./fish.nix
    ./git.nix
    ./scripts.nix
  ];

  home.packages = with pkgs; [
    exa
    fd
    ripgrep
    sd
    topgrade
  ];
}

{ pkgs, ... }:

{
  imports = [
    ./bat.nix
    ./direnv.nix
    ./fish.nix
    ./git.nix
  ];

  home.packages = with pkgs; [
    exa
    fd
    ripgrep
    sd
    wget
  ];
}

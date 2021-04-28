{ pkgs, ... }:

{
  imports = [
    ./bat.nix
    ./direnv.nix
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

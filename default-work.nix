{ pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "devin.alvaro";
  home.homeDirectory = "/Users/devin.alvaro";

  imports = [
    ./common.nix
    ./modules/editor
    ./modules/lang
    ./modules/shell
  ];

  programs.emacs.package = pkgs.emacsMacport;

  programs.fish = {
    plugins = [
      {
        name = "bass";
        src = pkgs.fetchFromGitHub {
          owner = "edc";
          repo = "bass";
          rev = "7aae6a85c24660422ea3f3f4629bb4a8d30df3ba";
          sha256 = "03693ywczzr46dgpnbawcfv02v5l143dqlz1fzjbhpwwc2xpr42y";
        };
      }
    ];
    shellInit = ''
      # Source nix.
      bass source ~/.nix-profile/etc/profile.d/nix.sh
    '';
  };

  programs.git.extraConfig.url."ssh://gitlab@git.garena.com:2222/".insteadOf = "https://git.garena.com/";

  programs.go = {
    package = (let
      pkgs = import (builtins.fetchTarball https://github.com/NixOS/nixpkgs/archive/2d9888f61c80f28b09d64f5e39d0ba02e3923057.tar.gz) {};
    in
      pkgs.go_1_12);
    goPrivate = [ "git.garena.com/*" ];
  };
}

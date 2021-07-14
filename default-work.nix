{ config, pkgs, ... }:

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
        name = "nix-env.fish";
        src = pkgs.fetchFromGitHub {
          owner = "lilyball";
          repo = "nix-env.fish";
          rev = "00c6cc762427efe08ac0bd0d1b1d12048d3ca727";
          sha256 = "1hrl22dd0aaszdanhvddvqz3aq40jp9zi2zn0v1hjnf7fx4bgpma";
        };
      }
    ];
  };

  programs.git.extraConfig.url."ssh://gitlab@git.garena.com:2222/".insteadOf = "https://git.garena.com/";

  programs.go.goPrivate = [ "git.garena.com/*" ];

  home.sessionVariables = {
    CC = "clang";
    SP_UNIX_SOCKET = "${config.home.homeDirectory}/.local/spex/spex.sock";
  };

  home.packages = with pkgs; [
    mysql
    redis
 ];
}

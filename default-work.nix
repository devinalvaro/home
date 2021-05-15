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

  programs.go.goPrivate = [ "git.garena.com/*" ];
}
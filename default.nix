{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "devin";
  home.homeDirectory = "/home/devin";

  imports = [
    ./common.nix
    ./modules/desktop
    ./modules/editor
    ./modules/lang
    ./modules/shell
  ];
}

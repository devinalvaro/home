{ config, lib, ... }:

{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "dropbox"
    "firefox-bin"
    "firefox-release-bin-unwrapped"
  ];

  services.dropbox = {
    enable = true;
  };
}

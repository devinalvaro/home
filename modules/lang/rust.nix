{ pkgs, ... }:

{
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/oxalica/rust-overlay/archive/master.tar.gz;
    }))
  ];

  home.packages = with pkgs; [
    (rust-bin.nightly.latest.default.override {
      extensions = [
        "rust-analyzer-preview"
        "rust-src"
      ];
    })
  ];
}

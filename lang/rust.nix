{ pkgs, ... }:

{
  nixpkgs.overlays = [ (import <rust-overlay>) ];

  home.packages = with pkgs; [
    (rust-bin.nightly.latest.default.override {
      extensions = [
        "rust-analyzer-preview"
        "rust-src"
      ];
    })
  ];
}

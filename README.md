# home

Also known as dotfiles.

## Setup

Sources:
- [Home Manager Manual](https://nix-community.github.io/home-manager/index.html#sec-install-standalone)
- [Doom Emacs](https://github.com/hlissner/doom-emacs#install)

### Adding Channels

``` sh
nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --add https://github.com/oxalica/rust-overlay/archive/master.tar.gz rust-overlay
nix-channel --update
```

### Cloning Home

``` sh
mkdir -p ~/.config/nixpkgs
git clone https://github.com/devinalvaro/home ~/Codes/home
ln -s ~/Codes/home/default.nix ~/.config/nixpkgs/home.nix
```

### Installing Home Manager

```sh
set -x NIX_PATH "$HOME/.nix-defexpr/channels:$NIX_PATH"
nix-shell '<home-manager>' -A install
```

### Installing Doom Emacs

```sh
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
```

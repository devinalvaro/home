# home

Also known as dotfiles.

## Setup

Sources:
- [Home Manager Manual](https://nix-community.github.io/home-manager/index.html#sec-install-standalone)
- [Doom Emacs](https://github.com/hlissner/doom-emacs#install)

### Adding overlays

``` sh
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-20.09.tar.gz home-manager
sudo nix-channel --add https://github.com/oxalica/rust-overlay/archive/master.tar.gz rust-overlay
sudo nix-channel --update
```

### Activating Home Manager

```sh
git clone https://gitlab.com/devinalvaro/home ~/Codes/home
ln -sf ~/Codes/home/default.nix ~/.config/nixpkgs/home.nix
nix-shell '<home-manager>' -A install
home-manager switch
```

### Installing Doom Emacs

```sh
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
```

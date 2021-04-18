# home

Also known as dotfiles.

## Setup

### Installing Home Manager

```sh
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-20.09.tar.gz home-manager
sudo nix-channel --update
nix-shell '<home-manager>' -A install
```

### Activating Home Manager

```sh
git clone https://gitlab.com/devinalvaro/home ~/Codes/home
ln -sf ~/Codes/home/default.nix ~/.config/nixpkgs/home.nix
home-manager switch
```

### Installing Doom Emacs

```sh
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
```

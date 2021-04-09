set fish_greeting

# functions
function edit
    $EDITOR $argv
end

# abbreviations
abbr -a c cargo
abbr -a d docker
abbr -a e edit
abbr -a g git
abbr -a h ghci
abbr -a l 'ls -l'
abbr -a o open
abbr -a s sudo

if type -q bat;
    abbr -a cat bat
end

if type -q delta;
    abbr -a diff delta
end

if type -q exa;
    abbr -a l 'exa -l'
    abbr -a ls exa
end

if type -q fd;
    abbr -a find fd
end

if type -q rg;
    abbr -a grep rg
end

if type -q sd;
    abbr -a sed sd
end

# bindings
bind \cd delete-char

# variables
set -x LANG "en_US.UTF-8"
set -x LANGUAGE "en_US.UTF-8"
set -x LC_ALL "en_US.UTF-8"

set -x GOPATH "$HOME/.go"
set -x PYTHONUSERBASE "$HOME/.pip"

set -x PATH "$HOME/.cargo/bin:$PATH"
set -x PATH "$HOME/.emacs.d/bin:$PATH"
set -x PATH "$HOME/.ghcup/bin:$PATH"
set -x PATH "$HOME/.go/bin:$PATH"
set -x PATH "$HOME/.local/bin:$PATH"
set -x PATH "$HOME/.pip/bin:$PATH"

# sources
if test -e "$HOME/.config/fish/extra.fish"
    source "$HOME/.config/fish/extra.fish"
end

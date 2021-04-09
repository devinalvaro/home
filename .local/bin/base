#!/bin/bash

cmd='fish'
if [ $# -ge 1 ]; then
    cmd="${@:1}"
fi

docker run \
    --rm -it \
    -v "$HOME:/home/devin" \
    "devinalvaro/base" \
    fish -c "cd $(dirs); $cmd"

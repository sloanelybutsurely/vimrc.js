#!/bin/bash

VIMRC=~/.vimrc
AUTOLOAD=~/.vim/autoload
VIMEXE=vim

if (which nvim > /dev/null); then
  VIMRC=~/.config/nvim/init.vim
  AUTOLOAD=~/.config/nvim/autoload
  VIMEXE=nvim
fi

curl -fLo $AUTOLOAD/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

git clone git@github.com:zperrault/vimrc.js.git ~/.vimrc.js

ln -s ~/.vimrc.js/vimrc $VIMRC

command $VIMEXE +PlugInstall +qall

#!/bin/bash

VIMRC=~/.vimrc
AUTOLOAD=~/.vim/autoload
VIMEXE=vim

if (which nvim > /dev/null); then
  echo "Found neovim. Using neovim config paths."
  VIMRC=~/.config/nvim/init.vim
  AUTOLOAD=~/.config/nvim/autoload
  VIMEXE=nvim
fi

echo -n "Installing vim-plug... "
curl -fLo $AUTOLOAD/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &> /dev/null
echo "done."

echo -n "Installing vimrc.js... "
git clone git@github.com:zperrault/vimrc.js.git ~/.vimrc.js &> /dev/null
echo "\" Put your personal settings here...\n" > ~/.vimrc.js/vimrc.local
echo "\" Add additional plugins here...\n" > ~/.vimrc.js/vimrc.plugs.local
echo "done."

if [[ -f $VIMRC ]]; then
  echo "Baking up existing vimrc to $VIMRC.bak"
  mv $VIMRC $VIMRC.bak
fi

echo -n "Linking vimrc... "
ln -s ~/.vimrc.js/vimrc $VIMRC
echo "done."

echo -n "Installing plugins... "
command $VIMEXE +PlugInstall +qall
echo "done."

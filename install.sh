#!/bin/bash
set -e

VIMRC=~/.vimrc
AUTOLOAD=~/.vim/autoload
VIMEXE=vim

if (which nvim > /dev/null); then
  VIMRC=~/.config/nvim/init.vim
  AUTOLOAD=~/.config/nvim/autoload
  VIMEXE=nvim
fi

cat <<WhatWillHappen

  I detected that you're using $VIMEXE.

  I'm going to...
    - clone vimrc.js into '~/.vimrc.js'
    - install vim-plug
    - move your existing vimrc
         from: '$VIMRC'
	 to:   '$VIMRC.bak'
    - symlink
         from: '$VIMRC'
	 to:   '~/.vimrc.js/vimrc'
    - install all plugins listed in
         '~/.vimrc.js/vimrc.plugs'

  If you're not comfortable with these plans,
  you can abort now by pressing <C-c>.

WhatWillHappen

read THROW_AWAY

echo -n "Installing vim-plug... "
curl -sfLo $AUTOLOAD/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "done."

echo -n "Installing vimrc.js... "
git clone --quiet https://github.com/zperrault/vimrc.js.git ~/.vimrc.js
echo "done."

if [[ -f $VIMRC ]]; then
  echo -n "Backing up existing vimrc... "
  mv $VIMRC $VIMRC.bak
  echo "done."
fi

echo -n "Linking vimrc... "
ln -s ~/.vimrc.js/vimrc $VIMRC
echo "done."

echo -n "Installing plugins... "
command $VIMEXE +PlugInstall +qall
echo "done."


cat <<NowThatWeAreDone

  Now that we are done you can...
    - add your own plugins to:
        '~/.vimrc.js/vimrc.plugs.local'
    - add your own settings to:
        '~/.vimrc.js/vimrc.local'

  If you add any new plugins to your 'plugs.local'
  file, make sure to run ':PlugInstall' from
  within $VIMEXE.

NowThatWeAreDone

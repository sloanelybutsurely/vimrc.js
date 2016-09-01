# vimrc.js

A vimrc that Just Works™ for modern JavaScript development.

👋 Hi! This project is very much a Work in Progress right now. If you
see something that you think needs fixed, please open up an issue or if
you're feeling particularly ambitious, a Pull Request!

## TODO
  - [ ] Support `vim` as well as `neovim`
  - [ ] Really good install instructions
  - [ ] A clear README with keybindings and available settings front and
    center

## Installing

### Prerequisities

  * [Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)
  * [Neovim python 3 client](https://github.com/neovim/python-client)
  * [vim-plug](https://github.com/junegunn/vim-plug#neovim)

### Downloading

**NOTE:** This will overwrite any existing `init.vim` that you have
configured for Neovim. It is recommended that you back up your config
before trying this out.

```
curl -fLo ~/.config/nvim/init.vim --create-dirs \
  https://raw.githubusercontent.com/zperrault/vimrc.js/master/vimrc
```

### What's in the box?

#### JavaScript, es6+, FlowType, and JSX syntax highlighting and indentation

Unfortunately there isn't a single plugin out there that provides proper
syntax highlighting for modern JavaScript development. This project uses
a combination of three plugins to achieve syntax highlighting bliss.
  
  * pangloss/vim-javascript
  * mxw/vim-jsx
  * gavocanov/vim-js-indent

![Syntax highlighting](http://i.imgur.com/aOrAmyr.png)

#### Intelligent and fast autocomplete

A combination of deoplete and tern means that you'll get smart
completion suggestions as you type.

![autocomplete](http://i.imgur.com/YeyRkB0.png)

#### Eslint and FlowType errors on save

Errors reported by eslint and flow are displayed inside vim so you can
jump straight to the problem.

#### Fuzzy file searching

Fuzzy finding is provided by `fzf`. Open the fuzzy searcher using `<C-t>`
(like Atom)

![FZF](http://i.imgur.com/1hKJWei.png)

#### File tree viewing

NERDTree provides a project viewer. Toggle it using `<C-\>` (also
similar to Atom).

![NERDTree](http://i.imgur.com/Lzi08Aa.png)

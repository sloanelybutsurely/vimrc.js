This project is no longer under active development. Feel free to use it and open issues and pull requests but new features won't be coming for the foreseeable future.

# vimrc.js

A vimrc that Just Works™ for modern JavaScript development.

## Installing

### The easy way

First, install [`neovim`](https://neovim.io/) with [Python3 support](https://github.com/neovim/python-client).
If you're on ~OS X~ macOS and have [homebrew](https://brew.sh) installed,
you can issue this command: `brew install python3 neovim/neovim/neovim; pip3 install neovim`.

While most of the features available in this project will work in
regular vim, neovim's asynchronous plugin support means the editor is
much faster even when dealing with complex tasks like FlowType
autocomplete and linting.

The easiest way to download and use this configuration is to issue the
following command.

```
curl -o- https://raw.githubusercontent.com/zperrault/vimrc.js/master/install.sh | bash
```

This command will download the [installation script](install.sh) and run it
through BASH. This script will detect if you have neovim installed, install
vim-plug, clone this repo into `~/.vimrc.js`, backup your existing vim or
neovim configuration, symlink `~/.vimrc.js/vimrc` to the appropriate path,
and install plugins with vim-plug.

I understand that `curl`-ing and executing random shell scripts can be scary.
You are encouraged to view the source of this file (and tell me how it can
be better).

Once installed, you can add your own plugins to `~/.vimrc.js/vimrc.plugs.local` and
your own settings to `~/.vimrc.js/vimrc.local`.

### The DIY way

You are by no means required to use the automated installer. All used plugins
are listed in [`vimrc.plugs`](vimrc.plugs) and all settings for these plugins
are listed in [`vimrc`](vimrc). Feel free to copy and paste pieces of these
files into your own vimrc.

Once installed, you can add your own plugins to `~/.vimrc.js/vimrc.plugs.local` and
your own settings to `~/.vimrc.js/vimrc.local`.

## Updating

If you've only modified the `*.local` files, you can update to the
latest version at any time by running the following:

```
cd ~/.vimrc.js
git pull origin master
command $(which nvim || which vim) +PlugUpdate +qall
```

## Usage

### Keybindings

- `<C-\>`- open project tree viewer
- `<C-t>` - start fuzzy file finding
- keybindings provided by [vim-commentary](https://github.com/tpope/vim-commentary#commentaryvim) and [vim-surround](https://github.com/tpope/vim-surround#surroundvim)

## What's in the box?

### JavaScript, es6+, FlowType, and JSX syntax highlighting and indentation

Unfortunately there isn't a single plugin out there that provides proper
syntax highlighting for modern JavaScript development. This project uses
a combination of three plugins to achieve syntax highlighting bliss.

- pangloss/vim-javascript
- mxw/vim-jsx
- gavocanov/vim-js-indent

![Syntax highlighting](http://i.imgur.com/aOrAmyr.png)

### Intelligent and fast autocomplete

A combination of deoplete and tern means that you'll get smart
completion suggestions as you type.

![autocomplete](http://i.imgur.com/YeyRkB0.png)

### Eslint and FlowType errors on save

Errors reported by eslint and flow are displayed inside vim so you can
jump straight to the problem.

### Fuzzy file searching

Fuzzy finding is provided by `fzf`. Open the fuzzy searcher using `<C-t>`
(like Atom)

![FZF](http://i.imgur.com/1hKJWei.png)

### File tree viewing

NERDTree provides a project viewer. Toggle it using `<C-\>` (also
similar to Atom).

![NERDTree](http://i.imgur.com/Lzi08Aa.png)

### Git diff markers in the gutter

[vim-gitgutter](https://github.com/airblade/vim-gitgutter)

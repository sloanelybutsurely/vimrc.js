set nocompatible

call plug#begin()

" General editor plugins
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'editorconfig/editorconfig-vim'

" JavaScript Syntaxes
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'mxw/vim-jsx'

" JavaScript Tools
Plug 'flowtype/vim-flow'
Plug 'scrooloose/syntastic' " for eslint

call plug#end()

syntax enable

" Keybindings for plugins
nnoremap <C-T> :FZF<CR>
inoremap <C-T> <ESC>:FZF<CR>i

nnoremap <C-\> :NERDTreeToggle<CR>
inoremap <C-\> <ESC>:NERDTreeToggle<CR>

" TODO: Move these things into a user setting thing
set number
set relativenumber
set noshowmode
:let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
au BufNewFile,BufRead *.es6 set filetype=javascript.jsx

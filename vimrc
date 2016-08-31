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
Plug 'ervandew/supertab'
Plug 'vim-scripts/SyntaxComplete'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'  }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

" JavaScript Syntaxes
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'mxw/vim-jsx'

" JavaScript Tools
Plug 'flowtype/vim-flow'
Plug 'scrooloose/syntastic' " for eslint

call plug#end()

syntax enable

" Plugin settings
let g:deoplete#enable_at_startup = 1
let g:SuperTabDefaultCompletionType = "<c-n>"

let g:jsx_ext_required = 0

let g:flow#enable = 1
let g:flow#autoclose = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']

let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = 0

set completeopt-=preview

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
nnoremap <ESC> :noh<CR><ESC>

set nocompatible

" === Plugins ===
call plug#begin()

try
  source ~/.vimrc.js/vimrc.plugs
  source ~/.vimrc.js/vimrc.plugs.local
catch
endtry

call plug#end()

syntax enable
set number
set mouse=a
set completeopt=longest,menuone

" === Plugin settings ===

" == pangloss/vim-javascript ==
let g:javascript_plugin_flow = 1

" == mxw/vim-jsx ==
let g:jsx_ext_required = 0

" === Language Servers ===
let g:LanguageClient_serverCommands = {
\ 'javascript': ['flow-language-server', '--stdio'],
\ 'javascript.jsx': ['flow-language-server', '--stdio'],
\ }

let g:LanguageClient_autoStart = 1

let g:SuperTabDefaultCompletionType = "context"

" === Keybindings ===

nnoremap <ESC> :nohlsearch<CR>

" == scrooloose/nerdtree ==
nnoremap <C-\> :NERDTreeToggle<CR>
inoremap <C-\> <ESC>:NERDTreeToggle<CR>

nnoremap <C-t> :Files<CR>
inoremap <C-t> <ESC>:Files<CR>
nnoremap <C-f> :Ag<CR>
inoremap <C-f> <ESC>:Ag<CR>

tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-w>j <C-\><C-n><C-w>j
tnoremap <C-w>k <C-\><C-n><C-w>k
tnoremap <C-w>l <C-\><C-n><C-w>l

try
  source ~/.vimrc.js/vimrc.local
catch
endtry

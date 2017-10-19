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

" == scrooloose/nerdtree ==
nnoremap <C-\> :NERDTreeToggle<CR>
inoremap <C-\> <ESC>:NERDTreeToggle<CR>

try
  source ~/.vimrc.js/vimrc.local
catch
endtry

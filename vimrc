set nocompatible

" === Plugins ===
call plug#begin()

try
  source ~/.vimrc.js/vimrc.plugs
  source ~/.vimrc.js/vimrc.plugs.local
catch
endtry

call plug#end()

filetype plugin indent on
syntax enable
set number
set ts=2 sw=2 et
set backspace=indent,eol,start

function! ShouldLint()
  return filereadable('.eslintrc') || filereadable('.eslintrc.json') ? 1 : 0
endfunction

function! ShouldTypeCheck()
  return filereadable('.flowconfig') ? 1 : 0
endfunction

function! StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction

" Disables the flow plugin's quickfix things. ale takes care of this.
let g:flow#enable = 0
let g:flow#omnifunc = ShouldTypeCheck()
let g:flow_path = StrTrim(system('PATH=$(npm bin):$PATH && which flow'))

" === Plugin settings ===

" == w0rp/ale ==
let javascript_linters = []
if ShouldLint()
  call add(javascript_linters, 'eslint')
endif
if ShouldTypeCheck()
  call add(javascript_linters, 'flow')
endif
let g:ale_linters = { 'javascipt': javascript_linters }
let g:ale_sign_column_always = 1

" == pangloss/vim-javascript ==
let g:javascript_plugin_flow = ShouldTypeCheck()

" == mxw/vim-jsx ==
let g:jsx_ext_required = 0

" == Shougo/neocomplete ==
" == ervandew/supertab ==
let g:neocomplete#enable_at_startup = 1
let g:SuperTabDefaultCompletionType = "<C-n>"

" === Keybindings ===
" == christoomey/vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <C-k> :TmuxNavigateUp<CR>
nnoremap <silent> <C-l> :TmuxNavigateRight<CR>

" == junegunn/fzf ==
" == junegunn/fzf.vim ==
nnoremap <C-T> :Files<CR>
inoremap <C-T> <ESC>:Files<CR>i
nnoremap <C-F> :Ag<CR>
inoremap <C-F> <ESC>:Ag<CR>i

" == scrooloose/nerdtree ==
nnoremap <C-\> :NERDTreeToggle<CR>
inoremap <C-\> <ESC>:NERDTreeToggle<CR>

try
  source ~/.vimrc.js/vimrc.local
catch
endtry

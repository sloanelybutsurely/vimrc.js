set nocompatible

" === Plugins ===
call plug#begin()

" == General editor plugins ==
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'

" == Autocomplete plugins ==
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'  }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern', 'for': ['javascript', 'javascript.jsx'] }

" == JavaScript syntax highlighting ==
Plug 'gavocanov/vim-js-indent', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }

" == JavaScript tools integration ==
Plug 'flowtype/vim-flow', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'scrooloose/syntastic'

call plug#end()

syntax enable

" === Plugin settings ===

" == Shougo/deoplete.nvim ==
" == carlitux/deoplete-ternjs ==
let g:deoplete#enable_at_startup = 1
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = 0
set completeopt-=preview

" == pangloss/vim-javascript ==
let g:javascript_plugin_flow = 1

" == mxw/vim-jsx ==
let g:jsx_ext_required = 0

" == flowtype/vim-flow ==
let g:flow#enable = 1
let g:flow#autoclose = 1
let g:flow#omnicomplete = 1

" == scrooloose/syntastic ==
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_jump = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']


" === Keybindings ===

" == junegunn/fzf ==
nnoremap <C-T> :FZF<CR>
inoremap <C-T> <ESC>:FZF<CR>i

" == scrooloose/nerdtree ==
nnoremap <C-\> :NERDTreeToggle<CR>
inoremap <C-\> <ESC>:NERDTreeToggle<CR>

" ==========================================

" === User settings ==
"
" These are my personal settings. Feel free to remove
" everything past this line and customize things to
" your liking.
"                                   - @zperrault


set number
set relativenumber
set noshowmode
:let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

if filereadable(getcwd() . '/node_modules/@trunkclub/build/node_modules/flow-bin/cli.js')
  let g:flow#flowpath = getcwd() . '/node_modules/@trunkclub/build/node_modules/flow-bin/cli.js'
endif

au BufNewFile,BufRead *.es6 set filetype=javascript.jsx
au BufWritePost *.es6 if g:flow#enable | call g:flow#typecheck() | endif

nnoremap <ESC> :noh<CR><ESC>

xnoremap < <gv
xnoremap > >gv

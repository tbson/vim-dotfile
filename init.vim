call plug#begin('~/.config/nvim/plugged')
    " Autocomplete
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
    Plug 'Shougo/neosnippet'
    Plug 'Shougo/neosnippet-snippets'

    " Navigating
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'easymotion/vim-easymotion'
    Plug 'gabesoft/vim-ags'
    Plug 'dyng/ctrlsf.vim'
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'brooth/far.vim'
    Plug 'mkitt/tabline.vim'

    " Language support
    Plug 'w0rp/ale'
    Plug 'rizzatti/dash.vim'

    " Elixir
    Plug 'elixir-editors/vim-elixir'
    Plug 'slashmili/alchemist.vim'
    Plug 'mhinz/vim-mix-format'

    " JS
    Plug 'pangloss/vim-javascript'
    Plug 'jelera/vim-javascript-syntax'
    Plug 'crusoexia/vim-javascript-lib'
    Plug 'othree/html5.vim'
    Plug 'mxw/vim-jsx'
    Plug 'othree/yajs.vim'
    Plug 'othree/es.next.syntax.vim'

    " Python
    Plug 'tell-k/vim-autopep8'

    " Syntax support
    Plug 'sheerun/vim-polyglot'
    Plug 'Valloric/MatchTagAlways'
    Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
    Plug 'Yggdroot/indentLine'

    " Git
    Plug 'tpope/vim-fugitive'
call plug#end()

call deoplete#custom#var('tabnine', {
\ 'line_limit': 500,
\ 'max_num_results': 5,
\ })

let mapleader = ","
augroup vimrc_autocmd
    autocmd!

    autocmd VimEnter * nmap <Leader>w <C-w>w

    noremap <silent> <F1> :let @+=expand("%")<CR>

    autocmd VimEnter * nmap <F2> :tabnew<CR>
    autocmd VimEnter * imap <F2> <Esc>:tabnew<CR>

    autocmd VimEnter * nmap <F3> :NERDTreeToggle<CR>
    autocmd VimEnter * imap <F3> <Esc>:NERDTreeToggle<CR>

    autocmd VimEnter * nmap <F4> :w<CR>
    autocmd VimEnter * imap <F4> <Esc>:w<CR>

    autocmd VimEnter * nmap <F5> :wa<CR>
    autocmd VimEnter * imap <F5> <Esc>:wa<CR>

    autocmd VimEnter * nmap <F8> :q!<CR>
    autocmd VimEnter * imap <F8> <Esc>:q!<CR>

    autocmd VimEnter * nmap <F9> :%retab<CR>:%s/\s\+$//e<CR>
    autocmd VimEnter * imap <F9> <Esc>:%retab<CR>:%s/\s\+$//e<CR>

    autocmd VimEnter * nmap <Leader>j :ALENext<cr>
    autocmd VimEnter * nmap <Leader>k :ALEPrevious<cr>

    autocmd VimEnter * nmap <S-U> <C-R>

    autocmd VimEnter * nmap f <Plug>(easymotion-overwin-f2)

    autocmd VimEnter * nmap <silent> <leader>d <Plug>DashSearch

    autocmd VimEnter *  nmap <C-F> <Plug>CtrlSFPrompt

    autocmd FileType python set sw=4
    autocmd FileType python set ts=4
    autocmd FileType python set sts=4

    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

" Always use 0 register to paste, not shit from deleting
xnoremap p "_dP

" Go to tab by number
noremap <leader>1 1gt
noremap <D-1> 1gt

noremap <leader>2 2gt
noremap <D-2> 2gt

noremap <leader>3 3gt
noremap <D-3> 3gt

noremap <leader>4 4gt
noremap <D-4> 4gt

noremap <leader>5 5gt
noremap <D-5> 5gt

noremap <leader>6 6gt
noremap <D-6> 6gt

noremap <leader>7 7gt
noremap <D-7> 7gt

noremap <leader>8 8gt
noremap <D-8> 8gt

noremap <leader>9 :tablast<cr>
noremap <D-9> :tablast<cr>

nnoremap <C-p> :FZF<CR>
nnoremap <C-l> :Buffers<CR>
nnoremap <C-k> :Tags<CR>
nnoremap <C-g> :Commits<CR>
nnoremap <C-s> :w<CR>

nnoremap <buffer> k gk
nnoremap <buffer> j gj

nnoremap * *``

filetype plugin on
set omnifunc=syntaxcomplete#Complete

syntax sync minlines=256

let g:python_host_prog="/usr/local/bin/python2"
let g:python3_host_prog="/usr/local/bin/python3"

let g:NERDTreeWinPos = "right"
let g:NERDTreeShowBookmarks=0
let g:NERDTreeWinSize=45
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeMapActivateNode="<space>"
let NERDTreeMapOpenInTab="<ENTER>"
let NERDTreeIgnore=['^\.DS_Store$', '^__pycache__$', '^\.cache$', '\.pyc$']

" set nocursorline
set termguicolors
set lazyredraw
set regexpengine=1
set scrolljump=2
" set synmaxcol=166
set colorcolumn=120

set mouse=a
set nonumber
set clipboard=unnamed
set smartcase
set ignorecase
set incsearch
set hlsearch
set showmatch

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set foldmethod=indent
set foldlevel=19
set completeopt-=preview

set encoding=UTF-8

let g:mix_format_on_save = 1

" Auto pep8
let g:autopep8_disable_show_diff=1
let g:autopep8_on_save = 1
let g:autopep8_max_line_length=120

" Use deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#tag#cache_limit_size = 40000000

" prettier
let g:prettier#config#print_width = 120
let g:prettier#config#tab_width = 4
let g:prettier#exec_cmd_async = 1
let g:prettier#config#trailing_comma = 'none'

let g:mta_filetypes = {
    \ 'javascript.jsx': 1,
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
\}

let g:javascript_plugin_flow = 1

let g:ale_sign_error = '>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = {
    \   'javascript': ['eslint', 'flow'],
    \   'python': ['flake8'],
\}

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

let g:ags_agexe = 'rg'
let g:ags_results_per_tab = 1
let g:ags_agargs = {
  \ '--column'         : ['', ''],
  \ '--line-number'    : ['', ''],
  \ '--context'        : ['g:ags_agcontext', '-C'],
  \ '--max-count'      : ['g:ags_agmaxcount', ''],
  \ '--heading'        : ['',''],
  \ '--smart-case'     : ['','-S'],
  \ '--color'          : ['always',''],
  \ '--colors'         : [['match:fg:green', 'match:bg:black', 'match:style:nobold', 'path:fg:red', 'path:style:bold', 'line:fg:black', 'line:style:bold'] ,''],
  \ }


let g:ctrlsf_auto_close = {
    \ "normal" : 0,
    \ "compact": 0
    \}
let g:ctrlsf_auto_focus = {
    \ "at": "start"
    \ }

highlight link javascriptReserved Keyword
highlight ALEErrorSign guifg=#F90000 guibg=#000000
highlight ALEWarningSign guifg=#fabd2f guibg=#000000
highlight clear SignColumn

highlight Search guibg=peru guifg=white

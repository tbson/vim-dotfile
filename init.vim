call plug#begin('~/.config/nvim/plugged')
    " Autocomplete
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Navigating
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'easymotion/vim-easymotion'
    Plug 'dyng/ctrlsf.vim'
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'brooth/far.vim'
    Plug 'mkitt/tabline.vim'

    " Elixir
    Plug 'mhinz/vim-mix-format'

    " JS
    Plug 'HerringtonDarkholme/yats.vim'

    " Python
    Plug 'psf/black', { 'tag': '19.10b0' }
    Plug 'tweekmonster/django-plus.vim'

    " Syntax support
    Plug 'tbson/ayu-vim'
    Plug 'sheerun/vim-polyglot'
    Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
    Plug 'Yggdroot/indentLine'
    Plug 'pechorin/any-jump.vim'

    " Git
    Plug 'tpope/vim-fugitive'
call plug#end()

let mapleader = ","

augroup vimrc_autocmd
    autocmd!

    " Highlight symbol under cursor on CursorHold
    autocmd CursorHold * silent call CocActionAsync('highlight')

    autocmd VimEnter * nmap <Leader>w <C-w>w

    noremap <silent> <F1> :let @+=expand("%")<CR>
    " autocmd VimEnter * nmap <F1> :terminal<CR>
    " autocmd VimEnter * imap <F1> <Esc>:terminal<CR>

    autocmd VimEnter * nmap <F2> :tabnew<CR>
    autocmd VimEnter * imap <F2> <Esc>:tabnew<CR>

    autocmd VimEnter * nmap <F3> :NERDTreeToggle<CR>
    autocmd VimEnter * imap <F3> <Esc>:NERDTreeToggle<CR>

    autocmd VimEnter * nmap <F4> :w<CR>
    autocmd VimEnter * imap <F4> <Esc>:w<CR>

    autocmd VimEnter * nmap <F5> :wa<CR>
    autocmd VimEnter * imap <F5> <Esc>:wa<CR>

    autocmd VimEnter * nmap <F6> :tabonly<CR>
    autocmd VimEnter * imap <F6> <Esc>:tabonly<CR>

    autocmd VimEnter * nmap <F8> :q!<CR>
    autocmd VimEnter * imap <F8> <Esc>:q!<CR>

    autocmd VimEnter * nmap <F9> :q!<CR>
    autocmd VimEnter * imap <F9> <Esc>:q!<CR>

    autocmd VimEnter * nmap <F10> :q!<CR>
    autocmd VimEnter * imap <F10> <Esc>:q!<CR>

    autocmd VimEnter * nmap <F11> :q!<CR>
    autocmd VimEnter * imap <F11> <Esc>:q!<CR>

    autocmd VimEnter * nmap <F12> :q!<CR>
    autocmd VimEnter * imap <F12> <Esc>:q!<CR>

    autocmd VimEnter * nmap <Leader>j <Plug>(coc-diagnostic-next)
    autocmd VimEnter * nmap <Leader>k <Plug>(coc-diagnostic-prev)
    autocmd VimEnter * nmap <Leader>r :noh<CR>:edit<CR>

    autocmd VimEnter * nmap <S-U> <C-R>

    autocmd VimEnter * nmap f <Plug>(easymotion-sn)

    autocmd VimEnter * nmap <silent> <leader>d <Plug>DashSearch

    autocmd VimEnter *  nmap <C-F> <Plug>CtrlSFPrompt

    autocmd FileType python set sw=4
    autocmd FileType python set ts=4
    autocmd FileType python set sts=4

    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    autocmd FileType json syntax match Comment +\/\/.\+$+

    autocmd BufWritePre *.py execute ':Black'
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

tnoremap <Esc> <C-\><C-n>

nnoremap <C-g> :Commits<CR>
nnoremap <C-j> :AnyJump<CR>
nnoremap <C-k> :Tags <C-R><C-W><CR>
nnoremap <C-l> :Buffers<CR>
nnoremap <C-p> :FZF<CR>
nnoremap <C-s> :w<CR>

nnoremap <buffer> k gk
nnoremap <buffer> j gj

nnoremap * *``

filetype plugin on
filetype indent on
set omnifunc=syntaxcomplete#Complete

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

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
let NERDTreeIgnore=['^\.DS_Store$', '^__pycache__$', '^\.cache$', '\.pyc$', '\.class$', '^out$', '^node_modules$', '^build$', '^dist$', '^yarn.lock$']

" set background=dark
set termguicolors
let ayucolor="dark"
colorscheme ayu

let g:molokai_original = 1
let g:rehash256 = 1

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" set synmaxcol=166
set lazyredraw
set scrolljump=2
set colorcolumn=88
set diffopt+=vertical

set mouse=a
set nonumber
set clipboard=unnamed
set smartcase
set smarttab
set ignorecase
set incsearch
set hlsearch
set showmatch
set magic

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set foldmethod=indent
set foldlevel=19
set completeopt-=preview
set autoindent
set cindent

set encoding=UTF-8

let g:mix_format_on_save = 1

" prettier
let g:prettier#config#print_width = 88
let g:prettier#config#tab_width = 4
let g:prettier#exec_cmd_async = 1
let g:prettier#config#trailing_comma = 'none'

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

let g:ctrlsf_auto_close = {
    \ "normal" : 0,
    \ "compact": 0
    \}
let g:ctrlsf_auto_focus = {
    \ "at": "start"
    \ }

let g:any_jump_disable_default_keybindings = 1
let g:any_jump_window_width_ratio = 1
let g:any_jump_window_height_ratio = 0.4
let g:any_jump_window_top_offset   = 0

hi TabLine      guifg=Gray  guibg=#000000     gui=NONE
hi TabLineFill  guifg=Gray  guibg=#000000     gui=NONE
hi TabLineSel   guifg=White  guibg=#000000  gui=NONE

highlight Directory guifg=#96CBFE guibg=NONE

highlight ColorColumn ctermbg=0 guibg=black

highlight link javascriptReserved Keyword
highlight NERDTreeDir guifg=#96CBFE guibg=NONE
highlight NERDTreeFile guifg=#E0DAC3 guibg=NONE
highlight clear SignColumn
highlight Search guibg=peru guifg=white
highlight DiffAdd gui=NONE guifg=white guibg=green
highlight DiffChange gui=NONE guifg=blue guibg=white

" let g:indentLine_char_list = ['|', '¦', '┆']

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %=Column:\ %c\ \ Line:\ %l


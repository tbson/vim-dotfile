call plug#begin('~/.config/nvim/plugged')
    " Autocomplete
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " General
    " Plug 'neovim/nvim-lspconfig'

    " Navigating
    Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
    Plug 'dyng/ctrlsf.vim'
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'nvim-tree/nvim-tree.lua'
    Plug 'mkitt/tabline.vim'
    Plug 'brooth/far.vim'
    Plug 'pechorin/any-jump.vim'
    Plug 'andymass/vim-matchup'

    " Copilot
    Plug 'github/copilot.vim'
    Plug 'zbirenbaum/copilot.lua'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'CopilotC-Nvim/CopilotChat.nvim', { 'branch': 'canary' }

    " Elixir
    Plug 'elixir-editors/vim-elixir'
    Plug 'mhinz/vim-mix-format'
    Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}

    " Python
    Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }

    " Rust
    " Plug 'rust-lang/rust.vim'

    " Syntax support
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'tanvirtin/monokai.nvim'
    Plug 'psf/black'
    Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
    " Plug 'yaegassy/coc-intelephense', {'do': 'yarn install --frozen-lockfile'}
    Plug 'Yggdroot/indentLine'
    " Plug 'posva/vim-vue'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

    " Git
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    " Markdown
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'
call plug#end()

let mapleader = ","

augroup vimrc_autocmd
    autocmd!

    " Highlight symbol under cursor on CursorHold
    " autocmd CursorHold * silent call CocActionAsync('highlight')

    autocmd VimEnter * nmap <Leader>w <C-w>w

    noremap <silent> <F1> :let @+=expand("%")<CR> 

    autocmd VimEnter * nmap <F2> :tabnew<CR>
    autocmd VimEnter * imap <F2> <Esc>:tabnew<CR>

    autocmd VimEnter * nmap <F3> :NvimTreeToggle<CR>
    autocmd VimEnter * imap <F3> <Esc>:NvimTreeToggle<CR>

    autocmd VimEnter * nmap <F4> :w<CR>
    autocmd VimEnter * imap <F4> <Esc>:w<CR>

    autocmd VimEnter * nmap <F5> :wa<CR>
    autocmd VimEnter * imap <F5> <Esc>:wa<CR>

    autocmd VimEnter * nmap <F6> :tabonly<CR>
    autocmd VimEnter * imap <F6> <Esc>:tabonly<CR>

    autocmd VimEnter * nmap <F9> :q!<CR>
    autocmd VimEnter * imap <F9> <Esc>:q!<CR>

    autocmd VimEnter * nmap <F10> :q!<CR>
    autocmd VimEnter * imap <F10> <Esc>:q!<CR>

    autocmd VimEnter * nmap <F11> :q!<CR>
    autocmd VimEnter * imap <F11> <Esc>:q!<CR>

    autocmd VimEnter * nmap <F12> :CopilotChatToggle<CR>
    autocmd VimEnter * imap <F12> <Esc>:CopilotChatToggle<CR>

    autocmd VimEnter * nmap <Leader>j <Plug>(coc-diagnostic-next)
    autocmd VimEnter * nmap <Leader>k <Plug>(coc-diagnostic-prev)
    autocmd VimEnter * nmap <Leader>r :noh<CR>:edit<CR>

    autocmd VimEnter * nmap <Leader>b :Black<CR>

    autocmd VimEnter * nmap <S-U> <C-R>

    " autocmd VimEnter * nmap f <Plug>(easymotion-sn)

    autocmd VimEnter *  nmap <C-F> <Plug>CtrlSFPrompt

    autocmd FileType fugitive nmap <buffer> T O
    autocmd FileType python set sw=4
    autocmd FileType python set ts=4
    autocmd FileType python set sts=4

    " autocmd FileType php let b:prettier_ft_default_args = {
    "    \ 'parser': 'php',
    "    \ }

    autocmd BufWritePre *.py execute ':Black'
    " autocmd BufWritePre *.js* execute ':Prettier'
    " autocmd BufWritePre *.ts* execute ':Prettier'
    autocmd BufWritePre *.php execute ':Prettier'
    autocmd BufWritePre *.vue execute ':Prettier'
    autocmd BufWritePre *.css execute ':Prettier'
    " autocmd BufEnter * lua require'completion'.on_attach()
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

nnoremap <leader>cl :CocDiagnostics<cr>
nmap <leader>cf  <Plug>(coc-fix-current)

tnoremap <Esc> <C-\><C-n>

nnoremap <C-g> :Commits<CR>
nnoremap <C-j> :AnyJump<CR>
nnoremap <C-k> :Tags <C-R><C-W><CR>
nnoremap <C-l> :Buffers<CR>
" nnoremap <C-p> :FZF<CR>
nnoremap <c-P> <cmd>lua require('fzf-lua').files()<CR>
" nnoremap <C-p> :GFiles --cached --others --exclude-standard<CR>
" nnoremap <C-p> :GFiles --others --exclude-standard<CR>
nnoremap <C-s> :w<CR>

nnoremap <buffer> k gk
nnoremap <buffer> j gj

nnoremap <silent> <Leader>d <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <Leader>r <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <Leader>h <cmd>lua vim.lsp.buf.hover()<CR>

nnoremap * *``

filetype plugin on
filetype indent on
set omnifunc=syntaxcomplete#Complete
set signcolumn=number
" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

syntax sync minlines=256

set guifont=JetBrains\ Mono:h11
set termguicolors
" packadd! dracula_pro
" let g:dracula_colorterm = 0
" colorscheme dracula_pro

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
set colorcolumn=90
set diffopt+=vertical

set mouse=a
set nonumber
set clipboard=unnamed
" set clipboard=unnamedplus
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

set encoding=utf-8

" prettier
let g:prettier#config#print_width = 88
let g:prettier#config#tab_width = 4
let g:prettier#exec_cmd_async = 1
let g:prettier#config#trailing_comma = 'none'

" Turn on case insensitive feature
" let g:EasyMotion_smartcase = 1

let g:ctrlsf_auto_close = {
    \ "normal" : 0,
    \ "compact": 0
    \}
let g:ctrlsf_auto_focus = {
    \ "at": "start"
    \ }
let g:ctrlsf_winsize = '100'
let g:ctrlsf_position = 'bottom'
let g:ctrlsf_search_mode = 'async'

let g:any_jump_disable_default_keybindings = 1
let g:any_jump_window_width_ratio = 1
let g:any_jump_window_height_ratio = 1
let g:any_jump_window_top_offset   = 0
let g:any_jump_grouping_enabled = 1
let g:any_jump_references_enabled = 1
let g:any_jump_max_search_results = 20
" let g:any_jump_search_prefered_engine = 'ag'

" let g:far#source = 'rg'
let g:mix_format_on_save = 1

" let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'
" let g:fzf_preview_window = []

let g:javascript_plugin_jsdoc = 1
let g:python3_host_prog = '/Library/Frameworks/Python.framework/Versions/3.12/bin/python3'

" highlight Search guibg=peru guifg=white
" highlight DiffAdd gui=NONE guifg=white guibg=green
" highlight DiffChange gui=NONE guifg=blue guibg=white

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Disable Perl
let g:loaded_perl_provider = 0

command! Cexplain CopilotChatExplain
command! -range Cexplain <line1>,<line2>CopilotChatExplain

command! Creview CopilotChatReview 
command! -range Creview <line1>,<line2>CopilotChatReview

command! Cfix CopilotChatFix
command! -range Cfix <line1>,<line2>CopilotChatFix

command! Coptimize CopilotChatOptimize
command! -range Coptimize <line1>,<line2>CopilotChatOptimize

command! Cdocs CopilotChatDocs
command! -range Cdocs <line1>,<line2>CopilotChatDocs

command! Ctests CopilotChatTests
command! -range Ctests <line1>,<line2>CopilotChatTests

command! Cfixd CopilotChatFixDiagnostic
command! -range Cfixd <line1>,<line2>CopilotChatFixDiagnostic

command! Ccommit CopilotChatCommit
command! Ccommitstaged CopilotChatCommitStaged

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
" set statusline=\ %{HasPaste()}%F%m%r%h\ %=Column:\ %c\ \ Line:\ %l
" set statusline+=%F
set statusline=
set statusline+=%f  " File name
set statusline+=%=  " Split the statusline
set statusline+=%l  " Current line number
set statusline+=\:  " Separator
set statusline+=%c  " Column number
set statusline+=\ 
set statusline+=%p%%  " Percentage through file

" Copilot configuration
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" COC configuration
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
" inoremap <silent><expr> <tab> coc#pum#visible() ? coc#pum#confirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <tab> coc#pum#visible() ? coc#pum#confirm() : "\<tab>"

lua <<EOF
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require'nvim-web-devicons'.setup {
 color_icons = true;
 default = true;
}
require("nvim-tree").setup {
    filters = { 
        custom = { "^.git$", "^.vscode$", "^.elixir_ls$", "^_build$", "^.DS_Store$", "^__pycache__$", "^.cache$", ".pyc$", ".coverage$", ".class$", "^out$", "^node_modules$", "^build$", "^dist$", "^yarn.lock$", "^.mypy_cache$", "^.swm$", "^tmp$"} 
    },
    git = {
        enable = false,
    },
    view = {
        side = "right",
        width = 48,
    },
    renderer = {
        root_folder_label = false,
    }
}
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  ignore_install = {"phpdoc"},
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
require('monokai').setup {
    palette = {
        base2 = '#000000',
    }
}
require('fzf-lua').setup{
  winopts = {
    preview = { hidden = "hidden" },
    height=1,
    width=1
  },
  files = {
    git_icons = false
  }
}
require("CopilotChat").setup {
  debug = true, -- Enable debugging
  model = 'gpt-4o',
  auto_insert_mode = true,
  highlight_selection = true,
  context = 'buffers',
  window = {
    layout = 'float', -- 'vertical', 'horizontal', 'float', 'replace'
    border = 'rounded',
    width = 0.9, -- fractional width of parent, or absolute width in columns when > 1
    height = 0.8, -- fractional height of parent, or absolute height in rows when > 1
  },
  show_help = false,
  -- See Configuration section for rest
}
-- require'lspconfig'.pyright.setup{}
-- require("elixir").setup()
EOF

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype plugin indent on
syntax on
let mapleader = "\<Space>"
set tabstop=2 shiftwidth=2 expandtab
set hlsearch
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set wildignore+=*.class,*/resolution-cache/*,*/$global/*,*/target/scala*
set ruler
set colorcolumn=80
set cursorline
set scrolloff=5
set autoread
set hidden
set ttyfast
set encoding=utf-8
if !has('nvim')
  set mouse=a
  set ttymouse=xterm2
endif
set signcolumn=yes
set omnifunc=syntaxcomplete#Complete
set number relativenumber
set nu rnu
au CursorHold * checktime
runtime macros/matchit.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-fugitive'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdcommenter'
Plug 'qpkorr/vim-bufkill'
Plug 'easymotion/vim-easymotion'
Plug 'vim-ruby/vim-ruby'
Plug 'w0rp/ale'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-endwise'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'burnettk/vim-angular'
Plug 'tomasiser/vim-code-dark'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap \ :bnext<CR>
nnoremap = :Buffers<CR>
nnoremap <Leader>. :ls<CR>:b<Space>
nnoremap <CR> :noh<CR>
noremap <Leader>l :ALEFix<CR>
" noremap <CR> :
noremap <Leader>o :FZF<CR>
noremap <Leader>f :VimFilerExplorer -parent<CR>
vmap <Leader>y "+y
map <C-c> :BD<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fzf.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=/usr/local/opt/fzf
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors
colorscheme codedark
let g:airline_theme = 'codedark'
autocmd BufWritePre * :%s/\s\+$//e

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Temporary Files.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if isdirectory($HOME . '/.vim-swap') == 0
  :silent !mkdir -p ~/.vim-swap >/dev/null 2>&1
endif
set directory=~/.vim-swap//
if isdirectory($HOME . '/.vim-backup') == 0
  :silent !mkdir -p ~/.vim-backup >/dev/null 2>&1
endif
set backupdir=~/.vim-backup/

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ruby.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead *.slim set ft=slim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ale.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
  \   'javascript': ['standard'],
  \   'html': ['tidy'],
  \   'bash': ['shellcheck'],
  \   'ruby': ['rubocop'],
  \ }

let g:ale_fixers = {
  \   'javascript': ['standard'],
  \   'html': ['tidy'],
  \   'bash': ['shellcheck'],
  \   'ruby': ['rubocop'],
  \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerdcommenter.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Persistent history.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set undofile
set undodir=$HOME/.vim-undo
set undolevels=1000
set undoreload=10000

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Easymotion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DelimitMate.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Performance tweaks for terminal.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocursorline        " Don't paint cursor line
set nocursorcolumn      " Don't paint cursor column
set lazyredraw          " Wait to redraw
set scrolljump=8        " Scroll 8 lines at a time at bottom/top

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Local machine config.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
so ~/.vimrc.local

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Project specific MUST BE AT END.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set exrc
set secure

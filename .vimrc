set nocompatible
set directory=/tmp "swap files
set backupdir=/tmp,. "tilde files

execute pathogen#infect()
syntax on
filetype plugin indent on
syntax enable
set guifont=Inconsolata:h18
set background=dark

set foldmethod=syntax
set foldcolumn=2

set clipboard=unnamed "share clipboard with OS
set iskeyword+=- "add dash to keywords (for e, b, *)
set nrformats= "number increments
set number
set ignorecase
set smartcase
set ruler
set undolevels=1000

set expandtab
set softtabstop=2
set tabstop=2
set shiftwidth=2
set splitright
set splitbelow

:let mapleader = ","
",s spec method
nnoremap <leader>s :!bundle exec rspec <C-R>=expand("%:p")<CR> --format nested --no-color -l <C-R>=line(".")<CR><CR>
",S spec file
nnoremap <leader>S :!bundle exec rspec <C-r>=expand("%:p")<CR> --format nested --no-color<CR>
",n toggle NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>
",j go to tag definition
nnoremap <leader>j <C-]>
",k go up the tag definition chain
nnoremap <leader>k <C-t>

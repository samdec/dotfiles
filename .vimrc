call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-characterize'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/LargeFile'
Plug 'airblade/vim-gitgutter'
Plug 'kchmck/vim-coffee-script'
Plug 'scrooloose/syntastic'
Plug 'wincent/Command-T'
Plug 'rking/ag.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'gavinbeatty/dragvisuals.vim'
Plug 'justinmk/vim-gtfo'
" required for snipmate
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'bling/vim-airline'
Plug 'kana/vim-operator-user'
Plug 'rgrinberg/vim-operator-gsearch'
call plug#end()

set nocompatible
set directory=/tmp "swap files
set backupdir=/tmp,. "tilde files

syntax on
filetype plugin indent on
syntax enable
set guifont=Inconsolata:h18
set background=dark
set hlsearch
let g:airline_theme = "sol"

set iskeyword+=- "add dash to keywords (for e, b, *)
set number
set ignorecase
set smartcase
set undolevels=1000

set expandtab
set softtabstop=2
set tabstop=2
set shiftwidth=2
set splitright
set splitbelow

"For all ruby/rails/rspec/cucumber files, strip out trailing white space at the end of lines.
autocmd FileType cucumber,ruby,yaml,eruby,coffee autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

"exclude directories from command-t
:let g:CommandTWildIgnore=&wildignore . ",**/coverage/*,**/spec/reports/*,**/tmp/*,**/node_modules/*,**/build/*"

:let mapleader = ","
",s spec method
nnoremap <leader>s :Dispatch bundle exec rspec <C-R>=expand("%:p")<CR> --format nested -l <C-R>=line(".")<CR><CR>
",S spec file
nnoremap <leader>S :Dispatch bundle exec rspec <C-r>=expand("%:p")<CR> --format nested <CR>
",n toggle NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>
",j go to tag definition
nnoremap <leader>j <C-]>
",k go up the tag definition chain
nnoremap <leader>k <C-t>
"Navigate splits without c-w first
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <c-w>l
nnoremap <C-H> <c-w>H
nnoremap <C-J> <c-w>J
nnoremap <C-K> <c-w>K
nnoremap <C-L> <C-w>L

" Map g/ to ag search
map g/ <Plug>(operator-ag)

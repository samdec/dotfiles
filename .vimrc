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
Plug 'yegappan/greplace'
Plug 'kien/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'majutsushi/tagbar'
call plug#end()

"" Basic Setup
set nocompatible      " Use vim, no vi defaults
set number            " Show line numbers
set ruler             " Show line and column number
syntax enable         " Turn on syntax highlighting allowing local overrides
set encoding=utf-8    " Set default encoding to UTF-8
set undolevels=1000

set splitright
set splitbelow

filetype plugin indent on " Turn on filetype plugins (:help filetype-plugin)

set directory=/tmp "swap files
set backupdir=/tmp,. "tilde files

"" Whitespace
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters

"" GUI and Themes
set guifont=Inconsolata:h18
set background=dark
let g:airline_theme = "sol"
colorscheme macvim

"" Searching
set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

set iskeyword+=- "add dash to keywords (for e, b, *)

set grepprg=ag " greplace searches with Silver Searcher
let g:grep_cmd_opts='--line-numbers --noheading'


"" Wild settings

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Ignore librarian-chef, vagrant, test-kitchen and Berkshelf cache
set wildignore+=*/tmp/librarian/*,*/.vagrant/*,*/.kitchen/*,*/vendor/cookbooks/*

" Ignore rails temporary asset caches
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*

set wildignore+=**/coverage/*,**/spec/reports/*,**/tmp/*,**/node_modules/*,**/build/*

"For all ruby/rails/rspec/cucumber files, strip out trailing white space at the end of lines.
autocmd FileType cucumber,ruby,yaml,eruby,coffee autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

let mapleader = ","

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
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Map g/ to ag search
map g/ <Plug>(operator-ag)

" Map ,t to ctrl-p
map <leader>t <c-p>

map <leader>rt :TagbarToggle<CR>

" Shift-Y should copy to end of line, like Shift-D deletes to end of line
noremap Y y$

" Accidently hit Q too damn much
noremap Q ""

inoremap ;; <Esc>

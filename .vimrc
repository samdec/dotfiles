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
Plug 'AndrewRadev/splitjoin.vim'
Plug 'gavinbeatty/dragvisuals.vim'
Plug 'justinmk/vim-gtfo'
" required for snipmate
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kana/vim-operator-user'
Plug 'rgrinberg/vim-operator-gsearch'
Plug 'yegappan/greplace'
Plug 'ervandew/supertab'
Plug 'majutsushi/tagbar'
Plug 'elixir-lang/vim-elixir'
Plug 'ElmCast/elm-vim'
" Plug 'Valloric/YouCompleteMe'
" Plug 'w0rp/ale'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'mileszs/ack.vim'
Plug 'altercation/vim-colors-solarized'
call plug#end()

"" Basic Setup
set nocompatible      " Use vim, no vi defaults
set number            " Show line numbers
set ruler             " Show line and column number
set encoding=utf-8    " Set default encoding to UTF-8
set undolevels=1000

set splitright
set splitbelow

filetype plugin indent on " Turn on filetype plugins (:help filetype-plugin)

set directory=/tmp "swap files
set backupdir=/tmp,. "tilde files

"" Enable mouse mode in terminal
set mouse=a

"" Show hidden files in NerdTREE by default
let g:NERDTreeShowHidden=1

"" Whitespace
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters

"" GUI and Themes
set guifont=Inconsolata_for_Powerline:h18
set background=dark
let g:airline_theme = "sol"
let g:airline_powerline_fonts = 1
syntax enable
colorscheme solarized

"" Searching
set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

set iskeyword+=- "add dash to keywords (for e, b, *)

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

" Map g/ to ack search
map g/ <Plug>(operator-ack)

" Use Silver Searcher if available
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

map <leader>rt :TagbarToggle<CR>

" Map fzf fuzzy searches
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>
nmap <Leader>a :Ag<CR>

" Shift-Y should copy to end of line, like Shift-D deletes to end of line
noremap Y y$

" Accidently type Q and q: too damn much
noremap Q <silent>
noremap q: <silent>

inoremap ;; <Esc>

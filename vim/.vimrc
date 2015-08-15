set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'airblade/vim-gitgutter'
Plugin 'Raimondi/delimitMate'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'sirver/ultisnips'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'junegunn/goyo.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'AndrewRadev/splitjoin.vim'

Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'thoughtbot/vim-rspec'
Plugin 'othree/html5.vim'
Plugin 'tpope/vim-haml'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'plasticboy/vim-markdown'
Plugin 'fatih/vim-go'

call vundle#end()

syntax enable
filetype plugin indent on

set encoding=utf-8

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.
set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.
set cursorline                    " Highlight the line of the cursor.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set linebreak                     " Break lines.
set nolist                        " `set list` disables linebreak.
set scrolloff=5                   " Line scroll offset from top and bottom.

set title                         " Set the terminal's title
set visualbell                    " No beeping.

set noswapfile                    " Disable .swp file creation.
set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.

set history=1000                  " Remember last 1000 commands.
set undolevels=1000               " Remember last 1000 undos.
set wildignore=*.swp,*.swo,*.bak,*.class

set tabstop=2                     " Global tab width.
set shiftwidth=2                  " And again, related.
set expandtab                     " Use spaces instead of tabs.

set clipboard=unnamed             " Enable OS clipboard to properly paste in to VIM buffer.
set pastetoggle=<F2>

set background=dark
colorscheme twilight

let &colorcolumn="80,100"         " Highlight column 80 and 100
let c_space_errors=1              " Highlight trailing spaces
set splitbelow                    " Open vsplits to below
set splitright                    " Open hsplits to the right

" Flag filetypes
" - Ruby
autocmd BufRead,BufNewFile {Rakefile,Gemfile,config.ru,Vagrantfile,Thorfile} set ft=ruby

" - Sass/Scss
autocmd BufRead,BufNewFile *.sass set ft=sass.css
autocmd BufRead,BufNewFile *.scss set ft=scss.css
autocmd BufRead,BufNewFile *.eco set ft=html
autocmd FileType css,sass set iskeyword+=-

" Activate omnifunc on filetypes
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType css,sass,scss setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags

let mapleader=","

runtime! config/**/*.vim

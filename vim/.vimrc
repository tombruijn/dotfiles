set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle "gmarik/vundle"
Bundle "scrooloose/nerdtree"
Bundle "scrooloose/nerdcommenter"
Bundle "kien/ctrlp.vim"
Bundle "ervandew/supertab"
Bundle "junegunn/goyo.vim"

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
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title
set visualbell                    " No beeping.

set noswapfile                    " Disable .swp file creation.
set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.

set history=1000                  " Remember last 1000 commands.
set undolevels=1000               " Remember last 1000 undos.
set wildignore=*.swp,*.swo,*.bak,*.class,*.lock

set tabstop=2                     " Global tab width.
set shiftwidth=2                  " And again, related.
set expandtab                     " Use spaces instead of tabs.

set laststatus=2                  " Show the status line all the time.
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\%=%-16(\ %l,%c-%v\ %)%P " Useful status information at bottom of screen.

set clipboard=unnamed             " Enable OS clipboard to properly paste in to VIM buffer.

" Open/Close the NERDTree using `Shift-T o` and `Shift-T c`.
nmap <C-T> :NERDTree<Enter>
nmap <C-Q> :NERDTreeClose<Enter>

nmap <Tab> <C-w>w

" Tell CtrlP to always use the base directory that VIM initialized with
" as the starting point for finding files, rather than scoping it down to the
" current buffer's directory level.
let g:ctrlp_working_path_mode = 0

" Show hidden files in NERDtree
let NERDTreeShowHidden=1

" Flag the following files as Ruby:
autocmd BufRead,BufNewFile {Rakefile,Gemfile,config.ru,Vagrantfile,Thorfile} set ft=ruby

colorscheme jellybeans
set colorcolumn=80

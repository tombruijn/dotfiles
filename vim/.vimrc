set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'junegunn/goyo.vim'
Plugin 'godlygeek/tabular'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-haml'
Plugin 'othree/html5.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'
Plugin 'plasticboy/vim-markdown'
Plugin 'terryma/vim-multiple-cursors'

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
set scrolloff=5                   " Show 3 lines of context around the cursor.

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

set clipboard=unnamed             " Enable OS clipboard to properly paste in to VIM buffer.

colorscheme jellybeans            " Configure appearance
let &colorcolumn="80,120"         " Highlight column 80 and 115
let c_space_errors=1              " Highlight trailing spaces

" Flag the following files as Ruby:
autocmd BufRead,BufNewFile {Rakefile,Gemfile,config.ru,Vagrantfile,Thorfile} set ft=ruby

let NERDTreeShowHidden=1 " Show hidden files in NERDTree
let NERDTreeIgnore = ['\.git$', '\.DS_Store$'] " Ignore certain files in NERDTree
let g:NERDTreeHijackNetrw=0

" CtrlP
" Tell CtrlP to always use the base directory that VIM initialized with
" as the starting point for finding files, rather than scoping it down to the
" current buffer's directory level.
let g:ctrlp_working_path_mode = 0
" List hidden files in CtrlP
let g:ctrlp_show_hidden = 1

let g:airline#extensions#tabline#enabled = 1

let g:vim_markdown_folding_disabled=1 " Disable folding for markdown

nmap <C-T> :NERDTreeToggle<Enter> " Open/Close the NERDTree using `Ctrl + T` to toggle.
nmap <Tab> <C-w>w                 " Cycle through buffers with tab
nmap <silent> <esc> :noh<cr>      " Clear current search highlights on ESC
nmap <A-/> <Leader>c " Toggle comments
vmap <A-/> <Leader>c " Toggle comments

" Highlight trailing whitespace as an error
highlight ExtraWhitespace ctermbg=darkred guibg=#902020
match ExtraWhitespace /\s\+$/

fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

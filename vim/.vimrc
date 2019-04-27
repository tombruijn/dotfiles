set nocompatible

call plug#begin('~/.vim/plugged')

" Themes
Plug 'vim-airline/vim-airline-themes'
Plug 'reedes/vim-colors-pencil', { 'on': [] }

" Navigation
Plug 'bling/vim-airline'
Plug 'mileszs/ack.vim', { 'on': 'Ack' }
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'], 'commit': '5782b22' }

" Languages
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'othree/html5.vim', { 'for': ['html', 'eruby'] }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'tpope/vim-haml', { 'for': ['haml', 'sass', 'scss'] }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }

" Useful tools
Plug 'tpope/vim-fugitive', { 'on': ['Gblame', 'Gbrowse'] }
Plug 'tpope/vim-rhubarb', { 'on': ['Gbrowse'] }
Plug 'tpope/vim-repeat', { 'commit': '7a6675f' }
Plug 'tpope/vim-surround', { 'commit': '2d05440' }

Plug 'AndrewRadev/splitjoin.vim', { 'commit': '9e2d602' }
Plug 'AndrewRadev/switch.vim'
Plug 'airblade/vim-gitgutter', { 'commit': 'b27ee4d' }
Plug 'janko-m/vim-test', { 'on': ['TestFile', 'TestNearest', 'TestLast', 'TestSuite'] }
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/vim-easy-align', { 'on': '<Plug>(EasyAlign)' }
Plug 'lifepillar/vim-mucomplete'
Plug 'sirver/ultisnips', { 'commit': '423f264' }
Plug 'tomtom/tcomment_vim', { 'commit': 'f5ca095', 'on': 'TComment' }
Plug 'w0rp/ale'

Plug 'ludovicchabant/vim-gutentags'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim', { 'on': ['Files', 'Buffers', 'Tags', 'Commands', 'Ag', 'History', 'Marks', 'Snippets'] }

call plug#end()

set encoding=utf-8

set showcmd                       " Display incomplete commands.
set noshowmode                    " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.
set hidden                        " Handle multiple buffers better.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.
set cursorline                    " Highlight the line of the cursor.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set spelllang=en,nl
set spellfile=$HOME/.vim/spell/en.utf-8.add,$HOME/.vim/spell/nl.utf-8.add
set complete+=kspell

set wrap                          " Turn on line wrapping.
set linebreak                     " Break lines.
set breakindent                   " Add indenting after break.
let &showbreak="↳ "               " Line break indicator.

set scrolloff=5                   " Line scroll offset from top and bottom.

set title                         " Set the terminal's title
set visualbell                    " No beeping.

set noswapfile                    " Disable .swp file creation.
set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.

set history=1000                  " Remember last 1000 commands.
set undolevels=1000               " Remember last 1000 undos.
set path+=**
set wildignore=*.swp,*.swo,*.bak,*.class,*/vendor/*,*/tmp/*

set tabstop=2                     " Global tab width.
set shiftwidth=2                  " And again, related.
set shiftround
set expandtab                     " Use spaces instead of tabs.
au FocusGained,BufEnter * checktime

set clipboard=unnamed             " Enable OS clipboard to properly paste in to VIM buffer.
set pastetoggle=<F2>

if (has("termguicolors"))
 set termguicolors
endif
let &colorcolumn="80,100"         " Highlight column 80 and 100
let c_space_errors=1              " Highlight trailing spaces
set splitbelow                    " Open vsplits to below
set splitright                    " Open hsplits to the right

set lazyredraw

let mapleader=","
let g:font_normal="Meslo\ LG\ M\ Regular\ for\ Powerline:h14"
let g:font_focus="Meslo\ LG\ M\ Regular\ for\ Powerline:h20"

runtime! config/**/*.vim

set shortmess+=IF
call Load_default_theme()

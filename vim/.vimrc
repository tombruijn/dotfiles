set nocompatible

call plug#begin('~/.vim/plugged')

" Themes
Plug 'vim-airline/vim-airline-themes'
Plug 'reedes/vim-colors-pencil', { 'on': [] }

" Navigation
Plug 'vim-airline/vim-airline'
Plug 'mileszs/ack.vim', { 'on': 'Ack' }
Plug 'preservim/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'tpope/vim-projectionist'

" Languages
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'othree/html5.vim', { 'for': ['html', 'eruby'] }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'MaxMEllon/vim-jsx-pretty', { 'for': 'javascript' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'tpope/vim-haml', { 'for': ['haml', 'sass', 'scss'] }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }

" Useful tools
Plug 'tpope/vim-fugitive', { 'on': ['Git', 'GBrowse', 'Gdiff'] }
Plug 'tpope/vim-rhubarb', { 'on': ['GBrowse'] }
Plug 'tpope/vim-repeat', { 'commit': '7a6675f' }
Plug 'tpope/vim-surround', { 'commit': '2d05440' }

Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'airblade/vim-gitgutter', { 'commit': 'b27ee4d' }
Plug 'janko-m/vim-test', { 'on': ['TestFile', 'TestNearest', 'TestLast', 'TestSuite'] }
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/vim-easy-align', { 'on': '<Plug>(EasyAlign)' }
Plug 'lifepillar/vim-mucomplete'
Plug 'sirver/ultisnips', { 'commit': '423f264' }
Plug 'tomtom/tcomment_vim', { 'on': 'TComment' }
Plug 'dense-analysis/ale'

Plug 'liuchengxu/vista.vim'
Plug 'ludovicchabant/vim-gutentags'

if filereadable('/opt/homebrew/opt/fzf')
  Plug '/opt/homebrew/opt/fzf'
else
  Plug '/usr/local/opt/fzf'
endif
Plug 'junegunn/fzf.vim' ", { 'on': ['Files2', 'Buffers', 'Tags', 'Commands', 'Ag', 'History', 'Marks', 'Snippets'] }

Plug 'zerowidth/vim-copy-as-rtf', { 'on': 'CopyRTF' }

Plug 'yegappan/lsp'

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
set display+=lastline             " Show last line contents if it doesn't fit entirely on in buffer

set scrolloff=5                   " Line scroll offset from top and bottom.

set title                         " Set the terminal's title
set visualbell                    " No beeping.

set noswapfile                    " Disable .swp file creation.
set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.

set history=1000                  " Remember last 1000 commands.
set undolevels=1000               " Remember last 1000 undos.

" Configure vim path
" - .: search relative to the directory of the current file
" - **: current directory and all sub directories
set path=.,**
" Ignore paths for `path` config
" The path config sets `**` which searches everything, which can be a
" performance issue. Tell vim which directories to ignore.
set wildignore=*.swp,*.swo,*.bak,*.class,*.lock,.gitkeep,.git/**
set wildignore+=**/vendor/**,**/tmp/**,tmp/**,log/**,coverage/**,doc/**
set wildignore+=*.ico,*.png,*.PNG,*.JPG,*.jpg,*.JPEG,*.jpeg,*.GIF,*.gif
set wildignore+=*/node_modules,node_modules,*.min.js,public/packs/**,**/public/packs-test/**

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

" Configure syntax highlighting
" Reduce syntax highlighting so it doesn't hang while trying to
" highlight everything.
syntax sync minlines=2000
syntax sync maxlines=5000
set synmaxcol=400
set redrawtime=4000
set lazyredraw

" Make % work on < and > to switch between them
set matchpairs+=<:>

" Disable line numbers in TOHtml output (which CopyRTF uses)
let g:html_number_lines=0

let mapleader=","
let g:font_normal="Meslo\ LG\ M\ Regular\ for\ Powerline:h16"
let g:font_focus="Meslo\ LG\ M\ Regular\ for\ Powerline:h20"

runtime! config/**/*.vim

set shell=$SHELL " Fix Ruby + chruby loading (https://github.com/postmodern/chruby/wiki/Vim)
set shortmess+=IF
set shortmess-=S " Show search matches count on search
call Load_default_theme()

abbr changset changeset
abbr changsets changesets

set nocompatible

call plug#begin('~/.vim/plugged')

" Themes
Plug 'vim-airline/vim-airline-themes'
Plug 'reedes/vim-colors-pencil', { 'on': [] }

" Navigation
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim', { 'commit': '28fce0f' }
Plug 'mileszs/ack.vim', { 'on': 'Ack' }
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'], 'commit': '5782b22' }

" Languages
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'othree/html5.vim', { 'for': ['html', 'eruby'] }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'tpope/vim-haml', { 'for': ['haml', 'sass', 'scss'] }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }

" Useful tools
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat', { 'commit': '7a6675f' }
Plug 'tpope/vim-surround', { 'commit': '2d05440' }

Plug 'AndrewRadev/splitjoin.vim', { 'commit': '9e2d602' }
Plug 'airblade/vim-gitgutter', { 'commit': 'dc73a81' }
Plug 'janko-m/vim-test'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/vim-easy-align', { 'on': '<Plug>(EasyAlign)' }
Plug 'lifepillar/vim-mucomplete'
Plug 'sirver/ultisnips', { 'commit': '423f264', 'on': [] }
Plug 'tomtom/tcomment_vim', { 'commit': 'f5ca095', 'on': 'TComment' }
Plug 'w0rp/ale'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim', { 'on': ['Files', 'Buffers', 'Tags'] }

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
set shiftround
set expandtab                     " Use spaces instead of tabs.

set clipboard=unnamed             " Enable OS clipboard to properly paste in to VIM buffer.
set pastetoggle=<F2>

let &colorcolumn="80,100"         " Highlight column 80 and 100
let c_space_errors=1              " Highlight trailing spaces
set splitbelow                    " Open vsplits to below
set splitright                    " Open hsplits to the right

" Flag filetypes
let g:jsx_ext_required = 0        " Don't require .jsx ext for JSX plugin
augroup filetypes
  " Clear this group's autocmds if previously set
  autocmd!

  " Ruby
  autocmd BufRead,BufNewFile {Rakefile,Gemfile,config.ru,Vagrantfile,Thorfile,Brewfile,*.jpbuilder}
        \ set ft=ruby

  " Sass/Scss
  autocmd BufRead,BufNewFile *.sass set ft=sass.css
  autocmd BufRead,BufNewFile *.scss set ft=scss.css
  autocmd FileType css,sass
        \ setlocal iskeyword+=-

  " git commit
  autocmd Filetype gitcommit
        \ let &l:colorcolumn="50,72" |
        \ setlocal spell textwidth=72

  " Markdown
  autocmd BufRead,BufNewFile *.md
        \ let &l:colorcolumn="80" |
        \ setlocal spell

  autocmd Filetype vim
        \ let &l:colorcolumn="80,100" |
        \ setlocal textwidth=0
augroup END

let mapleader=","
let g:font_normal="Meslo\ LG\ M\ Regular\ for\ Powerline:h14"
let g:font_focus="Meslo\ LG\ M\ Regular\ for\ Powerline:h20"

runtime! config/**/*.vim

set shortmess+=IF
call Load_default_theme()

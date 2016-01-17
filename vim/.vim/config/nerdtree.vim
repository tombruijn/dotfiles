let NERDTreeMinimalUI=1 " Hide UI I don't use
let NERDTreeAutoDeleteBuffer=1 " Delete buffers on move
let NERDTreeShowHidden=1 " Show hidden files in NERDTree

" Ignore certain files in NERDTree
let NERDTreeIgnore=[
  \ '\.git$',
  \ '\.DS_Store$',
  \ '\.bundle',
  \ 'tmp/',
  \ 'coverage',
  \ '\.sass-cache',
  \ '\.capistrano',
  \ '\.yardoc',
  \ '^_build$',
  \ '^build$',
  \ '^node_modules$',
  \ '^tags$[[file]]'
\ ]

" Don't open NERDTree if I open a directory with vim
let g:NERDTreeHijackNetrw=0

" Open/Close the NERDTree using `Ctrl + T` to toggle.
nmap <C-T> :NERDTreeToggle<CR>
" 'Find in Tree' find currently open buffer file in tree
nmap <leader>ft :NERDTreeFind<CR>

augroup nerdtree
  autocmd!

  " Refresh tree on pane focus
  autocmd WinEnter * if exists("b:NERDTree") | execute "normal R" | endif
augroup END

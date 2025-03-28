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
  \ '^node_modules$',
  \ '^__snapshots__$'
\ ]

" Don't open NERDTree if I open a directory with vim
let g:NERDTreeHijackNetrw=0

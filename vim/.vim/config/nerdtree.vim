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

" Open/Close the NERDTree using `Ctrl + T` to toggle.
nmap <C-T> :NERDTreeToggle<CR>

" 'Find in Tree' find currently open buffer file in tree
if exists('g:vscode')
  " VSCode extension
  nnoremap <leader>ft <Cmd>call VSCodeNotify('workbench.files.action.showActiveFileInExplorer')<CR>
else
  " Normal (Neo)vim
  nmap <leader>ft :NERDTreeFind<CR>
endif

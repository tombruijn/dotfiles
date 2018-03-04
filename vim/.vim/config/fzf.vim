let g:fzf_layout = { 'down': '~20%' }
let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'String'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'rubyClass'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Directory'],
  \ 'pointer': ['fg', 'Directory'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment']
  \ }
nmap <leader>p :Files<CR>
nmap <c-p> :Files<CR>
nmap <c-\> :Buffers<CR>

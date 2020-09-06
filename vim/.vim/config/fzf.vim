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
nmap <C-P> :Files2<CR>
nmap <C-\> :Buffers<CR>
nnoremap <leader>\ :Buffers<CR>

" Favor results with matches at the end first, then the shortest results first
command! -bang -nargs=? -complete=dir Files2
  \ call fzf#vim#files(<q-args>, {'options': ['--tiebreak=end,length']}, <bang>0)

let $FZF_DEFAULT_OPTS="--color=dark --layout=reverse"
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.4 } }
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

" Shortcuts
nnoremap <c-p> :Files2<CR>
nnoremap <c-BS> :Buffers<CR>
nnoremap <leader>; :Rg<CR>
nnoremap <leader>' :Commands<CR>
nnoremap <leader>h :Tags<CR>

" Favor results with matches at the end first, then the shortest results first
command! -bang -nargs=? -complete=dir Files2
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--tiebreak=length,end']}), <bang>0)

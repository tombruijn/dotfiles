" Tiebreak: Favor results with matches at the end first, then the shortest results first
let $FZF_DEFAULT_OPTS="--color=dark --layout=reverse --tiebreak=length,end"

let g:fzf_vim = {}
let g:fzf_vim.preview_window = ['right,50%', 'ctrl-o']

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.5 } }
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

" Keymaps
nnoremap <c-p> :Files<CR>
nnoremap <c-BS> :Buffers<CR>
nnoremap <leader>fr :Rg<CR>
" Show Git history for the current file
nnoremap <leader>fg :BCommits<CR>
" Show Git history for the selected lines
vnoremap <leader>fg :BCommits<CR>
nnoremap <leader>fe :Commands<CR>
nnoremap <leader>fv :Tags<CR>
nnoremap <leader>fw :Windows<CR>
nnoremap <leader>fh :History<CR>
nnoremap <leader>fs :Snippets<CR>
nnoremap <leader>fm :Maps<CR>
nnoremap <leader>f/ :History/<CR>

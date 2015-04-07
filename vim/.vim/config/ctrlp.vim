" Tell CtrlP to always use the base directory that VIM initialized with
" as the starting point for finding files, rather than scoping it down to the
" current buffer's directory level.
let g:ctrlp_working_path_mode = 0

" List hidden files in CtrlP
let g:ctrlp_show_hidden = 1

" Search on filename by default
let g:ctrlp_by_filename = 1

" Ignore directories and files
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v(\.git|\.hg|\.svn|log|\.yarddoc|doc|coverage|tmp|node_modules|\.sass-cache|.yardoc|build)$',
  \ 'file': '\v\.(DS_Store)$'
  \ }

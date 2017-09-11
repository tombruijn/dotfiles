" Tell CtrlP to always use the base directory that VIM initialized with
" as the starting point for finding files, rather than scoping it down to the
" current buffer's directory level.
let g:ctrlp_working_path_mode=0

" List hidden files in CtrlP
let g:ctrlp_show_hidden=1

" Don't search on filename by default
let g:ctrlp_by_filename=0

" Use the_silver_searcher (ag) https://github.com/ggreer/the_silver_searcher
" for fast search.
" http://blog.patspam.com/2014/super-fast-ctrlp
let g:ctrlp_user_command='ag %s -i --vimgrep --hidden --path-to-ignore ~/.ignore -g ""'

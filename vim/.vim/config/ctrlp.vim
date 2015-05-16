" Tell CtrlP to always use the base directory that VIM initialized with
" as the starting point for finding files, rather than scoping it down to the
" current buffer's directory level.
let g:ctrlp_working_path_mode=0

" List hidden files in CtrlP
let g:ctrlp_show_hidden=1

" Search on filename by default
let g:ctrlp_by_filename=1

" Use the_silver_searcher (ag) https://github.com/ggreer/the_silver_searcher
" for fast search.
" http://blog.patspam.com/2014/super-fast-ctrlp
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
  \ --ignore .git
  \ --ignore .svn
  \ --ignore .hg
  \ --ignore .DS_Store
  \ --ignore log
  \ --ignore .yarddoc
  \ --ignore doc
  \ --ignore coverage
  \ --ignore tmp
  \ --ignore node_modules
  \ --ignore .sass-cache
  \ --ignore build
  \ --ignore .kitchen
  \ --ignore public/uploads
  \ -g ""'

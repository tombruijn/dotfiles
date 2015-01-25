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
  \ 'dir':  '\.git\|\.hg\|\.svn\|log\|.yarddoc\|doc\|coverage\|tmp\|\.sass-cache$',
  \ 'file': '\v\.(DS_Store)$'
  \ }

" Open files in tabs by default
" - Map default behavior to `Ctrl + T`
" - Map open in tab behavior to `Enter`
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': ['<c-t>'],
  \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>']
  \ }

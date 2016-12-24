" Snippets config
" Bound to C-J/K because TAB is used by autocomplete.
let g:UltiSnipsExpandTrigger="<C-J>"
let g:UltiSnipsJumpForwardTrigger="<C-J>"
let g:UltiSnipsJumpBackwardTrigger="<C-K>"

" mucomplete
set completeopt=menu,menuone,preview,noinsert,noselect
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#chains = {}
let g:mucomplete#chains.default = ['c-n', 'omni', 'user', 'dict', 'file']

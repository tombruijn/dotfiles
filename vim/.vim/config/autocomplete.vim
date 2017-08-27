" Snippets config
" Bound to C-J/K because TAB is used by autocomplete.
let g:UltiSnipsExpandTrigger="<C-J>"
let g:UltiSnipsJumpForwardTrigger="<C-J>"
let g:UltiSnipsJumpBackwardTrigger="<C-K>"

" mucomplete
set completeopt=menu,menuone,preview,noinsert,noselect
set shortmess+=c " Turn off completion messages

let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#chains = {}
let g:mucomplete#chains.default = ['c-n', 'omni', 'user', 'dict', 'file']

" Fix mapping issue with UltiSnips config using <C-J>
" https://github.com/lifepillar/vim-mucomplete/blob/58e04c4e915d8ea51ac93f93e5709197a9c08533/doc/mucomplete.txt#L634
inoremap <silent> <plug>(MUcompleteFwdKey) <right>
imap <expr> <right> <plug>(MUcompleteCycFwd)

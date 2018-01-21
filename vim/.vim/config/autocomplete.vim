" Snippets config
" Bound to C-J/K because TAB is used by autocomplete.
let g:UltiSnipsExpandTrigger="<C-J>"
let g:UltiSnipsJumpForwardTrigger="<C-J>"
let g:UltiSnipsJumpBackwardTrigger="<C-K>"

" Autocomplete
set wildmenu " Enhanced command line completion.
set wildmode=list:longest " Complete files like a shell.
set shortmess+=c " Turn off completion messages
set completeopt=menu,menuone,noinsert,noselect,preview
set complete=.,w,b,u,i

" mucomplete
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#chains = { 'default': ['c-n', 'omni', 'uspl', 'path'] }
let g:mucomplete#no_mappings = 1
let g:mucomplete#spel#max = 10

" Configure TAB and SHIFT-TAB to also function as CTRL-N and CTRL-P
imap <tab> <plug>(MUcompleteFwd)
imap <s-tab> <plug>(MUcompleteBwd)

" Cycle completion methods
imap <c-y> <plug>(MUcompleteCycFwd)

" Exit autocomplete menu on these combinations
inoremap <expr> <c-e> mucomplete#popup_exit("\<c-e>")
inoremap <expr>  <cr> mucomplete#popup_exit("\<cr>")

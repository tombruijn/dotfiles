" Snippets config
" Bound to C-J/K because TAB is used by autocomplete.
let g:UltiSnipsExpandTrigger="<C-J>"
let g:UltiSnipsJumpForwardTrigger="<C-J>"
let g:UltiSnipsJumpBackwardTrigger="<C-K>"

" This function only runs when UltiSnips is not loaded
" Source: https://github.com/saaguero/dotvim/blob/44c3bbc9b2996fcf7e86f624785a3a06ca978167/.vimrc#L60-L69
inoremap <silent> <C-j> <C-r>=LoadUltiSnips()<cr>
function! LoadUltiSnips()
  let l:curpos = getcurpos()
  execute plug#load('ultisnips')
  call cursor(l:curpos[1], l:curpos[2])
  call UltiSnips#ExpandSnippet()
  return ""
endfunction

" Autocomplete
set wildmenu " Enhanced command line completion.
set wildmode=list:longest " Complete files like a shell.
set shortmess+=c " Turn off completion messages
set completeopt=menu,menuone,preview,noinsert,noselect
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
inoremap <silent> <plug>(MUcompleteFwdKey) <c-y>
imap <c-y> <plug>(MUcompleteCycFwd)

" Exit autocomplete menu on these combinations
inoremap <expr> <c-e> mucomplete#popup_exit("\<c-e>")
inoremap <expr>  <cr> mucomplete#popup_exit("\<cr>")

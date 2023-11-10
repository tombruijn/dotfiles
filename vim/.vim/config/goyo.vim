let g:goyo_width=80
let g:goyo_height=90
let g:goyo_linenr=0

function! s:goyo_enter()
  set noshowcmd
  set scrolloff=999
  set nocursorline
  " Remove space symbol from visible characters
  set listchars-=space:·
endfunction

function! s:goyo_leave()
  set showcmd
  set scrolloff=5
  set cursorline
  if g:my_theme == 0 " When not writer theme
    " Readd space symbol from visible characters
    set listchars+=space:·
  endif
endfunction

augroup mygoyo
  autocmd!

  autocmd User GoyoEnter nested call <SID>goyo_enter()
  autocmd User GoyoLeave nested call <SID>goyo_leave()
augroup END

" Toggle focus mode
nnoremap <leader>F :Goyo<CR>

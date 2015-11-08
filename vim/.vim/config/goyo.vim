let g:goyo_width=80
let g:goyo_height=90
let g:goyo_linenr=0

function! s:goyo_enter()
  set noshowcmd
  set scrolloff=999
  let &guifont=g:font_focus
endfunction

function! s:goyo_leave()
  set showcmd
  set scrolloff=5
  let &guifont=g:font_normal
endfunction

augroup goyo
  autocmd!

  autocmd User GoyoEnter nested call <SID>goyo_enter()
  autocmd User GoyoLeave nested call <SID>goyo_leave()
augroup END

" Toggle focus mode
nnoremap <leader>F :Goyo<CR>

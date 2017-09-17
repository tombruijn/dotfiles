" Create a list and make invisible chars visible
set list

" Highlight trailing whitespace as an error
" Source: https://github.com/bronson/vim-trailing-whitespace/blob/733fb64337b6da4a51c85a43450cd620d8b617b5/plugin/trailing-whitespace.vim
augroup whitespace
  autocmd!
  autocmd ColorScheme * highlight default ExtraWhitespace ctermbg=darkred guibg=#902020
  autocmd BufRead,BufNew * match ExtraWhitespace /\\\@<![\u3000[:space:]]\+$/

  autocmd InsertLeave * match ExtraWhitespace /\\\@<![\u3000[:space:]]\+$/
  autocmd InsertEnter * match ExtraWhitespace /\\\@<![\u3000[:space:]]\+\%#\@<!$/
augroup END

" Remove trailing whitespace
function! <SID>StripTrailingWhitespace()
  " Don't strip any spaces when the filetype is markdown
  if &ft =~ 'markdown'
    return
  endif

  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")

  " Do the business:
  %s/\s\+$//e

  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

augroup trimwhitespace
  autocmd!

  " Remove trailing whitespace automatically on save
  autocmd BufWritePre * :call <SID>StripTrailingWhitespace()
augroup END

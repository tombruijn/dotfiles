" Create a list and make invisible chars visible
set list
set listchars=nbsp:␣,tab:▸\ ,extends:»,precedes:«,trail:•

" Highlight trailing whitespace as an error
highlight ExtraWhitespace ctermbg=darkred guibg=#902020
match ExtraWhitespace /\s\+$/

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

" Remove trailing whitespace automatically on save
autocmd BufWritePre * :call <SID>StripTrailingWhitespace()

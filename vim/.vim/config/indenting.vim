function! FixIndenting()
  " Preparation: save cursor position.
  let l = line(".")
  let c = col(".")

  " Format code
  execute "normal! 1G=G"

  " Restore cursor location
  call cursor(l, c)
endfunction

nnoremap <leader>i :call FixIndenting()<CR>


fun! AutoAmendMarkdown()
    if &ft == "markdown"
      Git add % | Git commit --amend -C HEAD
    endif
endfun

" autocmd BufWritePost * call AutoAmendMarkdown()

if exists("b:my_current_syntax")
  finish
endif

" Color the `;` symbol as a git comment when detected at the start of a line.
" This allows me to use the default comment symbol (#) at the beginning of a
" line instead. Useful for when used in code examples.
syn match gitCommitComment "^;.*"
highlight def link gitCommitComment Comment

let b:my_current_syntax = "gitCommit"

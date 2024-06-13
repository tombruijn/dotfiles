let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
if filereadable('/opt/homebrew/bin/ctags')
  let g:gutentags_ctags_executable = '/opt/homebrew/bin/ctags'
else
  let g:gutentags_ctags_executable = '/usr/local/bin/ctags'
endif
let g:gutentags_cache_dir = '/Users/tombruijn/.cache/ctags'

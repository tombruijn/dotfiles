let g:jsx_ext_required = 0 " Don't require .jsx ext for JSX plugin
let g:ruby_indent_block_style = 'do' " Indent lines by block `do`-statement
let g:ruby_spellcheck_strings = 1
let g:ruby_space_errors = 1

augroup filetypes
  " Clear this group's autocmds if previously set
  autocmd!

  " Ruby
  autocmd BufRead,BufNewFile {Rakefile,Gemfile,config.ru,Vagrantfile,Thorfile,Brewfile,*.jpbuilder}
        \ set ft=ruby

  " Sass/Scss
  autocmd BufRead,BufNewFile *.sass set ft=sass.css
  autocmd BufRead,BufNewFile *.scss set ft=scss.css
  autocmd FileType css,sass
        \ setlocal iskeyword+=-

  " git commit
  autocmd Filetype gitcommit
        \ let &l:colorcolumn="50,72" |
        \ setlocal spell textwidth=72 |
        \ setlocal omnifunc& " Unset vim-rhubarb autocomplete

  " Markdown
  autocmd BufRead,BufNewFile *.md
        \ let &l:colorcolumn="80" |
        \ setlocal spell

  autocmd Filetype vim
        \ let &l:colorcolumn="80,100" |
        \ setlocal textwidth=0
augroup END

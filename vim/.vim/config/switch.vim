augroup switch_filetypes
  autocmd!

  autocmd FileType ruby let b:switch_custom_definitions =
      \ [
      \   {
      \     '\(scenario\|context\|feature\|describe\) "\(.*\)"\%(, :js\)\@! do': '\1 "\2", :js do',
      \     '\(scenario\|context\|feature\|describe\) "\(.*\)", :js do': '\1 "\2" do',
      \   },
      \ ]
augroup END

augroup switch_filetypes
  autocmd!

  " Don't switch _to_ single quotes, only _from_ single quotes to double quotes
  autocmd FileType ruby let b:switch_custom_definitions =
      \ [
      \   {
      \     '\(scenario\|context\|feature\|describe\) "\(.*\)"\%(, :js\)\@! do': '\1 "\2", :js do',
      \     '\(scenario\|context\|feature\|describe\) "\(.*\)", :js do': '\1 "\2" do',
      \   },
      \   {
      \     '"\(\k\+\%([?!]\)\=\)"':                ':\1',
      \     '''\(\k\+\%([?!]\)\=\)''':              '\"\1\"',
      \     ':\(\k\+\%([?!]\)\=\)\@>\%(\s*=>\)\@!': '"\1"\2',
      \   },
      \ ]
augroup END

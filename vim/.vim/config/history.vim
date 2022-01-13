if has("persistent_undo")
  set undolevels=5000
  set undofile
  if has("nvim")
    set undodir=$HOME/.NVIM_UNDO_FILES
  else
    set undodir=$HOME/.VIM_UNDO_FILES
  end
endif

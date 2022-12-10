let g:ale_lint_on_text_changed='never'
let g:ale_lint_on_save=1
" let g:ale_lint_delay=10
" let g:ale_completion_delay=50
" let g:ale_lint_on_enter=1
let g:ale_sign_column_always=1
let g:ale_sign_error="✕"
let g:ale_sign_warning="△"
let g:ale_linters={
\  'sh': ['shell', 'shellcheck'],
\  'elixir': ['credo'],
\  'sass': ['sass-lint'],
\  'javascript': ['eslint', 'prettier'],
\  'typescript': ['eslint', 'prettier', 'tsserver'],
\  'ruby': ['ruby', 'rubocop'],
\  'erb': ['erb'],
\  'rust': ['rustc', 'cargo', 'rustfmt', 'analyzer'],
\  'markdown': ['vale'],
\}
let g:ale_fixers={
\  'ruby': ['rubocop'],
\  'rust': ['rustfmt'],
\  'javascript': ['eslint', 'prettier'],
\  'typescript': ['eslint', 'prettier']
\}
let g:ale_fix_on_save=1
let g:ale_set_balloons=0
let g:ale_ruby_rubocop_executable='bundle'
let g:ale_rust_cargo_check_tests=1
let g:ale_rust_cargo_use_clippy=1
let g:ale_rust_cargo_avoid_whole_workspace=1
let g:ale_rust_ignore_error_codes = ['E0601']
let g:ale_cursor_detail=1
let g:ale_javascript_eslint_executable='yarn'
" let g:ale_javascript_eslint_executable='yarn'

" let g:ale_set_balloons=0
let g:ale_set_balloons=1
let g:ale_hover_to_preview=1
" let g:ale_open_list=0
" let g:ale_set_quickfix=0
let g:ale_hover_to_floating_preview=1
let g:ale_detail_to_floating_preview=1
let g:ale_floating_preview=1
" let g:ale_completion_autoimport=1

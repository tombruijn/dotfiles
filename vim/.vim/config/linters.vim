let g:ale_lint_on_text_changed='never'
let g:ale_lint_on_enter=1
let g:ale_sign_column_always=1
let g:ale_sign_error="✕"
let g:ale_sign_warning="△"
let g:ale_linters={
\  'sass': ['sass-lint'],
\  'js': ['eslint'],
\  'ruby': ['ruby', 'rubocop'],
\}
let g:ale_ruby_rubocop_executable='bundle exec rubocop'
let g:ale_set_balloons=0

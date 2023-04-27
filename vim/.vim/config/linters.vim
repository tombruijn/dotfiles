let g:ale_lint_on_text_changed='never'
let g:ale_lint_on_save=1
let g:ale_lint_delay=10
let g:ale_completion_delay=50
let g:ale_lint_on_enter=1
let g:ale_sign_column_always=1
let g:ale_sign_error="✕"
let g:ale_sign_warning="△"
let g:ale_linters={
\  'sh': ['shell', 'shellcheck'],
\  'elixir': ['credo'],
\  'sass': ['sass-lint'],
\  'javascript': ['eslint'],
\  'ruby': ['ruby', 'rubocop', 'standardrb'],
\  'erb': ['erb'],
\  'rust': ['rustc', 'cargo', 'rustfmt', 'analyzer'],
\  'markdown': ['vale'],
\ }
let g:ale_fixers={
\  'ruby': ['rubocop', 'standardrb'],
\  'rust': ['rustfmt']
\ }
let g:ale_ruby_rubocop_executable='bundle'
let g:ale_set_balloons=0

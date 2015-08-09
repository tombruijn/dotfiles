function clip {
  echo -n "$($1)" | pbcopy
}

function mk {
  mkdir "$1" && cd "$1"
}

function clip {
  echo -n "$($@)" | pbcopy
}

function mk {
  mkdir "$1" && cd "$1"
}

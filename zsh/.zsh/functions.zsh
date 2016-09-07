function clip {
  echo -n "$($@)" | pbcopy
}

function mk {
  mkdir "$1" && cd "$1"
}

# AppSignal cd + function helper
#
# Usage:
#
#   $ a
#   # cd to ~/appsignal
#
#   $ a server
#   # cd to ~/appsignal/server
#
#   $ a function
#   # perform "function"
function a {
  cd ~/appsignal

  if [[ -n "$1" ]]; then
    if [[ -d "$1" ]]; then
      cd $1
    else
      $1
    fi
  fi
}

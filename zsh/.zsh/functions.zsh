# Open things
#
# Usage:
#
#   $ o
#   # Open the current directory in Finder.app
#
#   $ o README.md
#   # Open the "README.md" file its the preferred application
function o {
  if [[ -n "$1" ]]; then
    open $1
  else
    open .
  fi
}

# Open files in my preferred editor
#
# Usage:
#
#   $ e
#   # Open the current directly in the editor
#
#   $ e README.md
#   # Open the "README.md" file in the editor
function e {
  mvim $1
}

function clip {
  echo -n "$($@)" | pbcopy
}

function mk {
  mkdir "$1" && cd "$1"
}

# Docker shorthands
#
# Mostly removal commands.

# Stop all containers
function dstop {
  docker stop $(docker ps -a -q)
}

# Remove all docker containers
function drm {
  docker rm $(docker ps -a -q)
}

# Remove all docker images
function drmi {
  docker rmi $(docker images -q)
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

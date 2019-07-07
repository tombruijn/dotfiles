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
  vimr $1
}

# Retry a command until it fails
#
# Usage:
#
#   $ retry true
#   # Will repeat forever
#
#   $ retry false
#   # Fails at the first iteration and break out of the while loop
#
#   $ retry ruby -e "(rand(0..1) == 1) && (puts 'failed'; exit(1)) || (puts 'success')"
#   # Fails randomly and breaks out of the while loop when it fails
function retry {
  cmd=$@
  if [[ -z "$cmd" ]]; then
    echo "ERROR: No command given to retry"
    return 1 # Error status
  fi

  i=0
  while true; do
    i=$((i + 1))
    echo "================================================================================"
    echo "Loop iteration: $i\n"
    if $cmd; then
      # Success: Do nothing this loop. Retry in the next loop.
    else
      echo "\nERROR: Loop $i broke!"
      return 1 # Exit loop with error status
    fi
  done
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
  if [[ -n "$1" ]]; then
    echo "Error: Use \`c\` instead"
    false
  else
    cd ~/appsignal
  fi
}

# Copy things onto the system clipboard
#
# With the `-s` option it will strip off any newlines from the string. So it's
# not recommended of multi line strings.
#
# Usage:
#
#   $ echo "foo" | copy
#   $ echo "foo" | copy -s
#
# macOS only
function copy {
  strip="false"
  option="$1"
  if [[ "$option" == "-s" ]]; then
    strip="true"
  fi

  # Copy STDIN to function to clipboard
  if [[ "$strip" == "true" ]]; then
    tr -d '\n' | pbcopy
  else
    pbcopy
  fi

  echo "Copied to clipboard: $(pbpaste)"
}

# Create directory and navigate into it
function mk {
  mkdir "$1" && cd "$1"
}

# Toggle Chrome headless testing with param
function headless {
  if [[ "$CHROME_HEADLESS" == "false" ]]; then
    echo "🔮😰 Running headless"
    unset CHROME_HEADLESS
  else
    echo "🖥 🍿 Running in foreground"
    export CHROME_HEADLESS=false
  fi
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

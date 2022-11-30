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
  /Applications/MacVim.app/Contents/bin/mvim $1
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
  mkdir -p "$1" && cd "$1"
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

# Wrapper around the commit_format gem
#
# Make sure commit_format is installed. Use a specific Ruby version so that it
# only needs to be installed once on the system, instead of for whatever Ruby
# version is currently being used.
function cf {
  ruby_version="ruby-3.1"
  if [ ! chruby-exec "$ruby_version" -- gem list commit_format --installed &> /dev/null ]; then
    chruby-exec "$ruby_version" -- gem install commit_format
  fi
  chruby-exec "$ruby_version" -- commit-format "$@" | pbcopy
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

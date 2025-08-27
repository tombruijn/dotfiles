eval "$(/opt/homebrew/bin/brew shellenv)"

# Load chruby version manager + auto detection
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh

# Old chruby workaround
# https://github.com/postmodern/chruby/issues/196#issuecomment-23826171
# [[ -e /etc/zshenv ]] && sudo mv /etc/zshenv /etc/zprofile

# Automatically switch to the ruby version specified in the .ruby-version file
# present in the current directory
chruby_auto

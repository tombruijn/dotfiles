# Dotfiles

These dotfiles contain configuration and installation for:

* XCode
* Homebrew
* ITerm2
* ZSH
* Dotfiles
* Sublime Text
* VIM (and MacVIM)
* chruby and ruby-install
* Hammerspoon
* Misc. Utilities

**This setup is intended for Mac OSX >= 10.9**

## Installation

Here is a step-by-step installation.

### XCode

Install XCode through the Mac App Store.

Run:

`xcode-select --install`

### OSX defaults

Set osx defaults.

`./.osx`

### Homebrew

Next, install [Homebrew](http://mxcl.github.com/homebrew/) using the following
command.

    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

After installing Homebrew, ensure permissions are correct by running the
following.

    sudo chown -R $(whoami) /usr/local
    brew update

### ITerm2

Download [ITerm2](http://iterm2.com), a Terminal replacement.
Using color preset "Tango Dark" at the moment.

#### Keyboard setup

Under "(Global) Keys" add the following maps *:

- `alt` + `backspace` = `Send Hex Code: 17` => Delete full word
- `alt` + `<-` = `Send Escape Sequence: b` => Skip to left word
- `alt` + `->` = `Send Escape Sequence: f` => Skip to right word
- `cmd` + `<-` = `Send Hex Codes: 0x01` => Beginning of line
- `cmd` + `->` = `Send Hex Codes: 0x05` => End of line

\* = Use the actual keys, not the text above.

### Git

Get the latest version of Git. Additional config will be done through the install script.

    brew install git

### ZSH

Install ZSH with the following command:

    brew install zsh

Set it as the default shell:

    chsh -s $(which zsh)

### Environment, ZSH, Sublime configuration

Next, clone this Git repository to your $HOME directory and initialize/update
the submodules and finally hook everything up by running the `install` script.

    git clone git://github.com/tombruijn/dotfiles.git $HOME/dotfiles
    cd $HOME/dotfiles && git submodule init && \
      git submodule update --recursive && ./install

This should set up the symlinks from the dotfiles directory to your `$HOME`
directory, do not remove the `dotfiles` directory.

### Sublime plugins

Install the following Sublime plugins through Sublime package control once
it is installed.

- [Package Control](http://wbond.net/sublime_packages/package_control)
- [RSpec](https://github.com/SublimeText/RSpec)
- [Sass](https://github.com/nathos/sass-textmate-bundle)
- [CoffeeScript](https://github.com/Xavura/CoffeeScript-Sublime-Plugin)
- [AngularJS (CoffeeScript)](https://github.com/EastPoint/Sublime-AngularJS-Coffee-Completions)
- [eco](https://github.com/davidjrice/sublime-eco)
- [GitGutter](https://github.com/jisaacks/GitGutter)
- [JsFormat](https://github.com/jdc0589/JsFormat)
- [Theme - Phoenix](https://github.com/netatoo/phoenix-theme) - Dark Blue
  - Syntax highlighting: __Default/Twilight.tmTheme__

### VIM

Mac OSX comes installed with an old version of VIM.
Replace this installation with a recent version of VIM through Homebrew.

    brew install --with-features=huge --enable-interp=lua,ruby,perl,python \
      https://raw.github.com/telemachus/homebrew/vim-mine/Library/Formula/vim.rb

### MacVIM

Next, install MacVIM as well.

    brew install mercurial vim macvim

Run vundle to install vim plugins.

1. Start vim
2. Run: `:PluginInstall`

### chruby and ruby-install

Install chruby by following the instructions on the
[project page](https://github.com/postmodern/chruby).

Or as lazy me would do it:

```bash
brew install chruby
brew install ruby-install
ruby-install ruby [VERSION] ~/.rubies/ruby-[VERSION]
```

### Hammerspoon

I use [Hammerspoon](http://www.hammerspoon.org/) for shortcut and window management.

Install it as per the instructions on the website.

### Misc. Utilities

**Node.js platform.**

    brew install node

**CoffeeScript language.**

    npm install coffee-script

**Some datastores.**

    brew install postgresql mongodb redis mysql sqlite memcached

**Here are some misc. utilities.** (not necessarily required)

    brew install ag ack tree ffmpeg imagemagick htop-osx watch qt phantomjs

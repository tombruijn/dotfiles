# Dotfiles

These dotfiles contain configuration and installation for:

* XCode
* Homebrew
* ITerm2
* ZSH
* Dotfiles
* VIM (and MacVIM)
* chruby and ruby-install
* Hammerspoon
* Misc. Utilities

**This setup is intended for Mac OSX >= 10.9**

## Installation

Here is a step-by-step installation.

### XCode

Install XCode through the Mac App Store.

Then run:

```sh
xcode-select --install
```

### Dotfiles installation

Next, clone this Git repository to your $HOME directory and initialize/update
the submodules and finally hook everything up by running the `install` script.

```sh
mkdir $HOME/tombruijn
git clone git://github.com/tombruijn/dotfiles.git $HOME/tombruijn/dotfiles
cd $HOME/tombruijn/dotfiles && git submodule init && \
  git submodule update --recursive
./install
```

### OSX defaults

Set osx defaults.

```sh
./.osx
```

### Homebrew

Next, install [Homebrew](http://mxcl.github.com/homebrew/) using the following
command.

```sh
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

After installing Homebrew, ensure permissions are correct by running the
following.

```sh
sudo chown -R "$USER" /usr/local
brew update
brew tap Homebrew/bundle

brew bundle Brewfile
```

### ZSH

Set it as the default shell:

```sh
chsh -s $(which zsh)
```

This should set up the symlinks from the dotfiles directory to your `$HOME`
directory, do not remove the `dotfiles` directory.

### iTerm2

- Set up `Load preferences from a custom folder or URL:`
  in the `General` section of `Preferences`.
- Select the directory `$DOTFILES/iterm2/`.
- Run `defaults read com.googlecode.iterm2`.
- Restart iTerm.

### vim

Use [vim-plug](https://github.com/junegunn/vim-plug/) to install vim plugins.

```sh
vim +:PlugInstall
```

### chruby and ruby-install

```sh
ruby-install ruby [VERSION] ~/.rubies/ruby-[VERSION]
```

### Misc. Utilities

**CoffeeScript language.**

```sh
npm install coffee-script
```

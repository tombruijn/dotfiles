# Dotfiles

These dotfiles contain configuration and installation for:

* Xcode
* Homebrew
* iTerm
* Zsh
* Dotfiles
* VIM (Neovim and MacVim)
* chruby and ruby-install
* rustup and Rust
* Hammerspoon
* Misc. Utilities

**This setup is intended for Mac OSX >= 10.9**

## Installation

Here is a step-by-step installation.

### Xcode

Install Xcode through the Mac App Store.

Then run:

```sh
xcode-select --install
```

### Dotfiles installation

Next, clone this Git repository, initialize/update the submodules and finally
hook everything up by running the install script.

```sh
mkdir $HOME/tombruijn
git clone git://github.com:tombruijn/dotfiles.git $HOME/tombruijn/dotfiles
cd $HOME/tombruijn/dotfiles && git submodule init && \
  git submodule update --recursive
./install
```

This should set up the symlinks from the dotfiles directory to your `$HOME`
directory, do not remove the `dotfiles` directory.

### macOS defaults

Set macOS defaults.

```sh
./.macos
```

### Homebrew

Next, install [Homebrew](https://brew.sh/) using the command listed on the website.

After installing Homebrew, ensure permissions are correct by running the
following.

```sh
brew update
brew tap Homebrew/bundle

brew bundle
```

### Zsh

#### Private credentials

To configure credentials that shouldn't be checked into git, create a
`~/.extra` file like the example below.

```sh
#!/bin/sh

export GPG_SIGNING_KEY="KEY_ID"
```

Now refresh you shell sessions either by opening a new pane or by running
`reload`.

### iTerm

- Set up `Load preferences from a custom folder or URL:`
  in the `General` section of `Preferences`.
- Select the directory `$DOTFILES/iterm2/`.
- Run `defaults read com.googlecode.iterm2`.
- Restart iTerm.

### fzf

To install [fzf](https://github.com/junegunn/fzf), use the
`/usr/local/opt/fzf/install` install script (listed in `brew info fzf` after
installing it through `brew install fzf`).

Say yes to "fuzzy auto-completion" and "key bindings".

### vim

Install Neovim.

```sh
# Should be installed through the Brewfile, but to do so manually:
brew install neovim

# Additional packages
# Ruby package for neovim
gem install neovim
# Python package for Python bindings (Python is used by UltiSnips)
pip2 install --upgrade neovim
```

Use [vim-plug](https://github.com/junegunn/vim-plug/) to install vim plugins.

```sh
vim +:PlugInstall
```

### chruby and ruby-install

```sh
ruby-install ruby [VERSION]
```

### Rust and rustup

Install [rustup](https://www.rustup.rs/) and with it Rust.

Which Rust version to install depends on the project you're working on.

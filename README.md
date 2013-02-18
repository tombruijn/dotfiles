# Dotfiles

Author: tombruijn (Tom de Bruijn)

## Installation

### Homebrew

```bash
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
```

### git

```bash
brew install git
```

### Requirements to continue

```bash
brew install openssl readline libyaml
```

### RVM

```bash
curl -L https://get.rvm.io | bash -s stable --ruby
```

### Download and install dotfiles

```bash
git clone git@github.com:tombruijn/dotfiles.git
cd dotfiles
rake install
```

### Node.js

```bash
brew install node
```

### Other

```bash
brew install openssl
brew install mongodb postgresql mysql redis
brew install qt
brew install imagemagick
brew install apple-gcc42 # For installation of old Ruby versions
```

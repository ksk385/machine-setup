#!/bin/bash
set -e

RUBY_VERSION=3.1.4
PACKAGE_LIST_FILE=./brew_packages.list

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/karankrishnani/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

cp .zshrc ~/.zshrc

source ~/.zshrc

# Install brew packages
brew install $(cat $PACKAGE_LIST_FILE)

# Install node
nvm install --lts

# Install ruby
rbenv install $RUBY_VERSION
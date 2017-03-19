#! /bin/bash

# Install command-line tools using Homebrew.
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

brew install fzf
# Install shell extensions
/usr/local/opt/fzf/install
brew install htop
brew install mas
brew install shellcheck
brew install tmux
brew install tree

brew cask install sublime-text3

# Remove outdated versions from the cellar.
brew cleanup
#!/bin/zsh

chsh -s $(which zsh)

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew tap Homebrew/bundle

brew bundle Brewfile

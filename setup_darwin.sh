#!/bin/zsh


chsh -s $(which zsh)

[[ -f "/usr/local/bin/brew" ]] && echo "Homebrew already installed" && return

xcode-select --install

read \?"Please wait for xcode installation to finish, then press [Enter] to continue."

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
# for bundle files
brew tap Homebrew/bundle
# for ROOT
brew tap homebrew/science
# for all kinds of other HEP stuff
brew tap davidchall/hep

brew bundle Brewfile

brew install root6
# pyenv
brew install pyenv
brew install pyenv-virtualenv

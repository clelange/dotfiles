#!/bin/zsh

chsh -s $(which zsh)

[[ -f "/usr/local/bin/brew" ]] && echo "Homebrew already installed" && return

xcode-select --install

read \?"Please wait for xcode installation to finish, then press [Enter] to continue."

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew bundle Brewfile

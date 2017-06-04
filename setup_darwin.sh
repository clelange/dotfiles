#!/bin/zsh

chsh -s $(which zsh)

[[ -f "/usr/local/bin/brew" ]] && echo "Homebrew already installed" && return

xcode-select --install

read \?"Please wait for xcode installation to finish, then press [Enter] to continue."

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

sudo chown -R $(whoami) /usr/local/opt
sudo chown -R $(whoami) /usr/local/lib/python2.7/site-packages
# brew link autoconf
# brew link pkg-config

brew bundle --file=~/.dotfiles/Brewfile

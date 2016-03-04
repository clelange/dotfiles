#!/bin/zsh

ln -s ~/dotfiles/prompt_clange_setup ~/.zprezto/modules/prompt/functions/prompt_clange_setup

[[ -d ~/.zprezto ]] && exit

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

#!/bin/zsh

if [[ -d ${ZDOTDIR:-$HOME}/bin/rmate_github ]]; then
  echo "Updating rmate"
  cd ${ZDOTDIR:-$HOME}/bin/rmate_github
  git pull
  cd -
else
  git clone --recursive git@github.com:aurora/rmate.git "${ZDOTDIR:-$HOME}/bin/rmate_github"
  ln -s ${ZDOTDIR:-$HOME}/bin/rmate_github/rmate ${ZDOTDIR:-$HOME}/bin/rmate
  chmod 755 ${ZDOTDIR:-$HOME}/bin/rmate
fi
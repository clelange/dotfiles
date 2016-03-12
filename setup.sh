#!/bin/zsh

echo "running setup.sh"
DOTDIR=".dotfiles"

platform=$(uname | awk '{print tolower($0)}')

[[ -f "./${DOTDIR}/setup_${platform}.sh" ]] && source "./${DOTDIR}/setup_${platform}.sh"

if [[ -f "./${DOTDIR}/system_${platform}.installed" ]]; then
  echo "System settings already adjusted" && return
else
  touch "./${DOTDIR}/system_${platform}.installed"
  [[ -f "./${DOTDIR}/system_${platform}.sh" ]] && source "./${DOTDIR}/system_${platform}.sh"
fi
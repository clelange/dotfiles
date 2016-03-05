#!/bin/zsh

echo "running setup.sh"
DOTDIR=".dotfiles"

platform=$(uname | awk '{print tolower($0)}')
[[ -f "./${DOTDIR}/setup_${platform}.sh" ]] && source "./${DOTDIR}/setup_${platform}.sh"

[[ -f "./${DOTDIR}/system_${platform}.sh" ]] && source "./${DOTDIR}/system_${platform}.sh"
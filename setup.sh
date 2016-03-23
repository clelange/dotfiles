#!/bin/zsh

echo "running setup.sh"
DOTDIR=".dotfiles"

platform=$(uname | awk '{print tolower($0)}')

if [[ -f "./${DOTDIR}/setup_${platform}.sh" ]]; then
  if [[ -f "./${DOTDIR}/setup_${platform}.installed" ]]; then
    echo "System setup already adjusted, delete ./${DOTDIR}/setup_${platform}.sh to run setup again."
  else
    touch "./${DOTDIR}/setup_${platform}.installed"
    source "./${DOTDIR}/setup_${platform}.sh"
  fi
fi
  

if [[ -f "./${DOTDIR}/system_${platform}.sh" ]]; then
  if [[ -f "./${DOTDIR}/system_${platform}.installed" ]]; then
  echo "System settings already adjusted, delete ./${DOTDIR}/system_${platform}.sh to run system script again."
  else
    touch "./${DOTDIR}/system_${platform}.installed"
    "Running system adjustment, press Ctrl+c to abort."
    source "./${DOTDIR}/system_${platform}.sh"
  fi
fi
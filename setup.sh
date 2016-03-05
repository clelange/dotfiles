#!/bin/zsh

platform=$(uname | awk '{print tolower($0)}')
[[ -f "setup_$platform" ]] && source "./setup_$platform"

[[ -f "system_$platform" ]] && source "./system_$platform"
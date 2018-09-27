# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# git shell completion
zstyle ':completion:*:*:git:*' script ~/bin/git-completion.zsh

# Customize to your needs...
export EDITOR="/usr/local/bin/mate -w"
export VISUAL=$EDITOR
export LSCOLORS="exfxcxdxbxegedabagacad"

unsetopt CORRECT                      # Disable autocorrect guesses. Happens when typing a wrong
                                      # command that may look like an existing one.


expand-or-complete-with-dots() {      # This bunch of code displays red dots when autocompleting
  echo -n "\e[31m......\e[0m"         # a command with the tab key, "Oh-my-zsh"-style.
  zle expand-or-complete
  zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

# alias definitions
# alias ssh="ln -fs $(echo $DISPLAY | sed 's:\(/private/tmp/com\.apple\.launchd\.[^/]*\)/.*:\1:') $(echo $DISPLAY | sed 's:/private/tmp/com\.apple\.launchd\.\([^/]*\)/.*:/private/tmp/launch-\1:'); ssh -Y"
alias lxplus="/Users/clange/autoKerb/ssh -Y -F ~/.ssh/config_kerb lxplus.cern.ch"
alias psi15="ssh -Y t3ui15.psi.ch"
alias psi="ssh -Y t3ui03.psi.ch"
alias bastion="ssh -Y bastion.desy.de"
alias atlnaf="~/scripts/naflogin.sh"
alias atlnaftoken="sh ~/scripts/naf_token.sh $USER"
alias cmsnaftoken="sh ~/scripts/cmsnaf_token.sh cmslange"
alias cmsnaf="ssh -Y naf-cms.desy.de"
alias cmsnafSLC5="ssh -Y nafhh-cms01.desy.de"
alias atlnaf2="ssh -Y nafhh-atlas01.desy.de"
alias pixcr="ssh -Y pc4634.cern.ch"
alias libsvn="ssh -Y libuzhcm@lxplus.cern.ch"
# alias myscp="rsync -e \"ssh -c arcfour -o Compression=no\" -avzP"
alias myscp="rsync -avzP"
alias iniroot="pushd $(brew --prefix root) >/dev/null; . bin/thisroot.sh; popd >/dev/null; echo use python3"
alias wakedge="wakeonlan f8:b1:56:bf:42:12"
# pixel PCs
alias bpix="ssh -Y vmepc-s2b18-07-01.cms"
alias fpix="ssh -Y vmepc-s2b18-06-01.cms"
alias pilot="ssh -Y vmepc-s2b18-08-01.cms"
alias anapix="ssh -Y srv-c2f38-15-01.cms"
alias superpix="ssh -Y srv-s2b18-10-01.cms"
alias diskpix="ssh -Y srv-c2f38-16-01.cms"
alias cmsusr="ssh cmsusr -D 10500 -L 5555:srv-c2f38-15-01.cms:22"
# alias iniconda2="export PATH=/Users/clange/anaconda2/bin:$PATH"
alias scp='/usr/bin/scp -S /usr/local/bin/ssh'
alias sftp='/usr/bin/sftp -S /usr/local/bin/ssh'
alias rmate='atom'

# synergy
function synergyhost {
 MYHOSTNAME=`hostname`;
 rm -f /Users/clange/.synergy/tmp.conf;
 sed "s/CERNHOST/${MYHOSTNAME}/" ~/.synergy/cern.conf > ~/.synergy/tmp.conf; $HOME/synergy/bin/Release/synergys --config ~/.synergy/tmp.conf
}

# setup ROOT
# for ROOT5
# pushd $(brew --prefix root) >/dev/null; . libexec/thisroot.sh; popd >/dev/null
# for ROOT6
pushd $(brew --prefix root) >/dev/null; . bin/thisroot.sh; popd >/dev/null

# pyenv
export WORKON_HOME=~/.ve
export PROJECT_HOME=~/CloudStation/python_workspace
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
# use either pyenv-virtualenv or virtualenvwrapper
# if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
source /usr/local/bin/virtualenvwrapper.sh
if which pyenv > /dev/null; then pyenv virtualenvwrapper_lazy; fi
# eval "$(pyenv virtualenv-init -)"

# python autocompletion and history
export PYTHONSTARTUP=$HOME/.pythonrc.py

# set up z
. /usr/local/etc/profile.d/z.sh

# single window mode
singleWindowOn="defaults write com.apple.dock single-app -bool true; killall Dock"
singleWindowOff="defaults write com.apple.dock single-app -bool false; killall Dock"

# export PYTHONPATH=$PYTHONPATH:$HOME/Library/Python/2.7/site-packages
# export PYTHONPATH="/System/Library/Frameworks/Python.framework/Versions/Current/Extras/lib/python/"

KRB5_CONFIG=~/scripts/CERNkrb5.conf

# http://hackercodex.com/guide/python-development-environment-on-mac-osx/
# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true

function gpip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

function playmidi {

    SOUNDFONT='/usr/local/share/fluidsynth/generaluser.v.1.471.sf2'
    # SOUNDFONT='/usr/local/share/fluidsynth/generaluser.v.1.44.sf2'

    if [ -e "$SOUNDFONT" ]
    then

        for i in "$@"
        do
            if [ -e "$i" ]
            then
                (fluidsynth -i "$SOUNDFONT" "$i"  2>&1) >/dev/null
            else
                echo "[playmidi]: cannot find file at $i"
                return 1
            fi
        done
    else
            echo "[playmidi]: SOUNDFONT file not found at $SOUNDFONT"
            return 1
    fi
}

midi2mp3 () {
  SOUNDFONT='/usr/local/share/fluidsynth/generaluser.v.1.471.sf2'

  if [[ ! -f $SOUNDFONT ]]
  then
    echo "Couldn't find the soundfont: $SOUNDFONT"
    return 1
  fi

  if [ "$#" -eq 0 ]
  then
    echo "usage: midi2mp3 file1.mid [file2.mid, file3.mid, ...]"
    return 0
  else
    for filename in "$@"
    do
      echo "${filename}"
      WAVFILE="$TMPDIR/${filename%.*}"

      fluidsynth -F "${WAVFILE}" $SOUNDFONT "${filename}" && \
        lame "${WAVFILE}" && \
        rm "${WAVFILE}"
    done
  fi
}

# Customize to your needs...
# export PATH=/Users/clange/.pyenv/versions/3.6.5/Python.framework/Versions/Current/bin:${PATH}
# pipsi
export PATH=/Users/clange/.local/bin:$PATH
# for pipenv to work
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

. $HOME/.shellrc.load

export MAGICK_HOME=$(brew --prefix imagemagick@6)

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

function voms() {
  voms-proxy-init -voms cms --valid 168:0
  VOMSPROXY=`voms-proxy-info -path`
  cp $VOMSPROXY $HOME/`basename $VOMSPROXY`
  export X509_USER_PROXY=$HOME/`basename $VOMSPROXY`
}

function ql() {
  qlmanage -p "$@" >& /dev/null &
}

setTerminalText () {
    # echo works in bash & zsh
    local mode=$1 ; shift
    echo -ne "\033]$mode;$@ ${HOST}\007"
}
stt_both  () { setTerminalText 0 $@; }
stt_tab   () { setTerminalText 1 $@; }
stt_title () { setTerminalText 2 $@; }

stt_tab

# export PATH=/Users/clange/autoKerb:${PATH}

PATH="/Users/clange/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/clange/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/clange/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/clange/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/clange/perl5"; export PERL_MM_OPT;

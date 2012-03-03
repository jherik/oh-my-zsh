function zsh_stats() {
  history | awk '{print $2}' | sort | uniq -c | sort -rn | head
}

function uninstall_oh_my_zsh() {
  /usr/bin/env ZSH=$ZSH /bin/sh $ZSH/tools/uninstall.sh
}

function upgrade_oh_my_zsh() {
  /usr/bin/env ZSH=$ZSH /bin/sh $ZSH/tools/upgrade.sh
}

function take() {
  mkdir -p $1
  cd $1
}

if [[ "$(uname)" == "Darwin" ]] ; then
  # get path of frontmost finder window
  function ff { osascript -e 'tell application "Finder"'\
   -e "if (${1-1} <= (count Finder windows)) then"\
   -e "get POSIX path of (target of window ${1-1} as alias)"\
   -e 'else' -e 'get POSIX path of (desktop as alias)'\
   -e 'end if' -e 'end tell'; };\

  # cd to path of frontmost finder window
  function cdff { cd "`ff $@`"; };
fi

function git(){hub "$@"}


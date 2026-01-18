#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EMACS_CONFIG_DIR="$HOME/.config/emacs"

alias start-sway='uwsm start sway'
alias sudo='sudo '
alias ls='lsd --group-dirs first --icon=never --color=auto'
alias la='lsd -a --group-dirs first --icon=never --color=auto'
alias ll='lsd -lh --group-dirs first --icon=never --color=never'
alias lla='lsd -lah --group-dirs first --icon=never --color=never'
alias grep='grep --color=auto'
alias swaycon='vim ~/.config/sway/config'
alias rm='trash'

# Custom PS1 prompt
PS1='\033[34m\u\033[0m'
if [[ -n "$SHOW_HOSTNAME" ]]; then
  PS1+='@\h'
fi
PS1+=' \033[32m\w\033[0m \$ '


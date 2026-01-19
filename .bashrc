# Welcome to Talha's Bash Configuration File

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Environment Variables
export EMACS_CONFIG_DIR="$HOME/.config/emacs"

# Aliases
alias start-sway='uwsm start sway'
alias sudo='sudo '
alias ls='lsd --group-dirs first --icon=never --color=auto'
alias la='lsd -a --group-dirs first --icon=never --color=auto'
alias ll='lsd -lh --group-dirs first --icon=never --color=never'
alias lla='lsd -lah --group-dirs first --icon=never --color=never'
alias grep='grep --color=auto'
alias swaycon='vim ~/.config/sway/config'
alias rm='trash'

# Custom PS1 Prompt
PS1='\033[90m[\033[34m\u'
if [[ -f "$HOME/.show_hostname" ]]; then
  PS1+='\033[97m@\033[36m\h'
fi
PS1+='\033[90m \033[32m\W\033[90m]\033[90m$\033[0m '

# Functions
show-host() {
  local state_file="$HOME/.show_hostname"
  
  if [[ -f "$state_file" ]]; then
    rm "$state_file"
    echo "Hostname hidden"
  else
    touch "$state_file"
    echo "Hostname shown"
  fi
  
  source ~/.bashrc
}

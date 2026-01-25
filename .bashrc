# Welcome to Talha's Bash Configuration File

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

eval "$(zoxide init bash --cmd cd)"

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
PS1='[\u'
if [[ -f "$HOME/.show_hostname" ]]; then
  PS1+='@\h'
fi
PS1+=' \W]$ '

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

gitui() {
  # Start SSH agent if not already running
  if [ -z "$SSH_AUTH_SOCK" ]; then
    eval "$(ssh-agent -s)" > /dev/null
  fi
  
  # Add your SSH key
  ssh-add ~/.ssh/id_ed25519 2>/dev/null
  
  # Launch gitui
  command gitui "$@"
}


# Welcome to Talha's Bash Configuration File

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

eval "$(zoxide init bash --cmd cd)"

# Environment Variables
export EMACS_CONFIG_DIR="$HOME/.config/emacs"
export LC_TIME=C

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
alias icat="kitten icat"

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

pkghealth() {
    local total=$(pacman -Q | wc -l)
    local valid=$(pacman -Qk 2>/dev/null | grep "0 missing files" | wc -l)
    local percent=$((valid * 100 / total))
    
    if [ "$valid" -eq "$total" ]; then
        echo "✅ System Status: ${percent}% Healthy"
        echo "   All $total packages intact!"
    else
        echo "⚠️  System Status: ${percent}% Healthy ($valid/$total)"
        echo ""
        echo "Broken packages:"
        pacman -Qk 2>/dev/null | grep -v "0 missing files"
    fi
}



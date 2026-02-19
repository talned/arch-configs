# Welcome to Talha's Bash Configuration File

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set up Guix environment
GUIX_PROFILE="/home/tal/.guix-profile"
. "$GUIX_PROFILE/etc/profile"
unset GUIX_PROFILE

eval "$(zoxide init bash --cmd cd)"

# Environment Variables
export EMACS_CONFIG_DIR="$HOME/.config/emacs"
export LC_TIME=C
export GUIX_LOCPATH="$HOME/.guix-profile/lib/locale"
export PATH="/home/tal/.local/bin:$HOME/.config/guix/current/bin:$PATH"

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
alias default-display='kanshi-laptop-monitor-shuffler --choose'
alias laus="systemctl --user list-units --state=running --type=service --no-legend | awk '{print \" | \" \$1}'"
alias lass="systemctl list-units --state=running --type=service --no-legend | awk '{print \" | \" \$1}'"
alias sway='[ -n "$WAYLAND_DISPLAY" ] && echo "Sway is already running." || command sway'

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
    local total=$(sudo pacman -Q | wc -l)
    local valid=$(sudo pacman -Qk 2>/dev/null | grep "0 missing files" | wc -l)
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



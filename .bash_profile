#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export QT_QPA_PLATFORMTHEME=qt6ct

# Auto-launch Sway on TTY1 login
if [ "$(tty)" = "/dev/tty1" ]; then
    read -p "Start SwayWM? [y]es or [n]o: " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        uwsm start sway
    fi
fi



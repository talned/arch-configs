#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Auto-launch Sway on TTY1 login
if [ "$(tty)" = "/dev/tty1" ]; then
    read -p "Start MangoWC? [y]es or [n]o: " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        mangowc ---start
    fi
fi


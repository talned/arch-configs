# Export display env to systemd user session (needed for XDG autostart)
systemctl --user import-environment DISPLAY XAUTHORITY 2>/dev/null
dbus-update-activation-environment --systemd DISPLAY XAUTHORITY 2>/dev/null

xrdb -merge ~/.Xresources
xset r rate 200 35
picom -b
exec i3


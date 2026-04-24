# Store this file in home directory of user logged in

# Export display env to systemd user session (needed for XDG autostart)
systemctl --user import-environment DISPLAY XAUTHORITY 2>/dev/null
dbus-update-activation-environment --systemd DISPLAY XAUTHORITY 2>/dev/null

xrdb -merge ~/.Xresources
#xset r rate 200 35
xset s off
xset -dpms
xset s noblank
picom -b
exec i3


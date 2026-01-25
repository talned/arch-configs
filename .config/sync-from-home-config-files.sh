#!/bin/bash
cd ~/Projects/arch-configs/.config
mkdir -p Code/User fastfetch kanshi sway/config.d
cp ~/.config/Code/User/*.json Code/User/
cp ~/.config/code-flags.conf ~/.config/spotify-flags.conf .
cp ~/.config/fastfetch/config.jsonc fastfetch/
cp ~/.config/kanshi/config kanshi/
cp ~/.config/sway/config sway/
cp ~/.config/sway/config.d/* sway/config.d/
cp ~/.config/sway/{cpu.sh,mem.sh,nothing.jpg} sway/
echo "✅ Copied all configs!"


# 🖥️ arch-configs

Personal Arch Linux dotfiles and configuration files for **Sway** (Wayland) & **i3-wm** (Xlibre) desktop environment, featuring a minimal black theme, vim-style keybindings, and smart multi-monitor display management.

---

## ⚠️ Compatibility

> **This configuration is not beginner-friendly.** It assumes familiarity with Arch Linux, Sway/Wayland, tiling window managers, and manual system configuration. There is no installer — files are meant to be reviewed and placed manually.

<br>

- **Hardware-specific:** Built for a dual-display setup consisting of a **laptop** (`eDP-1` at 1920×1200) and an **external monitor** (`HDMI-A-1` at 1920×1080). Display profiles, scaling values, and output identifiers are hardcoded to this hardware — if your outputs differ, you will need to modify the Kanshi config and display scripts accordingly.

<br>

- **Opinionated keybindings:** All keybinds are tailored to Tal's personal workflow. The `Super` key is the modifier, navigation uses both vim-style (`h` `j` `k` `l`) and arrow keys, and application shortcuts assume specific software is installed (Kitty, Firefox, Spotify, VS Code, OBS, Discord, etc.). Adjust or remove bindings that don't apply to your setup.

<br>
  
- **Opinionated styling:** The entire environment is themed around a **pure black aesthetic** — Sway borders, the status bar, VS Code, and window decorations are all black with white accents. This is a personal preference, not a universal default.

<br>

- **Software dependencies:** These configs expect a number of packages to already be installed (Sway, Kanshi, Kitty, lsd, zoxide, trash-cli, hyprshot, brightnessctl, swaylock-fancy, etc.). Missing packages will result in broken keybinds or startup errors.

<br>

**TL;DR** — These are one person's dotfiles, not a distribution. Use them as reference or a starting point, but expect to adapt them to your own machine and preferences.

---


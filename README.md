# 🖥️ arch-configs

Personal Arch Linux dotfiles and configuration files for a **Sway** (Wayland) desktop environment, featuring a minimal black theme, vim-style keybindings, and smart multi-monitor display management.

---

## ⚠️ Compatibility

> **This configuration is not beginner-friendly.** It assumes familiarity with Arch Linux, Sway/Wayland, tiling window managers, and manual system configuration. There is no installer — files are meant to be reviewed and placed manually.

- **Hardware-specific:** Built for a dual-display setup consisting of a **laptop** (`eDP-1` at 1920×1200) and an **external monitor** (`HDMI-A-1` at 1920×1080). Display profiles, scaling values, and output identifiers are hardcoded to this hardware — if your outputs differ, you will need to modify the Kanshi config and display scripts accordingly.
- **Opinionated keybindings:** All keybinds are tailored to Tal's personal workflow. The `Super` key is the modifier, navigation uses both vim-style (`h` `j` `k` `l`) and arrow keys, and application shortcuts assume specific software is installed (Kitty, Firefox, Spotify, VS Code, OBS, Discord, etc.). Adjust or remove bindings that don't apply to your setup.
- **Opinionated styling:** The entire environment is themed around a **pure black aesthetic** — Sway borders, the status bar, VS Code, and window decorations are all black with white accents. This is a personal preference, not a universal default.
- **Software dependencies:** These configs expect a number of packages to already be installed (Sway, Kanshi, Kitty, lsd, zoxide, trash-cli, hyprshot, brightnessctl, swaylock-fancy, etc.). Missing packages will result in broken keybinds or startup errors.

**TL;DR** — These are one person's dotfiles, not a distribution. Use them as reference or a starting point, but expect to adapt them to your own machine and preferences.

---

## ⌨️ Keybindings

The modifier key (`$mod`) is **Super / Logo key** (Mod4). Navigation uses **vim-style** keys (`h` `j` `k` `l`) alongside arrow keys for full compatibility.

### Application Launchers

| Keybind | Action |
|---|---|
| `Super + Enter` | Open terminal (Kitty) |
| `Super + Shift + Enter` | Open VS Code |
| `Super + B` | Open Firefox |
| `Super + N` | Open Spotify |
| `Super + Shift + V` | Open PulseAudio Volume Control (pavucontrol) |
| `Super + Ctrl + D` | Open Discord (Wayland) |
| `Super + Ctrl + O` | Open Okular (PDF viewer) |
| `Super + Shift + O` | Open OBS Studio |
| `Super + Ctrl + P` | Open Cisco Packet Tracer |
| `Super + Shift + R` | Open Themix GUI |

### Window Management

| Keybind | Action |
|---|---|
| `Super + Shift + Q` | Kill focused window |
| `Super + H / ← ` | Focus left |
| `Super + J / ↓ ` | Focus down |
| `Super + K / ↑ ` | Focus up |
| `Super + L / → ` | Focus right |
| `Super + Shift + H/J/K/L` | Move focused window (vim keys) |
| `Super + Shift + ←/↓/↑/→` | Move focused window (arrow keys) |
| `Super + W` | Focus most recent urgent window |
| `Super + Shift + W` | Focus first tab in tabbed/stacked container |
| `Super + Tab` | Focus parent container |

### Layout

| Keybind | Action |
|---|---|
| `Super + O` | Horizontal split |
| `Super + I` | Vertical split |
| `Super + S` | Stacking layout |
| `Super + D` | Tabbed layout |
| `Super + E` | Toggle split layout |
| `Super + F` | Fullscreen |
| `Super + Shift + Space` | Toggle floating |
| `Super + Space` | Toggle focus between tiling/floating |

### Workspaces

| Keybind | Action |
|---|---|
| `Super + 1–0` | Switch to workspace 1–10 |
| `Super + Shift + 1–0` | Move container to workspace 1–10 |
| `Super + Ctrl + 1` | Move current workspace to laptop display (`eDP-1`) |
| `Super + Ctrl + 2` | Move current workspace to external monitor (`HDMI-A-1`) |

### Scratchpad

| Keybind | Action |
|---|---|
| `Super + Shift + Minus` | Send focused window to scratchpad |
| `Super + Minus` | Show / cycle scratchpad windows |

### Resize Mode

Enter resize mode with `Super + R`, then:

| Key | Action |
|---|---|
| `H / ← ` | Shrink width 10px |
| `L / → ` | Grow width 10px |
| `K / ↑ ` | Shrink height 10px |
| `J / ↓ ` | Grow height 10px |
| `Enter / Escape` | Exit resize mode |

### Utilities & Media Keys

| Keybind | Action |
|---|---|
| `XF86AudioMute` | Toggle mute (works while locked) |
| `XF86AudioLowerVolume` | Volume −5% (works while locked) |
| `XF86AudioRaiseVolume` | Volume +5% (works while locked) |
| `XF86AudioMicMute` | Toggle mic mute (works while locked) |
| `XF86MonBrightnessDown` | Brightness −5% (works while locked) |
| `XF86MonBrightnessUp` | Brightness +5% (works while locked) |
| `Super + Ctrl + S` | Screenshot — select region (hyprshot) |
| `Super + Ctrl + Shift + S` | Screenshot — full output (hyprshot) |
| `Super + F1` | Lock screen (swaylock-fancy) |
| `Super + Shift + C` | Reload Sway config |
| `Super + Shift + E` | Exit Sway (with confirmation) |

### VS Code Keybindings

| Keybind | Action |
|---|---|
| `Shift + Alt + B` | Toggle breadcrumbs |

> **Compatibility note:** Both vim-style (`h` `j` `k` `l`) and arrow keys are mapped for every navigation and resize action, so the setup works seamlessly whether you're a vim user or prefer arrow keys.

---

## 🖥️ Display Setup — Laptop & Monitor

Display output management is handled by [**Kanshi**](https://sr.ht/~emersion/kanshi/), a dynamic output configuration daemon for Wayland. Sway delegates all display decisions to Kanshi via `exec_always kanshictl reload`.

### Hardware

| Output | Identifier | Native Resolution |
|---|---|---|
| Laptop screen | `eDP-1` | 1920×1200 |
| External monitor | `HDMI-A-1` | 1920×1080 |

### Kanshi Display Profiles

Four profiles are defined in `.config/kanshi/config`:

| Profile | Laptop (`eDP-1`) | Monitor (`HDMI-A-1`) | Use Case |
|---|---|---|---|
| **Screen Only** | ✅ Enabled — 1920×1200 @ scale 1.2 | — (not connected) | Laptop with no external display plugged in |
| **Laptop Only** | ✅ Enabled — 1920×1200 @ scale 1.2 | ❌ Disabled | External monitor connected but turned off |
| **External Only** | ❌ Disabled | ✅ Enabled — 1920×1080 @ scale 1.1 | Laptop lid closed / laptop screen off |
| **Both Displays** | ✅ Enabled — 1920×1200 @ scale 1.2 (below) | ✅ Enabled — 1920×1080 @ scale 1.1 (above) | Dual-screen: monitor stacked on top of laptop |

In the **Both Displays** profile the monitor sits at position `(0, 0)` and the laptop screen at `(0, 982)`, creating a vertically stacked arrangement with the external monitor on top.

### Display Scripts

Two scripts provide flexible ways to switch between profiles:

#### [scripts/cycle-display](https://github.com/talned/arch-configs/blob/main/scripts/cycle-display)
Bound to `Super + Shift + P` — cycles through profiles in a loop:

```
Laptop Only → Both Displays → External Only → Laptop Only → …
```

State is persisted in `~/.config/sway/display-state`.

#### [scripts/kanshi-laptop-monitor-shuffler](https://github.com/talned/arch-configs/blob/main/scripts/kanshi-laptop-monitor-shuffler)
An advanced profile manager that rewrites the Kanshi config to set a chosen profile as active:

```bash
# Auto-detect and apply the currently active profile
kanshi-laptop-monitor-shuffler --current

# Interactively choose from available profiles
kanshi-laptop-monitor-shuffler --choose
```
It always keeps the `"Screen Only"` profile at the top of the config file and reorders the remaining profiles so the selected one comes first.

### Additional Script(s)

#### [scripts/move-workspaces](https://github.com/talned/arch-configs/blob/main/scripts/move-workspaces)
Bulk-moves all workspaces from one output to another:

```bash
# Move all workspaces to the laptop screen
move-workspaces --laptop

# Move all workspaces to the external monitor
move-workspaces --monitor
```

#### [scripts/sway-focus-first-tab](https://github.com/talned/arch-configs/blob/main/scripts/sway-focus-first-tab)
During tabbed mode in Sway, if you have multiple windows stacked as tabs (e.g. tabs A, B, C) and you're currently focused on tab C, there's no built-in Sway keybind to jump straight back to the first tab. You'd have to press focus left repeatedly. This script solves that in one keypress.
```
Tabbed container
┌──────────┬──────────┬──────────┐
│  Tab A   │  Tab B   │  Tab C ◄ │  ← you are here
└──────────┴──────────┴──────────┘

After running the script:

┌──────────┬──────────┬──────────┐
│  Tab A ◄ │  Tab B   │  Tab C   │  ← now here
└──────────┴──────────┴──────────┘
```
---

## 🚀 Startup Applications

When Sway launches, the following applications are automatically started and assigned to workspaces:

| Workspace | Application |
|---|---|
| 1 | Kitty (terminal) |
| 2 | Spotify + pavucontrol |
| 3 | Firefox |
| 4 | VS Code |

---

## 🎨 Theming

The setup uses a **minimal black theme** across the entire environment:

- **Sway borders & tabs:** Pure black (`#000000`) background with white (`#ffffff`) text for focused windows; dark grey (`#272727`) for unfocused tabs.
- **Window borders:** 1px pixel border, 5px outer gaps.
- **Status bar:** Top-positioned swaybar on a black background showing memory usage, CPU usage, date, and time.
- **VS Code:** "Simple Black Theme" with fully black status/title bars and IBM Plex Mono font.

---

## 🐚 Shell Configuration

### Bash Aliases

Please **read** the [.bashrc](https://github.com/talned/arch-configs/blob/main/.bashrc) file to see the aliases

### Bash Functions

- **`show-host`** — Toggles showing the hostname in the shell prompt.
- **`pkghealth`** — Reports system package integrity (percentage of packages with no missing files).

### Prompt

A minimal bracket prompt: `[user dir]$` — hostname is conditionally shown if `~/.show_hostname` exists.

**Zoxide** is integrated as a `cd` replacement for smart directory navigation.

---

## ⚙️ Systemd Services

| Service | Description |
|---|---|
| `kanshi.service` | Runs Kanshi as a user service tied to the graphical session. Auto-restarts on failure. |
| `polkit-gnome.service` | Runs the Polkit GNOME authentication agent for privilege escalation dialogs. |

---

## 🔄 Syncing Configs

The script `.config/sync-from-home-config-files.sh` copies live configuration files from your home directory into this repository:

```bash
cd ~/Projects/arch-configs/.config
bash sync-from-home-config-files.sh
```

This copies configs for: VS Code, Fastfetch, Kanshi, Sway (including config.d fragments and bar scripts), and Wayland flags for Code/Spotify.

---

## 📦 Key Dependencies

- [Sway](https://swaywm.org/) — Wayland compositor (i3-compatible)
- [Kanshi](https://sr.ht/~emersion/kanshi/) — Dynamic display configuration
- [Kitty](https://sw.kovidgoyal.net/kitty/) — GPU-accelerated terminal
- [lsd](https://github.com/lsd-rs/lsd) — Modern `ls` replacement
- [zoxide](https://github.com/ajeetdsouza/zoxide) — Smart `cd` replacement
- [trash-cli](https://github.com/andreafrancia/trash-cli) — Safe file deletion
- [hyprshot](https://github.com/Gustash/Hyprshot) — Screenshot utility
- [swaylock-fancy](https://github.com/Big-Bag/swaylock-fancy) — Fancy lock screen
- [brightnessctl](https://github.com/Hummer12007/brightnessctl) — Backlight control
- [Fastfetch](https://github.com/fastfetch-cli/fastfetch) — System information tool
- [GitUI](https://github.com/extrawurst/gitui) — Terminal Git interface
- [UWSM](https://github.com/Vladimir-csp/uwsm) — Universal Wayland Session Manager

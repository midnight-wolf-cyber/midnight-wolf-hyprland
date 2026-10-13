# MIDNIGHT WOLF — Hyprland

> **SILENT • FOCUSED • UNSTOPPABLE**

A dark, moonlit Hyprland rice inspired by the **Midnight Wolf** identity:
black glass surfaces, silver typography, icy-blue accents, rounded panels, soft blur, and a cinematic wolf-at-night atmosphere.

## What is included

- Hyprland 0.55+ Lua configuration
- Waybar top panel
- Hyprpaper wallpaper configuration
- Rofi-Wayland launcher theme
- Kitty terminal theme
- Useful keybinds and startup services
- Midnight Wolf color system

## Color palette

| Name | Hex |
|---|---|
| Void | `#000000` |
| Obsidian | `#080B14` |
| Midnight | `#1A2433` |
| Wolf Blue | `#3382F6` |
| Moon Silver | `#94A3B8` |
| White | `#E8EEF7` |

## Requirements

This repo targets **Hyprland 0.55+**, where Hyprland's Lua configuration is the current configuration format. Check your version with:

```bash
hyprctl version
```

Install the main packages on Arch:

```bash
sudo pacman -S --needed hyprland waybar hyprpaper rofi-wayland kitty \
  pipewire pipewire-pulse wireplumber playerctl brightnessctl \
  networkmanager network-manager-applet pavucontrol \
  ttf-jetbrains-mono-nerd
```

Optional:

```bash
sudo pacman -S --needed swaync hyprlock hypridle grim slurp wl-clipboard
```

## Install

Clone the repository:

```bash
git clone https://github.com/YOUR_USERNAME/midnight-wolf-hyprland.git
cd midnight-wolf-hyprland
```

Then:

```bash
chmod +x install.sh
./install.sh
```

The installer backs up existing config directories before copying Midnight Wolf.

## Wallpaper

Put your wallpaper here:

```text
~/.config/midnight-wolf/wallpapers/midnight-wolf.jpg
```

The supplied `hyprpaper.conf` expects:

```text
~/.config/midnight-wolf/wallpapers/midnight-wolf.jpg
```

The configuration intentionally does **not** ship a copyrighted wallpaper. Add your own image to the repo only if you have permission to redistribute it.

## Important

If your monitor has a fixed preferred mode, you can add a monitor rule to `hyprland.lua`.

Example:

```lua
hl.monitor({
    output = "DP-1",
    mode = "2560x1440@144",
    position = "0x0",
    scale = 1,
})
```

Find your monitor name with:

```bash
hyprctl monitors
```

## Main keybinds

| Shortcut | Action |
|---|---|
| `SUPER + Enter` | Kitty |
| `SUPER + R` | Rofi launcher |
| `SUPER + E` | File manager |
| `SUPER + Q` | Close window |
| `SUPER + V` | Toggle floating |
| `SUPER + F` | Fullscreen |
| `SUPER + L` | Lock screen if hyprlock is installed |
| `SUPER + SHIFT + R` | Reload Waybar |
| `SUPER + SHIFT + W` | Next wallpaper |
| `SUPER + 1..9` | Workspace |
| `SUPER + SHIFT + 1..9` | Move window to workspace |
| `SUPER + Arrow keys` | Focus direction |
| `SUPER + SHIFT + Arrow keys` | Move window |
| `XF86AudioRaiseVolume` | Volume up |
| `XF86AudioLowerVolume` | Volume down |
| `XF86AudioMute` | Mute |
| `XF86MonBrightnessUp` | Brightness up |
| `XF86MonBrightnessDown` | Brightness down |

## Reload after editing

Hyprland Lua config:

```bash
hyprctl reload
```

Waybar:

```bash
pkill waybar
waybar &
```

Or use:

```text
SUPER + SHIFT + R
```

## Design direction

**MIDNIGHT WOLF**

- Silent
- Focused
- Unstoppable
- Minimal
- Cold
- Precise

The goal is a professional desktop rather than a cluttered "everything neon" rice.

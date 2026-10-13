#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"
TARGET="$CONFIG_DIR"

timestamp="$(date +%Y%m%d-%H%M%S)"
backup="$HOME/.config-midnight-wolf-backup-$timestamp"

mkdir -p "$TARGET"
mkdir -p "$CONFIG_DIR/midnight-wolf/wallpapers"

backup_dir() {
    local name="$1"
    if [[ -e "$TARGET/$name" ]]; then
        mkdir -p "$backup"
        mv "$TARGET/$name" "$backup/$name"
        echo "Backed up $TARGET/$name -> $backup/$name"
    fi
}

echo "== Midnight Wolf installer =="

backup_dir "hypr"
backup_dir "waybar"
backup_dir "rofi"
backup_dir "kitty"

cp -a "$REPO_DIR/hypr" "$TARGET/"
cp -a "$REPO_DIR/waybar" "$TARGET/"
cp -a "$REPO_DIR/rofi" "$TARGET/"
cp -a "$REPO_DIR/kitty" "$TARGET/"

# Keep wallpaper outside the git-tracked config by default.
if [[ -d "$REPO_DIR/assets/wallpapers" ]]; then
    cp -a "$REPO_DIR/assets/wallpapers/." \
        "$CONFIG_DIR/midnight-wolf/wallpapers/" 2>/dev/null || true
fi

chmod +x "$TARGET/hypr/scripts/"*.sh 2>/dev/null || true

echo
echo "Midnight Wolf installed."
echo "Backups: ${backup:-none}"
echo
echo "Run:"
echo "  hyprctl reload"
echo
echo "If Waybar is not running:"
echo "  waybar &"

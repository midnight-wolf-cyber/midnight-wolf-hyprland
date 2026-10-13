#!/usr/bin/env bash
set -euo pipefail

WALLPAPER_DIR="${HOME}/.config/midnight-wolf/wallpapers"

mapfile -t WALLPAPERS < <(
    find "$WALLPAPER_DIR" -type f \
        \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' -o -iname '*.jxl' \) \
        | sort
)

if [[ ${#WALLPAPERS[@]} -eq 0 ]]; then
    notify-send "Midnight Wolf" "No wallpapers found."
    exit 0
fi

CURRENT="$(hyprctl hyprpaper listactive 2>/dev/null | head -n1 | sed 's/^[^:]*: //')"

NEXT="${WALLPAPERS[0]}"

for i in "${!WALLPAPERS[@]}"; do
    if [[ "${WALLPAPERS[$i]}" == "$CURRENT" ]]; then
        NEXT="${WALLPAPERS[$(( (i + 1) % ${#WALLPAPERS[@]} ))]}"
        break
    fi
done

hyprctl hyprpaper wallpaper ",${NEXT},cover"
notify-send "Midnight Wolf" "Wallpaper changed"

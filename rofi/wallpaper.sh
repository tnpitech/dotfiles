#!/usr/bin/env bash

WALL_DIR="$HOME/Pictures/Wallpapers"
THEME="$HOME/.config/rofi/wallpapertheme.rasi"

list_wallpapers() {
    find "$WALL_DIR" -maxdepth 2 -type f \
        \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \) \
        -printf '%T@\t%p\n' \
        | sort -t$'\t' -k1,1nr \
        | cut -f2- \
        | while IFS= read -r img; do
            printf '%s\0icon\x1f%s\n' "$(basename "$img")" "$img"
        done
}

choice=$(list_wallpapers | rofi -dmenu -i \
    -show-icons \
    -p "" \
    -theme "$THEME")

[ -z "$choice" ] && exit 0

img=$(find "$WALL_DIR" -type f -name "$choice" | head -n1)

awww img "$img" --transition-type fade

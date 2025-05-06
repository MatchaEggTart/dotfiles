#!/bin/bash

CONFIG_PATH="$HOME/.config/hypr/monitors.conf"

echo "# Auto-generated monitor config" > "$CONFIG_PATH"

hyprctl monitors -j | jq -r '.[] | 
    .name as $name |
    .width as $current_w |
    .height as $current_h |
    .availableModes | 
    map(
        split("@") | 
        { 
            res: .[0], 
            w: (.[0] | split("x")[0] | tonumber),
            h: (.[0] | split("x")[1] | tonumber),
            rate: (.[1] | split("Hz")[0] | tonumber) 
        }
    ) | 
    map(select(.w == $current_w and .h == $current_h)) |  # 筛选当前分辨率
    max_by(.rate) | 
    "monitor=\($name), \(.w)x\(.h)@\(.rate | tostring | split(".")[0]), 0x0, 1"
' >> "$CONFIG_PATH"

hyprctl reload

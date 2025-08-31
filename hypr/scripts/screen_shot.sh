#!/bin/bash
# FILE_PATH="$HOME/Pictures/Screenshots/screenshot-$(date +%s).png"
# grim -g "$(slurp)" "$FILE_PATH"
# wl-copy < "$FILE_PATH"
# swayimg --scale=fit --config="info.show=no" "$FILE_PATH" &
# 单击关闭窗口（需提前赋予权限：chmod +x ~/.local/bin/snipaste_swayimg）

#!/bin/bash
FILE_PATH="$HOME/Pictures/Screenshots/screenshot-$(date +%s).png"
grim -g "$(slurp)" "$FILE_PATH"
wl-copy < "$FILE_PATH"
swayimg --scale=1 --config="info.show=no" "$FILE_PATH" &  # 关键修改：--scale=1

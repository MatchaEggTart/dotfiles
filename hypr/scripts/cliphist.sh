#!/bin/sh
# 保存为 ~/.config/hypr/scripts/cliphist.sh

# 检查 wofi 是否已在运行
if pgrep -f "wofi --dmenu" > /dev/null; then
    # 关闭已打开的 wofi 窗口
    pkill -f "wofi --dmenu"
else
    cliphist list | wofi --dmenu | cliphist decode | wl-copy
fi

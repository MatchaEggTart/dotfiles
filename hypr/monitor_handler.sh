#!/bin/bash

INTERNAL="eDP-1"  # 根据实际情况修改

# 等待Hyprland完全启动
sleep 5

while true; do
    # 获取当前连接的显示器信息
    monitors=$(hyprctl monitors)
    external_connected=$(echo "$monitors" | grep -v "$INTERNAL" | grep "Monitor")
    
    if [ -n "$external_connected" ]; then
        # 外接显示器连接时，禁用内置屏幕
        hyprctl keyword monitor "$INTERNAL, disable"
    else
        # 无外接显示器时，启用内置屏幕
        hyprctl keyword monitor "$INTERNAL, 2560x1440@165, auto, 1"
    fi
    sleep 5
done

# sleep 5
#  
# # 获取当前连接的显示器信息
# monitors=$(hyprctl monitors)
# external_connected=$(echo "$monitors" | grep -v "$INTERNAL" | grep "Monitor")
#  
# if [ -n "$external_connected" ]; then
#     # 外接显示器连接时，禁用内置屏幕
#     hyprctl keyword monitor "$INTERNAL, disable"
# else
#     # 无外接显示器时，启用内置屏幕
#     hyprctl keyword monitor "$INTERNAL, 2560x1440@165, auto, 1"
# fi

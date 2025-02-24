#!/bin/bash

# 初始化状态标志
LAST_STATE="none"
#!/bin/bash

# 加载壁纸功能
source ~/.config/hypr/scripts/wallpaper.sh 

# 初始化显示器接口
get_monitors() {
    MONITOR_LAPTOP=$(hyprctl monitors all | grep -oP 'eDP-\d+')
    MONITOR_EXTERNAL=$(hyprctl monitors all | grep -oP '(?<!e)DP-\d+')
}

# 获取显示器接口（动态更新）
get_monitors() {
    MONITOR_LAPTOP=$(hyprctl monitors all | grep -oP 'eDP-\d+')
    MONITOR_EXTERNAL=$(hyprctl monitors all | grep -oP '(?<!e)DP-\d+')
}

# 等待Hyprland完全启动
sleep 5

while true; do
    # 动态获取最新显示器接口（防止接口变化）
    get_monitors
    
    # 检测外接显示器状态
    monitors=$(hyprctl monitors)
    external_connected=$(echo "$monitors" | grep -v "$MONITOR_LAPTOP" | grep "Monitor")
    
    # 判断状态变化
    if [ -n "$external_connected" ]; then
        CURRENT_STATE="external"
    else
        CURRENT_STATE="internal"
    fi

    # 仅当状态变化时执行命令
    if [ "$CURRENT_STATE" != "$LAST_STATE" ]; then
        if [ "$CURRENT_STATE" = "external" ]; then
            hyprctl keyword monitor "$MONITOR_LAPTOP, disable"
        else
            hyprctl keyword monitor "$MONITOR_LAPTOP, 2560x1440@165, auto, 1"
        fi
	set_wallpaper
	hyprctl dispatch workspace 1
        LAST_STATE="$CURRENT_STATE"  # 更新状态标志
    fi
    sleep 5
done

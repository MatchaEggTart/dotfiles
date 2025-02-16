#!/bin/bash

# 来源 https://shaobin-jiang.github.io/blog/posts/hyprland-monitor/
# 非常感谢

# 双显示器选择
# monitor = eDP-1, 2560x1440@165, 0x0, 1
# monitor = DP-3, 2560x1440@165, 0x0, 1

# 双显示器镜像
# monitor = eDP-1, 2560x1440@165, 0x0, 1
# monitor = DP-3, 2560x1440@165, 0x0, 1, mirror, eDP-1

# 获取主显示器接口
MONITOR_LAPTOP=$(hyprctl monitors all | grep -oP 'eDP-\d+')
# 获取外接显示器接口
MONITOR_EXTERNAL=$(hyprctl monitors all | grep -oP '(?<!e)DP-\d+')

callback() {
    MONITOR_COUNT=$(hyprctl monitors | grep -c " (ID [0-9]):")
    if (($MONITOR_COUNT > 1)); then
        hyprctl keyword monitor $MONITOR_LAPTOP,disable
    else
        hyprctl keyword monitor $MONITOR_LAPTOP,preferred,0x0,1
    fi
}

handle() {
    if [[ ${1:0:14} == "monitorremoved" ]]; then
        callback ${1:16}
    fi
    if [[ ${1:0:14} == "monitoradded>>" ]]; then
        callback ${1:14}
    fi
}

callback
hyprctl dispatch workspace 1

# sudo pacman -S socat
# socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done

# Old Version

# one_monitors=$1
# two_monitors=$2

# number_of_monitors=$(hyprctl monitors all | grep "DP-2" | awk '{print $2}')
# number_of_monitors=$(hyprctl monitors all | grep "Monitor" | wc -l)
# number_of_monitors=$(hyprctl monitors all | grep -c "Monitor")
# echo $number_of_monitors
# if [[$number_of_monitors > $one_monitors]];then
#     hyprctl keyword monitor eDP-1,disable
# else
#     hyprctl keyword monitor eDP-1,preferred,0x0,1
# fi

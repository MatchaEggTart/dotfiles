#!/bin/bash
sleep 0.1  # 等待 Hyprland 更新状态
current_status=$(hyprctl -j devices | jq -r '.keyboards[] | select(.main == true) | .capsLock')

if [[ "$current_status" == "true" ]]; then
  notify-send "Caps Lock ON" -u low -i keyboard
else
  notify-send "Caps Lock OFF" -u low -i keyboard
fi

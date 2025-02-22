#!/bin/bash
sleep 0.2  # 适当延时确保状态更新

# 获取所有键盘的 CapsLock 状态
declare -A status_map
while IFS= read -r line; do
    name=$(jq -r '.name' <<< "$line")
    status_map["$name"]=$(jq -r '.capsLock' <<< "$line")
done < <(hyprctl -j devices | jq -c '.keyboards[]')

# 定义优先检测顺序（根据实际键盘名称修改）
declare -a keyboard_order=(
    "hl-virtual-keyboard"           # 外接键盘设备名    
    "at-translated-set-2-keyboard"  # 笔记本内置键盘
)

# 按优先级检测首个活动键盘状态
for kb in "${keyboard_order[@]}"; do
    if [[ -n "${status_map[$kb]}" ]]; then
        current_status="${status_map[$kb]}"
        break
    fi
done

# 如果找不到指定设备则获取第一个键盘状态
[[ -z "$current_status" ]] && current_status=$(hyprctl -j devices | jq -r '.keyboards[1].capsLock')

# 通知逻辑
if [[ "$current_status" == "true" ]]; then
    notify-send -c "capslock" "Caps Lock ON" -u low -i keyboard
else
    notify-send -c "capslock" "Caps Lock OFF" -u low -i keyboard
fi

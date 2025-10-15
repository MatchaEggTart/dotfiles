#!/bin/bash
sleep 0.1

# 配置区域 ==============================
# 内置键盘标识（根据实际情况修改）
internal_kb="at-translated-set-2-keyboard"

# 优先检测的键盘列表（按优先级排序）
preferred_kbs=("milsky-mini84" "keychron-k6-pro" "keychron-k8")
# ======================================

# 智能识别键盘逻辑
external_kb=""
# 获取所有连接中的键盘设备
all_kbs=($(hyprctl -j devices | jq -r '.keyboards[].name'))

# 优先检查预设列表
for kb in "${preferred_kbs[@]}"; do
    if [[ " ${all_kbs[*]} " =~ " $kb " ]]; then
        external_kb="$kb"
        break
    fi
done

# 未找到预设设备时使用自动检测
if [[ -z "$external_kb" ]]; then
    external_kb=$(hyprctl -j devices | jq -r '.keyboards[] | select(((.name | test("keyboard"; "i")) and (.name | test("virtual|translated|mouse|event|bus|button|receiver"; "i") | not))) | .name' | head -n1)
fi

# 获取所有键盘状态
declare -A status_map
while IFS= read -r line; do
    name=$(jq -r '.name' <<< "$line")
    status_map["$name"]=$(jq -r '.capsLock' <<< "$line")
done < <(hyprctl -j devices | jq -c '.keyboards[]')

# 状态检测逻辑
if [[ -n "${status_map[$external_kb]}" ]]; then
    # 优先使用外接键盘状态
    current_status="${status_map[$external_kb]}"
    echo "External Keyboard Connected"
elif [[ -n "${status_map[$internal_kb]}" ]]; then
    # 回退到内置键盘
    current_status="${status_map[$internal_kb]}"
    echo "External Keyboard Disconnected"
else
    # 应急回退方案
    current_status=$(hyprctl -j devices | jq -r '.keyboards[0].capsLock')
    echo "External Keyboard Disconnected: Use Built-in Keyboard"
fi

# 通知逻辑
if [[ "$current_status" == "true" ]]; then
    notify-send -c "capslock" "Caps Lock ON" -u low -i keyboard
else
    notify-send -c "capslock" "Caps Lock OFF" -u low -i keyboard
fi

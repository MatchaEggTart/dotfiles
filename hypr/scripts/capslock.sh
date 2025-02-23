#!/bin/bash
sleep 0.2  # 适当延时确保状态更新

# 设备名称配置（请根据实际名称修改）
# 使用 hyprctl -j devices | jq  检查
internal_kb="at-translated-set-2-keyboard"  # 内置键盘
# 智能识别特定外接键盘
external_kb=$(
    hyprctl -j devices | jq -r '.keyboards[] | select(((.name | test("keyboard"; "i")) and (.name | test("virtual|translated|event|bus|button|receiver"; "i") | not))) | .name' | head -n1 
)

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

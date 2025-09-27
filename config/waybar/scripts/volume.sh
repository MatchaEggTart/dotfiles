#!/usr/bin/env bash
# ~/.config/waybar/scripts/audio-control.sh

# 获取所有音频设备
get_devices() {
  pactl list short sinks | awk -v type="$1" '{
    print type " " $1 " " $2
  }'
}

# 生成设备选择菜单
menu_content=$(cat <<EOF
Output Devices:
$(get_devices "sink")
---
Input Devices:
$(get_devices "source")
---
Volume: 100%
Volume: 90%
Volume: 80%
Volume: 70%
Volume: 60%
Volume: 50%
EOF
)

# 使用 wofi 显示菜单
selected=$(echo "$menu_content" | wofi --dmenu --prompt "Audio Control" --height 200 --width 300)

# 处理选择结果
if [[ $selected == "Volume: "* ]]; then
  level=${selected/Volume: /}
  level=${level/%/}
  pactl set-sink-volume @DEFAULT_SINK@ $level%
elif [[ $selected == sink* ]] || [[ $selected == source* ]]; then
  type=$(echo $selected | awk '{print $1}')
  id=$(echo $selected | awk '{print $2}')
  name=$(echo $selected | awk '{print $3}')
  
  if [ "$type" = "sink" ]; then
    pactl set-default-sink $id
  else
    pactl set-default-source $id
  fi
fi

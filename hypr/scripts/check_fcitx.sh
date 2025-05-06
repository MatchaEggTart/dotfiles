#!/bin/bash

# 核心功能：切换输入法
/usr/bin/fcitx5-remote -t  # 先切换状态

# 获取切换后的状态
status=$(fcitx5-remote 2>/dev/null)

# 发送通知（优化状态描述）
if [[ $status -eq 1 ]]; then
  notify-send -c "fcitx" -t 800 "󱂬   NO Fcitx" 
elif [[ $status -eq 2 ]]; then
  notify-send -c "fcitx" -t 800 "󱂬   Fcitx"
else
  notify-send -c "fcitx" -t 1500 "⚠️ WARING" "Fcitx5 NO RUNNING\!\!\!"
fi

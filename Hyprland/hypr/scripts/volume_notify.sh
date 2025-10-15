#!/bin/bash

case $1 in
    up)
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
        ;;
    down)
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
        ;;
    mute)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        ;;
esac

# 获取音量状态
volume_info=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
volume=$(echo $volume_info | awk '{printf "%d", $2*100}')
muted=$(echo $volume_info | grep -q "[MUTED]" && echo 1 || echo 0)

# 发送通知
if [ $muted -eq 1 ]; then
    notify-send -c "volume" "🔇   Muted" -h string:x-canonical-private-synchronous:volume
else
    if [ $volume -ge 70 ]; then
        notify-send -c "volume" "    Volume: ${volume}%" -h string:x-canonical-private-synchronous:volume
    elif [ $volume -ge 30 ]; then
        notify-send -c "volume" "   Volume: ${volume}%" -h string:x-canonical-private-synchronous:volume
    elif [ $volume -gt 0 ]; then
        notify-send -c "volume" "   Volume: ${volume}%" -h string:x-canonical-private-synchronous:volume
    else
        notify-send -c "volume" "🔇   Volume: ${volume}%" -h string:x-canonical-private-synchronous:volume
    fi
fi

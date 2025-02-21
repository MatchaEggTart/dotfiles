#!/bin/bash

set_wallpaper() {
    # 终止现有壁纸进程
    pkill -x mpvpaper 2>/dev/null
    pkill -x hyprpaper 2>/dev/null

    # 优先处理视频壁纸
    local video_wallpaper="$HOME/Videos/Wallpapers/0.mp4"
    local image_wallpaper="$HOME/Pictures/Wallpapers/0.jpg"

    if [[ -f "$video_wallpaper" ]]; then
        notify-send "Set Video Wallpaper: $video_wallpaper"
        # mpvpaper -o "no-audio --loop-playlist --terminal=no --panscan=1" "*" "$video_wallpaper" &
	# mpvpaper -o "no-audio --loop-file --terminal=no --panscan=1" "*" "$video_wallpaper" &
	mpvpaper -o "no-audio --loop-file=inf --video-sync=display-resample --hr-seek=yes --cache=yes --hwdec=nvdec --demuxer-max-bytes=500M" "*" "$video_wallpaper" &
    elif [[ -f "$image_wallpaper" ]]; then
        notify-send "Set Image Wallpaper: $image_wallpaper"
	hyprpaper &
    else
        notify-send "Can't find either video or image!"
    fi
}

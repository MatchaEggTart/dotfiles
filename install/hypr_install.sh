# pipewire-pulse 音频驱动
# pavucontrol 音频控制器
# mako 通知功能
# hyprpaper 壁纸
# waybar 上条
# hyprlock 锁屏
# hypridle 状态监控
# brightnessctl 笔记本屏幕光度
# tofi 软件启动
# wlogou 开机关机功能
# ddccontrol 外接屏幕光度
sudo pacman -Syy pavucontrol mako hyprpaper waybar hyprlock hypridle brightnessctl swayimg grim slurp wl-clipboard wl-clip-persist jq papirus-icon-theme cliphist # copyq
# 图标主题
paru -S tofi wlogout ddccontrol bibata-cursor-theme-bin mpvpaper # hyprshot # rose-pine-hyprcursor

mkdir -p $HOME/Pictures/Screenshots $HOME/Videos/Wallpapers $HOME/Pictures/Wallpapers
# if use input
# sudo usermod -aG input matchaeggtart
# 双显示器工具 https://wiki.archlinuxcn.org/wiki/%E8%83%8C%E5%85%89
# paru -Syy ddcci-driver-linux-dkms 废了，太卡了
# 使用指令 ddcutil setvcp 10 70 设置为 70
# 用 ddccontrol 会好一点，但需要 ddccontrol -p 去看分配型号

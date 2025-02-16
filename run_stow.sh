rm -rf $HOME/.emacs.d
rm -rf $HOME/nvim

rm -rf $HOME/.bash_logout
rm -rf $HOME/.bashrc
rm -rf $HOME/.bash_profile 

rm -rf $HOME/.zshrc
rm -rf $HOME/.zsh_profile

rm -rf $HOME/.config/emacs
rm -rf $HOME/.config/kitty
rm -rf $HOME/.config/mako
rm -rf $HOME/.config/tofi
rm -rf $HOME/.config/waybar

stow bash
stow zsh
stow -t $HOME/.config config

# mkdir -p $HOME/Pictures/Wallpapers
# cp -r hypr/* $HOME/.config/hypr/

#! /bin/sh

~/.config/zsh/startup.sh &

$HOME/.config/polybar/launch.sh &

# first add all the wallpapers then apply a random wallpaper including the theme
wpg -s ~/.config/wallpapers &
pywal-discord -t abou &

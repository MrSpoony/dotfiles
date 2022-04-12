#! /bin/sh

~/bin/startup.sh &

$HOME/.config/polybar/launch.sh &

# first add all the wallpapers then apply a random wallpaper including the theme
wpg -s ~/pictures/wallpapers &
pywal-discord -t abou &

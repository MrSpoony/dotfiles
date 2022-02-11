#! /bin/sh

pgrep -x sxhkd > /dev/null || sxhkd &

# Compositor picom
# picom --backend glx &
picom &

# Start session
lxsession &

# x-commands
# keyboard layout colemak and repetitive CapsLock/Backspace presses
setxkbmap us -variant colemak &

# sudo kmonad ~/testing/colemak-extend-iso.kbd &
xset r 66 & # set repetitive backspace on CapsLock
xset r rate 180 85 & # set repetitive keyboardpresses faster

# set tapping and natural scrolling on touchpad
xinput set-prop "DLL0945:00 04F3:311C Touchpad" "libinput Tapping Enabled" 1 &
xinput set-prop "DLL0945:00 04F3:311C Touchpad" "libinput Natural Scrolling Enabled" 1 &

# set cursor
xsetroot -cursor_name crosshair &

# set screen timeout
xset s 600 5 &
xss-lock -n /usr/lib/xsecurelock/dimmer -l -- xsecurelock &

# start clients like clipmenu, dunst, vpn etc 
clipmenud &
dunst &
# mullvad connect &

# start spotifyd clients
spotifyd --no-daemon --device-name spotifydDellXPS15 &
cd /opt/whoogle-search/
./run & 

# eval $(gnome-keyring-daemon --start) &
# export SSH_AUTH_SOCK &

wmname LG3D &


# copied from https://github.com/microsoft/vscode/issues/120392#issuecomment-814210643 for github auth in vscode/vscode-insiders for setting-sync etc
# init keyring
# eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
# export keyring
# export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK
# exec dbus-launch dwm

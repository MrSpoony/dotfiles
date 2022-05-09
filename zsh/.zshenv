# Path variable and stuff
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:~/bin/
export PATH=$PATH:~/apps/rofi-translate
export PATH=$PATH:~/code/python/rofi_spotify/bin
export PYTHONPATH=$PYTHONPATH:~/code/python/rofi_spotify

# clipboard things
export CM_SELECTIONS="clipboard"
export CM_DEBUG=0
export CM_OUTPUT_CLIP=0
export CM_MAX_CLIPS=1000
export CM_HISTLENGTH=16
export CM_LAUNCHER="rofi"
export CM_IGNORE_WINDOW="Bitwarden"

# xautolock stuff
export XSECURELOCK_SAVER="saver_xscreensaver"
export XSECURELOCK_SAVER="saver_mplayer"
export XSECURELOCK_DISCARD_FIRST_KEYPRESS=0
export XSECURELOCK_PASSWORD_PROMPT="cursor"
export XSECURELOCK_COMPOSITE_OBSCURER=0

# powerline theme stuff for oh-my-zsh-powerline-theme
# export POWERLINE_RIGHT_A="date"
# export POWERLINE_RIGHT_B="none"
export POWERLINE_RIGHT_A="mixed"
export POWERLINE_RIGHT_A_COLOR_BACK="red"
export POWERLINE_DATE_FORMAT="%D{%d-%m-%y}"
# export POWERLINE_HIDE_USER_NAME="true"
# export POWERLINE_HIDE_HOST_NAME="true"
export POWERLINE_NO_BLANK_LINE="true"
export POWERLINE_DETECT_SSH="true"

export POWERLINE_GIT_CLEAN="✔"
export POWERLINE_GIT_DIRTY="✘"
export POWERLINE_GIT_ADDED="%F{green}✚%F{black}"
# export POWERLINE_GIT_MODIFIED="%F{blue}✹%F{black}"
export POWERLINE_GIT_MODIFIED="%F{blue}✹"
export POWERLINE_GIT_DELETED="%F{red}✖%F{black}"
export POWERLINE_GIT_UNTRACKED="%F{yellow}✭%F{black}"
export POWERLINE_GIT_RENAMED="➜"
export POWERLINE_GIT_UNMERGED="═"

# Whoogle stuff
export EXPOSE_PORT=5080
# export HTTPS_ONLY=true

# editor to neovim
export EDITOR="nvim"
export VISUAL="nvim"

export TERMINAL="$TERM"

# for wine idk why but it helps
export _JAVA_AWT_WM_NONPARENTING=1
export _JAVA_AWT_WM_NONREPARTENTING=1
# export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

# History
export SAVEHIST=1000000000
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export HISTFILE=~/.zsh_history

export QT_STYLE_OVERRIDE=gtk2

# Go stuff
export GOPATH="/home/kimil/code/go"
export GOBIN="/home/kimil/code/go/bin"


# Keyring stuff
if [ -n "$DESKTOP_SESSION" ]; then
    eval $(gnome-keyring-daemon --start --start)
    export SSH_AUTH_SOCK
fi

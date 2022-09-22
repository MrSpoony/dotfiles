# Path variable and stuff
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:$HOME/bin/
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/usr/local/opt/node/bin
export PATH=$PATH:$HOME/apps/rofi-translate
export PATH=$PATH:$HOME/code/py/rofi-spotify/bin
export PYTHONPATH=$PYTHONPATH:$HOME/code/python/rofi_spotify
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:/mnt/c/Windows/System32/

# Language
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export NVM_DIR="$HOME/.nvm"

# clipboard things
export CM_SELECTIONS="clipboard"
export CM_DEBUG=0
export CM_OUTPUT_CLIP=0
export CM_MAX_CLIPS=10000
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

export BROWSER="brave"

export TERMINAL="$TERM"

# for wine idk why but it helps
export _JAVA_AWT_WM_NONPARENTING=1
export _JAVA_AWT_WM_NONREPARTENTING=1
# export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

# History
export SAVEHIST=1000000000
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export HISTFILE=$HOME/.zsh_history

export QT_STYLE_OVERRIDE=gtk2

export LANG="en_US.UTF-8"

# Go stuff
export GOPATH="$HOME/code/go"
export GOBIN="$HOME/code/go/bin"

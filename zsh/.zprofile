eval "$(/opt/homebrew/bin/brew shellenv)"

# disable homebrew analytics
export HOMEBREW_NO_ANALYTICS=1

# configure locales to UTF-8
export LC_ALL="en_US.UTF-8"
export LC_NUMERIC="fi_FI.UTF-8"
export LC_TIME="fi_FI.UTF-8"

# terminal color settings
export TERM="xterm-256color"

# start tmux automatically
ZSH_TMUX_AUTOSTART='true'

# set vim as default editor
export EDITOR=/usr/bin/vim

# hide the "user@hostname" info when you’re logged in as yourself on your local machine
DEFAULT_USER=`whoami`

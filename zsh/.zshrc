# path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# configure zsh theme
# ZSH_THEME=agnoster

# load zsh plugins
plugins=(git-auto-fetch gitignore magic-enter)

# automatically updates Oh My Zsh when a new version is available
zstyle ':omz:update' mode auto

# enable timestamps for history
HIST_STAMPS="yyyy-mm-dd"

# initialize oh-my-zsh
source $ZSH/oh-my-zsh.sh

# function for shortened urls checking
function urlxray() {
    if [ "$1" != "" ]
    then
        curl $1 -Is | grep -i location | cut -f2- -d' '
    fi
}

# function for enumerating subdomains
function enumerate() {
    if [ "$1" != "" ]
    then
        curl -s "https://crt.sh/?q=%.$1&output=json" | jq '.name_value' | sed 's/\"//g' | sed 's/\*\.//g' | sort -u
    fi
}

# function for checking tldr tips for command
function howto() {
    if [ "$1" != "" ]
    then
        curl cheat.sh/$1
    fi
}

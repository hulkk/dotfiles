# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# workaround for python fork() issue in High Sierra
# https://github.com/ansible/ansible/issues/31869#issuecomment-337769174
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# configure locales to UTF-8
export LC_ALL="en_US.UTF-8"
export LC_NUMERIC="fi_FI.UTF-8"
export LC_TIME="fi_FI.UTF-8"

# terminal color settings
export TERM="xterm-256color"

# start tmux automatically
ZSH_TMUX_AUTOSTART='true'

# set antigen path for powerlevel9k
POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k

# enable patched fonts
POWERLEVEL9K_MODE='awesome-patched'

# disable dir/git icons, leave home icon enabled
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_VCS_GIT_GITHUB_ICON=''
POWERLEVEL9K_VCS_GIT_ICON=''

# modify git icons
POWERLEVEL9K_VCS_UNTRACKED_ICON='\u25CF'
POWERLEVEL9K_VCS_UNSTAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_STAGED_ICON='\u002b'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\u2193'
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\u2191'

# modify git colours
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='white'
POWERLEVEL9K_VCS_STAGED_BACKGROUND='yellow'

# show status only with icon
POWERLEVEL9K_STATUS_VERBOSE=true
POWERLEVEL9K_STATUS_CROSS=true
POWERLEVEL9K_STATUS_OK=true

# prompt element settings
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time)

# remove extra space after right prompt
ZLE_RPROMPT_INDENT=0

# custom aliases
alias 'password=openssl rand -base64 15'
alias 'cat=ccat'
alias 'headers=http --follow --all -h'
alias 'mv=mv -i'
alias 'cp=cp -i'
alias 'pip_upgrade_outdated=pip_upgrade_outdated -3'
alias 'rg=rg -S'
alias 'python=python3'
alias 'pip=pip3'
alias 'vdiff=vim -d'

# fuck plugin
eval $(thefuck --alias)

# set vim as default editor
export EDITOR=/usr/bin/vim

# hide the "user@hostname" info when you’re logged in as yourself on your local machine
DEFAULT_USER=`whoami`

# load zsh plugins
plugins=(git-auto-fetch gitignore magic-enter vagrant web-search terraform thefuck tmux)

# let macos control ls colours
unset LSCOLORS

# update oh-my-zsh automatically without prompt
DISABLE_UPDATE_PROMPT=true

# enable timestamps for history
HIST_STAMPS="yyyy-mm-dd"

# disable automatic title update
DISABLE_AUTO_TITLE="true"

# function to force command to be run using rosetta 2 with Apple Silicon Macs
rosetta() {
  arch -x86_64 $@
}

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

# function for renaming tmux's default session
function rename_tmux_session() {
    if [ "$1" = "0" ]
    then
        tmux rename-session -t 0 "$2"
    fi
}

# antigen plugin manager configs
source /usr/local/share/antigen/antigen.zsh
antigen use oh-my-zsh

antigen bundle brew

antigen theme romkatv/powerlevel10k

antigen bundle zdharma/fast-syntax-highlighting
antigen bundle zlsun/solarized-man

antigen apply

# enable google cloud sdk
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

# initialize oh-my-zsh
source $ZSH/oh-my-zsh.sh

# rename tmux session
tmux_sessions=$(tmux list-sessions)
rename_tmux_session ${tmux_sessions:0:1} iTerm

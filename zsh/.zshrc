# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# use brew python by default
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# configure theme
ZSH_THEME="powerlevel9k/powerlevel9k"

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
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status battery time)

# battery element settings
POWERLEVEL9K_BATTERY_ICON=''
POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND='yellow'
POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND='green'
POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND='white'
POWERLEVEL9K_BATTERY_LOW_FOREGROUND='red'
POWERLEVEL9K_BATTERY_LOW_THRESHOLD='20'

# custom aliases
alias 'password=openssl rand -base64 15'
alias 'cat=ccat'
alias 'headers=http --follow --all -h'

# fuck plugin
eval $(thefuck --alias)

# set vim as default editor
export EDITOR=/usr/bin/vim

# hide the "user@hostname" info when you’re logged in as yourself on your local machine
DEFAULT_USER=`whoami`

# load fast syntax highlighting plugin
source $ZSH/custom/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# load zsh plugins
plugins=(solarized-man)

# let macos control ls colours
unset LSCOLORS

# update oh-my-zsh automatically without prompt
DISABLE_UPDATE_PROMPT=true

# initialize oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# configure theme
ZSH_THEME="powerlevel9k/powerlevel9k"

# initialize oh-my-zsh
source $ZSH/oh-my-zsh.sh

# fuck plugin
eval $(thefuck --alias)

# set vim as default editor
export EDITOR=/usr/bin/vim

# hide the "user@hostname" info when you’re logged in as yourself on your local machine
DEFAULT_USER=`whoami`

# load syntax highlighting plugin
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# powerlevel settings
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(root_indicator time battery)

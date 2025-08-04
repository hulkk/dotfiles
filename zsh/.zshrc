alias vim="nvim"
alias ll='eza --all --long --group --group-directories-first --icons --time-style long-iso'

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Install missing modules and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
  source /opt/homebrew/opt/zimfw/share/zimfw.zsh init
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh

# this should be the last line of .zshrc
eval "$(oh-my-posh init zsh --config ~/src/github.com/dotfiles/oh-my-posh/config.toml)"

# enable homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# disable homebrew analytics
export HOMEBREW_NO_ANALYTICS=1

# hide the "user@hostname" info when you’re logged in as yourself on your local machine
DEFAULT_USER=`whoami`

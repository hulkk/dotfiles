# enable homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# disable homebrew analytics
export HOMEBREW_NO_ANALYTICS=1

# disable environment variable hints
export HOMEBREW_NO_ENV_HINTS=1

# do not show the list of newly added formulae/casks
export HOMEBREW_NO_UPDATE_REPORT_NEW=1

# hide the "user@hostname" info when you’re logged in as yourself on your local machine
DEFAULT_USER=`whoami`

# configure screenshots
mkdir -p ~/screenshots
defaults write com.apple.screencapture location ~/screenshots
defaults write com.apple.screencapture show-thumbnail -bool false

# configure dock icon size
defaults write com.apple.dock tilesize -integer 40 && killall Dock

# disable recent apps from dock
defaults write com.apple.dock show-recents -bool false && killall Dock

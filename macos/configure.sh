echo "Disable - Show recent applications in Dock"
defaults write "com.apple.dock" "show-recents" -bool false

echo "Disable - Animate opening application icon"
defaults write "com.apple.dock" "launchanim" -bool false

echo "Minimise windows using: Scale effect"
defaults write "com.apple.dock" "mineffect" 'scale'

echo "Disable - Facetime Calls From iPhone"
defaults write "com.apple.TelephonyUtilities" "relayCallingDisabled" -bool true

echo "Disable - Spotlight Show in Menu Bar"
defaults delete "com.apple.Spotlight" "NSStatusItem Visible Item-0"

echo "Press globe/fn to: Do Nothing"
defaults write "com.apple.HIToolbox" "AppleFnUsageType" '0'

echo "Disable - Use smart quotes and dashes"
defaults write "Apple Global Domain" "NSAutomaticDashSubstitutionEnabled" -bool false
defaults write "Apple Global Domain" "NSAutomaticQuoteSubstitutionEnabled" -bool false

echo "Disable - Correct spelling automatically"
defaults write "Apple Global Domain" "WebAutomaticSpellingCorrectionEnabled" -bool false
defaults write "Apple Global Domain" "NSAutomaticSpellingCorrectionEnabled" -bool false

echo "Disable - Now Playing Show in Menu Bar"
defaults write "com.apple.controlcenter" "NSStatusItem Visible NowPlaying" '0'

echo "Disable - Show warning before emptying the Bin"
defaults write "com.apple.finder" "WarnOnEmptyTrash" -bool false

echo "Show Path Bar"
defaults write com.apple.finder ShowPathbar -bool true

echo "Show Status Bar"
defaults write com.apple.finder ShowStatusBar -bool true

echo "Configure screenshots path"
mkdir -p ~/screenshots
defaults write com.apple.screencapture location '"~/screenshots"'

echo "Disable - Screencapture Show Floating Thumbnail"
defaults write com.apple.screencapture show-thumbnail -bool false

echo "Adjust Dock autohide reaction delay from 500ms to 0ms"
defaults write com.apple.dock "autohide-delay" -float "0.0"

echo "Adjust Dock autohide animation time from <default> to 200ms" 
defaults write com.apple.dock autohide-time-modifier -float "0.2"

echo "Enable dock autohide"
defaults write com.apple.dock autohide -bool true

echo "Disable Ask Siri"
defaults write com.apple.assistant.support "Assistant Enabled" -bool false

echo "Remove Siri icon from status menu"
defaults write com.apple.Siri StatusMenuVisible -bool false

echo "Disable the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo "Set dock icon size"
defaults write com.apple.dock tilesize -int 36

# Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable automatic period substitution as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# enable night shift
# TODO

# optimized battery charging
# TODO

# show battery percentage menu bar
# TODO

# disable force click
# TODO

# safari, show status bar
# TODO

echo "Done. Restart computer or kill Dock / Finder."

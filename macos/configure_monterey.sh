echo "Disable - Show recent applications in Dock"
defaults write "com.apple.dock" "show-recents" -bool false

echo "Disable - Animate opening application icon"
defaults write "com.apple.dock" "launchanim" -bool false

echo "Minimise windows using: Scale effect"
defaults write "com.apple.dock" "mineffect" 'scale'

echo "Set Accent colour to Red"
# todo

echo "Set resolution to More Space"
# todo

echo "Disable Automatic brightness adjustment"
# todo

echo "Show bluetooth in menu bar"
# todo

echo "Show Sound in menu bar"
# todo

echo "Show battery percentage in menu bar"
# todo

echo "Disable Universal Control"
# todo

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

echo "Show all filename extensions"
# todo

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

echo "Done. Restart computer or kill Dock / Finder."

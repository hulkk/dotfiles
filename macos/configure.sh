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

echo "Show all filename extensions"
defaults write "Apple Global Domain" "AppleShowAllExtensions" -bool true

echo "Disable - Show warningn before emptying the Bin"
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

echo "Adjust Dock autohide delay from 500ms to 100ms"
defaults write com.apple.dock "autohide-delay" -float "0.1"

echo "Done."

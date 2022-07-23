echo "Disable - Show recent applications in Dock"
defaults write "com.apple.dock" "show-recents" '0'

echo "Disable - Animate opening application icon"
defaults write "com.apple.dock" "launchanim" '0'

echo "Minimise windows using: Scale effect"
defaults write "com.apple.dock" "mineffect" 'scale'

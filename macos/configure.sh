echo "Disable - Show recent applications in Dock"
defaults write "com.apple.dock" "show-recents" '0'

echo "Disable - Animate opening application icon"
defaults write "com.apple.dock" "launchanim" '0'

echo "Minimise windows using: Scale effect"
defaults write "com.apple.dock" "mineffect" 'scale'

echo "disable facetime calls"
defaults write "com.apple.TelephonyUtilities" "relayCallingDisabled" '1'

echo "Disable - Spotlight Show in Menu Bar"
defaults delete "com.apple.Spotlight" "NSStatusItem Visible Item-0"

echo "Press globe/fn to: Do Nothing"
defaults write "com.apple.HIToolbox" "AppleFnUsageType" '0'

echo "Disable - Use smart quotes and dashes"
defaults write "Apple Global Domain" "NSAutomaticDashSubstitutionEnabled" '0'
defaults write "Apple Global Domain" "NSAutomaticQuoteSubstitutionEnabled" '0'

echo "Disable - Correct spelling automatically"
defaults write "Apple Global Domain" "WebAutomaticSpellingCorrectionEnabled" '0'
defaults write "Apple Global Domain" "NSAutomaticSpellingCorrectionEnabled" '0'

echo "Disable - Now Playing Show in Menu Bar"
defaults write "com.apple.controlcenter" "NSStatusItem Visible NowPlaying" '0'


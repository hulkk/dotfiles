echo "Disable macOS Analytics & Improvements"
echo "### manual task ###"
echo "System Preferences >> Security & Privacy >> Privacy >> Analytics & Improvements >> uncheck everything\n"

echo "Disable macOS location services for Applications"
echo "### manual task ###"
echo "System Preferences >> Security & Privacy >> Location Services >> uncheck every application\n"

echo "Disable macOS location services for System Services"
echo "### manual task ###"
echo "System Preferences >> Security & Privacy >> Location Services >> System Services, Details... >> uncheck all except Find My Mac and Time Zone & System Customisation\n"

echo "Disable Siri Suggestions"
echo "### manual task ###"
echo "System Preferences >> Spotlight >> Search Results >> uncheck Siri Suggestions\n"

echo "Disable Safari Suggestions"
echo "### manual task ###"
echo "Safari >> Preferences >> Search >> uncheck Include Safari Suggestions\n"

echo "Disable dictionary lookup: Trackpad -> Point & Click -> Look up & data detectors off"
# TODO

echo "disable crash reporter"
# defaults write com.apple.CrashReporter DialogType none

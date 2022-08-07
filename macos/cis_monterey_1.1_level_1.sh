### 1 Install Updates, Patches and Additional Security Software

# 1.1 Ensure All Apple-provided Software Is Current
# N/A, point in time check

echo "1.2 Ensure Auto Update Is Enabled"
sudo /usr/bin/defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

echo "1.3 Ensure Download New Updates When Available is Enabled"
sudo /usr/bin/defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticDownload -bool true

echo "1.4 Ensure Installation of App Update Is Enabled"
sudo /usr/bin/defaults write /Library/Preferences/com.apple.commerce AutoUpdate -bool true

echo "1.5 Ensure System Data Files and Security Updates Are Downloaded Automatically Is Enabled"
sudo /usr/bin/defaults write /Library/Preferences/com.apple.SoftwareUpdate ConfigDataInstall -bool true
sudo /usr/bin/defaults write /Library/Preferences/com.apple.SoftwareUpdate CriticalUpdateInstall -bool true

echo "1.6 Ensure Install of macOS Updates Is Enabled"
sudo /usr/bin/defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticallyInstallMacOSUpdates -bool true

# 1.7 Ensure Software Update Deferment Is Less Than or Equal to 30 Days
# N/A, Requires MDM profile

# 1.8 Ensure Computer Name Does Not Contain PII or Protected Organizational Information
# N/A, Level 2

### 2 System Preferences

echo "2.1.1 Ensure Show Bluetooth Status in Menu Bar Is Enabled"
defaults -currentHost write com.apple.controlcenter.plist Bluetooth -int 18

echo "2.1.2 Ensure Show Wi-Fi status in Menu Bar Is Enabled"
defaults -currentHost write com.apple.controlcenter.plist WiFi -int 18

echo "2.2.1 Ensure \"Set time and date automatically\" Is Enabled"
sudo /usr/sbin/systemsetup -setusingnetworktime on

# 2.2.2 Ensure time set is within appropriate limits
# N/A, point in time check

echo "2.3.1 Ensure an Inactivity Interval of 20 Minutes Or Less for the Screen Saver Is Enabled"
# Use display sleep instead of screen saver
sudo pmset -a displaysleep 20

# 2.3.2 Ensure Screen Saver Corners Are Secure
# N/A, Level 2

# echo "2.4.1 Ensure Remote Apple Events Is Disabled"
# sudo /usr/sbin/systemsetup -setremoteappleevents off
# Turning Remote AppleEvents on or off requires Full Disk Access privileges.

echo "2.4.2 Ensure Internet Sharing Is Disabled"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.nat NAT -dict Enabled -int 0

echo "2.4.3 Ensure Screen Sharing Is Disabled"
sudo launchctl disable system/com.apple.screensharing

echo "2.4.4 Ensure Printer Sharing Is Disabled"
sudo cupsctl --no-share-printers

echo "2.4.5 Ensure Remote Login Is Disabled"
sudo systemsetup -setremotelogin off

echo "2.4.6 Ensure DVD or CD Sharing Is Disabled"
sudo launchctl disable system/com.apple.ODSAgent

# 2.4.7 Ensure Bluetooth Sharing Is Disabled
# TODO

echo "2.4.8 Ensure File Sharing Is Disabled"
sudo launchctl disable system/com.apple.smbd

echo "2.4.9 Ensure Remote Management Is Disabled"
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -deactivate -stop

# 2.4.10 Ensure Content Caching Is Disabled
# N/A, Level 2

# 2.4.11 Ensure AirDrop Is Disabled
# N/A, acceptable risk

# 2.4.12 Ensure Media Sharing Is Disabled
# N/A, Level 2

echo "2.4.13 Ensure AirPlay Receiver Is Disabled"
defaults -currentHost write com.apple.controlcenter.plist AirplayRecieverEnabled -bool false
# yes, the parameter has a typo in it

# 2.5.1.1 Ensure FileVault Is Enabled
# N/A, Requires MDM profile

# 2.5.1.2 Ensure all user storage APFS volumes are encrypted
# N/A, point in time check

# 2.5.1.3 Ensure all user storage CoreStorage volumes are encrypted
# N/A, point in time check

echo "2.5.2.1 Ensure Firewall Is Enabled"
sudo /usr/bin/defaults write /Library/Preferences/com.apple.alf globalstate -int 1

echo "2.5.2.2 Ensure Firewall Stealth Mode Is Enabled"
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on

# 2.5.3 Ensure Location Services Is Enabled
# N/A, Level 2

# 2.5.4 Audit Location Services Access
# N/A, Level 2

# 2.5.5 Ensure Sending Diagnostic and Usage Data to Apple Is Disabled
# N/A, Level 2

echo "2.5.6 Ensure Limit Ad Tracking Is Enabled"
defaults -currentHost write /Users/$USER/Library/Preferences/com.apple.Adlib.plist allowApplePersonalizedAdvertising -bool false

echo "2.5.7 Ensure Gatekeeper is Enabled"
sudo /usr/sbin/spctl --master-enable

echo "2.5.8 Ensure a Custom Message for the Login Screen Is Enabled"
echo "### manual task ###"
echo "sudo /usr/bin/defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText \"My Login Screen message\"\n"

echo "2.5.9 Ensure an Administrator Password Is Required to Access System-Wide Preferences"
echo "### manual task ###"
echo "Due to change required in authorizationdb, preferred way to change via UI\n"

echo "2.5.10 Ensure a Password is Required to Wake the Computer From Sleep or Screen Saver Is Enabled"
echo "### manual task ###"
echo "No terminal method available, configure via UI\n"

# 2.6.1.1 Audit iCloud Keychain
# N/A, Level 2

# 2.6.1.2 Audit iCloud Drive
# N/A, Level 2

# 2.6.1.3 Ensure iCloud Drive Document and Desktop Sync is Disabled
# N/A, Level 2

# 2.6.2 Audit App Store Password Settings
# N/A, Level 2

# 2.7.1 Ensure Backup Automatically is Enabled
# N/A, Level 2

# 2.7.2 Ensure Time Machine Volumes Are Encrypted
# N/A, if Time Machine is not enabled

echo "2.8.1 Ensure Wake for Network Access Is Disabled"
sudo pmset -a womp 0

# 2.8.2 Ensure Power Nap Is Disabled for Intel Macs
# N/A, Apple Silicon

# 2.8.3 Ensure the OS is not Activate When Resuming from Sleep
# N/A, Level 2

# 2.9 Ensure Legacy EFI Is Valid and Updating
# N/A, Apple Silicon

# 2.10 Audit Siri Settings
# N/A, Audit task

# 2.11 Audit Universal Control Settings
# N/A, Audit task

# 2.12 Audit Touch ID and Wallet & Apple Pay Settings
# N/A, Audit task

# 2.13 Audit Notification & Focus Settings
# N/A, Audit task

# 2.14 Audit Passwords System Preference Setting
# N/A, Audit task

### 3 Logging and Auditing
# TODO

### 4 Network Configurations

# 4.1 Ensure Bonjour Advertising Services Is Disabled
# N/A, Level 2

echo "4.2 Ensure HTTP Server Is Disabled"
sudo launchctl disable system/org.apache.httpd

echo "4.3 Ensure NFS Server Is Disabled"
sudo launchctl disable system/com.apple.nfsd

### 5 System Access, Authentication and Authorization

# 5.1.1 Ensure Home Folders Are Secure

echo "5.1.2 Ensure System Integrity Protection Status (SIPS) Is Enabled"
sudo /usr/bin/csrutil status

# 5.1.3 Ensure Apple Mobile File Integrity (AMFI) Is Enabled
# TODO

echo "5.1.4 Ensure Sealed System Volume (SSV) Is Enabled"
sudo /usr/bin/csrutil authenticated-root status

# 5.1.5 Ensure Appropriate Permissions Are Enabled for System Wide Applications
# N/A, point in time check

# 5.1.6 Ensure No World Writable Files Exist in the System Folder
# N/A, point in time check

# 5.1.7 Ensure No World Writable Files Exist in the Library Folder
# N/A, Level 2

echo "5.2.1 Ensure Password Account Lockout Threshold Is Configured"
sudo /usr/bin/pwpolicy -n /Local/Default -setglobalpolicy "maxFailedLoginAttempts=5"

echo "5.2.2 Ensure Password Minimum Length Is Configured"
sudo /usr/bin/pwpolicy -n /Local/Default -setglobalpolicy "minChars=15"

# 5.2.3 Ensure Complex Password Must Contain Alphabetic Characters Is Configured
# N/A, Level 2

# 5.2.4 Ensure Complex Password Must Contain Numeric Character Is Configured
# N/A, Level 2

# 5.2.5 Ensure Complex Password Must Contain Special Character Is Configured
# N/A, Level 2

# 5.2.6 Ensure Complex Password Must Contain Uppercase and Lowercase Characters Is Configured
# N/A, Level 2

# 5.2.7 Ensure Password Age Is Configured
# N/A, acceptable risk

echo "5.2.8 Ensure Password History Is Configured"
sudo /usr/bin/pwpolicy -n /Local/Default -setglobalpolicy "usingHistory=15"

# 5.3 Ensure the Sudo Timeout Period Is Set to Zero
# N/A, acceptable risk

# 5.4 Ensure a Separate Timestamp Is Enabled for Each User/tty Combo
# N/A, acceptable risk

# echo "5.5 Ensure the \"root\" Account Is Disabled"
# sudo /usr/sbin/dsenableroot -d
# TODO

echo "5.6 Ensure Automatic Login Is Disabled"
sudo /usr/bin/defaults delete /Library/Preferences/com.apple.loginwindow autoLoginUser

echo "5.7 Ensure an administrator account cannot login to another user's active and locked session"
sudo security authorizationdb write system.login.screensaver use-login-window-ui

# 5.8 Ensure a Login Window Banner Exists
# N/A, Level 2

# 5.9 Ensure Users' Accounts Do Not Have a Password Hint
# N/A, acceptable risk

# 5.10 Ensure Fast User Switching Is Disabled
# N/A, Level 2

# 5.11 Ensure Secure Keyboard Entry Terminal.app Is Enabled
# N/A, acceptable risk

### 6 User Accounts and Environment

# 6.1.1 Ensure Login Window Displays as Name and Password Is Enabled
# N/A, acceptable risk

echo "6.1.2 Ensure Show Password Hints Is Disabled"
sudo /usr/bin/defaults write /Library/Preferences/com.apple.loginwindow RetriesUntilHint -int 0

echo "6.1.3 Ensure Guest Account Is Disabled"
sudo /usr/bin/defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool false

echo "6.1.4 Ensure Guest Access to Shared Folders Is Disabled"
sudo /usr/sbin/sysadminctl -afpGuestAccess off
sudo /usr/sbin/sysadminctl -smbGuestAccess off

# 6.1.5 Ensure the Guest Home Folder Does Not Exist
# N/A, point in time check

echo "6.2 Ensure Show All Filename Extensions Setting is Enabled"
defaults write "Apple Global Domain" "AppleShowAllExtensions" -bool true

# 6.3 Ensure Automatic Opening of Safe Files in Safari Is Disabled
# TODO

### 1 Install Updates, Patches and Additional Security Software

# 1.1 Ensure All Apple-provided Software Is Current
# N/A

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

# 1.7 Audit Computer Name
# N/A, Level 2

### 2 System Preferences

# 2.1.1 Ensure Bluetooth Is Disabled If No Devices Are Paired
# N/A

# 2.1.2 Ensure Show Bluetooth Status in Menu Bar Is Enabled

# 2.2.1 Ensure "Set time and date automatically" Is Enabled

# 2.2.2 Ensure time set is within appropriate limits

# 2.3.1 Ensure an Inactivity Interval of 20 Minutes Or Less for the Screen Saver Is Enabled

# 2.3.2 Ensure Screen Saver Corners Are Secure
# N/A, Level 2

# 2.3.3 Audit Lock Screen and Start Screen Saver Tools

# 2.4.1 Ensure Remote Apple Events Is Disabled

# 2.4.2 Ensure Internet Sharing Is Disabled

# 2.4.3 Ensure Screen Sharing Is Disabled

# 2.4.4 Ensure Printer Sharing Is Disabled

# 2.4.5 Ensure Remote Login Is Disabled

# 2.4.6 Ensure DVD or CD Sharing Is Disabled

# 2.4.7 Ensure Bluetooth Sharing Is Disabled

# 2.4.8 Ensure File Sharing Is Disabled

# 2.4.9 Ensure Remote Management Is Disabled

# 2.4.10 Ensure Content Caching Is Disabled
# N/A, Level 2

# 2.4.11 Ensure AirDrop Is Disabled
# N/A, acceptable risk

# 2.4.12 Ensure Media Sharing Is Disabled
# N/A, Level 2

# 2.4.13 Ensure AirPlay Receiver Is Disabled

# 2.5.1.1 Ensure FileVault Is Enabled

# 2.5.1.2 Ensure all user storage APFS volumes are encrypted

# 2.5.1.3 Ensure all user storage CoreStorage volumes are encrypted

# 2.5.2.1 Ensure Gatekeeper is Enabled

# 2.5.2.2 Ensure Firewall Is Enabled

# 2.5.2.3 Ensure Firewall Stealth Mode Is Enabled

# 2.5.3 Ensure Location Services Is Enabled
# N/A, Level 2

# 2.5.4 Audit Location Services Access
# N/A, Level 2

# 2.5.5 Ensure Sending Diagnostic and Usage Data to Apple Is Disabled
# N/A, Level 2

# 2.5.6 Ensure Limit Ad Tracking Is Enabled

# 2.5.7 Audit Camera Privacy and Confidentiality
# N/A, Level 2

# 2.6.1.1 Audit iCloud Configuration
# N/A, Level 2

# 2.6.1.2 Audit iCloud Keychain
# N/A, Level 2

# 2.6.1.3 Audit iCloud Drive
# N/A, Level 2

# 2.6.1.4 Ensure iCloud Drive Document and Desktop Sync is Disabled
# N/A, Level 2

# 2.6.2 Audit App Store Password Settings
# N/A, Level 2

# 2.7.1 Ensure Backup Up Automatically is Enabled
# N/A, Level 2

# 2.7.2 Ensure Time Machine Volumes Are Encrypted

# 2.8 Ensure Wake for Network Access Is Disabled

# 2.9 Ensure Power Nap Is Disabled

# 2.10 Ensure Secure Keyboard Entry terminal.app is Enabled

# 2.11 Ensure EFI Version Is Valid and Checked Regularly

# 2.12 Audit Automatic Actions for Optical Media

# 2.13 Audit Siri Settings

# 2.14 Audit Sidecar Settings

# 2.15 Audit Touch ID and Wallet & Apple Pay Settings

# 2.16 Audit Notification System Preference Settings

# 2.17 Audit Passwords System Preference Setting

### 3 Logging and Auditing

### 4 Network Configurations

# 4.1 Ensure Bonjour Advertising Services Is Disabled
# N/A, Level 2

# 4.2 Ensure Show Wi-Fi status in Menu Bar Is Enabled

# 4.3 Audit Network Specific Locations
# N/A, Level 2

# 4.4 Ensure HTTP Server Is Disabled

# 4.5 Ensure NFS Server Is Disabled

# 4.6 Audit Wi-Fi Settings
# N/A, Level 2

### 5 System Access, Authentication and Authorization

# 5.1.1 Ensure Home Folders Are Secure

# 5.1.2 Ensure System Integrity Protection Status (SIPS) Is Enabled

# 5.1.3 Ensure Apple Mobile File Integrity Is Enabled

# 5.1.4 Ensure Library Validation Is Enabled

# 5.1.5 Ensure Sealed System Volume (SSV) Is Enabled

# 5.1.6 Ensure Appropriate Permissions Are Enabled for System Wide Applications

# 5.1.7 Ensure No World Writable Files Exist in the System Folder

# 5.1.8 Ensure No World Writable Files Exist in the Library Folder
# N/A, Level 2

# 5.2.1 Ensure Password Account Lockout Threshold Is Configured

# 5.2.2 Ensure Password Minimum Length Is Configured

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

# 5.2.8 Ensure Password History Is Configured

# 5.3 Ensure the Sudo Timeout Period Is Set to Zero

# 5.4 Ensure a Separate Timestamp Is Enabled for Each User/tty Combo

# 5.5 Ensure login keychain is locked when the computer sleeps
# N/A, Level 2

# 5.6 Ensure the "root" Account Is Disabled

# 5.7 Ensure Automatic Login Is Disabled

# 5.8 Ensure a Password is Required to Wake the Computer From Sleep or Screen Saver Is Enabled

# 5.9 Ensure system is set to hibernate
# N/A, Level 2

# 5.10 Require an administrator password to access system-wide preferences

# 5.11 Ensure an administrator account cannot login to another user's active and locked session

# 5.12 Ensure a Custom Message for the Login Screen Is Enabled

# 5.13 Ensure a Login Window Banner Exists
# N/A, Level 2

# 5.14 Ensure Users' Accounts Do Not Have a Password Hint

# 5.15 Ensure Fast User Switching Is Disabled
# N/A, Level 2

### 6 User Accounts and Environment

# 6.1.1 Ensure Login Window Displays as Name and Password Is Enabled

# 6.1.2 Ensure Show Password Hints Is Disabled

# 6.1.3 Ensure Guest Account Is Disabled

# 6.1.4 Ensure Guest Access to Shared Folders Is Disabled

# 6.1.5 Ensure the Guest Home Folder Does Not Exist

# 6.2 Ensure Show All Filename Extensions Setting is Enabled

# 6.3 Ensure Automatic Opening of Safe Files in Safari Is Disabled


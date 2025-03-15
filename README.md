# dotfiles - macOS laptop setup

## terminal screenshots

![terminal screenshot](/screenshots/terminal.png?raw=true)

![vim screenshot](/screenshots/vim.png?raw=true)

## initial macOS setup
<details>
  <summary>macOS Sequoia</summary>

  * language, country, regional settings, accessibility, network, update later, skip migration assistant, sign in with apple id
  * computer account (uncheck "*Allow my Apple Account to reset this password*")
  * skip icloud keychain activation
  * make this your new mac (customize)
    * enable location services
    * uncheck analytics
    * skip screen time setup
    * skip Apple Intelligence
    * uncheck enable ask siri
    * uncheck "Allow my Apple Account to unlock my disk"
        * write down the FileVault Recovery Key
    * touch id
    * skip apple pay setup
    * dark mode
  * software update
    * reboot
  * uncheck "*Store files from Documents and Desktop in iCloud Drive*"
</details>
<details>
  <summary>macOS Monterey</summary>

  * language, country, regional settings, accessibility, network, skip migration assistant, apple id
  * computer account (uncheck "*Allow my Apple ID to reset this password*")
  * skip icloud keychain activation
  * find my
  * make this your new mac (customize)
    * enable location services
    * uncheck analytics
    * skip screen time setup
    * uncheck enable ask siri
    * uncheck filevault encryption (will be enabled later)
    * touch id
    * skip apple pay setup
    * dark mode
  * software update
    * reboot
  * uncheck "*Store files from Documents and Desktop in iCloud Drive*"
</details>

## install command line utilities and applications
### open terminal
```bash
mkdir -p ~/src/github.com && mkdir -p ~/.ssh
xcode-select --install
# anonymous clone
git clone https://github.com/hulkk/dotfiles.git ~/src/github.com/dotfiles
# authenticated clone
# git clone git@github.com:hulkk/dotfiles.git ~/src/github.com/dotfiles
```

### install oh-my-zsh, script source https://ohmyz.sh
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### install homebrew, script source https://brew.sh
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo >> ~/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

### install homebrew packages using brewfile
```bash
brew bundle --file=~/src/github.com/dotfiles/homebrew/Brewfile
```

### install mac appstore packages using brewfile

> **Note**
> Due to mas api limitations first download for Apple ID must be done manually

```bash
brew bundle --file=~/src/github.com/dotfiles/homebrew/mas
```

### uninstall unnecessary default applications
```bash
sudo rm -rf /Applications/GarageBand.app
sudo rm -rf /Library/Application\ Support/GarageBand
sudo rm -rf /Library/Audio/Apple\ Loops
sudo rm -rf /Library/Application\ Support/Logic
sudo rm -rf /Library/Audio/Impulse\ Responses/Apple
sudo rm -rf /Applications/iMovie.app
```

## configure git
```bash
 # configure git identity
 git config --global user.email "email@example.com"
# configure "auto push" for new branches
 git config --global --add --bool push.autoSetupRemote true
 # enable commit signing with ssh
 git config --global gpg.format ssh
 git config --global user.signingkey ~/.ssh/id_ed25519.pub
 git config --global --bool commit.gpgsign true
# enable diff-so-fancy
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"

```
 > **Note**
 > Signing key needs to be added to your account in e.g. GitHub

## configure macOS

### enable hardening configurations based on CIS Level 1 benchmark
```bash
./macos/cis_monterey_1.1_level_1.sh
```

### enable privacy related recommended settings
```bash
./macos/privacy.sh
```

### configure macOS settings based on personal preferences
```bash
./macos/configure.sh
```

## configure terminal

### Enable "Full Disk Access"
- add iTerm

### install the custom font from iTerm2-folder
```bash
cp ~/src/github.com/dotfiles/iterm2/fonts/SourceCodePro+Powerline+Awesome+Regular.ttf ~/Library/Fonts
```

### iTerm2 config 
```bash
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/src/github.com/dotfiles/iterm2"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# Override local entry to enable italics without breaking outgoing SSH connections
infocmp xterm-256color > /tmp/xterm-256color.terminfo
printf '\tsitm=\\E[3m, ritm=\\E[23m,\n' >> /tmp/xterm-256color.terminfo
tic /tmp/xterm-256color.terminfo
```

### .zshrc symbolic link
```bash
ln -sf ~/src/github.com/dotfiles/zsh/.zshrc ~/.zshrc
```

### .zprofile symbolic link
```bash
ln -sf ~/src/github.com/dotfiles/zsh/.zprofile ~/.zprofile
```

### .p10k.zsh symbolic link
```bash
ln -sf ~/src/github.com/dotfiles/zsh/.p10k.zsh ~/.p10k.zsh
```

### .vimrc symbolic link
```bash
ln -sf ~/src/github.com/dotfiles/vim/.vimrc ~/.vimrc
```

### .tmux.conf symbolic link
```bash
ln -sf ~/src/github.com/dotfiles/tmux/.tmux.conf ~/.tmux.conf
```

### yaml lint symbolic link
```bash
mkdir -p ~/.config/yamllint && ln -sf ~/src/github.com/dotfiles/yamllint/config ~/.config/yamllint/config
```

### install tmux plugin manager
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## test advanced formatting
### italics
```
echo `tput sitm`italics`tput ritm`
```
### true color
```bash
printf "\x1b[38;2;255;100;0mTRUECOLOR\x1b[0m\n"
```

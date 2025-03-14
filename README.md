# dotfiles - macOS laptop setup

## terminal screenshots

![terminal screenshot](/screenshots/terminal.png?raw=true)

![vim screenshot](/screenshots/vim.png?raw=true)

## new laptop
<details>
  <summary>macOS Monterey, initial setup</summary>

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
<details>
  <summary>macOS Sonoma, initial setup</summary>

  * language, country, regional settings, accessibility, network, skip migration assistant, sign in with apple id and accept iCloud terms
  * computer account (uncheck "*Allow my Apple ID to reset this password*")
  * skip icloud keychain activation
  * make this your new mac (customize)
    * enable location services
    * uncheck analytics
    * skip screen time setup
    * uncheck enable ask siri
    * uncheck filevault icloud unlock
    * add filevault recovery key to e.g. 1Password
    * setup touch id
    * skip apple pay setup
    * dark mode
  * software update
    * reboot

</details>

## install homebrew and applications
### open terminal
```bash
mkdir -p ~/src && mkdir -p ~/src/github.com && mkdir -p ~/.ssh
xcode-select --install
git clone https://github.com/hulkk/dotfiles.git ~/src/github.com/dotfiles
cd ~/src/github.com/dotfiles
```

### install brew, script source https://brew.sh
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### install brew packages using brewfile
```bash
brew bundle --file=~/src/github.com/dotfiles/homebrew/Brewfile
```

### install oh-my-zsh, script source https://ohmyz.sh
```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### download powerlevel10k theme
```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

### download zsh-syntax-highlighting plugin
```bash
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
```

> **Note**
> Reboot computer

## configure laptop

### enable hardening configurations based on CIS Level 1 benchmark
=======
### install oh-my-zsh, script source https://ohmyz.sh
>>>>>>> 0bd34e5 (fix)
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### enable privacy related recommended settings
```bash
./macos/privacy.sh
```

### configure macOS settings based on personal preferences
```bash
./macos/configure.sh
```

### install mac appstore packages using brewfile

> **Note**
> Due to mas api limitations apps can't be purchased using this method

```bash
brew bundle --file=~/src/github.com/dotfiles/homebrew/mas
```

<<<<<<< HEAD
=======
### uninstall unnecessary mac apps
```bash
sudo rm -rf /Applications/GarageBand.app
sudo rm -rf /Applications/iMovie.app
```

## install python packages using requirements.txt
```bash
rm /opt/homebrew/opt/python/Frameworks/Python.framework/Versions/Current/lib/python3.12/EXTERNALLY-MANAGED
pip3 install -r dotfiles/python/requirements.txt
```

### configure git
```bash
# configure git identity
git config --global user.email "email@example.com"
git config --global --add --bool push.autoSetupRemote true
# enable commit signingh with ssh
git config --global gpg.format ssh
git config --global user.signingkey ~/.ssh/mykey.pub
git config --global commit.gpgsign true
```
> **Note**
> Signing key needs to be added to your account in e.g. GitHub

### .zprofile symbolic link
```bash
ln -sf ~/src/github.com/dotfiles/zsh/.zprofile ~/.zprofile
```

### .vimrc symbolic link
```bash
ln -sf ~/src/github.com/dotfiles/vim/.vimrc ~/.vimrc
# errors in first launch are expected until plugins are installed
```

> **Note**
> Reboot computer

>>>>>>> 0bd34e5 (fix)
## configure terminal

### open iTerm2
```bash
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/src/github.com/dotfiles/iterm2"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# Override local entry to enable italics without breaking outgoing SSH connections
infocmp xterm-256color > /tmp/xterm-256color.terminfo
printf '\tsitm=\\E[3m, ritm=\\E[23m,\n' >> /tmp/xterm-256color.terminfo
tic /tmp/xterm-256color.terminfo
```

### zsh symbolic links
```bash
ln -sf ~/src/github.com/dotfiles/zsh/.zshrc ~/.zshrc
<<<<<<< HEAD
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
=======
ln -sf ~/src/github.com/dotfiles/zsh/.p10k.zsh ~/.p10k.zsh
ln -sf ~/src/github.com/dotfiles/zsh/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh
>>>>>>> 0bd34e5 (fix)
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

## configure laptop

### enable hardening configurations based on CIS Level 1 benchmark
```bash
<<<<<<< HEAD
# configure git identity
git config --global user.email "you@example.com"
git config --global user.name "Your Name"

# enable diff-so-fancy
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
=======
./macos/cis_monterey_1.1_level_1.sh
```

### enable privacy related recommended settings
```bash
./macos/privacy.sh
```

### configure macOS settings based on personal preferences
```bash
./macos/configure.sh
>>>>>>> 0bd34e5 (fix)
```

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

## open terminal
### clone this repo
```bash
mkdir -p ~/src && mkdir -p ~/src/github.com
xcode-select --install
git clone https://github.com/hulkk/dotfiles.git ~/src/github.com/dotfiles
cd ~/src/github.com/dotfiles
```

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

### install brew, script source https://brew.sh
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
### install brew packages using brewfile
```bash
brew bundle --file=~/<your-path>/dotfiles/homebrew/Brewfile
```

### configure terminal
#### install the custom font from iTerm2-folder
```bash
cp ~/your-path/dotfiles/iterm2/fonts/SourceCodePro+Powerline+Awesome+Regular.ttf ~/Library/Fonts
```

#### iTerm2 config 
```bash
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/your-path/dotfiles/iterm2"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# Override local entry to enable italics without breaking outgoing SSH connections
infocmp xterm-256color > /tmp/xterm-256color.terminfo
printf '\tsitm=\\E[3m, ritm=\\E[23m,\n' >> /tmp/xterm-256color.terminfo
tic /tmp/xterm-256color.terminfo
```

#### install oh-my-zsh, script source https://ohmyz.sh
```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

#### .zshrc symbolic link
```bash
ln -sf ~/your-path/dotfiles/zsh/.zshrc ~/.zshrc
```

#### .vimrc symbolic link
```bash
ln -sf ~/your-path/dotfiles/vim/.vimrc ~/.vimrc
```

#### .tmux.conf symbolic link
```bash
ln -sf ~/your-path/dotfiles/tmux/.tmux.conf ~/.tmux.conf
```

#### yaml lint symbolic link
```bash
mkdir ~/.config/yamllint && ln -sf ~/your-path/dotfiles/yamllint/config ~/.config/yamllint/config
```

#### Test terminal features
##### italics
```
echo `tput sitm`italics`tput ritm`
```
##### true color
```bash
printf "\x1b[38;2;255;100;0mTRUECOLOR\x1b[0m\n"
```

#### disable the last login info
```bash
touch ~/.hushlogin
```

## install other packages
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
gem install tmuxinator
pip install ansible ansible-lint pywinrm pip-upgrade-outdated
```

## git config
```bash
# enable diff-so-fancy
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
```

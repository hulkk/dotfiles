# dotfiles - macOS terminal setup

## screenshots

![terminal screenshot](/screenshots/terminal.png?raw=true)

![vim screenshot](/screenshots/vim.png?raw=true)

## install brew, script source https://brew.sh
```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

## install brew packages
```bash
brew install nmap openssl testssl thefuck tldr vim wget ccat tree watch tig httpie reattach-to-user-namespace antigen terraform mas zsh tmux
brew cask install virtualbox vagrant the-unarchiver iterm2
```

## clone this repo
```bash
git clone https://github.com/hulkk/dotfiles.git ~/your-path/dotfiles
```

## install the custom font from iTerm2-folder

## disable the last login info
```bash
touch ~/.hushlogin
```

## iTerm2 config 
```bash
# debug these
# defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/your-path/dotfiles/iterm2/com.googlecode.iterm2.plist"
# defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# Override local entry to enable italics without breaking outgoing SSH connections
infocmp xterm-256color > /tmp/xterm-256color.terminfo
printf '\tsitm=\\E[3m, ritm=\\E[23m,\n' >> /tmp/xterm-256color.terminfo
tic /tmp/xterm-256color.terminfo
```

## install oh-my-zsh, script source https://ohmyz.sh
```bash
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

## install other packages
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
gem install tmuxinator
pip install ansible pywinrm
```

## .zshrc symbolic link
```bash
ln -sf ~/your-path/dotfiles/zsh/.zshrc ~/.zshrc
```

## .vimrc symbolic link
```bash
ln -sf ~/your-path/dotfiles/vim/.vimrc ~/.vimrc
```

## .tmux.conf symbolic link
```bash
ln -sf ~/your-path/dotfiles/tmux/.tmux.conf ~/.tmux.conf
```

## Test commands
### italics
```
echo `tput sitm`italics`tput ritm`
```
### true color
```bash
printf "\x1b[38;2;255;100;0mTRUECOLOR\x1b[0m\n"
```

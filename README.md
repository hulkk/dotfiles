# dotfiles

![terminal screenshot](/screenshots/terminal.png?raw=true)

![vim screenshot](/screenshots/vim.png?raw=true)

## Brew
```bash
brew install nmap openssl testssl thefuck tldr vim wget ccat tree watch tig httpie reattach-to-user-namespace antigen terraform mas
brew cask install virtualbox
brew cask install vagrant
brew cask install the-unarchiver
brew cask install iterm2

```
## Mac App Store
```bash
# Pocket
mas install 568494494
# Slack
mas install 803453959
# Bear
mas install 1091189122
# Telegram
mas install 747648890
# Amphetamine
mas install 937984704
```

## Zsh

```bash
ln -sf ~/your-path/dotfiles/zsh/.zshrc ~/.zshrc
```

## Tmux
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

gem install tmuxinator

ln -sf ~/your-path/dotfiles/tmux/.tmux.conf ~/.tmux.conf
```

## Vim

```bash
ln -sf ~/your-path/dotfiles/vim/.vimrc ~/.vimrc

wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -O ~/.vim/autoload/plug.vim
```

## iTerm2

```bash
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/your-path/dotfiles/iterm2/com.googlecode.iterm2.plist"

defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# Override local entry to enable italics without breaking outgoing SSH connections
infocmp xterm-256color > /tmp/xterm-256color.terminfo
printf '\tsitm=\\E[3m, ritm=\\E[23m,\n' >> /tmp/xterm-256color.terminfo
tic /tmp/xterm-256color.terminfo
```
Test italics
```
echo `tput sitm`italics`tput ritm`
```

## Misc

Test true color, should print TRUECOLOR in red
```bash
printf "\x1b[38;2;255;100;0mTRUECOLOR\x1b[0m\n"
```

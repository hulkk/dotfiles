# dotfiles

![terminal screenshot](/screenshots/terminal.png?raw=true)

![vim screenshot](/screenshots/vim.png?raw=true)

## Brew
```bash
brew install nmap openssl testssl thefuck tldr vim wget ccat tree watch tig httpie reattach-to-user-namespace antigen terraform mas
brew cask install virtualbox
brew cask install vagrant
brew cask install the-unarchiver

```
## Mac App Store
```bash

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
```

## Misc

Test true color, should print TRUECOLOR in red
```bash
printf "\x1b[38;2;255;100;0mTRUECOLOR\x1b[0m\n"
```

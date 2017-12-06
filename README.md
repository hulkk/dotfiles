# dotfiles

## Zsh

```bash
ln -sf ~/your-path/dotfiles/zsh/.zshrc ~/.zshrc

git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
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

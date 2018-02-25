# dotfiles

![terminal screenshot](/screenshots/terminal.png?raw=true)

![vim screenshot](/screenshots/vim.png?raw=true)

## Brew
```bash
brew install nmap openssl testssl thefuck tldr vim wget zsh-syntax-highlighting ccat tree
```

## Zsh

```bash
ln -sf ~/your-path/dotfiles/zsh/.zshrc ~/.zshrc

git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

git clone https://github.com/zlsun/solarized-man.git ~/.oh-my-zsh/custom/plugins/solarized-man

git clone https://github.com/zdharma/fast-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/fast-syntax-highlighting
```

## Vim

```bash
ln -sf ~/your-path/dotfiles/vim/.vimrc ~/.vimrc

wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -O ~/.vim/autoload/plug.vim

git clone https://github.com/lifepillar/vim-solarized8.git ~/.vim/pack/themes/opt/solarized8
```

## iTerm2

```bash
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/your-path/dotfiles/iterm2/com.googlecode.iterm2.plist"

defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
```

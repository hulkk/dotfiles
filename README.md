# dotfiles - macOS laptop setup

## terminal screenshots

![terminal screenshot](/screenshots/terminal.png?raw=true)

![vim screenshot](/screenshots/vim.png?raw=true)

## initial macOS setup
<details>
  <summary>macOS Sequoia</summary>

  * language, country, skip migration assistant, regional settings, skip accessibility settings, network
  * create a mac account - uncheck "Allow computer account password to be reset with your Apple Account", sign in with apple account
  * enable location services
  * uncheck analytics
  * skip screen time setup
  * apple intelligence???
  * skip siri setup
  * touch id
  * dark mode
  * update mac automatically
  * check software update & reboot
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

*uninstall unnecessary default applications*
```bash
sudo rm -rf /Applications/GarageBand.app
sudo rm -rf /Library/Application\ Support/GarageBand
sudo rm -rf /Library/Audio/Apple\ Loops
sudo rm -rf /Library/Application\ Support/Logic
sudo rm -rf /Library/Audio/Impulse\ Responses/Apple
sudo rm -rf /Applications/iMovie.app
```
</details>

## install command line utilities and applications
### open terminal
```bash
mkdir -p ~/src/github.com && mkdir -p ~/.ssh
xcode-select --install
# anonymous clone
git clone https://github.com/hulkk/dotfiles.git ~/src/github.com/dotfiles
# authenticated clone, after ssh key configured
# git clone git@github.com:hulkk/dotfiles.git ~/src/github.com/dotfiles
```

### install homebrew, script source https://brew.sh
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
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

### install zimfw, script source https://zimfw.sh
```bash
curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
```

## configure terminal

### Enable "Full Disk Access"
- add ghostty

### Disable last login info
```bash
touch ~/.hushlogin
```

### ghostty config
```bash
ln -sf ~/src/github.com/dotfiles/ghostty/config ~/Library/Application\ Support/com.mitchellh.ghostty/config
```

### zsh symbolic links
```bash
ln -sf ~/src/github.com/dotfiles/zsh/.zprofile ~/.zprofile
ln -sf ~/src/github.com/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/src/github.com/dotfiles/zsh/.zimrc ~/.zimrc
```

### nvim symbolic links
```bash
mkdir -p ~/.config/nvim/lua/plugins && mkdir ~/.config/nvim/lua/core
ln -sf ~/src/github.com/dotfiles/nvim/init.lua ~/.config/nvim/init.lua
ln -sf ~/src/github.com/dotfiles/nvim/lua/core/options.lua ~/.config/nvim/lua/core/options.lua
ln -sf ~/src/github.com/dotfiles/nvim/lua/plugins/lualine.lua ~/.config/nvim/lua/plugins/lualine.lua
ln -sf ~/src/github.com/dotfiles/nvim/lua/plugins/gruvbox.lua ~/.config/nvim/lua/plugins/gruvbox.lua
#ln -sf ~/src/github.com/dotfiles/nvim/lua/plugins/gitsigns.lua ~/.config/nvim/lua/plugins/gitsigns.lua
```

### tmux config
```bash
ln -sf ~/src/github.com/dotfiles/tmux/.tmux.conf ~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### yaml lint symbolic link
```bash
mkdir -p ~/.config/yamllint && ln -sf ~/src/github.com/dotfiles/yamllint/config ~/.config/yamllint/config
```

### configure git
```bash
# configure git identity
git config --global user.email "email@example.com"
# configure "auto push" for new branches
git config --global --add --bool push.autoSetupRemote true
# enable commit signing with ssh key
git config --global gpg.format ssh
git config --global user.signingkey ~/.ssh/id_ed25519.pub
git config --global --bool commit.gpgsign true
# always rebase your local branch if the upstream branch has additional commits
git config --global --bool pull.rebase true
# use delta to display output of git diff
git config --global core.pager "delta --side-by-side --hunk-header-style=omit"
```
> **Note**
> Signing key needs to be added to your account in e.g. GitHub


### test advanced formatting
#### italics
```bash
echo `tput sitm`italics`tput ritm`
```
#### true color
```bash
printf "\x1b[38;2;255;100;0mTRUECOLOR\x1b[0m\n"
```

## configure macOS

### Sequoia
[Configuration notes](macos/sequoia.md)

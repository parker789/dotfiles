f test ! $(which brew); then
    echo "Installing homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Installing homebrew packages..."

# Install Brew formulae
formulaes=(
  'aws-sso-util'
  'awscli'
  'bash'
  'bat'
  'coreutils'
  'fastlane'
  'fd'
  'fontconfig'
  'fx'
  'fzf'
  'gcc'
  'gh'
  'htop'
  'jakehilborn/jakehilborn/displayplacer'
  'jq'
  'koekeishiya/formulae/skhd'
  'koekeishiya/formulae/yabai'
  'lazygit'
  'lftp'
  'luajit-openresty'
  'luarocks'
  'neovim'
  'nnn'
  'nvm'
  'pipx'
  'postgresql@12'
  'pv'
  'railwaycat/emacsmacport/emacs-mac'
  'ripgrep'
  'shellcheck'
  'sk'
  'starship'
  'stow'
  'tig'
  'tmux'
  'wget'
  'zellij'
)
lnprint "Checking for necessary brew formulae to install..."
for formulae in "${formulaes[@]}"; do
  brew list $formulae &>/dev/null || brew install $formulae
done
echo "Done"

# Install Brew casks
casks=(
  'charles'
  'datagrip'
  'firefox-developer-edition'
  'font-hack-nerd-font'
  'iterm2'
  'jiggler'
  'obsidian'
  'postman'
  'raycast'
  'rectangle'
  'slack'
  'spacelauncher'
  'spectacle'
  'steelseries-exactmouse-tool'
  'stretchly'
  'tunnelblick'
  'virtualbox'
  'visual-studio-code'
  'vscodium'
  'wezterm'
)
lnprint "Checking for necessary brew casks to install..."
for cask in "${casks[@]}"; do
  brew list --cask $cask &>/dev/null || brew install $cask
done
echo "Done"

exit 0

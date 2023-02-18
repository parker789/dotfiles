if test ! $(which brew); then
    echo "Installing homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Installing dependencies..."

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm

eval "$(/opt/homebrew/bin/brew shellenv)"
brew tap homebrew/cask-fonts

echo "Installing homebrew packages..."

# Install Brew formulae
formulaes=(
	'aspell'
	'bat'
	'clamav'
	'cmake'
	'coreutils'
	'curl'
	'fd'
	'git'
	'helix'
	'jakehilborn/jakehilborn/displayplacer'
	'jq'
	'koekeishiya/formulae/skhd'
	'koekeishiya/formulae/yabai'
	'lazygit'
	'ncdu'
	'neofetch'
	'neovim'
	'nmap'
	'nnn'
	'ripgrep'
	'shellcheck'
	'showkey'
	'sk'
	'starship'
	'stow'
	'tig'
	'tmate'
	'tmux'
	'tree'
	'wget'
	'zoxide'
	'zsh'
)

echo "Checking for necessary brew formulae to install..."
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
  'slack'
  'spacelauncher'
  'steelseries-exactmouse-tool'
  'tunnelblick'
  'visual-studio-code'
  'wezterm'
  'discord'
  'todoist'
  'little-snitch'
)

echo "Checking for necessary brew casks to install..."
for cask in "${casks[@]}"; do
  brew list --cask $cask &>/dev/null || brew install $cask
done
echo "Done"

exit 0

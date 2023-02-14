export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-nvm)

source $ZSH/oh-my-zsh.sh
export XDG_CONFIG_HOME="$HOME/.config"
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

###################
### User Config ###
###################
export PATH="/Users/parker/.local/bin:~/.emacs.d/bin:$PATH"
#export MANPAGER="nvim -c 'set ft=man' -"
export CC="$(which gcc)"
export DISABLE_AUTO_TITLE=true

alias weather="curl 'wttr.in/Charlotte?u'"
alias ez="nvim ~/.zshrc"
alias n="/opt/homebrew/bin/nvim"
alias tss="tmux-sessionizer"

alias sm='displayplacer "id:6444A171-7C57-4159-B927-815EDE8CBE2A res:2560x1440 hz:144 color_depth:8 scaling:off origin:(0,0) degree:0" "id:A78D980B-8055-943E-CBB8-ABBDA7CF2E34 res:2560x1440 hz:144 color_depth:8 scaling:off origin:(-2560,0) degree:0" "id:3BA3D31B-B7FD-773C-7001-4C48D7FAED86 res:2560x1440 hz:144 color_depth:8 scaling:off origin:(2560,0) degree:0"'

alias lg='lazygit'

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"


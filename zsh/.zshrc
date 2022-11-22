# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/parker.vaughn/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git nvm)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/Users/parker.vaughn/.emacs.d/bin:/usr/local/opt/postgresql@12/bin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

# Functions
function fixMonitors {
	displayplacer "id:6444A171-7C57-4159-B927-815EDE8CBE2A res:2560x1440 hz:144 color_depth:8 scaling:off origin:(0,0) degree:0" "id:A78D980B-8055-943E-CBB8-ABBDA7CF2E34 res:2560x1440 hz:144 color_depth:8 scaling:off origin:(-2560,0) degree:0" "id:3BA3D31B-B7FD-773C-7001-4C48D7FAED86 res:2560x1440 hz:144 color_depth:8 scaling:off origin:(2560,0) degree:0"
	exit 1;
}

# Backend Aliases
alias be="cd ~/Dev/prodigy/backend"
alias bes="AWS_REGION=us-west-1 BLUEBIRD_LONG_STACK_TRACES=1 NODE_ENV=local \
	npx concurrently \
	\"webpack --mode development --watch --progress\" \
	\"npx supervisor --inspect --extensions 'js,ts' --watch dist ./dist/main.js 2>&1\""

alias on="cd ~/Dev/prodigy/online"
alias cm="cd ~/Dev/prodigy/chairman"
alias py="cd ~/Dev/prodigy/papyrus"
alias web="cd ~/Dev/prodigy/web"
alias legos="cd ~/Dev/prodigy/legos"


alias lg='lazygit'
alias n='nvim'
alias tss='tmux-sessionizer'

# overwrite BAD BAD
alias gstc=''
set -o vi

# Created by `pipx` on 2022-05-26 20:03:30
export PATH="$PATH:/Users/parker.vaughn/.local/bin"
export PATH="/usr/local/opt/python@3.10/bin:$PATH"

bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search

alias admin="sudo dseditgroup -o edit -a parker.vaughn -t user admin"
eval "$(starship init zsh)"

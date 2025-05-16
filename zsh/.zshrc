# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="awesomepanda"

# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode auto      # update automatically without asking

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

plugins=(
	git
	colored-man-pages
)

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

alias nivm="nvim"
alias nvi="nvim"
alias nv="nvim"

alias n="nvim ."

alias lls="ll --sort=size"

alias no="yes n"

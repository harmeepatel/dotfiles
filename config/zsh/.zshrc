normal='\033[0m'
bold='\033[1m'
dim='\033[2m'
italic='\033[3m'
underline='\033[4m'
blinking='\033[5m'
reverse='\033[7m'
invisible='\033[8m'

green='\033[1;32m'
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL10K_MODE="nerdfont-complete"

export UPDATE_ZSH_DAYS=30
source $ZSH/oh-my-zsh.sh

# homebrew
export PATH="/usr/local/sbin:$PATH"

# Setting PATH for Python 3.9
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:${PATH}"
export PATH

# PS1="
# $bg[cyan] %~ %B%B→ %b%b "
# export PS1

export PATH="$PATH:/Users/harmy_patel/Developer/flutter/bin"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ls="exa -ll --icons"
alias cat="bat"
alias rg="rg --hidden --ignore .git -g"
alias fd="fd -u"
alias echo="echo -e"

alias zrc="nvim ~/.zshrc"
alias zprofile="nvim ~/.zprofile"
alias szrc="source ~/.zshrc"
alias szprofile="source ~/.zprofile"

alias python="python3"
alias pip="pip3"

alias v="nvim"
alias btm='btm --color gruvbox'

alias htdocs="cd /Users/harmy_patel/.bitnami/stackman/machines/xampp/volumes/root/htdocs"
alias dp="cd ~/Developer/projects"
alias dpr="cd ~/Developer/projects/rust"
alias dpw="cd ~/Developer/projects/websites"
alias conf="cd ~/Developer/mmc/config"


source ~/.config/zsh/zshrc_functions.zsh
source ~/.config/zsh/vim_mode.zsh

plugins=(
    zsh-vim-mode
)


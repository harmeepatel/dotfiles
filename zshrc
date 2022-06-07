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

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ls="exa -ll --icons"
alias cat="bat"
alias rg="rg --hidden --ignore .git -g"
alias fd="fd -H"
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

cocYarnInstall() {
    cwd=$(pwd)
    echo "exiting $green$bold$italic$cwd\n$normal" &&
    cd .local/share/nvim/site/pack/packer/start/coc.nvim &&
    yarn install &&
    cd $cwdForCoc &&
    echo "\nentering $green$bold$italic$cwd$normal" &&
}


acp(){
	if [[ "$1" == "" ]]
	then
		echo "enter a message..."
	else
		git add .
		git commit -m "$1"
		git push
	fi
}

cn(){
	if [[ $1 == "cf" ]]
	then
		if [ -f ~/Developer/CP/codeforces/$2.cpp ];then
			subl ~/Develope/CP/codeforces/$2.cpp
		else
			touch ~/Developer/CP/codeforces/$2.cpp
			cp ~/Developer/CP/template.cpp ~/Developer/CP/codeforces/$2.cpp
			cd codeforces
			nvim $2.cpp
		fi
	fi

	if [[ $1 == "lc" ]]
	then
		if [ -f ~/Developer/CP/leetcode/$2.cpp ];then
			subl ~/Developer/CP/leetcode/$2.cpp
		else
			touch ~/Developer/CP/leetcode/$2.cpp
			cp ~/Developer/CP/template.cpp ~/Developer/CP/leetcode/$2.cpp
			cd leetcode
			nvim $2.cpp
		fi
	fi
	if [[ $1 == "at" ]]
	then
		if [ -f ~/Developer/CP/atcoder/$2.cpp ];then
			subl ~/Developer/CP/atcoder/$2.cpp
		else
			touch ~/Developer/CP/atcoder/$2.cpp
			cp ~/Developer/CP/template.cpp ~/Developer/CP/atcoder/$2.cpp
			cd atcoder
			nvim $2.cpp
		fi
	fi
}

g++(){
	g++-10 -std=c++17 -O2 -Wall $1 && ./a.out && rm -rf a.out
}

mkcd(){
	mkdir $1 && cd $1
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

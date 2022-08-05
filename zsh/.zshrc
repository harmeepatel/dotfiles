#                            ╭──────────────────────╮
#                            │ run tmux on start-up │
#                            ╰──────────────────────╯
if [ ! "$TMUX" ]; then
        tmux a || tmux &> /dev/null
fi

normal='\033[0m'
bold='\033[1m'
dim='\033[2m'
italic='\033[3m'
underline='\033[4m'
blinking='\033[5m'
reverse='\033[7m'
invisible='\033[8m'

green='\033[1;32m'

#                                   ╭─────────╮
#                                   │ plugins │
#                                   ╰─────────╯
source ~/.config/zsh/zshrc_functions.zsh

#                                     ╭─────╮
#                                     │ vim │
#                                     ╰─────╯


source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.zsh
ZVM_VI_INSERT_ESCAPE_BINDKEY=kj
ZVM_VI_VISUAL_ESCAPE_BINDKEY=kj

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# export ZSH="$HOME/.oh-my-zsh"

export UPDATE_ZSH_DAYS=30
# source $ZSH/oh-my-zsh.sh

# homebrew
export PATH="/usr/local/sbin:$PATH"

# Setting PATH for Python 3.9
# The original version is saved in .zprofile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:$PATH"

export PATH="$HOME/Developer/mmc:$PATH"
# PS1="
# $bg[cyan] %~ %B%B→ %b%b "
# export PS1

#                                    ╭───────╮
#                                    │ alias │
#                                    ╰───────╯
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ls="exa -l -a --icons"
alias cat="bat"
alias rg="rg --hidden --ignore .git -g"
alias fd="fd -u"
alias echo="echo -e"

alias htdocs="cd /Users/harmy_patel/.bitnami/stackman/machines/xampp/volumes/root/htdocs"
alias dp="cd ~/Developer/projects"
alias dpr="cd ~/Developer/projects/rust"
alias dpw="cd ~/Developer/projects/websites"
alias mmc="cd ~/Developer/mmc"

alias zrc="nvim ~/.zshrc"
alias zprofile="nvim ~/.zprofile"
alias szrc="source ~/.zshrc"
alias szprofile="source ~/.zprofile"

alias python="python3"
alias pip="pip3"

alias v="nvim"
alias btm='btm --color gruvbox'
alias c='codium'

#                               ╭─────────────────╮
#                               │ bun completions │
#                               ╰─────────────────╯
[ -s "/Users/harmeepatel/.bun/_bun" ] && source "/Users/harmeepatel/.bun/_bun"

#                                     ╭─────╮
#                                     │ Bun │
#                                     ╰─────╯
export BUN_INSTALL="/Users/harmeepatel/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

#                                     ╭─────╮
#                                     │ fnm │
#                                     ╰─────╯
eval "$(fnm env --use-on-cd)"

#                                  ╭──────────╮
#                                  │ starship │
#                                  ╰──────────╯
eval "$(starship init zsh)"

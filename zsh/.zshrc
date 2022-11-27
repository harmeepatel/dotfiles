
normal='\033[0m'
bold='\033[1m'
dim='\033[2m'
italic='\033[3m'
underline='\033[4m'
blinking='\033[5m'
reverse='\033[7m'
invisible='\033[8m'

green='\033[1;32m'


PWD=`basename \`pwd\``

#                                   ╭─────────╮
#                                   │ imports │
#                                   ╰─────────╯
source ~/.config/zsh/zshrc_functions.zsh
source /usr/local/Cellar/fzf/0.35.1/shell/key-bindings.zsh
source /usr/local/Cellar/fzf/0.35.1/shell/completion.zsh

#                                     ╭─────╮
#                                     │ vim │
#                                     ╰─────╯


source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.zsh
ZVM_VI_INSERT_ESCAPE_BINDKEY=kj
ZVM_VI_VISUAL_ESCAPE_BINDKEY=kj

#                                     ╭─────╮
#                                     │ gen │
#                                     ╰─────╯
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# export ZSH="$HOME/.oh-my-zsh"

export UPDATE_ZSH_DAYS=30
# source $ZSH/oh-my-zsh.sh

# homebrew
export PATH="/usr/local/sbin:$PATH"

export PATH="$HOME/Developer/mmc:$PATH"
# PS1="
# $bg[cyan] %~ %B%B→ %b%b "
# export PS1

#                            ╭──────────────────────╮
#                            │ run tmux on start-up │
#                            ╰──────────────────────╯
ala=`ps -ax | grep Alacritty | head -n 1 | awk '{print $4}'`
if [[ -n $KITTY_PID || $ala == "/Applications/Alacritty.app/Contents/MacOS/alacritty" ]] then
    if [[ -z "$TMUX" ]]; then
            tmux a || tmux new-session -s $PWD
    fi
fi

#                                    ╭───────╮
#                                    │ alias │
#                                    ╰───────╯
source ~/.config/zsh/alias.zsh

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

#                                    ╭───────╮
#                                    │ juice │
#                                    ╰───────╯
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

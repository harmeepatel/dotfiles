# profiling
# zmodload zsh/zprof

# normal='\033[0m'
# bold='\033[1m'
# dim='\033[2m'
# italic='\033[3m'
# underline='\033[4m'
# blinking='\033[5m'
# reverse='\033[7m'
# invisible='\033[8m'

PWD=`basename \`pwd\``

# imports
source $ZDOTDIR/alias

# source $ZDOTDIR/prompt

# evals
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# fzf stuff
fzf_version=`\ls /usr/local/Cellar/fzf/ | awk '{print$0}'`
source /usr/local/Cellar/fzf/$fzf_version/shell/completion.zsh
source /usr/local/Cellar/fzf/$fzf_version/shell/key-bindings.zsh

# run tmux if using alacritty or kitty
# ALACRITTY_PID=`ps -ax | grep Alacritty | grep -v grep | head -n 1 | awk '{print $1}'`
# if [[ -n $KITTY_PID || -n $ALACRITTY_PID ]] then
#     if [[ -z "$TMUX" ]]; then
#             tmux a || tmux new-session -s $PWD
#     fi
# fi
# if [[ -n "$TMUX" ]]; then
#     source ~/.config/tmux/tmux-git.sh; 
# fi

# pnpm
export PNPM_HOME="/Users/$YOU/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# rust
source $HOME/.cargo/env

# fnm
eval "$(fnm env --use-on-cd)"
source ~/dotfiles/.home/.config/zsh/zsh-prompt-benchmark/zsh-prompt-benchmark.plugin.zsh

# profiling
# zprof

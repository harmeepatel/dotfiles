ZVM_VI_INSERT_ESCAPE_BINDKEY=kj
ZVM_VI_VISUAL_ESCAPE_BINDKEY=kj

# prompt
# export STARSHIP_CONFIG="~/.config/starship/starship.toml"

# fonts
export FONT="CaskaydiaCovePL Nerd Font Mono"

export UPDATE_ZSH_DAYS=30
export EDITOR=nvim

# zsh home dir
export ZDOTDIR=$HOME/.config/zsh

# PATH
# homebrew
export PATH="/usr/local/sbin:$PATH"

# custom binaries
export PATH="$HOME/bin:$PATH"

# bun
export BUN_INSTALL="/Users/$YOU/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# rust
# .rustup/toolchains/nightly-x86_64-apple-darwin/bin/rust-analyzer
export RUST_ANALYZER=".rustup/toolchains/nightly-x86_64-apple-darwin"
export PATH="$RUST_ANALYZER/bin:$PATH"

# go
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# postgresql
PSTGRS_VERSION=`\ls /usr/local/Cellar/postgresql@15/ | awk '{print$0}'`
export PATH="/usr/local/Cellar/postgresql@15/$PSTGRS_VERSION/bin:$PATH"

# fabric (https://github.com/danielmiessler/fabric)
export FABRIC_PATH="$HOME/.local/bin"
export PATH="$FABRIC_PATH/:$PATH"

# !!! EXPERIMENTAL !!!
# for raw go within templ file
export TEMPL_EXPERIMENT=rawgo

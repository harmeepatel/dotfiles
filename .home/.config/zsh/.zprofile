ZVM_VI_INSERT_ESCAPE_BINDKEY=kj
ZVM_VI_VISUAL_ESCAPE_BINDKEY=kj

# starship
SPACESHIP_DIR_TRUNC=5

export UPDATE_ZSH_DAYS=30
export EDITOR=nvim

# zsh home dir
export ZDOTDIR=$HOME/.config/zsh

# homebrew
export PATH="/usr/local/sbin:$PATH"

# compress_to_webp
export PATH="$HOME/bin:$PATH"

# bun
export BUN_INSTALL="/Users/$YOU/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# custom
export FONT="CaskaydiaCovePL Nerd Font Mono"

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

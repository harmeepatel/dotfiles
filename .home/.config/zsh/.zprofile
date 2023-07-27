ZVM_VI_INSERT_ESCAPE_BINDKEY=kj
ZVM_VI_VISUAL_ESCAPE_BINDKEY=kj

export YOU=$(whoami)

# starship
SPACESHIP_DIR_TRUNC=5

export UPDATE_ZSH_DAYS=30
export EDITOR=nvim

# zsh home dir
export ZDOTDIR=$HOME/.config/zsh

# homebrew
export PATH="/usr/local/sbin:$PATH"

# bun
export BUN_INSTALL="/Users/$YOU/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# custom
export FONT="CaskaydiaCovePL Nerd Font Mono"

#rust
# .rustup/toolchains/nightly-x86_64-apple-darwin/bin/rust-analyzer
export RUST_ANALYZER=".rustup/toolchains/nightly-x86_64-apple-darwin"
export PATH="$RUST_ANALYZER/bin:$PATH"

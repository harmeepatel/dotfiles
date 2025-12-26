#! /bin/bash

# --- FOR MAC ONLY ---

# install brew
if [ ! -d "/usr/local/Homebrew/" ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# install brew packages
brew install --cask ghostty
brew install btop
brew install exa
brew install ffmpeg
brew install fzf
brew install git
brew install hyperfine
brew install neovim
brew install rg
brew install stow
brew install trash
brew install yt-dlp
brew install zoxide

# git clone
if [ ! -d "/Users/$USER/dotfiles" ]; then
    git clone --depth=1 https://github.com/Harmy1410/dotfiles.git
fi

# stow
cd dotfiles
stow .home

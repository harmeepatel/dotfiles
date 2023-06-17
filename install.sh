#! /bin/bash

# FOR MAC ONLY

# install brew
if [ ! -d "/usr/local/Homebrew/" ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# brew
brew install git

# git clone
if [ ! -d "~/.files" ]; then
    git clone --depth=1 https://github.com/Harmy1410/mmc.git
fi

# stow
stow .home

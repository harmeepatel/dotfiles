#! /bin/bash

# FOR MAC ONLY

# install brew
if [ ! -d "/usr/local/Homebrew/" ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# brew
brew install git

# stow
stow .home

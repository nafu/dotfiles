#!/usr/bin/env bash

# Install Homebrew & brew-cask

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
# For x86_64
# arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# eval "$(/usr/local/homebrew/bin/brew shellenv)"
brew tap homebrew/cask
brew install homebrew/cask/brew-cask
brew tap homebrew/cask-versions

# Install brew & brew-cask packages

. install/brew.sh

# Install npm packages

. install/npm.sh

# Install python packages with pip

. install/pip.sh

# Install haskell packages with cabal

. install/cabal.sh

# Install npx packages

. install/npx.sh

# Install docker images

. install/docker.sh

# Xcode

mkdir -p ~/Library/Developer/Xcode/UserData/FontAndColorThemes/
ln -s ~/dotfiles/xcode/Dracula.dvtcolortheme ~/Library/Developer/Xcode/UserData/FontAndColorThemes/Dracula.dvtcolortheme

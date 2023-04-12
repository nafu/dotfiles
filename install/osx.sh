#!/usr/bin/env bash

# Install Homebrew & brew-cask

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
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

# Install docker images

. install/docker.sh

# Xcode

mkdir -p ~/Library/Developer/Xcode/UserData/FontAndColorThemes/
ln -s ~/dotfiles/xcode/Dracula.dvtcolortheme ~/Library/Developer/Xcode/UserData/FontAndColorThemes/Dracula.dvtcolortheme

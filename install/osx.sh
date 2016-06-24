#!/usr/bin/env bash

# Install Homebrew & brew-cask

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask
brew install caskroom/cask/brew-cask
brew tap homebrew/versions
brew tap caskroom/versions

# Install brew & brew-cask packages

. install/brew.sh

# Install npm packages

. install/npm.sh

# Install python packages with pip

. install/pip.sh

# Install haskell packages with cabal

. install/cabal.sh

# Xcode

mkdir -p ~/Library/Developer/Xcode/UserData/FontAndColorThemes/
ln -s xcode/Dracula.dvtcolortheme ~/Library/Developer/Xcode/UserData/FontAndColorThemes/Dracula.dvtcolortheme

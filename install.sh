#!/bin/sh

# Set zsh as your login shell
chsh -s $(which zsh)

# git
ln -sfv ~/dotfiles/git/.gitconfig ~/.gitconfig
ln -sfv ~/dotfiles/git/.gitignore_global ~/.gitignore_global

# zsh
ln -sfv ~/dotfiles/zshrc ~/.zshrc
ln -sfv ~/dotfiles/zshenv ~/.zshenv

# vim
ln -sfv ~/dotfiles/_vimrc ~/.vimrc
ln -sfv ~/dotfiles/vimfiles ~/.vim

if [ "$(uname)" == "Darwin" ]; then
    if [ -f "install/osx.sh" ]; then
        . "install/osx.sh"
    fi
fi

# Update submodule
git submodule init
git submodule update

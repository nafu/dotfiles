#!/bin/sh

# Set zsh as your login shell
chsh -s $(which zsh)

# git
ln -sfv ~/dotfiles/git/.gitconfig ~/.gitconfig
ln -sfv ~/dotfiles/git/.gitignore_global ~/.gitignore_global

# zsh
ln -sfv ~/dotfiles/zshrc ~/.zshrc
ln -sfv ~/dotfiles/zshenv ~/.zshenv
# Use below if you don't want to delete old .zsh
# mv ~/.zsh ~/.zsh`date '+%Y%m%d'`
rm -r ~/.zsh
ln -sfv ~/dotfiles/zsh ~/.zsh

# vim
ln -sfv ~/dotfiles/vimrc ~/.vimrc
# Use below if you don't want to delete old .vim
# mv ~/.vim ~/.vim.`date '+%Y%m%d'`
rm -r ~/.vim
ln -sfv ~/dotfiles/vimfiles ~/.vim

if [ "$(uname)" == "Darwin" ]; then
    if [ -f "install/osx.sh" ]; then
        . "install/osx.sh"
    fi
fi

# Update submodule
git submodule init
git submodule update

# todo.txt setup
mkdir -p ~/Dropbox/todo

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
ln -sfv ~/dotfiles/xvimrc ~/.xvimrc
# Use below if you don't want to delete old .vim
# mv ~/.vim ~/.vim.`date '+%Y%m%d'`
rm -r ~/.vim
ln -sfv ~/dotfiles/vimfiles ~/.vim

# nvm
mkdir ~/.nvm

# tmux
ln -sfv ~/dotfiles/tmux.conf ~/.tmux.conf

if [ "$(uname)" == "Darwin" ]; then
    if [ -f "install/osx.sh" ]; then
        . "install/osx.sh"
    fi
fi

# Update submodule
git submodule init
git submodule update

# todo.txt setup
# See more: https://github.com/ginatrapani/todo.txt-cli/wiki/Tips-and-Tricks
mkdir -p ~/Dropbox/todo
# Use below if you don't want to delete old .todo.actions.d
# mv ~/.todo.actions.d ~/.todo.actions.d`date '+%Y%m%d'`
rm -r ~/.todo.actions.d
ln -sfv ~/dotfiles/todo.actions.d ~/.todo.actions.d

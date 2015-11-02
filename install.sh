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
mkdir ~/Dropbox/todo
ln -sv ~/dotfiles/todo.txt-cli/todo.txt ~/Dropbox/todo/todo.txt
ln -sv ~/dotfiles/todo.txt-cli/done.txt ~/Dropbox/todo/done.txt
ln -sv ~/dotfiles/todo.txt-cli/report.txt ~/Dropbox/todo/report.txt

limit coredumpsize 0
#Setup command search path
typeset -U path
# (N-/) を付ける事で存在しなければ無視してくれる
path=($path /usr/*/bin(N-/) /usr/local/*/bin(N-/) /var/*/bin(N-/) /usr/sbin(N-/))

# todo.txt
export PATH=~/dotfiles/todo.txt-cli:$PATH
source ~/dotfiles/todo.txt-cli/todo_completion
alias t='todo.sh -d ~/Dropbox/todo/todo.cfg'
export EDITOR=vim

# リモートから起動するコマンド用の環境変数を設定（必要なら）
export RSYNC_RSH=ssh
export CVS_RSH=ssh

# Prevent to load /etc
# El Capitan automatically creates /etc/zprofile
setopt no_global_rcs
. "$HOME/.cargo/env"

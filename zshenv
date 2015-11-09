limit coredumpsize 0
#Setup command search path
typeset -U path
# (N-/) を付ける事で存在しなければ無視してくれる
path=($path /usr/*/bin(N-/) /usr/local/*/bin(N-/) /var/*/bin(N-/))

export PATH="$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"
alias t='todo.sh -d ~/Dropbox/todo/todo.cfg'

# リモートから起動するコマンド用の環境変数を設定（必要なら）
export RSYNC_RSH=ssh
export CVS_RSH=ssh

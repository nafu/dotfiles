# Set Colors
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=36;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=~/dotfiles/lazy-git/bin:$PATH
export PATH=/usr/local/bin:/usr/local/sbin:/usr/share/cakephp/2.1.0/lib/Cake/Console:$PATH
# For MAMP MySQL
# export PATH=/usr/local/bin:/usr/local/sbin:/Applications/MAMP/Library/bin:/usr/share/cakephp/2.1.0/lib/Cake/Console:~/usr/local/lazy-git/bin:$PATH
export PATH=~/dotfiles/todo.txt-cli:$PATH
source ~/dotfiles/todo.txt-cli/todo_completion
export EDITOR=vim

# Go
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# Android dev tools
export ANDROID_HOME=~/Documents/Develop/android/android-sdk-macosx
export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH

# Set PYTHONPATH
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

# Use screen
if [ $TERM != "screen" ]; then
        #exec screen -U -S main -xRR
fi

# Set Shell variable
# WORDCHARS=$WORDCHARS:s,/,,
HISTSIZE=1000 HISTFILE=~/.zhistory SAVEHIST=100000
# 重複を記録しない
setopt hist_ignore_dups
# 開始と終了を記録
setopt EXTENDED_HISTORY


# Set shell options
# 有効にしてあるのは副作用の少ないもの
setopt auto_cd auto_remove_slash auto_name_dirs
setopt extended_history hist_ignore_dups hist_ignore_space prompt_subst
setopt extended_glob list_types no_beep always_last_prompt
setopt cdable_vars sh_word_split auto_param_keys pushd_ignore_dups
#便利だが副作用の強い物はコメントアウト
#setopt auto_menu correct rm_star)silent sun_keyboard_hack
#setopt share_history inc_append_history

# Alias and functions
alias copy='cp -ip' del='rm -i' move='mv -i'
alias fullreset='echo "\ec\ec"'
h () {history $* | less}
alias ja='LANG=ja_JP.eucJP XMODIFIERS=@im=kinput2'
alias ls='ls -G' la='ls -a' ll='ls -la'
mdcd () {mkdir -p "$@" && cd "$*[-1]"}
mdpu () {mkdir -p "$@" && pushd "$*[-1]"}
alias pu=pushd po=popd dirs='dirs -v'
alias gst='git status -s | grep -n . --color=auto'
alias mamp='/Applications/MAMP/htdocs'
alias t='todo.sh'

# Suffix aliases（起動コマンドは環境によって変更する）
alias -s pdf=acroread dvi=xdvi
alias -s {opt,ods,odp,doc,xls,ppt}=soffice
alias -s {tgz,lzh,zip,arc}=file-roller

# binding keys
bindkey -e
#bindkey '^p' history-beginning-search-backward
#bindkey '^n' history-beginning-search-forward

# 補完システムを利用：補完の挙動が分かりやすくなる２つの設定のみ記述
zstyle ':completion:*' format '%BCompleting %d%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
autoload -U compinit && compinit

# get and show branch name

autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null

function show-git-current-branch {
        local name st color gitdir action
        if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
                return
        fi
		name=`git rev-parse --abbrev-ref=loose HEAD 2> /dev/null`
        if [[ -z $name ]]; then
                return
        fi

        gitdir=`git rev-parse --git-dir 2> /dev/null`
        action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"

        st=`git status 2> /dev/null`
        if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
                color=%F{green}
        elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
                color=%F{yellow}
        elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
                color=%B%F{red}
        else
                 color=%F{red}
         fi

        echo "$color$name$action%f%b "
}

PROMPT='%B%~%b `show-git-current-branch` %# '

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# add / as a word
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*'  word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

# search history incrementally
bindkey '^r' \
  history-incremental-pattern-search-backward
bindkey '^s' \
  history-incremental-pattern-search-forward

# history-search-end
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end \
  history-search-end
bindkey "^o" history-beginning-search-backward-end

# move multiple files
autoload zmv

# awscli
source /usr/local/share/zsh/site-functions/_aws

# pg
alias pg="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log"

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

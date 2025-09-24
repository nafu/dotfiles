# Set Colors
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=36;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
export PATH=/opt/homebrew/share/npm/bin:$PATH
export PATH=~/dotfiles/lazy-git/bin:$PATH
export PATH=~/dotfiles/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH
# For MAMP MySQL
# export PATH=/Applications/MAMP/Library/bin:/usr/share/cakephp/2.1.0/lib/Cake/Console:$PATH
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Go
export GOROOT=/opt/homebrew/opt/go/libexec
export GOPATH=$HOME
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# Java
export JAVA_HOME=`/usr/libexec/java_home -v 17`
export JAVA8_HOME=`/usr/libexec/java_home -v 1.8`

# Android dev tools
export ANDROID_HOME=~/Library/Android/sdk
export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH

# Anaconda
export DYLD_FALLBACK_LIBRARY_PATH=$HOME/.pyenv/versions/$(cat ~/.pyenv/version)/lib/:$DYLD_FALLBACK_LIBRARY_PATH

# Use screen
if [ $TERM != "screen" ]; then
        #exec screen -U -S main -xRR
fi

# brew

eval "$(/opt/homebrew/bin/brew shellenv)"

# rbenv
eval "$(rbenv init -)"

# pyenv
eval "$(pyenv init -)"

# Set Shell variable
# WORDCHARS=$WORDCHARS:s,/,,
HISTSIZE=10000 HISTFILE=~/.zhistory SAVEHIST=100000
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
setopt share_history inc_append_history

## autojump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
## highlight
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
## k
source ~/.zsh/plugins/k/k.sh

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
alias hb='hub browse'
alias mamp='/Applications/MAMP/htdocs'
## Ruby
alias bi='bundle install'
alias bu='bundle update'
alias be='bundle exec'
##
## Git
##
## I tried to prepare zsh completion for lazy-git commands,
## but it doesn't seem to work correctly.
## Using alias is better way because completion works correctly. 🚀
##
## Ref.
## https://github.com/zsh-users/zsh-completions/blob/master/zsh-completions-howto.org
## http://stackoverflow.com/questions/8260398/adding-new-zshell-command-line-custom-git-completions
##
alias b='git branch -a'
alias ch='git cherry -v'
alias cm='(){ git commit -m "$*" }'
alias d='git diff'
alias dca='git diff --cached'
alias dh='git diff HEAD'
alias gb='git branch'
alias gc='git clone'
alias gco='git checkout'
alias gl='git log'
alias pr='hub pull-request'
alias st='git status -s'
alias ush='git push origin'
alias ull='git pull origin'
alias track='git update-index --no-assume-unchanged'
alias untrack='git update-index --assume-unchanged'
## ghq with peco
alias g='cd $(ghq root)/$(ghq list | peco)'
alias ghb='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'

# Suffix aliases（起動コマンドは環境によって変更する）
alias -s pdf=acroread dvi=xdvi
alias -s {opt,ods,odp,doc,xls,ppt}=soffice
alias -s {tgz,lzh,zip,arc}=file-roller

# binding keys
bindkey -e
bindkey '^p' history-beginning-search-backward
bindkey '^n' history-beginning-search-forward

# load our own completion functions
fpath=(~/.zsh/completion /opt/homebrew/share/zsh/site-functions $fpath)
# 補完システムを利用：補完の挙動が分かりやすくなる２つの設定のみ記述
zstyle ':completion:*' format '%BCompleting %d%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
autoload -U compinit && compinit

## More completion

cp_complete_directory() {
  LBUFFER="${LBUFFER%/*}/"
  zle self-insert
}
zle -N cp_complete_directory
bindkey '^X^D' cp_complete_directory

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

PROMPT='%B%~%b `show-git-current-branch` %(?..[%F{red}%?%f%b] )%# '

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
source /opt/homebrew/share/zsh/site-functions/_aws

# pg
alias pg="pg_ctl -D $(brew --prefix)/var/postgres -l $(brew --prefix)/var/postgres/server.log"

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /opt/homebrew/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /opt/homebrew/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /opt/homebrew/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /opt/homebrew/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

# added by travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

# nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# asdf
if [ -f "$PWD/.tool-versions" ]; then
  source $(brew --prefix asdf)/libexec/asdf.sh
else
  export PATH=`echo $PATH | sed -E 's/(.*)\.asdf([^:]*)://'`
  export PATH=`echo $PATH | sed -E 's/(.*)\asdf([^:]*)://'`
fi

# flutter
if [ -f "$PWD/.tool-versions" ]; then
  export PATH=$PATH:~/.pub-cache/bin
  export FLUTTER_ROOT="$(asdf where flutter)"
else
  export PATH=$PATH:~/development/flutter/flutter/bin
fi

## enhancd (make sure to put after compinit)
source ~/.zsh/plugins/enhancd/init.sh

# enable passphrase prompt for gpg
export GPG_TTY=$(tty)

# Added by Windsurf
export PATH=~/.codeium/windsurf/bin:$PATH

# Added by aider
# https://github.com/Aider-AI/aider
export PATH=~/.local/bin:$PATH

# qlty
# https://qlty.sh/dashboard
# Install qlty via `curl -sSL https://qlty.sh/install | sh`
export QLTY_INSTALL="$HOME/.qlty"
export PATH="$QLTY_INSTALL/bin:$PATH"

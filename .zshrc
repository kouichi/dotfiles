JAVA_HOME=`/usr/libexec/java_home`
ANDROID_HOME=/Applications/android-sdk
NODE_PATH=/usr/local/lib/node_modules

PATH=$JAVA_HOME/bin:$PATH
PATH=$ANDROID_HOME/platform-tools:$PATH
PATH=$PATH:$HOME/bin

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export GOPATH=$HOME/.go
export PYENV_ROOT=$HOME/.pyenv
export PATH="$PYENV_ROOT/bin:$PATH"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

if pyenv which aws_zsh_completer.sh 1>/dev/null 2>&1; then
  source "$(pyenv which aws_zsh_completer.sh)"
fi

#  complete -C aws_completer aws

# Docker
DOCKER_HOST=tcp://192.168.59.103:2376
DOCKER_CERT_PATH=/Users/kouichi/.boot2docker/certs/boot2docker-vm
DOCKER_TLS_VERIFY=1

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/kouichi/.gvm/bin/gvm-init.sh" ]] && source "/Users/kouichi/.gvm/bin/gvm-init.sh"

if [[ -f $HOME/.zsh/antigen/antigen.zsh ]]; then
  source $HOME/.zsh/antigen/antigen.zsh
  antigen bundle zsh-users/zsh-syntax-highlighting
  antigen apply
fi

FIGNORE=".svn"
PROMPT="[%n@%m](%*%) %~ %# "

# Alias
alias ls='ls -F'
alias la='ls -a'
alias ll='ls -l'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'

alias zmv='noglob zmv -W'

alias brew="env PATH=${PATH/\/Users\/kouichi\/\.pyenv\/shims:/} brew"

alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g N='> /dev/null'
alias -g P=' --help | less'

# コマンド履歴
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

bindkey -e # Emacs like
bindkey '^r' history-incremental-pattern-search-backward
bindkey '^s' history-incremental-pattern-search-forward

setopt AUTO_CD
#setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt SHARE_HISTORY
setopt IGNORE_EOF # ^D で zsh を終了しない
setopt NO_FLOW_CONTROL # ^Q/^S のフローコントロールを無効にする
setopt NO_BEEP # beep 音を鳴らさない

# zsh plugins
autoload -Uz add-zsh-hook

# コマンド編集: 単語の区切り
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

# 補完機能強化
fpath=($HOME/.zsh/zsh-completions/src(N-/) $fpath)

# 補完機能
autoload -Uz compinit
compinit

# 補完機能: メニュー選択モード
zstyle ':completion:*:default' menu select=2

# 補完機能: 大文字と小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# コマンド履歴: history-search-end関数
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
bindkey "^o" history-beginning-search-backward-end

# 最近移動したディレクトリに移動する
autoload -Uz chpwd_recent_dirs cdr
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-max 200

# 一括リネーム
autoload -Uz zmv

# Gitリポジトリ情報の表示
autoload -Uz vcs_info

zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

function _update_vcs_info_msg() {
  LANG=en_US.UTF-8 vcs_info
  RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg

function zman() {
  PAGER="less -g -s '+/^ {7}"$1"'" man zshall
}


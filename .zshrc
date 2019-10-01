####################################################Plugins######################################################
# zplug
source ~/.zplug/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "mafredri/zsh-async"
# zplug "plugins/git", from:oh-my-zsh
# zplug "plugins/brew", from:oh-my-zsh
zplug "plugins/brew-cask", from:oh-my-zsh
zplug "plugins/osx", from:oh-my-zsh
zplug "plugins/gpg-agent", from:oh-my-zsh
zplug 'dracula/zsh', as:theme
# 構文のハイライト(https://github.com/zsh-users/zsh-syntax-highlighting)
zplug "zsh-users/zsh-syntax-highlighting", defer:2
# history関係
zplug "zsh-users/zsh-history-substring-search"
# タイプ補完
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
#zplug "rupa/z", use:"*.sh"
#zplug "b4b4r07/emoji-cli"
#zplug "greymd/tmux-xpanes"
zplug "chrissicool/zsh-256color"

####################################################Path######################################################
# anyenv
if [ -d $HOME/.anyenv ]; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init - zsh)"
fi

# gopath
export GOPATH=${HOME}/go
export PATH=${PATH}:${GOPATH}/bin

# export ZSH=/Users/kokitsumura/.oh-my-zsh
export XDG_CONFIG_HOME="$HOME/.config"
NODEBREW_HOME=/usr/local/var/nodebrew/current
export NODEBREW_HOME
export NODEBREW_ROOT=/usr/local/var/nodebrew

export PATH=$PATH:$NODEBREW_HOME/bin

export PATH="$HOME/.yarn/bin:$PATH"

export PKG_CONFIG_PATH="/usr/local/opt/libxml2/lib/pkgconfig"
export PATH=$PATH:/usr/local/mysql/bin
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi
# Then, source plugins and add commands to $PATH
####################################################FZF######################################################
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history
# メモリに保存される履歴の件数
export HISTSIZE=1000
# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000
# 重複を記録しない
setopt hist_ignore_dups
# 開始と終了を記録
setopt EXTENDED_HISTORY

function select-history() {
  BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
}

zle -N select-history
bindkey '^r' select-history
####################################################alias######################################################
alias sss='source ~/dotfiles/.zshrc'
source ~/dotfiles/.aliases

zplug load

####################################################Plugins######################################################
source ~/.zplug/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "mafredri/zsh-async"
# zplug "plugins/git", from:oh-my-zsh
# zplug "plugins/brew", from:oh-my-zsh
# zplug "plugins/brew-cask", from:oh-my-zsh
# zplug "plugins/osx", from:oh-my-zsh
# zplug "plugins/gpg-agent", from:oh-my-zsh
# zplug "b4b4r07/emoji-cli"
# zplug "greymd/tmux-xpanes"
# TODO 調べる
# ディレクトリのエイリアス
# zplug "lib/directories", from:"oh-my-zsh"
# 見た目
zplug 'dracula/zsh', as:theme
zplug "chrissicool/zsh-256color"
# 構文のハイライト
zplug "zsh-users/zsh-syntax-highlighting", defer:2
# history
zplug "zsh-users/zsh-history-substring-search"
# 補完
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
# TODO cd -を効くようにする gdも直す
zplug "b4b4r07/enhancd", use:init.sh
zplug "rupa/z", use:"*.sh"

####################################################path######################################################
# TODO pathの設定を直す&ファイルに切り出す
# TODO 読み込みの速度を上げる
# TODO zplug clean/clearをした時に、rmtrashで怒られないようにする(現状だとerror出るたびalias rm=rmで対処している)
## anyenv
#if [ -d $HOME/.anyenv ]; then
#  export PATH="$HOME/.anyenv/bin:$PATH"
#  eval "$(anyenv init - zsh)"
#fi
#
## gopath
#export GOPATH=${HOME}/go
#export PATH=${PATH}:${GOPATH}/bin
#
## export ZSH=/Users/kokitsumura/.oh-my-zsh
#export XDG_CONFIG_HOME="$HOME/.config"
#NODEBREW_HOME=/usr/local/var/nodebrew/current
#export NODEBREW_HOME
#export NODEBREW_ROOT=/usr/local/var/nodebrew
#
#export PATH=$PATH:$NODEBREW_HOME/bin
#
#export PATH="$HOME/.yarn/bin:$PATH"
#
#export PKG_CONFIG_PATH="/usr/local/opt/libxml2/lib/pkgconfig"
#export PATH=$PATH:/usr/local/mysql/bin
#export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
# TODO 重複パスを登録しない
# typeset -U path cdpath fpath manpath
# Install plugins if there are plugins that have not been installed

############################################zplug installation####################################################
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

####################################################fzf######################################################
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
# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups
# 同時に起動したzshの間でヒストリを共有する
setopt share_history
# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space
# 開始と終了を記録
setopt EXTENDED_HISTORY
function select-history() {
  BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
}

zle -N select-history
bindkey '^r' select-history

####################################################suggestion####################################################
# TODO 将来的には部分一致での自動補完が欲しい
# word区切り
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
# 補完で大文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 矢印で選択肢を選べるように
setopt auto_menu
zstyle ':completion:*:default' menu select=1
# cd -<tab>で以前移動したディレクトリを表示
setopt auto_pushd
setopt complete_in_word
# ミスタイプ時にyes/noで候補を出す
setopt correct

####################################################etc######################################################
# ビープ音の停止
setopt no_beep
# ビープ音の停止(補完時)
setopt nolistbeep

####################################################alias######################################################
alias sss='source ~/dotfiles/.zshrc'
source ~/dotfiles/.aliases

local_alias=~/dotfiles/.$(scutil --get ComputerName).aliases
if [ -e $local_alias ]; then
  source $local_alias
fi

####################################################zplug load####################################################
zplug load

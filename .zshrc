####################################################Plugins######################################################
source ~/.zplug/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "mafredri/zsh-async"
zplug 'dracula/zsh', as:theme
zplug "chrissicool/zsh-256color"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
# history
zplug "zsh-users/zsh-history-substring-search"
# 補完
zplug "zsh-users/zsh-autosuggestions"
zplug 'zsh-users/zsh-completions'
# directory移動を楽に
zplug "rupa/z", use:"*.sh"
# zplug "b4b4r07/zsh-vimode-visual", defer:3

############################################zplug installation####################################################
# 最初にプラグインいれるときだけコメントアウトする
# if ! zplug check --verbose; then
#   printf "Install? [y/N]: "
#   if read -q; then
#     echo; zplug install
#   fi
# fi

zplug load

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
# word区切り
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# 部分一致も可能な補完
if [[ "$CASE_SENSITIVE" = true ]]; then
  zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'
else
  if [[ "$HYPHEN_INSENSITIVE" = true ]]; then
    zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
  else
    zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
  fi
fi
unset CASE_SENSITIVE HYPHEN_INSENSITIVE

# 矢印で選択肢を選べる
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
# after cd do ls
setopt auto_cd
function chpwd() { ls }

####################################################alias######################################################
alias sss='source ~/dotfiles/.zshrc'
source ~/dotfiles/.aliases

local_alias=~/dotfiles/.$(scutil --get ComputerName).aliases
[ -e $local_alias ] && source $local_alias

####################################################path######################################################
# TODO anyenvの読み込みが遅いから、lazyload等できるようにする
local_path=~/dotfiles/.$(scutil --get ComputerName).path
[ -e $local_path ] && source $local_path

# TODO pathの設定を直す & ファイルに切り出す & 読み込みの速度を上げる
# anyenv setting
if [ -d $HOME/.anyenv ]; then
  PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init - --no-rehash)"
fi

# gopath setting. Downloaded from golang.org
export GOPATH="$HOME/go"
PATH="$GOPATH/bin:$PATH"
PATH="$PATH:/Users/kokitsumura/flutter/bin"

# language setting
export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8

# editor and xdg setting
export EDITOR=nvim
export XDG_CONFIG_HOME="$HOME/.config"

export PATH="$PATH:/usr/local/mysql/bin"

# for c++
export PKG_CONFIG_PATH="/usr/local/opt/libxml2/lib/pkgconfig"
# export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"

# 重複パスを登録しない
typeset -U path cdpath fpath manpath

# Dotfiles
## 前提
- neovim
- vim-plug
- zsh
- zplug

## zplug install
```
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
```

## vim-plug install
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
注意: 現状だとsymlinkで対応できていないから注意、一度autoloadとかのdirectoryを生成してからしか現状では使えない

## 使い方
1. シンボリックリンクを貼る
```
sh makeSymLinks.sh
```

## TODO
- symlinkを貼るだけでnvimが動くようにする
- brewで必要なものを追加する
- nvimの文字崩れとかを直す

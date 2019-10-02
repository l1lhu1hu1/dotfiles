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

### 注意
aliasesの中身を置き換える、必要のないPATHを消す等は必要

## vim-plug install
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## 使い方
1. シンボリックリンクを貼る
### zshell
```
sh makeZshSymLinks.sh
```

### neovim
```
sh makeVimSymLinks.sh
```

## TODO
- [ ] brewtap、brewcaskとは?
- [ ] brewで必要なものを一括でインストールできる方法がないか探す
- [ ] brewで必要なものを追加する
- [ ] install.shに必要なものを追加する(brew等の)
- [ ] それぞれのファイルの役割を書く
- [x] ricty for powerlineを追加する
- [x] symlinkを貼るだけでnvimが動くようにする(makeVimSymLinks.shの改善)
- [x] aliasesでPC名になっているところをwhoamiに置き換える
- [x] aliasをlocal依存のものと分割する

## 必要なもの
### ricty for powerline
```
brew tap sanemat/font
brew install ricty --with-powerline
cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/
fc-cache -vf
```

### vimでdeopleteを使うために必要
```
pip3 install --user pynvim
pip3 install --user --upgrade pynvim
```


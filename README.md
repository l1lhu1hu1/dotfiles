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

### 注意
現状だとsymlinkで対応できていないから注意、一度autoloadとかのdirectoryを生成してからしか現状では使えない

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
- [ ] symlinkを貼るだけでnvimが動くようにする(makeVimSymLinks.shの改善)
- [ ] brewで必要なものを追加する
- [ ] nvimの文字崩れとかを直す(iterm2側)
- [ ] aliasesでPC名になっているところをwhoamiに置き換える

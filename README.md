# dotfiles
## 構成
- zsh & zplug
- neovim & vim-plug

### 注意
aliasesの中身を置き換える、必要のないPATHを消す等は必要

## zplug install
```
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
```
## vim-plug install
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## シンボリックリンクの作成
### zshell
```
sh makeZshSymLinks.sh
```

### neovim
```
sh makeVimSymLinks.sh
```

### 両方
```
sh makeVimSymLinks.sh
```

## neovim setting
### neovim install
```
brew install neovim
```
### ricty for powerline(neovimの表示用)
#### Step 1
```
brew tap sanemat/font
brew install ricty --with-powerline
cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/
fc-cache -vf
```

#### Step 2 
iTerm側でfontの設定が必要。これと同じように設定する  
<img src="./iterm_setting.png" height="600px">

### vimでdeopleteを使うために必要
```
pip3 install --user pynvim
pip3 install --user --upgrade pynvim
```

## TODO
- [ ] brewtap、brewcaskとは?
- [ ] brewで必要なものを一括でインストールできる方法がないか探す
- [ ] brewで必要なものを追加する
- [ ] install.shに必要なものを追加する(brew等の)
- [ ] それぞれのファイルの役割を書く
- [ ] zshrcの中の必要のないものを削除して、環境依存のものと共通なものを切り分ける
- [x] ricty for powerlineを追加する
- [x] symlinkを貼るだけでnvimが動くようにする(makeVimSymLinks.shの改善)
- [x] aliasesでPC名になっているところをwhoamiに置き換える
- [x] aliasをlocal依存のものと分割する

## Markdown Preview Plus
`chrome://extensions`にいって、詳細をクリック後にファイルのURLへのアクセスを許可するをクリックする

## Githubアカウント連携(2FAをつけている場合)
`Developer settings`にいき、`Personal access tokens`でGenerate new tokenをする。その後に、


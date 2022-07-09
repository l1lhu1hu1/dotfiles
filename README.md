# dotfiles
## 構成
- zsh & zplug
- neovim & vim-plug

## brew install
Install Brew from [here](https://brew.sh/)

### 疑問点
.configで配下にnvim directoryは作る必要ある?

## dotfilesを置く場所
`~`配下

```sh
brew install argon/mas/mas
brew install rcmdnk/file/brew-file
brew file init
cp ~/dotfiles/app_settings/Brewfile ~/.config/brewfile/Brewfile
```

### 参考サイト
- [Macで自動環境構築＆バックアップ（App Storeも）](https://qiita.com/takeo-asai/items/29724f94e2992fdc7246#homebrew)

## zplug install

```sh
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
```

## vim-plug install

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## シンボリックリンクの作成
### zshell

```sh
cd symlink_settings && sh make_zsh_symlinks
```

### neovim

```sh
cd symlink_settings && sh make_vim_symlinks
```

### 両方

```sh
cd symlink_settings && sh make_all_symlinks
```

## Neovim setting

```sh
brew install neovim
```

pyenvを入れると、pipもついてくるので、pipでpynvimとneovimを入れる必要がある

```sh
chmod 755 /usr/local/share/zsh/site-functions
chmod 755 /usr/local/share/zsh
pip3 install --user pynvim
pip3 install --user neovim
```

### 疑問点
- [macでzshでzsh compinit: insecure directoriesの警告が出る問題](https://qiita.com/ayihis@github/items/88f627b2566d6341a741)

## Ricty for powerline(neovimの表示用)

```sh
brew tap sanemat/font
brew install ricty --with-powerline
cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/
fc-cache -vf
```

iTerm側でfontの設定が必要。これと同じように設定する
<img src="./images/iterm_setting.png" height="600px">

## Markdown Preview Plus
`chrome://extensions`にいって、詳細をクリック後にファイルのURLへのアクセスを許可するをクリックする

## Nodenv and yarn installation

```sh
anyenv install nodenv
nodenv install -l
nodenv install (versionは自分で調べてから入れる)
touch $(nodenv root)/default-packages
mkdir -p "$(nodenv root)/plugins"
git clone https://github.com/pine/nodenv-yarn-install.git "$(nodenv root)/plugins/nodenv-yarn-install" //yarn
nodenv uninstall (最初に選んだversion)
nodenv install (最初に選んだversion)
yarn add global tern
```

```sh
pyenv install -l
pyenv install バージョン番号
```

## karabiner element
Add ruleからのimport more rules from the internetで日本語入力時のesc(vim)を入れる

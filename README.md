# dotfiles
## 構成
- zsh & zplug
- neovim & vim-plug

## brew install
Install Brew from [here](https://brew.sh/)

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

### coc設定
1. `CocInstall coc-json coc-tsserver` を実行する
2. `:CocCofig` を入力し、 `~/.config/nvim/coc-settings.json` を編集(dotfiles内のファイルをコピペ)する
3. `:CocInstall coc-snippets` を実行する
4. `ts` ファイルを開いた状態で `:CocCommand snippets.editSnippet` を入力し、 `~/.config/coc/ultisnips/typescript.snippets` を編集(dotfiles内のファイルをコピペ)する

## iTerm Font
monacoを使用すること

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

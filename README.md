# dotfiles
## 構成
- zsh & zplug
- neovim & vim-plug

## brew install
Install Brew from [here](https://brew.sh/)

## dotfilesを置く場所
`~`配下

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
# TODO
mkdir /Users/l1lhu1hu1/.config/nvim
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
pip3 install --user pynvim
pip3 install --user neovim
```
## iTerm Font
monacoを使用

## karabiner element
Add ruleからのimport more rules from the internetで日本語入力時のesc(vim)を入れる

## Memo
### rg
```
brew install rg
```

### Volta installation
https://docs.volta.sh/guide/getting-started からインストール

### Node.js Installation
```sh
volta install node
```

### Claude Code installation

### Neovimで出ているエラー
```
The `require('lspconfig')` "framework" is deprecated, use vim.lsp.config (see :help lspconfig-nvim-0.11)
 instead.
Feature will be removed in nvim-lspconfig v3.0.0
```

### iTerm2
以下の設定を行う
- ctrl + k: iTerm2をアクティブ状態にする
- cmd + ←: Previous Tabに移動する
- cmd + →: Next Tabに移動する

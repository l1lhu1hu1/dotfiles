# Neovim Configuration
### 必須要件

| ソフトウェア | 最小バージョン | 推奨バージョン | 備考 |
|--------------|----------------|----------------|------|
| **Neovim** | 0.10.0 | 0.11.2+ | LSP機能、標準コメント機能に必要 |
| **Node.js** | 16.0+ | 20.0+ | TypeScript Language Server用 |
| **Git** | 2.0+ | 最新 | vim-fugitive用 |
| **fzf** | 0.48.0+ | 0.62.0+ | --zshフラグサポートに必要 |

### UltiSnips（スニペット）の設定

Neovimは `~/.config/nvim/UltiSnips/` からスニペットファイルを読み込みます。
dotfilesのスニペットを使用するには、シンボリックリンクを作成してください。

```bash
# UltiSnipsディレクトリを作成（なければ）
mkdir -p ~/.config/nvim/UltiSnips

# シンボリックリンクを作成
ln -s /Users/l1lhu1hu1/dotfiles/.vim/UltiSnips/typescript.snippets ~/.config/nvim/UltiSnips/typescript.snippets
ln -s /Users/l1lhu1hu1/dotfiles/.vim/UltiSnips/typescript.snippets ~/.config/nvim/UltiSnips/typescriptreact.snippets
ln -s /Users/l1lhu1hu1/dotfiles/.vim/UltiSnips/javascript.snippets ~/.config/nvim/UltiSnips/javascript.snippets
```

**注意:** 新しいファイルタイプ用のスニペットを追加した場合は、同様にシンボリックリンクを作成する必要があります。

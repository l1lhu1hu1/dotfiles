"----------------------------------------------------
" vim-plug core  setting
"----------------------------------------------------
if has('vim_starting')
  set nocompatible
endif

let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

if !filereadable(vimplug_exists)
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

"----------------------------------------------------
" ###################################################
"----------------------------------------------------
call plug#begin(expand('~/.config/nvim/plugged'))
"----------------------------------------------------
" theme plugins
"----------------------------------------------------
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" colorscheme
Plug 'dracula/vim', { 'as': 'dracula' }

"----------------------------------------------------
" utility plugins
"----------------------------------------------------
" faster jk movement
Plug 'rhysd/accelerated-jk'
" emmet
Plug 'mattn/emmet-vim'
" fzf (both plugins required: fzf provides vim integration functions, fzf.vim provides commands)
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
"----------------------------------------------------
" syntax check
"----------------------------------------------------
" stands for Asynchronous Lint Engine. stntax checking and semantic errors
Plug 'dense-analysis/ale'
"----------------------------------------------------
" snippet and template plugins
"----------------------------------------------------
Plug 'mattn/vim-sonictemplate'
"----------------------------------------------------
" completion and formatter plugins
"----------------------------------------------------
Plug 'editorconfig/editorconfig-vim'
" auto close html or jsx tag completion
Plug 'alvan/vim-closetag'
" auto close completion for ", ', (, etc
Plug 'cohama/lexima.vim'
" replace tag name to different tag name. eg) <h1>hello</h1> to <h2>hello</h2>
Plug 'tpope/vim-surround'
"----------------------------------------------------
" syntax highlighting plugins
"----------------------------------------------------
" prisma schema syntax highlighting
Plug 'prisma/vim-prisma'

" session management
Plug 'tpope/vim-obsession'
" github copilot ai assistant
Plug 'github/copilot.vim'
" lsp configuration
Plug 'neovim/nvim-lspconfig'

call plug#end()
" ###################################################
"----------------------------------------------------
" LSP Configuration
"----------------------------------------------------
lua << EOF
local lspconfig = require('lspconfig')

-- Show errors inline (virtual text)
vim.diagnostic.config({
  virtual_text = true,
})

-- TypeScript/JavaScript Language Server
lspconfig.ts_ls.setup{}

-- LSP key mappings
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', '<space>df', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
  end,
})
EOF
"----------------------------------------------------
" Standard indent visualization (replaces vim-indent-guides)
set list
set listchars=tab:»-,trail:-,nbsp:%,eol:↩

let g:dracula_italic=0

let g:sonictemplate_vim_template_dir = ['~/.config/nvim/templates']

set splitright

autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s
" completionの候補の詳細がwindowとして出てきた後にescを押したら消える
autocmd CompleteDone * silent! pclose!
"----------------------------------------------------
" c++, c, python and etc settings
"----------------------------------------------------
augroup autoformat_settings
  autocmd!
  autocmd Filetype php set filetype=html
augroup END
autocmd FileType python set shiftwidth=4 tabstop=4 expandtab
"----------------------------------------------------
" js, rust settings
"----------------------------------------------------
let g:ale_fixers = {
    \ 'javascript': ['eslint'],
    \ 'typescript': ['eslint'],
    \ 'python': ['autopep8'],
    \ 'css': ['stylelint'],
    \ 'scss': ['stylelint'],
    \ 'html': ['prettier'],
    \ 'rust': ['rustfmt'],
    \ 'go': ['gobuild'],
\ }

let g:ale_linters = {
    \ 'javascript': ['eslint'],
    \ 'typescript': ['eslint'],
    \ 'python': ['flake8'],
    \ 'css': ['stylelint'],
    \ 'scss': ['stylelint'],
    \ 'html': ['prettier'],
    \ 'rust': ['rust-analyzer'],
    \ 'go': ['gobuild'],
\ }

let g:ale_rust_rust_analyzer_executable = 'rust-analyzer'
let g:ale_rust_analyzer_config = {
      \   'rust': {
      \     'clippy_preference': 'on'
      \   }
      \ }

let g:ale_sign_error = '>>'
let g:ale_sign_warning = '__'
let g:ale_linters_explicit = 1

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 1
let g:ale_fix_on_save = 1
let g:ale_use_neovim_diagnostics_api = 1

" ESLint設定ファイルがない場合のエラーを非表示
let g:ale_javascript_eslint_suppress_missing_config = 1

let g:closetag_filenames = '*.html,*.js,*.jsx,*.tsx,*.php'

"----------------------------------------------------
" md tex settings
"----------------------------------------------------
au BufRead,BufNewFile *.md set filetype=markdown
let g:markdown_fenced_languages = ['javascript', 'ruby', 'go', 'cpp']

"----------------------------------------------------
" search settings
"----------------------------------------------------
" 検索の時に大文字が含まれている場合は区別して検索する
set ignorecase
" 最後まで検索したら先頭に戻る
set smartcase
" インクリメンタルサーチを使わない
set wrapscan
" 検索結果文字列のハイライトを有効にする
set noincsearch
set hlsearch

"----------------------------------------------------
" cursor settings
"----------------------------------------------------
" カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set whichwrap=b,s,h,l,<,>,[,],~
" 行番号を表示
set number
" カーソルラインをハイライト
set cursorline
set backspace=indent,eol,start " バックスペースキーの有効化

"----------------------------------------------------
" visual settings
"----------------------------------------------------
syntax enable
colorscheme dracula

hi Visual guifg=#000000 guibg=#FFFFFF gui=none
" 入力中のコマンドをステータスに表示する
set showcmd
" ステータスラインを常に表示
set laststatus=2
" 現在のモードを表示
set showmode
set ruler
"----------------------------------------------------
" statusLine settings
"----------------------------------------------------
" ステータスラインの右側にカーソルの位置を表示する
" ステータスラインに表示する情報の指定
let g:airline_theme = 'laederon'
" ステータスラインの色
let g:airline_powerline_fonts = 1
" tablineの表示
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 0
let g:airline#extensions#tabline#show_buffers = 0
" tabの番号表示
let g:airline#extensions#tabline#tab_nr_type = 1
" file名だけを表示するために必要
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = ''
let g:airline_skip_empty_sections = 1
let g:airline_section_c = ''
"----------------------------------------------------
" indent settings
"----------------------------------------------------
" タブ入力を複数の空白入力に置き換える
set expandtab
" 画面上でタブ文字が占める幅
set tabstop=2
" 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=2
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に前の行の構文をチェックし次の行のインデントを増減する
set smartindent
"smartindentで増減する幅
set shiftwidth=2
filetype plugin indent on

"----------------------------------------------------
" bracket and tag settings
"----------------------------------------------------
set showmatch " 括弧の対応関係を一瞬表示する

"----------------------------------------------------
" font and encoding settings
"----------------------------------------------------
set fileencodings=utf-8,iso-2022-jp,sjis,ccp932,euc-jp " 読み込み時の文字コードの自動判別. 左側が優先される
set encoding=utf-8
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される

"----------------------------------------------------
" clipboard and paste settings
"----------------------------------------------------
" ヤンクをクリップボードへ
set clipboard=unnamed
"----------------------------------------------------
" nvim clipboard key mappings
"----------------------------------------------------
nnoremap <silent><Space>cp :let @+=expand("%:p")<CR>

"----------------------------------------------------
" fzf key mappings
"----------------------------------------------------
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>
let g:fzf_layout = { 'window': '-tabnew' }
" fzfではTabでいくつかの候補を取っておける
nnoremap <silent> <Space>fh :<C-u>:History<CR>
nnoremap <silent> <Space>fr :Rg <C-R><C-W><CR>
" CtrlP replacement with fzf
nnoremap <C-p> :<C-u>Files<CR>
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
"----------------------------------------------------
" movement key mappings
"----------------------------------------------------
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap <down> gjzz
nnoremap <up> gkzz
nnoremap G Gzz
nnoremap j gjzz
nnoremap k gkzz
noremap <S-h>   ^
noremap <S-j>   }
noremap <S-k>   {
noremap <S-l>   $

"----------------------------------------------------
" tabs and window key mappings
"----------------------------------------------------
nnoremap s <Nop>
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sw <C-w>w
nnoremap sH <C-w>H
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sr <C-w>r
nnoremap fl gt
nnoremap fh gT
nnoremap gt <Nop>
nnoremap gT <Nop>

"----------------------------------------------------
" save and quit key mappings
"----------------------------------------------------
let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>qt :tabo<CR>
nnoremap <Leader>qw :on<CR>
nnoremap <Leader>q1 :q!<CR>
nnoremap <Leader>qa :qa<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>wq1 :wq!<CR>

"----------------------------------------------------
" search key mappings
"----------------------------------------------------
nnoremap <C-j> *
nnoremap <C-k> #
nnoremap  <C-c><C-c> :<C-u>nohlsearch<cr><Esc>
"----------------------------------------------------
" other key mappings
"----------------------------------------------------
" xした結果をレジスタに保存しない
nnoremap x "_x

nnoremap ZZ <nop>
nnoremap ZQ <nop>
nnoremap Q <nop>

nnoremap ; :
nnoremap <C-z> <nop>
set wildignore+=*/dist/*,*/node_modules/*

set nobackup
set noswapfile
"----------------------------------------------------
" pcごとの設定を読み込む
"----------------------------------------------------
function! GetComputerName()
  if has('mac')
    return trim(system('scutil --get ComputerName'))
  elseif has('unix')
    return trim(system('hostname'))
  elseif has('win32')
    return trim(system('hostname'))
  else
    return 'unknown'
  endif
endfunction

let pcname = GetComputerName()
let filepath = $HOME . '/dotfiles/.vim/custom.' . pcname . '.vim'
if filereadable(filepath)
    execute 'source ' . filepath
endif

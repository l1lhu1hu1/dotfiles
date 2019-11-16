"----------------------------------------------------
" Vim Plug Core  Setting
"----------------------------------------------------
if has('vim_starting')
  set nocompatible
endif

let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

let g:vim_bootstrap_langs = "go,html,javascript,python,ruby"
let g:vim_bootstrap_editor = "nvim" " nvim or vim

if !filereadable(vimplug_exists)
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

"----------------------------------------------------
" Plug Install Packages Setting
"----------------------------------------------------
call plug#begin(expand('~/.config/nvim/plugged'))

Plug 'tpope/vim-commentary'
Plug 'rhysd/accelerated-jk'
Plug 'bfredl/nvim-miniyank'

Plug 'tpope/vim-abolish'
" use :S to subtitute words or serach for words
Plug 'vim-syntastic/syntastic'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'cohama/lexima.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
" TODO gitgutterいれたい
Plug 'benekastah/neomake'
Plug 'benjie/neomake-local-eslint.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'editorconfig/editorconfig-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'moll/vim-node'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'sjl/badwolf'
Plug 'vimlab/split-term.vim'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'w0rp/ale'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

let g:make = 'gmake'
if exists('make')
  let g:make = 'make'
  Plug 'Shougo/vimproc.vim', {'do': g:make}
endif

if filereadable(expand("~/.config/nvim/local_bundles.vim"))
  source ~/.config/nvim/local_bundles.vim
endif

let g:neosnippet#snippets_directory='~/dotfiles/vim-snippets/'
let g:neosnippet#enable_completed_snippet = 1

call plug#end()
let g:deoplete#enable_at_startup = 1

"----------------------------------------------------
" Go and JS Setting
"----------------------------------------------------
" 保存時に必要なimportを自動的に挿入
autocmd! BufWritePost * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:vim_jsx_pretty_colorful_config = 1 " default 0
let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

"----------------------------------------------------
" Go Setting
"----------------------------------------------------
let g:go_fmt_command = "goimports"
autocmd FileType go nmap ge <Plug>(go-def-vertical)
autocmd FileType go nmap gr :GoRun %<CR> 

"----------------------------------------------------
" Search Setting
"----------------------------------------------------
set ignorecase
" 検索の時に大文字が含まれている場合は区別して検索する
set smartcase
" 最後まで検索したら先頭に戻る
set wrapscan
" インクリメンタルサーチを使わない
set noincsearch
" 検索結果文字列のハイライトを有効にする
set hlsearch
set rtp+=/usr/local/opt/fzf

"----------------------------------------------------
" Cursor Setting
"----------------------------------------------------
" カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set whichwrap=b,s,h,l,<,>,[,],~
" 行番号を表示
set number
" カーソルラインをハイライト
set cursorline
set backspace=indent,eol,start " バックスペースキーの有効化
if has('mouse')
  set mouse=a
endif
" TODO 調べる
"set mousemodel=popup

"----------------------------------------------------
" Visual Setting
"----------------------------------------------------
syntax enable
" syntax on
colorscheme badwolf
highlight Normal ctermbg=none
" autocmd colorscheme badwolf highlight Visual ctermbg=8
hi Visual ctermfg=255 ctermbg=39
let g:badwolf_original = 1
let g:airline_powerline_fonts = 1
set list
set listchars=tab:»-,trail:-,nbsp:%,eol:↲
set showcmd
" 入力中のコマンドをステータスに表示する
set laststatus=2
" ステータスラインを常に表示
set showmode
" 現在のモードを表示
set ruler

"----------------------------------------------------
" StatusLine Setting
"----------------------------------------------------
" ステータスラインの右側にカーソルの位置を表示する
set statusline=%n\:%y%F\ \|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}%m%r%=<%l/%L:%p%%>
" ステータスラインに表示する情報の指定
highlight StatusLine term=NONE cterm=NONE ctermfg=black ctermbg=white
" ステータスラインの色
let g:airline_theme = 'aurora'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#fnamemod = ':t'

"----------------------------------------------------
" Indent Setting
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
"martindentで増減する幅
set shiftwidth=2
filetype plugin indent on
"let g:indent_guides_enable_on_vim_startup=1 " indent colors
"let g:indent_guides_start_level = 1 " 1インデント目からガイドする
"let g:indent_guides_auto_colors = 0 " 自動カラーを無効にして手動で設定する
"let g:indent_guides_guide_size = 1 " ガイドの幅
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#010101  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#0F0F0F  ctermbg=233

"----------------------------------------------------
" Bracket and Tag Setting
"----------------------------------------------------
set showmatch " 括弧の対応関係を一瞬表示する
source $VIMRUNTIME/macros/matchit.vim " Vimの「%」を拡張する

"----------------------------------------------------
" Font and Encode Setting
"----------------------------------------------------
set fileencodings=utf-8,iso-2022-jp,sjis,ccp932,euc-jp " 読み込み時の文字コードの自動判別. 左側が優先される
set encoding=utf-8
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=double " □や○文字が崩れる問題を解決

"----------------------------------------------------
" Clipboard and Paste Setting
"----------------------------------------------------
" ヤンクをクリップボードへ
set clipboard=unnamed
" 挿入モードでクリップボードからペーストする時に自動でインデントさせないようにする
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"
    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction
    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

"----------------------------------------------------
" Other Setting
"----------------------------------------------------
" バッファを切替えてもundoの効力を失わない
"set hidden
set nobackup
set noswapfile
let g:tex_conceal = ''
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

" ESCキーを押した時にIMEに無効化させる
if has('mac')
  let g:imeoff = 'osascript -e "tell application \"System Events\" to key code 102"'
  augroup MyIMEGroup
    autocmd!
    autocmd InsertLeave * :call system(g:imeoff)
  augroup END
endif

:source ~/dotfiles/.custom.vim

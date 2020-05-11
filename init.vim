"----------------------------------------------------
" vim-plug core  setting
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
" ###################################################
"----------------------------------------------------
call plug#begin(expand('~/.config/nvim/plugged'))
"----------------------------------------------------
" theme plugins
"----------------------------------------------------
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'nathanaelkane/vim-indent-guides'
" indent可視化
Plug 'ntpeters/vim-better-whitespace'
" trailing space可視化

"----------------------------------------------------
" utility plugins
"----------------------------------------------------
Plug 'tpope/vim-commentary'
" comment out with gc and gcc
Plug 'rhysd/accelerated-jk'
" faster jk movement
Plug 'bfredl/nvim-miniyank'
" yank setting for nvim
Plug 'tpope/vim-abolish'
" replace and search plugin
Plug 'vimlab/split-term.vim'
" open terminal in vim
Plug 'easymotion/vim-easymotion'
" make vim moves like vimium
Plug 'preservim/nerdtree'
" file or folder search by tree
Plug 'kien/ctrlp.vim'
" file or folder search
Plug 'simeji/winresizer'
" window resizer
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" fzf

" Plug 'terryma/vim-multiple-cursors'
" 現状使用していない

"----------------------------------------------------
" syntax check
"----------------------------------------------------
Plug 'dense-analysis/ale'
" stands for Asynchronous Lint Engine. stntax checking and semantic errors

"----------------------------------------------------
" snippet and template plugins
"----------------------------------------------------
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'mattn/vim-sonictemplate'

"----------------------------------------------------
" completion and formatter plugins
"----------------------------------------------------
Plug 'alvan/vim-closetag'
" auto close html or jsx tag completion
Plug 'cohama/lexima.vim'
" auto close completion for ", ', (, etc
Plug 'tpope/vim-surround'
" replace tag name to different tag name. eg) <h1>hello</h1> to <h2>hello</h2>
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
" deoplete source for go
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
" deoplete source for javascript

"----------------------------------------------------
" language dependant plugins
"----------------------------------------------------
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" go formatter and go command exectuion(GoRun, GoFormat, etc)

"----------------------------------------------------
" syntax highlighting plugins
"----------------------------------------------------
Plug 'pangloss/vim-javascript'
" javascript syntax highlighting
Plug 'leafgarland/typescript-vim'
" typescript syntax highlighting
Plug 'dart-lang/dart-vim-plugin'
" dart syntax highlighting
Plug 'maxmellon/vim-jsx-pretty'
" jsx syntax highlighting
"----------------------------------------------------
" process management plugins
"----------------------------------------------------
let g:make = 'gmake'
if exists('make')
  let g:make = 'make'
  Plug 'Shougo/vimproc.vim', {'do': g:make}
  " 非同期処理で重たい処理を実行する(saveに時間がかかってしまう時とかに、vimの操作自体をブロックしない)
endif

call plug#end()
"----------------------------------------------------
" ###################################################
"----------------------------------------------------

let g:indent_guides_enable_on_vim_startup = 1
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:neosnippet#snippets_directory='~/dotfiles/vim-snippets'
let g:neosnippet#enable_completed_snippet = 1

let g:deoplete#enable_at_startup = 1
let NERDTreeShowHidden = 1
let g:sonictemplate_vim_template_dir = ['~/.config/nvim/templates']
let g:winresizer_start_key = '<c-w>'
autocmd CompleteDone * silent! pclose!
" completionの候補の詳細がwindowとして出てきた後にescを押したら消える

"----------------------------------------------------
" js settings
"----------------------------------------------------
" 保存時に必要なimportを自動的に挿入
let g:vim_jsx_pretty_colorful_config = 1 " default 0
let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:closetag_filenames = '*.html,*.js,*.jsx'

"----------------------------------------------------
" go settings
"----------------------------------------------------
let g:go_template_autocreate = 0
let g:go_fmt_command = "goimports"
let g:go_term_mode = "tabe"
autocmd FileType go nmap ge <Plug>(go-def-tab)
autocmd FileType go nmap gr :GoRun %:p<CR>
let g:go_snippet_engine = ""
" fnとかのスニペットでこれをしないとconflictが起きてしまう

"----------------------------------------------------
" flutter settings
"----------------------------------------------------
let g:loaded_syntastic_dart_dartanalyzer_checker = 0
autocmd FileType dart nmap ff :!flutter format %:p<CR>
"----------------------------------------------------
" search settings
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
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

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
if has('mouse')
  set mouse=a
endif

"----------------------------------------------------
" visual settings
"----------------------------------------------------
syntax enable
" syntax on
let g:gruvbox_contrast_light = "hard"

set background=light

colorscheme gruvbox

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
" statusLine settings
"----------------------------------------------------
" ステータスラインの右側にカーソルの位置を表示する
" ステータスラインに表示する情報の指定
let g:airline_theme = 'luna'
let g:airline_powerline_fonts = 1
" ステータスラインの色
let g:airline#extensions#tabline#enabled = 1
" tablineの表示
let g:airline#extensions#tabline#buffer_idx_mode = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1
" tabの番号表示
let g:airline#extensions#tabline#fnamemod = ':t'
" file名だけを表示するために必要

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
source $VIMRUNTIME/macros/matchit.vim " Vimの「%」を拡張する

"----------------------------------------------------
" font and encoding settings
"----------------------------------------------------
set fileencodings=utf-8,iso-2022-jp,sjis,ccp932,euc-jp " 読み込み時の文字コードの自動判別. 左側が優先される
set encoding=utf-8
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=double " □や○文字が崩れる問題を解決

"----------------------------------------------------
" clipboard and paste settings
"----------------------------------------------------
set clipboard=unnamed
" ヤンクをクリップボードへ
" if &term =~ "xterm"
"     let &t_SI .= "\e[?2004h"
"     let &t_EI .= "\e[?2004l"
"     let &pastetoggle = "\e[201~"
"     function XTermPasteBegin(ret)
"         set paste
"         return a:ret
"     endfunction
"     inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
" endif
" 挿入モードでクリップボードからペーストする時に自動でインデントさせないようにする

"----------------------------------------------------
" other settings
"----------------------------------------------------
" set hidden
set nobackup
set noswapfile
let g:tex_conceal = ''
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

" ESCキーを押した時にIMEに無効化させる
" if has('mac')
"   let g:imeoff = 'osascript -e "tell application \"System Events\" to key code 102"'
"   augroup MyIMEGroup
"     autocmd!
"     autocmd InsertLeave * :call system(g:imeoff)
"   augroup END
" endif

:source ~/dotfiles/.custom.vim

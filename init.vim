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
Plug 'sjl/badwolf'

" Plug 'editorconfig/editorconfig-vim'
" 現状使用していない

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
" TODO compare. どれか一つだけでいいはず
Plug 'dense-analysis/ale'
" stands for Asynchronous Lint Engine. stntax checking and semantic errors
Plug 'neomake/neomake'
Plug 'benjie/neomake-local-eslint.vim'
" TODO これは必要そうかどうかを確認する(aleかneomakeを使うかによって変わる(?))
" Plug 'vim-syntastic/syntastic'
" for syntax checking

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

" Plug 'thosakwe/vim-flutter'
" 現状使いづらいから使うのを辞めている

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

let g:neosnippet#snippets_directory='~/dotfiles/vim-snippets'
let g:neosnippet#enable_completed_snippet = 1
let g:deoplete#enable_at_startup = 1
let NERDTreeShowHidden = 1
let g:sonictemplate_vim_template_dir = ['~/.config/nvim/templates']
let g:winresizer_start_key = '<c-w>'

"----------------------------------------------------
" js settings
"----------------------------------------------------
" 保存時に必要なimportを自動的に挿入
autocmd! BufWritePost Neomake "保存時に実行する
let g:neomake_javascript_enabled_makers = ['eslint']
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
autocmd FileType go nmap ge <Plug>(go-def-vertical)
autocmd FileType go nmap gr :GoRun %:p<CR>
let g:go_snippet_engine = ""

"----------------------------------------------------
" flutter settings
"----------------------------------------------------
let g:loaded_syntastic_dart_dartanalyzer_checker = 0
"let g:hot_reload_on_save = 1
"let g:flutter_show_log_on_run = 0

"function RunFlutterTab()
"  :FlutterRun
"  :FlutterTab
"endfunction

"function QuitFlutter()
"  :FlutterQuit
"  "TODO __flutter__log以外を保存する処理に変える
"  "TODO or __flutter__logを消す処理に変える
"  :wqa!
"endfunction

"autocmd FileType dart nmap fr :exec RunFlutterTab()<CR>
"autocmd FileType dart nmap fq :exec QuitFlutter()<CR>

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
colorscheme badwolf
highlight Normal ctermbg=none
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
" statusLine settings
"----------------------------------------------------
" ステータスラインの右側にカーソルの位置を表示する
set statusline=%n\:%y%F\ \|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}%m%r%=<%l/%L:%p%%>
" ステータスラインに表示する情報の指定
highlight StatusLine term=NONE cterm=NONE ctermfg=black ctermbg=white
" ステータスラインの色
let g:airline_theme = 'luna'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#fnamemod = ':t'

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
"martindentで増減する幅
set shiftwidth=2
filetype plugin indent on
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#010101  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#0F0F0F  ctermbg=233

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
" 挿入モードでクリップボードからペーストする時に自動でインデントさせないようにする

"----------------------------------------------------
" other settings
"----------------------------------------------------
set hidden
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

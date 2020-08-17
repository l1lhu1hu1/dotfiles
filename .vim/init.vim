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
" colorscheme
Plug 'morhetz/gruvbox'
" indent可視化
Plug 'nathanaelkane/vim-indent-guides'
" trailing space可視化
Plug 'ntpeters/vim-better-whitespace'

"----------------------------------------------------
" utility plugins
"----------------------------------------------------
" comment out with gc and gcc
Plug 'tpope/vim-commentary'
" faster jk movement
Plug 'rhysd/accelerated-jk'
" yank setting for nvim
Plug 'bfredl/nvim-miniyank'
" replace and search plugin
" TODO 使い方(現状使えてない)
Plug 'tpope/vim-abolish'
" open terminal in vim
Plug 'vimlab/split-term.vim'
" make vim moves like vimium
Plug 'easymotion/vim-easymotion'
" file or folder search by tree
Plug 'preservim/nerdtree'
" file or folder search
Plug 'kien/ctrlp.vim'
" window resizer
Plug 'simeji/winresizer'
" fzf
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'pseewald/vim-anyfold'
" Plug 'terryma/vim-multiple-cursors'
" 現状使用していない

"----------------------------------------------------
" syntax check
"----------------------------------------------------
Plug 'dense-analysis/ale'
" stands for Asynchronous Lint Engine. stntax checking and semantic errors
"----------------------------------------------------
" git manipulater
"----------------------------------------------------
Plug 'tpope/vim-fugitive'
" for Gbrowse
Plug 'tpope/vim-rhubarb'
"----------------------------------------------------
" snippet and template plugins
"----------------------------------------------------
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'mattn/vim-sonictemplate'

"----------------------------------------------------
" completion and formatter plugins
"----------------------------------------------------
" auto close html or jsx tag completion
Plug 'alvan/vim-closetag'
" auto close completion for ", ', (, etc
Plug 'cohama/lexima.vim'
" replace tag name to different tag name. eg) <h1>hello</h1> to <h2>hello</h2>
" TODO 使い方(現状使えてない)
Plug 'tpope/vim-surround'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
" deoplete source for go
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
" deoplete source for javascript
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }

" for disabling json conceal function
Plug 'elzr/vim-json'


"----------------------------------------------------
" language dependant plugins
"----------------------------------------------------
" go formatter and go command exectuion(GoRun, GoFormat, etc)
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" c++ formatter
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

"----------------------------------------------------
" syntax highlighting plugins
"----------------------------------------------------
" javascript syntax highlighting
Plug 'pangloss/vim-javascript'
" typescript syntax highlighting
Plug 'leafgarland/typescript-vim'
" dart syntax highlighting
Plug 'dart-lang/dart-vim-plugin'
" jsx syntax highlighting
Plug 'maxmellon/vim-jsx-pretty'
" md syntax highlighting
Plug 'tpope/vim-markdown'
" Plug 'scrooloose/syntastic'
"----------------------------------------------------
" process management plugins
"----------------------------------------------------
let g:make = 'gmake'
if exists('make')
  let g:make = 'make'
  " 非同期処理で重たい処理を実行する(saveに時間がかかってしまう時とかに、vimの操作自体をブロックしない)
  Plug 'Shougo/vimproc.vim', {'do': g:make}
endif

call plug#end()
"----------------------------------------------------
" ###################################################
"----------------------------------------------------
let g:indent_guides_enable_on_vim_startup = 1
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:neosnippet#snippets_directory='~/dotfiles/.vim/vim-snippets'
let g:neosnippet#enable_completed_snippet = 1

let g:deoplete#enable_at_startup = 1
let NERDTreeShowHidden = 1
let g:sonictemplate_vim_template_dir = ['~/.config/nvim/templates']
let g:winresizer_start_key = '<c-w>'

autocmd Filetype * AnyFoldActivate
" open all folds
set foldlevel=99
" let g:anyfold_identify_comments = 2
" let g:anyfold_fold_comments=1

autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s
" completionの候補の詳細がwindowとして出てきた後にescを押したら消える
autocmd CompleteDone * silent! pclose!

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
let g:ale_fix_on_save = 1

"----------------------------------------------------
" md settings
"----------------------------------------------------
au BufRead,BufNewFile *.md set filetype=markdown
let g:markdown_fenced_languages = ['javascript', 'ruby', 'go', 'cpp']
let g:markdown_syntax_conceal = 0
"----------------------------------------------------
" go settings
"----------------------------------------------------
let g:go_template_autocreate = 0
autocmd FileType go nmap ge <Plug>(go-def-tab)
autocmd FileType go nmap gr :GoRun %:p<CR>
" fnとかのスニペットでこれをしないとconflictが起きてしまう
let g:go_snippet_engine = ""
let g:go_fmt_fail_silently = 1
let g:ale_linters = {
\   'go': ['gobuild'],
\}
let g:go_fmt_command = "goimports"
" let g:go_term_mode = "tabe"
" let g:go_metalinter_autosave = 1

let g:vim_json_syntax_conceal = 0
"----------------------------------------------------
" flutter settings
"----------------------------------------------------
let g:loaded_syntastic_dart_dartanalyzer_checker = 0
autocmd FileType dart nmap ff :!flutter format %:p<CR>
"----------------------------------------------------
" c++, c, python, rust and etc settings
"----------------------------------------------------
augroup autoformat_settings
  autocmd FileType c,cpp AutoFormatBuffer clang-format
  autocmd FileType python AutoFormatBuffer yapf
  autocmd FileType rust AutoFormatBuffer rustfm
augroup END
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
" mouseを無効化
set mouse=

"----------------------------------------------------
" visual settings
"----------------------------------------------------
syntax enable
" syntax on

set background=light

colorscheme gruvbox

" highlight Cursor guifg=white guibg=white
set list
set listchars=tab:»-,trail:-,nbsp:%,eol:↲
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
let g:airline_theme = 'luna'
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
" ヤンクをクリップボードへ
set clipboard=unnamed

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

"----------------------------------------------------
" nvim clipboard key mappings
"----------------------------------------------------
" noremapはユーザーが定義した他のマップの影響を受けない
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
nmap <silent><Space>cp :let @+=expand("%:p")<CR>

"----------------------------------------------------
" fzf key mappings
"----------------------------------------------------
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>
let g:fzf_layout = { 'window': '-tabnew' }
" fzfではTabでいくつかの候補を取っておける
nnoremap [fzf] <Nop>
nmap     <Space>f [fzf]
nnoremap <silent> [fzf]h :<C-u>:History<CR>
nnoremap <silent> [fzf]r :Rg <C-R><C-W><CR>
nnoremap <Space>r :<C-u>source ~/.config/nvim/init.vim<CR>
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

inoremap <expr> <C-n> pumvisible() ? "" : "\<C-n>"
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-p> pumvisible() ? "" : "\<C-p>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

"----------------------------------------------------
" tabs and window key mappings
"----------------------------------------------------
function! TabMove(direction)
  let s:current_tab=tabpagenr()
  let s:total_tabs = tabpagenr("$")

  " Wrap to end
  if s:current_tab == 1 && a:direction == -1
    tabmove
    " Wrap to start
  elseif s:current_tab == s:total_tabs && a:direction == 1
    tabmove 0
    " Normal move
  else
    execute (a:direction > 0 ? "+" : "-") . "tabmove"
  endif
  echo "Moved to tab " . tabpagenr() . " (previosuly " . s:current_tab . ")"
endfunction

" The prefix key.
nnoremap [Tag] <Nop>
nmap t [Tag]
" Tab jump. t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

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
nmap gt <Nop>
nmap gT <Nop>
nnoremap fH :call TabMove(-1)<CR>
nnoremap fL :call TabMove(1)<CR>

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
let g:EasyMotion_do_mapping = 0
nnoremap <C-j> *
nnoremap <C-k> #
nnoremap  <C-c><C-c> :<C-u>nohlsearch<cr><Esc>

"----------------------------------------------------
" completion key mappings
"----------------------------------------------------
imap <C-i> <Plug>(neosnippet_expand_or_jump)
smap <C-i> <Plug>(neosnippet_expand_or_jump)
xmap <C-i> <Plug>(neosnippet_expand_target)

imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"----------------------------------------------------
" other key mappings
"----------------------------------------------------
" xした結果をレジスタに保存しない
nnoremap x "_x

nnoremap ZZ <nop>
nnoremap ZQ <nop>
nnoremap Q <nop>

nnoremap <silent><C-e> :NERDTreeToggle<CR>
nmap <Leader>e <Plug>(easymotion-overwin-f2)
" for :term
tnoremap <Esc><Esc> <C-\><C-n>
nmap <silent><Space>tt :tabe\|:term<CR>
nmap <silent><Space>ts :vs\|:term<CR>

nnoremap ; :
nmap tm :Tem main %<CR>

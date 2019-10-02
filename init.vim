"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
if has('vim_starting')
  set nocompatible " Be iMproved
endif

" ESCキーを押した時にIMEに無効化させる
if has('mac')
  let g:imeoff = 'osascript -e "tell application \"System Events\" to key code 102"'
  augroup MyIMEGroup
    autocmd!
    autocmd InsertLeave * :call system(g:imeoff)
  augroup END
endif

let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

let g:vim_bootstrap_langs = "go,html,javascript,python,ruby"
let g:vim_bootstrap_editor = "nvim" " nvim or vim
" let g:python3_host_prog = system('type pyenv &>/dev/null && echo -n "$(pyenv root)/versions/$(cat $(pyenv root)/version | head -n 1)/bin/python" || echo -n $(which python)')


if !filereadable(vimplug_exists)
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

Plug 'tpope/vim-commentary'
" gc to comment out a line and gcap to comment out a paragraph

"Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-rhubarb'
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
" htmlタグとか""で囲みたい時に便利
" Plug 'airblade/vim-gitgutter'
Plug 'cohama/lexima.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
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
" Plug cok 検討する
"TODO $GOPATHの設定について見直さないとGoDocが動かない

let g:make = 'gmake'
if exists('make')
  let g:make = 'make'
  Plug 'Shougo/vimproc.vim', {'do': g:make}
endif

"" Include user's extra bundle
if filereadable(expand("~/.config/nvim/local_bundles.vim"))
  source ~/.config/nvim/local_bundles.vim
endif

call plug#end()

" Required

"*****************************************************************************
"" Basic Setting
"*****************************************************************************
" Visual modeでのpasteを直す
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
filetype plugin indent on
set rtp+=/usr/local/opt/fzf
syntax enable
let g:deoplete#enable_at_startup = 1
" 保存時に必要なimportを自動的に挿入
autocmd! BufWritePost * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:go_fmt_command = "goimports"
let g:vim_jsx_pretty_colorful_config = 1 " default 0
let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
" let g:ale_fix_on_save = 1
" LSPに任せる機能をOFFにする
" let g:go_def_mapping_enabled = 0
" let g:go_doc_keywordprg_enabled = 0
"*****************************************************************************
"" Search Setting
"*****************************************************************************
set ignorecase
" 検索の時に大文字が含まれている場合は区別して検索する
set smartcase
" 最後まで検索したら先頭に戻る
set wrapscan
" インクリメンタルサーチを使わない
set noincsearch
" 検索結果文字列のハイライトを有効にする
set hlsearch
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>
" 改行時に前の行の構文をチェックし次の行のインデントを増減する
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
" nnoremap <silent> [fzf]f :<C-u>:GFiles?<CR>
" nnoremap <silent> [fzf]a :<C-u>:GFiles<CR>
" nnoremap <Space><Space> :<C-u>:Buffers<CR>
nnoremap <silent> [fzf]s :call fzf#run({'source': 'git grep ' . expand('<cword>'), 'sink': function('Extract_from_grep')})<CR>
command! -nargs=1 V call fzf#run({'source': 'rg -n "' . expand('<args>') . '"', 'sink': function('Extract_from_grep')})
function! s:escape(path)
  return substitute(a:path, ' ', '\\ ', 'g')
endfunction

function! Extract_from_grep(line)
  let parts = split(a:line, ':')
  let [fn, lno] = parts[0 : 1]
  execute 'e '. s:escape(fn)
  execute lno
  normal! zz
endfunction

"*****************************************************************************
"" Cursor Setting
"*****************************************************************************
set whichwrap=b,s,h,l,<,>,[,],~
" カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set number
" 行番号を表示
set cursorline
" カーソルラインをハイライト
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap G Gzz
nnoremap j gjzz
nnoremap k gkzz
nnoremap <down> gj
nnoremap <up> gk
set backspace=indent,eol,start " バックスペースキーの有効化
if has('mouse')
  set mouse=a
endif
" TODO 調べる
"set mousemodel=popup
"*****************************************************************************
"" Visual Setting
"*****************************************************************************
syntax on
colorscheme badwolf
highlight Normal ctermbg=none
autocmd colorscheme badwolf highlight Visual ctermbg=8
let g:badwolf_original = 1
let g:airline_powerline_fonts = 1
set list
set listchars=tab:»-,trail:-,nbsp:%,eol:↲
"*****************************************************************************
"" Status Line Setting
"*****************************************************************************
set showcmd
" 入力中のコマンドをステータスに表示する
set laststatus=2
" ステータスラインを常に表示
set showmode
" 現在のモードを表示
set ruler
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
"*****************************************************************************
" Tab and Indent Setting
"*****************************************************************************
set expandtab
" タブ入力を複数の空白入力に置き換える
set tabstop=2
" 画面上でタブ文字が占める幅
set softtabstop=2
" 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent
" 改行時に前の行のインデントを継続する
set smartindent
" 改行時に前の行の構文をチェックし次の行のインデントを増減する
set shiftwidth=2
"martindentで増減する幅
set clipboard=unnamed
" ヤンクをクリップボードへ
"let g:indent_guides_enable_on_vim_startup=1 " indent colors
"let g:indent_guides_start_level = 1 " 1インデント目からガイドする
"let g:indent_guides_auto_colors = 0 " 自動カラーを無効にして手動で設定する
"let g:indent_guides_guide_size = 1 " ガイドの幅
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#010101  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#0F0F0F  ctermbg=233
"*****************************************************************************
" Bracket and Tag Setting
"*****************************************************************************
set showmatch " 括弧の対応関係を一瞬表示する
source $VIMRUNTIME/macros/matchit.vim " Vimの「%」を拡張する
"*****************************************************************************
" Font and Encoding Setting
"*****************************************************************************
set fileencodings=utf-8,iso-2022-jp,sjis,ccp932,euc-jp " 読み込み時の文字コードの自動判別. 左側が優先される
set encoding=utf-8
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=double " □や○文字が崩れる問題を解決
"*****************************************************************************
" Clipboard Paste Setting
"*****************************************************************************
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
autocmd FileType go nnoremap <silent><Space>gr :GoRun %<CR> 
nnoremap <silent><C-e> :NERDTreeToggle<CR>
let g:tex_conceal = ''
" let g:split_term_default_shell = "zsh"
inoremap <silent> jj <ESC>:<C-u>w<CR>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

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

nnoremap fH :call TabMove(-1)<CR>
nnoremap fL :call TabMove(1)<CR>

:source ~/dotfiles/.custom.vim

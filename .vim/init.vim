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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" colorscheme
Plug 'dracula/vim', { 'as': 'dracula' }
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
Plug 'tpope/vim-abolish'
" open terminal in vim
Plug 'vimlab/split-term.vim'
" make vim moves like vimium
" Plug 'easymotion/vim-easymotion'
Plug 'phaazon/hop.nvim'
" file or folder search by tree
Plug 'preservim/nerdtree'
" file or folder search
Plug 'ctrlpvim/ctrlp.vim'
" window resizer
Plug 'simeji/winresizer'
" emmet
Plug 'mattn/emmet-vim'
" fzf
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'pseewald/vim-anyfold'

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
" Plug 'tpope/vim-rhubarb'
"----------------------------------------------------
" snippet and template plugins
"----------------------------------------------------
" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'
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

" Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }

" for disabling json conceal function
Plug 'elzr/vim-json'

"----------------------------------------------------
" syntax highlighting plugins
"----------------------------------------------------
" javascript syntax highlighting
Plug 'pangloss/vim-javascript'
" typescript syntax highlighting
Plug 'leafgarland/typescript-vim'
" jsx syntax highlighting
Plug 'maxmellon/vim-jsx-pretty'
" dart syntax highlighting
Plug 'dart-lang/dart-vim-plugin'
" md syntax highlighting
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'prisma/vim-prisma'
" Plug 'scrooloose/syntastic'
" rust file detection, syntax highlighting, formatting and more
Plug 'rust-lang/rust.vim'

Plug 'lervag/vimtex'
Plug 'tpope/vim-obsession'
Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript'],
  \ 'do': 'make install'
\}
Plug 'preservim/tagbar'
Plug 'github/copilot.vim'
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
" hop設定
"----------------------------------------------------
lua require'hop'.setup()
nnoremap <Space>e :HopWord<CR>
"----------------------------------------------------
" ###################################################
"----------------------------------------------------
let g:indent_guides_enable_on_vim_startup = 1
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:dracula_italic=0

let NERDTreeShowHidden = 1
let NERDTreeQuitOnOpen=1
let g:sonictemplate_vim_template_dir = ['~/.config/nvim/templates']
let g:winresizer_start_key = '<c-w>'

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal_code_blocks = 0
set splitright

autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s
" completionの候補の詳細がwindowとして出てきた後にescを押したら消える
autocmd CompleteDone * silent! pclose!
"----------------------------------------------------
" c++, c, python and etc settings
"----------------------------------------------------
augroup autoformat_settings
  autocmd FileType c,cpp AutoFormatBuffer clang-format
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
    \ 'css': ['stylelin'],
    \ 'scss': ['stylelint'],
    \ 'html': ['prettier'],
    \ 'rust': ['rustfmt'],
    \ 'go': ['gobuild'],
\ }

let g:ale_linters = {
    \ 'javascript': ['eslint'],
    \ 'typescript': ['eslint'],
    \ 'python': ['flake8'],
    \ 'css': ['stylelin'],
    \ 'scss': ['stylelint'],
    \ 'html': ['prettier'],
    \ 'rust': ['rls'],
    \ 'go': ['gobuild'],
\ }

let g:ale_rust_rls_toolchain = 'stable'
let g:ale_rust_rls_config = {
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

let g:closetag_filenames = '*.html,*.js,*.jsx,*.tsx,*.php'
let g:cargo_shell_command_runner = 'noautocmd vnew | terminal'

function! ToggleLoclist(cmd)
  " TODO この条件を置き換える
  " 引数(cmd)なしで、すでにloclistが開いているときは閉じて、
  " loclistがないときは、開くように変える
  if a:cmd == 'open'
    vert lopen 30
  else
    lclose
  endif
endfunction

" errorとwarningをリアルタイムで出すと重くなるのでこのようにしている
nnoremap <silent><Space>lg :call ToggleLoclist('open')<CR>
nnoremap <silent><Space>lc :call ToggleLoclist('close')<CR>

" ファイルが閉じられたら、一緒にloclistのタブも閉じる
augroup CloseLoclistWindowGroup
  autocmd!
  autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END
"----------------------------------------------------
" md tex settings
"----------------------------------------------------
au BufRead,BufNewFile *.md set filetype=markdown
let g:markdown_fenced_languages = ['javascript', 'ruby', 'go', 'cpp']
let g:vim_markdown_conceal = 0
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0

"----------------------------------------------------
" go settings
"----------------------------------------------------
let g:go_template_autocreate = 0
" TODO aleからできるかチェックする
autocmd FileType go nnoremap ge <Plug>(go-def-tab)
" autocmd FileType go nmap gr <Plug>(go-run-vertical)
" fnとかのスニペットでこれをしないとconflictが起きてしまう
let g:go_snippet_engine = ""
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
" let g:go_term_mode = 'tabe'
" let g:go_metalinter_autosave = 1

let g:vim_json_syntax_conceal = 0
"----------------------------------------------------
" flutter settings
"----------------------------------------------------
let g:loaded_syntastic_dart_dartanalyzer_checker = 0
autocmd FileType dart nnoremap ff :!flutter format %:p<CR>
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
" set mouse=

"----------------------------------------------------
" visual settings
"----------------------------------------------------
syntax enable
" syntax on
colorscheme dracula

hi Visual guifg=#000000 guibg=#FFFFFF gui=none
set list
set listchars=tab:»-,trail:-,nbsp:%,eol:↩
" 入力中のコマンドをステータスに表示する
set showcmd
" ステータスラインを常に表示
set laststatus=2
" 現在のモードを表示
set showmode
set ruler
"----------------------------------------------------
" tagbar settings
"----------------------------------------------------
nnoremap <silent> <Space>tb :TagbarToggle<CR>
let g:tagbar_sort = 0
let g:tagbar_compact = 1
let g:tagbar_foldlevel = 0
let g:tagbar_show_tag_linenumbers = 2
" tagbar windowが開いているときにsを無効化(space+shとの衝突を避けるため)
let g:tagbar_map_togglesort = ''
let g:tagbar_type_typescript = {
    \ 'ctagstype' : 'typescript',
    \ 'kinds'     : [
        \ 'f:functions',
        \ 'c:classes',
        \ 'm:methods',
        \ 'p:properties',
        \ 'g:generator functions',
        \ 'a:async functions',
        \ 'I:interfaces',
        \ 'E:exported variables/constants/functions/classes',
        \ 'i:imports'
    \ ]
\ }

let g:tagbar_type_javascript = {
    \ 'ctagstype' : 'javascript',
    \ 'kinds'     : [
        \ 'f:functions',
        \ 'c:classes',
        \ 'm:methods',
        \ 'p:properties',
        \ 'g:generator functions',
        \ 'a:async functions',
        \ 'E:exported variables/constants/functions/classes',
        \ 'i:imports'
    \ ]
\ }
"----------------------------------------------------
" statusLine settings
"----------------------------------------------------
" vim-airline のステータスラインに現在のタグを表示するための関数
function! CurrentTagInfo()
    return tagbar#currenttag('%s', '', 'f')
endfunction

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
let g:airline_section_c = '%{CurrentTagInfo()}'
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

"----------------------------------------------------
" clipboard and paste settings
"----------------------------------------------------
" ヤンクをクリップボードへ
set clipboard=unnamed
"----------------------------------------------------
" git
"----------------------------------------------------
nnoremap <space>gd :Gvdiffsplit<CR>
"----------------------------------------------------
" anyfold settings
"----------------------------------------------------
autocmd Filetype * AnyFoldActivate
set foldlevel=99
hi Folded term=NONE cterm=NONE
augroup anyfoldSettings
  autocmd!
  autocmd User anyfoldLoaded nmap fj [[
  autocmd User anyfoldLoaded nmap fk ]]
  autocmd User anyfoldLoaded nnoremap fo zo
  autocmd User anyfoldLoaded nnoremap zo zR
  autocmd User anyfoldLoaded nnoremap fc zc
  autocmd User anyfoldLoaded nnoremap zc zM
augroup END
"----------------------------------------------------
" nvim clipboard key mappings
"----------------------------------------------------
" noremapはユーザーが定義した他のマップの影響を受けない
noremap p <Plug>(miniyank-autoput)
noremap P <Plug>(miniyank-autoPut)
nnoremap <silent><Space>cp :let @+=expand("%:p")<CR>

"----------------------------------------------------
" fzf key mappings
"----------------------------------------------------
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>
let g:fzf_layout = { 'window': '-tabnew' }
" fzfではTabでいくつかの候補を取っておける
nnoremap <silent> <Space>fh :<C-u>:History<CR>
nnoremap <silent> <Space>fr :Rg <C-R><C-W><CR>
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
" coc settings
"----------------------------------------------------
highlight CocErrorSign ctermfg=15 ctermbg=196
highlight CocWarningSign ctermfg=0 ctermbg=172
set updatetime=300
set signcolumn=yes
nnoremap <silent> <space><space> :<C-u>CocList<cr>
nnoremap <silent> <space>h :<C-u>call CocAction('doHover')<cr>
nnoremap <silent> <space>df :call CocAction('jumpDefinition', 'tabe')<cr>
nnoremap <silent> <space>rn <Plug>(coc-rename)
inoremap <silent><expr> <Down> coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"
inoremap <silent><expr> <Up> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"
inoremap <silent><expr> <C-j> coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"
inoremap <silent><expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"
inoremap <silent><expr> <C-l> coc#refresh()
inoremap <C-s> <Plug>(coc-snippets-expand)

if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#pum#next(1):
  \ CheckBackspace() ? "\<Tab>" :
  \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col-1] =~# '\s'
endfunction

nnoremap <silent><Space>jj <Plug>(coc-diagnostic-prev)
nnoremap <silent><Space>kk <Plug>(coc-diagnostic-next)
nnoremap <silent><Space>ll :<C-u>CocDiagnostics<cr>

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
nnoremap gt <Nop>
nnoremap gT <Nop>
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
nnoremap <C-j> *
nnoremap <C-k> #
nnoremap  <C-c><C-c> :<C-u>nohlsearch<cr><Esc>

function! ReplaceWordUnderCursor()
  normal! viw"*y
  let @/ = escape(@*, '/\')
  let cmd = ':%s/'.@/.'/'
  let replaceWith = input('Replace with: ')
  let replaceWithEscaped = escape(replaceWith, '/')
  execute cmd . replaceWithEscaped . '/g'
endfunction

nnoremap <Space>r :call ReplaceWordUnderCursor()<CR>

"----------------------------------------------------
" other key mappings
"----------------------------------------------------
" xした結果をレジスタに保存しない
nnoremap x "_x

nnoremap ZZ <nop>
nnoremap ZQ <nop>
nnoremap Q <nop>

nnoremap <silent><C-e> :NERDTreeToggle<CR>
" for :term
tnoremap <Esc><Esc> <C-\><C-n>
nnoremap <silent><Space>tt :tabe\|:term<CR>
nnoremap <silent><Space>ts :vs\|:term<CR>

nnoremap ; :
nnoremap <C-z> <nop>
nnoremap tm :Tem main %<CR>
set wildignore+=*/dist/*,*/node_modules/*

set nobackup
set noswapfile
let g:tex_conceal = ''

augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END
"----------------------------------------------------
" jsdoc
"----------------------------------------------------
let g:javascript_plugin_jsdoc = 1
let g:jsdoc_default_mapping = 0
nnoremap <silent> <Space>j :JsDoc<CR>

"----------------------------------------------------
" pcごとの設定を読み込む
"----------------------------------------------------
let pcname = trim(system('scutil --get ComputerName'))
let filepath = $HOME . '/dotfiles/.vim/custom.' . pcname . '.vim'
if filereadable(filepath)
    execute 'source ' . filepath
else
  echo 'failed to load: ' . filepath
endif

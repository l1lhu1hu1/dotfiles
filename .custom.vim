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
nnoremap <C-h> <S-j>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

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

" function! s:SID_PREFIX()
"   return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
" endfunction

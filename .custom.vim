nnoremap x "_x
nnoremap s "_s
nnoremap ZZ <nop>
nnoremap ZQ <nop>
nnoremap Q <nop>
let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>q! :q!<CR>
nnoremap <Leader>qa :qa<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>wq! :wq!<CR>
let g:EasyMotion_do_mapping = 0
nmap <Leader>e <Plug>(easymotion-overwin-f2)
noremap <S-h>   ^
noremap <S-j>   }
noremap <S-k>   {
noremap <S-l>   $
"leaderはspaceでSはshift
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
nnoremap <C-j> *
nnoremap <C-k> #
" nnoremap sn gt
" nnoremap sp gT
nnoremap st :<C-u>tabnew<CR>
nnoremap ; :
nnoremap  <C-c><C-c> :<C-u>nohlsearch<cr><Esc>
"s is same as cl
"tabe is tabnew ファイル名と同じ

function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" The prefix key.
nnoremap [Tag] <Nop>
nmap t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
" map <silent> [Tag]n :tabnext<CR>
" tn 次のタブ
" map <silent> [Tag]p :tabprevious<CR>
" tp 前のタブ
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" =====================================================
" BASIC SETTINGS
" =====================================================
" Compatibility and basic setup
if has('vim_starting')
  set nocompatible
endif

" File handling
set fileencodings=utf-8,iso-2022-jp,sjis,ccp932,euc-jp
set encoding=utf-8
set fileformats=unix,dos,mac
set nobackup
set noswapfile
set wildignore+=*/dist/*,*/node_modules/*

" =====================================================
" PLUGIN MANAGEMENT
" =====================================================
" Vim-plug auto-installation
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(vimplug_exists)
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"
  autocmd VimEnter * PlugInstall
endif

" Plugin definitions
call plug#begin(expand('~/.config/nvim/plugged'))

" UI & Theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim', { 'as': 'dracula' }

" Development Tools
Plug 'dense-analysis/ale'                " Linting and fixing
Plug 'neovim/nvim-lspconfig'            " LSP configuration
Plug 'github/copilot.vim'               " AI assistant

" File & Search
Plug 'junegunn/fzf'                     " Fuzzy finder
Plug 'junegunn/fzf.vim'                 " Fuzzy finder vim integration

" Editing Enhancement
Plug 'rhysd/accelerated-jk'             " Faster j/k movement
Plug 'cohama/lexima.vim'                " Auto-close brackets
Plug 'alvan/vim-closetag'               " Auto-close HTML/JSX tags
Plug 'tpope/vim-surround'               " Surround text objects
Plug 'mattn/emmet-vim'                  " HTML/CSS shortcuts
Plug 'editorconfig/editorconfig-vim'    " EditorConfig support

" Language Support
Plug 'prisma/vim-prisma'                " Prisma schema syntax

" Session & Templates
Plug 'tpope/vim-obsession'              " Session management
Plug 'mattn/vim-sonictemplate'          " Code templates

call plug#end()

" =====================================================
" LSP CONFIGURATION
" =====================================================
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

" =====================================================
" ALE (LINTING & FORMATTING)
" =====================================================
" Fixers configuration
let g:ale_fixers = {
    \ 'javascript': ['prettier', 'eslint'],
    \ 'typescript': ['prettier', 'eslint'],
    \ 'javascriptreact': ['prettier', 'eslint'],
    \ 'typescriptreact': ['prettier', 'eslint'],
    \ 'json': ['prettier'],
    \ 'python': ['autopep8'],
    \ 'css': ['prettier'],
    \ 'scss': ['prettier'],
    \ 'html': ['prettier'],
    \ 'markdown': ['prettier'],
    \ 'rust': ['rustfmt'],
    \ 'go': ['gofmt'],
\ }

" Linters configuration
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

" ALE behavior settings
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '__'
let g:ale_linters_explicit = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 1
let g:ale_fix_on_save = 1
let g:ale_use_neovim_diagnostics_api = 1
let g:ale_javascript_eslint_suppress_missing_config = 1

" Rust analyzer configuration
let g:ale_rust_rust_analyzer_executable = 'rust-analyzer'
let g:ale_rust_analyzer_config = {
      \   'rust': {
      \     'clippy_preference': 'on'
      \   }
      \ }

" =====================================================
" UI & APPEARANCE
" =====================================================
" Color scheme and syntax
syntax enable
colorscheme dracula
let g:dracula_italic=0

" Visual indicators
set list
set listchars=tab:»-,trail:-,nbsp:%,eol:↩
set number
set cursorline
set showmatch
hi Visual guifg=#000000 guibg=#FFFFFF gui=none

" Status line (vim-airline)
let g:airline_theme = 'laederon'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = ''
let g:airline_section_c = ''
let g:airline_skip_empty_sections = 1

" Command line and status
set showcmd
set laststatus=2
set showmode
set ruler

" =====================================================
" EDITING BEHAVIOR
" =====================================================
" Indentation
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent
filetype plugin indent on

" Cursor and navigation
set whichwrap=b,s,h,l,<,>,[,],~
set backspace=indent,eol,start

" Search settings
set ignorecase
set smartcase
set wrapscan
set noincsearch
set hlsearch

" Window behavior
set splitright

" File explorer behavior
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 25
let g:netrw_altv = 1

" Clipboard
set clipboard=unnamed

" =====================================================
" PLUGIN CONFIGURATIONS
" =====================================================
" FZF
let g:fzf_layout = { 'window': '-tabnew' }

" Closetag
let g:closetag_filenames = '*.html,*.js,*.jsx,*.tsx,*.php'

" Sonic template
let g:sonictemplate_vim_template_dir = ['~/.config/nvim/templates']

" =====================================================
" FILE TYPE SPECIFIC SETTINGS
" =====================================================
" Language-specific indentation and settings
autocmd FileType python set shiftwidth=4 tabstop=4 expandtab
autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s

" File type associations
au BufRead,BufNewFile *.md set filetype=markdown
let g:markdown_fenced_languages = ['javascript', 'ruby', 'go', 'cpp']

" PHP files treated as HTML for some contexts
augroup autoformat_settings
  autocmd!
  autocmd Filetype php set filetype=html
augroup END

" Completion behavior
autocmd CompleteDone * silent! pclose!

" =====================================================
" KEY MAPPINGS
" =====================================================
" Leader key
let mapleader = "\<Space>"

" File operations
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>qt :tabo<CR>
nnoremap <Leader>qw :on<CR>
nnoremap <Leader>q1 :q!<CR>
nnoremap <Leader>qa :qa<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>wq1 :wq!<CR>

" Movement enhancements
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap <down> gjzz
nnoremap <up> gkzz
nnoremap G Gzz
nnoremap j gjzz
nnoremap k gkzz
noremap <S-h> ^
noremap <S-j> }
noremap <S-k> {
noremap <S-l> $

" Window management
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

" Tab navigation
nnoremap fl gt
nnoremap fh gT
nnoremap gt <Nop>
nnoremap gT <Nop>

" Search mappings
nnoremap <C-j> *
nnoremap <C-k> #
nnoremap <C-c><C-c> :<C-u>nohlsearch<cr><Esc>
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

" FZF mappings
nnoremap <C-p> :<C-u>Files<CR>
nnoremap <silent> <Space>fh :<C-u>:History<CR>
nnoremap <silent> <Space>fr :Rg <C-R><C-W><CR>
nnoremap <silent> <Space>fb :<C-u>Buffers<CR>

" File explorer mappings
nnoremap <C-e> :Lexplore<CR>

" Utility mappings
nnoremap <silent><Space>cp :let @+=expand("%:p")<CR>
nnoremap x "_x
nnoremap ; :

" Disabled keys
nnoremap ZZ <nop>
nnoremap ZQ <nop>
nnoremap Q <nop>
nnoremap <C-z> <nop>

" =====================================================
" CUSTOM COMMANDS
" =====================================================
" Enhanced Rg command with preview
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

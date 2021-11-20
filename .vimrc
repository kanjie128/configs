" =======================================
" ========= normal settings  ============
" =======================================
set nu
syntax on
set noerrorbells
set shiftwidth=4
set tabstop=4
set expandtab
set ffs=unix
set incsearch
set smartindent
set nobackup
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

set relativenumber

" auto format
let g:clang_format#auto_format=1
autocmd FileType c,cpp setlocal equalprg=clang-format

filetype plugin indent on         " Enable good stuff
"set list                          " Show some more characters

" =======================================
" ========= install plug.vim ============
" =======================================
" see https://github.com/junegunn/vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" =======================================
" ========= Plugins =====================
" =======================================
" manage plugins with specific dir
call plug#begin('~/.vim/plugged')

"YCM vim 8.1+ required
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

"fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

"rust
Plug 'rust-lang/rust.vim'

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" alignment
Plug 'junegunn/vim-easy-align'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh'
    \ }
call plug#end()

" =======================================
" =========== Plugin configs ============
" =======================================
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-h': 'split',
  \ 'ctrl-v': 'vsplit' } 

let g:rustfmt_command = "rustfmt"


" =======================================
" ======= key maps       ================
" =======================================
let mapleader = " "
" wincmd
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
" YCM
nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>gf :YcmCompleter FixIt<CR>


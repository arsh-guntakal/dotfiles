syntax on
set number
set tabstop=4       " Number of spaces that a <Tab> in the file counts for
set shiftwidth=4    " Number of spaces to use for autoindent and shifting
set noexpandtab       " do not Converts tabs to spaces

set hlsearch
nnoremap <silent> <F3> :set hlsearch!<CR>
set ruler

set incsearch
set autoindent
filetype plugin indent on
"autocmd FileType c,cpp setlocal tabstop=4 shiftwidth=4 noexpandtab  "tab = 4 for c, c++


call plug#begin('~/.vim/plugged')

" fzf.vim plugin
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
call plug#end()

set laststatus=2

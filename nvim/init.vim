syntax on

" 4 spaces instead of tabs
set tabstop=4
set shiftwidth=4
set expandtab

" no backup files
set nobackup
set nowritebackup

" so the stuff get written to swap faster
" and less delay/better ux
set updatetime=1000

" set numbers encoding etc.
set number
set encoding=utf-8
set hidden
set cmdheight=2
set signcolumn=number

" <leader> key
let mapleader=","

" don't pass messages to ins-vompletion-menu
set shortmess+=c

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
" let g:NERDTreeDirArrowExpandable = '.'
" let g:NERDTreeDirArrowCollapsible = '.'
let NERDTreeShowHidden=1
nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <leader> :NERDTreeFocus<CR>

call plug#end()

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

" nnoremap h h|xnoremap h h
" nnoremap n j|xnoremap n j
" nnoremap e k|xnoremap e k
" nnoremap i l|xnoremap i l
" nnoremap j e|xnoremap j e
" nnoremap k n|xnoremap k n
" nnoremap l i|xnoremap l i

" If im dumb as shit
command WQ wq
command Wq wq
command W w
command Q q



call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
" let g:NERDTreeDirArrowExpandable = '.'
" let g:NERDTreeDirArrowCollapsible = '.'
let NERDTreeShowHidden=1
nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <leader> :NERDTreeFocus<CR>

call plug#end()

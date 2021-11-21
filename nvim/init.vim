set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

" for nicer bar at the bottom
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" To see buffers/tabs in bottom airline bar
Plug 'bling/vim-bufferline'

" fzf in vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" easymotion to make navigating in the code easier
Plug 'easymotion/vim-easymotion'

" autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" nerdtree for code structure
Plug 'preservim/nerdtree'
" ranger for opening files easier
Plug 'francoiscabrol/ranger.vim'

" collection of language packs
Plug 'sheerun/vim-polyglot'
" Plug 'lervag/vimtex'
call plug#end()

syntax on

" 
" all set commands
"
set background=dark
set clipboard=unnamed,unnamedplus
set nospell
set shiftwidth=4
set encoding=utf-8
set tabstop=4
set expandtab
set autoindent
set number
set relativenumber   
set showmode
set ruler
set showcmd
set showmatch
set incsearch
set hlsearch
set hidden
set lazyredraw
set laststatus=2
set autoread
set ofu=syntaxcomplete#Complete
set wildmenu
set wildmode=list:longest,full
set textwidth=0
set noswapfile
set nobackup
set nowritebackup
set so=5
set mouse=a
set visualbell
set t_vb=
set history=1000
set backspace=indent,eol,start
set splitright
set splitbelow
set cmdheight=2
set updatetime=300
set shortmess+=c


" If im dumb as shit
command WQ wq
command Wq wq
command W w
command Q q

let mapleader = ","

" for faster commandline access
nmap \<Space> :

" Ctrl+W and Q in VIM
" map <C-s> :w<CR>
map <C-w> :q<CR>
map <C-t> :tabnew<CR>

" add lines above and below without going into insert mode
nmap oo o<Esc>
nmap OO O<Esc>

" reset highlighting of search
map <f3> :noh<CR>



" Disable arrow keys cause I shall better learn those hjkl commands in colemak
" or use colemak maps
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" nnoremap h h|xnoremap h h
" nnoremap n j|xnoremap n j
" nnoremap e k|xnoremap e k
" nnoremap i l|xnoremap i l
" nnoremap j e|xnoremap j e
" nnoremap k n|xnoremap k n
" nnoremap l i|xnoremap l i


"
" NERDTree
"

map <C-b> :NERDTreeToggle<CR>
let g:NERDTreeHijackNetrw = 0 "// add this line if you use NERDTree
let g:ranger_replace_netrw = 1 "// open ranger when vim open a directory
let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'
let g:NERDTreeShowHidden=1

" Start NERDtree, unless file or session is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif
" same as above but open when directory specified
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and
" bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
	\ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif


"
" airline
"
let g:airline_theme='deus'
let g:airline_powerline_fonts = 1
" let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#bufferline#enablod = 1 

"
" neovide
"
let g:neovide_refresh_rate=140
let g:neovide_transparency=0.8
let g:neovide_cursor_vfx_mode = "pixiedust"
let g:neovide_cursor_animation_length=0.13
let g:neovide_cursor_trail_length=0.8


" 
" coc autocompletion
"

" extensions
let g:coc_global_extensions = ['coc-pairs', 
            \'coc-pyright', 
            \'coc-snippets',
            \'coc-omnisharp']
" use tab to complete
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Ctrl Space to trigger autocompletion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" let <CR> (Carriage Return [Enter]) autoselect first item
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <F2> <Plug>(coc-rename)
nmap <leader>rn <Plug>(coc-rename)

" Applying codeAction to the selected region
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-n> for scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-n> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-n>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-n> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-n> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-n>"
endif

" Use CTRL-S for selections ranges
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)


" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" Set keybindings for formatting code
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

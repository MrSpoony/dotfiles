" C#
autocmd FileType cs  map <F2>      :w<CR>:!csc %<CR>:term mono %:r.exe<CR>
autocmd FileType cs imap <F2> <Esc>:w<CR>:!csc %<CR>:term mono %:r.exe<CR>
" Python
autocmd FileType python  map <F2>      :w<CR>:term python3 %<CR>
autocmd FileType python imap <F2> <Esc>:w<CR>:term python3 %<CR>
" C++
autocmd FileType cpp  map <F2>      :w<CR>:!g++ % -o %:r<CR>:term ./%:r<CR>
autocmd FileType cpp imap <F2> <Esc>:w<CR>:!g++ % -o %:r<CR>:term ./%:r<CR>
" Java
autocmd FileType java  map <F2>      :w<CR>:!javac %<CR>:term java %:r<CR>
autocmd FileType java imap <F2> <Esc>:w<CR>:!javac %<CR>:term java %:r<CR>

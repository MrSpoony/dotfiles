" C#
autocmd FileType cs  map <F2>      :w<CR>:!csc %<CR>:term mono %:r.exe<CR>
autocmd FileType cs imap <F2> <Esc>:w<CR>:!csc %<CR>:term mono %:r.exe<CR>
" Python
autocmd FileType python  map <buffer>  <F2>     :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F2> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
" C
autocmd FileType c  map <F2>      :w<CR>:!gcc -Wall -Wextra -fdiagnostics-color=always -Wno-sign-compare -std=c2x -O2 -static % -o %:r<CR>:term ./%:r<CR>
autocmd FileType c imap <F2> <Esc>:w<CR>:!gcc -Wall -Wextra -fdiagnostics-color=always -Wno-sign-compare -std=c2x -O2 -static % -o %:r<CR>:term ./%:r<CR>
" Java
autocmd FileType java  map <F2>      :w<CR>:!javac %<CR>:term java %:r<CR>
autocmd FileType java imap <F2> <Esc>:w<CR>:!javac %<CR>:term java %:r<CR>
" Latex
autocmd FileType tex  map <F2>      :w<CR>:!pdflatex %<CR>
autocmd FileType tex imap <F2> <Esc>:w<CR>:!pdflatex %<CR>
" Assembly
autocmd FileType nasm  map <F2>      :w<CR>:!nasm -felf64 -o %:r.o %<CR>:!ld %:r.o -o %:r<CR>:term ./%:r<CR>
autocmd FileType nasm  map <F2> <Esc>:w<CR>:!nasm -felf64 -o %:r.o %<CR>:!ld %:r.o -o %:r<CR>:term ./%:r<CR>

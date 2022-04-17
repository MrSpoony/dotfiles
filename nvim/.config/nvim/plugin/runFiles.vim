" C#
autocmd FileType cs  map <F2>      w<CR><cmd>!csc %<CR><cmd>term mono %:r.exe<CR>
autocmd FileType cs imap <F2> <Esc><cmd>w<CR><cmd>!csc %<CR><cmd>term mono %:r.exe<CR>
" Python
autocmd FileType python  map <buffer>  <F2>     <cmd>w<CR><cmd>exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F2> <esc><cmd>w<CR><cmd>exec '!python3' shellescape(@%, 1)<CR>
" C
autocmd FileType c  map <F2>      <cmd>w<CR><cmd>!gcc -Wall -Wextra -fdiagnostics-color=always -Wno-sign-compare -std=c2x -O2 -static % -o %:r<CR><cmd>term ./%:r<CR>
autocmd FileType c imap <F2> <Esc><cmd>w<CR><cmd>!gcc -Wall -Wextra -fdiagnostics-color=always -Wno-sign-compare -std=c2x -O2 -static % -o %:r<CR><cmd>term ./%:r<CR>
" Java
autocmd FileType java  map <F2>      <cmd>w<CR><cmd>!javac %<CR><cmd>term java %:r<CR>
autocmd FileType java imap <F2> <Esc><cmd>w<CR><cmd>!javac %<CR><cmd>term java %:r<CR>
" Latex
autocmd FileType tex  map <F2>      <cmd>w<CR><cmd>!pdflatex %<CR>
autocmd FileType tex imap <F2> <Esc><cmd>w<CR><cmd>!pdflatex %<CR>
" Assembly
autocmd FileType nasm  map <F2>      <cmd>w<CR><cmd>!nasm -felf64 -o %:r.o %<CR><cmd>!ld %:r.o -o %:r<CR><cmd>term ./%:r<CR>
autocmd FileType nasm  map <F2> <Esc><cmd>w<CR><cmd>!nasm -felf64 -o %:r.o %<CR><cmd>!ld %:r.o -o %:r<CR><cmd>term ./%:r<CR>

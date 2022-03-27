autocmd BufReadPost,BufNewFile *.asm setlocal ft=nasm
autocmd FileType nasm setlocal commentstring=;\ %s

let soi = "soi"
let path = expand('%:p:h')
if (stridx(path, soi) > 0)
    autocmd BufNewFile *.cpp            0r ~/.config/nvim/templates/cpp.cpp
endif

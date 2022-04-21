let g:goyotoggled = 0

let g:goyo_height = '70%'
nnoremap <leader>go <cmd>Goyo<CR>


function! s:goyo_enter()
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
    set noshowmode
    set noshowcmd
    set scrolloff=999
    nnoremap  <Up>    k
    nnoremap  <Down>  j
    nnoremap  <Left>  h
    nnoremap  <Right> l
    Limelight
endfunction

function! s:goyo_leave()
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
    set showmode
    set showcmd
    set scrolloff=5
    Limelight!
    nnoremap  <Up>    <cmd> resize +2<cr>")
    nnoremap  <Down>  <cmd> resize -2<cr>")
    nnoremap  <Left>  <cmd> vertical resize +2<cr>")
    nnoremap  <Right> <cmd> vertical resize -2<cr>")
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

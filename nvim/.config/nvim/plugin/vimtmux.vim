let g:tmux_navigator_no_mappings = 1

nnoremap <silent> {Left-Mapping}     <cmd>TmuxNavigateLeft<cr>
nnoremap <silent> {Down-Mapping}     <cmd>TmuxNavigateDown<cr>
nnoremap <silent> {Up-Mapping}       <cmd>TmuxNavigateUp<cr>
nnoremap <silent> {Right-Mapping}    <cmd>TmuxNavigateRight<cr>
nnoremap <silent> {Previous-Mapping} <cmd>TmuxNavigatePrevious<cr>

nnoremap <silent> <C-h> <cmd>TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> <cmd>TmuxNavigateDown<cr>
nnoremap <silent> <C-k> <cmd>TmuxNavigateUp<cr>
nnoremap <silent> <C-l> <cmd>TmuxNavigateRight<cr>
nnoremap <silent> <C-_> <cmd>TmuxNavigatePrevious<cr>

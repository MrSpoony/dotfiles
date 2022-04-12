let g:dashbord_default_executive = 'telescope'

autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2

nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>th :DashboardFindHistory<CR>
nnoremap <silent> <Leader>tt :DashboardFindFile<CR>
nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>ta :DashboardFindWord<CR>
nnoremap <silent> <Leader>tb :DashboardJumpMark<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>


let g:dashboard_default_executive ='telescope'

" let g:dashboard_preview_command = 'cat'
" let g:dashboard_preview_pipeline = 'lolcat'
" let g:dashboard_preview_file = '~/.config/nvim/dashboard/neovim.cat'
let g:dashboard_preview_file_height = 10
let g:dashboard_preview_file_width = 80

" let g:dashboard_custom_header = [
" \ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
" \ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
" \ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
" \ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
" \ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
" \ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
" \]
"
let g:dashboard_custom_header = [
            \'                                ',
            \'        ███████████        █████      ██',
            \'       ███████████          █████ ███',
            \'       ██████████████████    ████████ ███  ████████',
            \'      ████████████████████████████ █████ ██████████████',
            \'     █████████████████████████████ █████ █████ ████ █████',
            \'    ██████████████████████████████ █████ █████ ████ █████',
            \'   █████████ ███████  █████████ ████ █████ █████ ████ ██████',
            \'  █████████  ███████████████  ██ █████████████████',
            \'█████████████   ███████ █████   ██ █████████████████',
            \]

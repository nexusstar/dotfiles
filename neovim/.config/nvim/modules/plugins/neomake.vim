" neomake
autocmd! BufWritePost,BufEnter * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']

nmap <silent><Leader>o  :lopen<CR>      " open location window
nmap <silent><Leader>c  :lclose<CR>     " close location window
nmap <silent><Leader>,  :ll<CR>         " go to current error/warning
nmap <silent><Leader>n  :lnext<CR>      " next error/warning
nmap <silent><Leader>p  :lprev<CR>      " previous error/warning

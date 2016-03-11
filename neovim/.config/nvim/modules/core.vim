" Backspace is managed by vim-sensible, but I need it here too because some
" plugins depend on it during start up.
set backspace=indent,eol,start

" Enable invisible characters.
set list

" Enable line numbers in Insert mode and realtive in Normal.
set number
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" More natural splitting.
set splitbelow
set splitright

" Set a default indent, but vim-sleuth should adjust it.
filetype plugin indent on

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Enable mouse. Great for resizing windows and keeping co-workers sane.
set mouse=a

" Disable swap files.
set noswapfile

" Write files as they are, don't mess with line endings etc.
set binary

" Disable the completion preview window.
set completeopt-=preview

" Make session files minimal.
set sessionoptions=blank,curdir,folds,help,tabpages,winsize

" Automaticaly change the current directory
autocmd BufEnter * silent! lcd %:p:h

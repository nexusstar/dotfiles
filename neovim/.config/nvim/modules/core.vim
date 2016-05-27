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

" let airline show status
set noshowmode

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Enable mouse. Great for resizing windows and keeping co-workers sane.
if has('mouse')
  set mouse=a
endif

" Disable swap files.
set noswapfile

" Write files as they are, don't mess with line endings etc.
set binary

" Force selection of match in menu
set completeopt+=noselect

" Make session files minimal.
set sessionoptions=blank,curdir,folds,help,tabpages,winsize

" No need for ex mode
  nnoremap Q <nop>
" no recording macros
map q <Nop>

" Automaticaly change the current directory
autocmd BufEnter * silent! lcd %:p:h

" Move lines up and down with Alt+j Alt+k
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==

inoremap <M-j> <esc>:m .+1<CR>==gi
inoremap <M-k> <esc>:m .-2<CR>==gi

vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> <esc>:m '<-2<CR>gv=gv

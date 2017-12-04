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

" Enable mouse. Great for resizing windows and keeping co-workers sane.
if has('mouse')
  set mouse=a
endif

" Disable swap files.
set noswapfile

" Write files as they are, don't mess with line endings etc.
set binary

" Set default indent
set tabstop=2 shiftwidth=2 expandtab

" Force selection of match in menu
set completeopt+=noselect

" Make session files minimal.
set sessionoptions=blank,curdir,folds,help,tabpages,winsize

" Automaticaly change the current directory
autocmd BufEnter * silent! lcd %:p:h

" Increase height of preview window
" Adapted from http://stackoverflow.com/a/3787326/588561
set previewheight=6
au WinEnter * call PreviewHeightWorkAround()
func PreviewHeightWorkAround()
        if &previewwindow
                exec 'setlocal winheight='.&previewheight
        endif
endfunc

" Map ; to : so instead to use 
" shift+: just type ;
nnoremap ; :

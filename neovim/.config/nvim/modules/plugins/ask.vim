"  use ag if present
if executable('ag')
    let g:askprg = 'ag --vimgrep'
endif

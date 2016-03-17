" Make Vim more useful. This should always be your first configuration line.
set nocompatible

" Always edit in utf-8:
set encoding=utf-8

" Wraps paths to make them relative to this directory.
function! Dot(path)
  return '~/.config/nvim/' . a:path
endfunction

" Load all configuration modules.
for file in split(glob(Dot('modules/*.vim')), '\n')
  execute 'source' file
endfor

if filereadable("~/.nvim.local.vim")
    source ~/.nvim.local.vim
endif
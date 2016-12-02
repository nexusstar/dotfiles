" Highlight searches.
set hlsearch

" Highlight the current line.
set cursorline

function! s:after_colorscheme()
  " Make spelling problems easier to read.
  highlight clear SpellBad
  highlight clear SpellCap
  highlight clear SpellLocal
  highlight clear SpellRare

  highlight SpellBad cterm=underline
  highlight SpellCap cterm=underline
  highlight SpellLocal cterm=underline
  highlight SpellRare cterm=underline

  " Stop the cross hair ruining highlighting.
  highlight CursorLine cterm=NONE ctermbg=235 ctermfg=NONE guibg=3a3a3a guifg=NONE
  highlight CursorColumn cterm=NONE ctermbg=235 ctermfg=NONE guibg=3a3a3a guifg=NONE

  " Make conceal look better.
  highlight Conceal cterm=bold ctermbg=NONE ctermfg=67
endfunction

augroup after_colorscheme
  autocmd!
  autocmd ColorScheme * call s:after_colorscheme()
augroup END

" Use <C-L> to clear the highlighting of :set hlsearch.
" coz I am so used to it
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

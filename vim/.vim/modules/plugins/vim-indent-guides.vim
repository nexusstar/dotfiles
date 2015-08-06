nnoremap <silent> <leader>ti :IndentGuidesToggle<CR>
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors=0
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

augroup indent_guide_settings
  autocmd!
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermfg=white ctermbg=234
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermfg=white ctermbg=236
augroup END

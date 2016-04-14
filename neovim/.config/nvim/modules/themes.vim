" Themes, Commands, etc  ----------------------------------------------------{{{
" Theme
  syntax on
  "colorscheme OceanicNext
  set background=dark
  " set background=light

  " no need to fold things in markdown all the time
  let g:vim_markdown_folding_disabled = 1

  " disable markdown auto-preview. Gets annoying
  let g:instant_markdown_autostart = 0

  " Keep my termo window open when I navigate away
  autocmd TermOpen * set bufhidden=hide
"}}}

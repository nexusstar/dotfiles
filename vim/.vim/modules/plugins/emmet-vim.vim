"enable only for html and css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
"map emmet-vim expand abbr to <tab> in insert mode
function! s:zen_html_tab()
  let line = getline('.')
  if match(line, '<.*>') >= 0
    return "\<c-y>n"
  endif
  return "\<c-y>,"
endfunction
autocmd FileType html imap <buffer><expr><tab> <sid>zen_html_tab()

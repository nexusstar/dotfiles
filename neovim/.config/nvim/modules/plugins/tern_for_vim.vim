" Use d to close preview window when present
" or d to show it

let g:doc = 1
function! s:doc_toggle()
  if g:doc
    TernDoc
  else
    pclose
  endif
  let g:doc = !g:doc
endfunction
nnoremap <silent> <leader>d :call <SID>doc_toggle()<CR>

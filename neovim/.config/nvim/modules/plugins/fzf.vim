" FZF and AG settings

" Search hidden directories
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
nmap <silent> <leader>f :FZF<CR>
nmap <silent> <leader>a :Ag!<CR>
nnoremap <silent> <leader>A :exe 'Ag!' expand('<cword>')<CR>
nnoremap <silent> <leader>F :call fzf#vim#files('.', {'options':'--query '.expand('<cword>')})<CR>

" Ag search only content not filenames
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:40%')
  \                         : fzf#vim#with_preview({'options': '--delimeter : --nth 4..'}, 'right:50%:hidden', '?'),
\ <bang>0)

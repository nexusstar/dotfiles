let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp' " Add cash directory to ctrlp
let g:ctrlp_max_files = 0

if executable("ag") " use silver searcher if present
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
  let g:ctrlp_use_caching = 0

  " bind K to grep word under cursor
  nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

endif

"lldb.nvim recommended mappings
"
nmap <M-b> <Plug>LLBreakSwitch
vmap <F2> <Plug>LLStdInSelected
nnoremap <F4> :LLstdin<CR>
nnoremap <F5> :LLmode debug<CR>
nnoremap <silent> <leader>ld :LLmode debug<CR>
nnoremap <S-F5> :LLmode code<CR>
nnoremap <silent> <leader>lc :LLmode code<CR>
nnoremap <F8> :LL continue<CR>
nnoremap <silent> <leader>ln :LL continue<CR>
nnoremap <silent> <leader>ls :LL step<CR>
nnoremap <S-F8> :LL process interrupt<CR>
nnoremap <F9> :LL print <C-R>=expand('<cword>')<CR>
vnoremap <F9> :<C-U>LL print <C-R>=lldb#util#get_selection()<CR><CR>

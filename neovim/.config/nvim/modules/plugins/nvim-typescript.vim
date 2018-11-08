autocmd FileType typescript,typescriptreact setl omnifunc=TSOmnicFunc
" let g:neomake_typescript_enabled_makers = ['tslint']
let g:nvim_typescript#max_completion_detail=50
let g:nvim_typescript#completion_mark=''
let g:nvim_typescript#javascript_support=1
let g:nvim_typescript#expand_snippet=0
let g:nvim_typescript#vue_support=1
let g:nvim_typescript#diagnosticsEnable=1
map <silent> <leader>td :TSDoc <cr>
map <silent> <leader>tt :TSType <cr>
map <silent> <leader>ts :TSTypeDef <cr>
map <silent> <leader>@ :Denite -buffer-name=TSDocumentSymbol TSDocumentSymbol <cr>
map <silent> <leader># :Denite -buffer-name=TSWorkspaceSymbol TSWorkspaceSymbol <cr>
map <silent> <leader>ti :TSImport <cr>
nnoremap <m-Enter> :TSGetCodeFix<CR>

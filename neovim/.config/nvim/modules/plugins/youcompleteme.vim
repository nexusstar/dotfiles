" YouCompletMe configuration
"
" example: https://github.com/vheon/home/blob/380b87e34091cfd279338af6a36dd3f99bf97336/.vim/vimrc#L62
"
"
let g:ycm_confirm_extra_conf    = 0
let g:ycm_complete_in_comments  = 1
let g:ycm_global_ycm_extra_conf = fnamemodify($MYVIMRC, ':h').'/ycm_extra_conf.py'
let g:ycm_extra_conf_vim_data   = ['&filetype']
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_filetype_blacklist = { 'help': 1 }

autocmd FileType javascript setlocal omnifunc=tern#Complete

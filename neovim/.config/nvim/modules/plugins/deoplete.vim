" enable deoplete
let g:deoplete#enable_at_startup = 1
let g:echodoc_enable_at_startup=1
set splitbelow
set completeopt+=noselect
set completeopt-=preview
autocmd CompleteDone * pclose

function! Multiple_cursors_before()
  let b:deoplete_disable_auto_complete=2
endfunction

function! Multiple_cursors_after()
  let b:deoplete_disable_auto_complete=0
endfunction

let g:deoplete#file#enable_buffer_path=1

call deoplete#custom#set('buffer', 'mark', 'ℬ')
call deoplete#custom#set('ternjs', 'mark', '')
call deoplete#custom#set('omni', 'mark', '⌾')
call deoplete#custom#set('file', 'mark', 'file')
call deoplete#custom#set('jedi', 'mark', '')
call deoplete#custom#set('typescript', 'mark', '')
call deoplete#custom#set('neosnippet', 'mark', '')

call deoplete#custom#set('typescript',  'rank', 630)

function! Preview_func()
  if &pvw
    setlocal nonumber norelativenumber
  endif
endfunction

autocmd WinEnter * call Preview_func()
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources._ = ['around']

inoremap <expr><C-j> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr><C-l> pumvisible() ? "\<C-y>" : "\<C-l>"

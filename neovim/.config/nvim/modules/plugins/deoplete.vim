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

call deoplete#custom#source('buffer', 'mark', 'ℬ')
call deoplete#custom#source('ternjs', 'mark', '')
call deoplete#custom#source('omni', 'mark', '⌾')
call deoplete#custom#source('file', 'mark', 'file')
call deoplete#custom#source('jedi', 'mark', '')
call deoplete#custom#source('typescript', 'mark', '')
call deoplete#custom#source('neosnippet', 'mark', '')

call deoplete#custom#source('typescript',  'rank', 630)

function! Preview_func()
  if &pvw
    setlocal nonumber norelativenumber
  endif
endfunction

autocmd WinEnter * call Preview_func()
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources._ = ['around']


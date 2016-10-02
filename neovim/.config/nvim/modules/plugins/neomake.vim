" neomake
nmap <silent><Leader>o  :lopen<CR>      " open location window
nmap <silent><Leader>c  :lclose<CR>     " close location window
nmap <silent><Leader>,  :ll<CR>         " go to current error/warning
nmap <silent><Leader>n  :lnext<CR>      " next error/warning
nmap <silent><Leader>p  :lprev<CR>      " previous error/warning

" Linting -------------------------------------------------------------------{{{

function! EchoPWD()
  echom getcwd()
endfunction
function! neomake#makers#ft#javascript#eslint()
  return {
        \ 'args': ['-f', 'compact'],
        \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
        \ '%W%f: line %l\, col %c\, Warning - %m'
        \ }
endfunction
let g:neomake_javascript_enabled_makers = ['standard']

function! neomake#makers#ft#typescript#tsc()
  return {
        \ 'args': [
        \ '-m', 'commonjs', '--noEmit', '--experimentalDecorators', '--emitDecoratorMetadata'
        \],
        \ 'errorformat':
        \ '%E%f %#(%l\,%c): error %m,' .
        \ '%E%f %#(%l\,%c): %m,' .
        \ '%Eerror %m,' .
        \ '%C%\s%\+%m'
        \ }
endfunction

let g:neomake_cpp_enabled_makers = ['gcc']
function! neomake#makers#ft#cpp#gcc()
  return{
        \ 'exe:': 'g++',
        \ 'args': ['-fsyntax-only', '-Wall','-Wextra', '-std=c++11'],
        \ 'errorformat':
        \ '%-G%f:%s:,' .
        \ '%-G%f:%l: %#error: %#(Each undeclared identifier is reported only%.%#,' .
        \ '%-G%f:%l: %#error: %#for each function it appears%.%#,' .
        \ '%-GIn file included%.%#,' .
        \ '%-G %#from %f:%l\,,' .
        \ '%f:%l:%c: %trror: %m,' .
        \ '%f:%l:%c: %tarning: %m,' .
        \ '%f:%l:%c: %m,' .
        \ '%f:%l: %trror: %m,' .
        \ '%f:%l: %tarning: %m,'.
        \ '%f:%l: %m',
        \ }
endfunction

autocmd! BufWritePost * Neomake

function! JscsFix()
  let l:winview = winsaveview()
  % ! jscs -x
  call winrestview(l:winview)
endfunction
command! JscsFix :call JscsFix()
noremap <silent><leader>j :JscsFix<CR>
"}}}

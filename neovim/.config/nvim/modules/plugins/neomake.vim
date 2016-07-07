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
  let g:neomake_javascript_enabled_makers = ['eslint']
  function! neomake#makers#ft#javascript#eslint()
      return {
          \ 'args': ['-f', 'compact'],
          \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
          \ '%W%f: line %l\, col %c\, Warning - %m'
          \ }
  endfunction

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
  autocmd! BufWritePost * Neomake

  function! JscsFix()
      let l:winview = winsaveview()
      % ! jscs -x
      call winrestview(l:winview)
  endfunction
  command JscsFix :call JscsFix()
  noremap <leader>j :JscsFix<CR>
"}}}

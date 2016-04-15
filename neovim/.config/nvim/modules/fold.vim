" Fold, gets it's own section  ----------------------------------------------{{{
function! MyFoldText() " {{{
      let line = getline(v:foldstart)

      let nucolwidth = &fdc + &number * &numberwidth
      let windowwidth = winwidth(0) - nucolwidth - 3
      let foldedlinecount = v:foldend - v:foldstart

      " expand tabs into spaces
      let onetab = strpart('          ', 0, &tabstop)
      let line = substitute(line, '\t', onetab, 'g')

      let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
      let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
      return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}

"{{{
  let s:exclude_tags_list = [
        \ '\/',
        \ '!',
        \ 'html',
        \ 'area',
        \ 'base',
        \ 'br',
        \ 'col',
        \ 'embed',
        \ 'hr',
        \ 'img',
        \ 'input',
        \ 'keygen',
        \ 'link',
        \ 'menuitem',
        \ 'meta',
        \ 'param',
        \ 'source',
        \ 'track',
        \ 'wbr',
        \ 'ion-spinner',
        \ 'ion-tab',
        \ 'ion-icon',
        \ 'ion-item',
        \ 'ion-input',
        \ 'ion-content'
        \ ]
  let s:exclude_tags = join(s:exclude_tags_list, '\|')
"}}}

  function! HTMLFolds() "{{{
    let line = getline(v:lnum)

    " Ignore tags that open and close in the same line
    if line =~# '<\(\w\+\).*<\/\1>'
      return '='
    endif

    if line =~# '<\%(' . s:exclude_tags . '\)\@!'
      return 'a1'
    endif

    if line =~# '<\/\%(' . s:exclude_tags . '\)\@!'
      return 's1'
    endif

    return '='
  endfunction "}}}

  autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
  autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

  autocmd FileType vim setlocal fdc=1
  set foldlevel=99

  " jf to toggle folds.
  nnoremap jf za
  vnoremap jf za
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType vim setlocal foldlevel=0

  autocmd FileType html setlocal fdl=99

  autocmd FileType javascript,html,css,scss,typescript setlocal foldlevel=99
  autocmd FileType css,scss,less,json setlocal foldmethod=marker
  autocmd FileType css,scss,less,json setlocal foldmarker={,}

  autocmd FileType html setl foldmethod=expr
  autocmd FileType html setl foldexpr=HTMLFolds()

  autocmd FileType javascript,typescript,json setl foldmethod=syntax
" }}}

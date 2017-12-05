
let g:ale_fixers = {
\   'javascript': ['eslint']
\}

" Use a slightly slimmer error pointer
let g:ale_sign_error = '‽'
hi ALEErrorSign guifg=#DF8C8C
let g:ale_sign_warning = '⚠'
hi ALEWarningSign guifg=#F2C38F

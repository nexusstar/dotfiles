" Theme
if (has("termguicolors"))
  set termguicolors
endif
syntax enable

" set colorscheme

try 
  colorscheme OceanicNext
  let g:OceanicNext_italic = 1
  catch
  try 
    colorscheme solarize
    catch
  endtry
endtry

set background=dark
 
" set background=light
" included airline theme
let g:airline_theme='oceanicnext'

""" Low contrast theme
" Unified color scheme (default: dark)
"colorscheme seoul256
"set background=dark
"set background=light
"
"let g:seoul256_srgb = 1
"
"
"let g:airline_theme="wombat"

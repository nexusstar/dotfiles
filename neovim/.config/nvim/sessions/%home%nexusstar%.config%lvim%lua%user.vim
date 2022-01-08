let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/lvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
$argadd ~/github/lvim/lua/user/plugins.lua
edit ~/github/lvim/lua/user/plugins.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 82 + 83) / 166)
exe 'vert 2resize ' . ((&columns * 83 + 83) / 166)
argglobal
balt lua/user/plugins.lua
let s:l = 404 - ((31 * winheight(0) + 20) / 40)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 404
normal! 02|
lcd ~/github/lvim
wincmd w
argglobal
if bufexists("~/.config/lvim/lua/user/plugins.lua") | buffer ~/.config/lvim/lua/user/plugins.lua | else | edit ~/.config/lvim/lua/user/plugins.lua | endif
if &buftype ==# 'terminal'
  silent file ~/.config/lvim/lua/user/plugins.lua
endif
balt ~/.config/lvim/config.lua
let s:l = 314 - ((12 * winheight(0) + 20) / 40)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 314
normal! 06|
lcd ~/.config/lvim/lua/user
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 82 + 83) / 166)
exe 'vert 2resize ' . ((&columns * 83 + 83) / 166)
tabnext 1
badd +115 ~/github/lvim/lua/user/plugins.lua
badd +341 ~/.config/lvim/lua/user/plugins.lua
badd +13 ~/.config/lvim/config.lua
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=FnlOcTitofIx
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :

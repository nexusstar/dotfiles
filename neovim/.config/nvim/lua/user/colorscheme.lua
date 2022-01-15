local _time = os.date "*t"
if _time.hour < 6 or _time.hour < 10 then
  vim.cmd [[
    try
      colorscheme catppuccin
    catch /^Vim\%((\a\+)\)\=:E185/
      colorscheme default
      set background=dark
    endtry
  ]]
else
    vim.cmd [[
    try
      colorscheme tokyonight
    catch /^Vim\%((\a\+)\)\=:E185/
      colorscheme default
      set background=dark
    endtry
    ]]
end

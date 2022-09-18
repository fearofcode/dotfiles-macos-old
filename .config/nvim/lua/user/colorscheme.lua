vim.g.gruvbox_baby_telescope_theme = 1
vim.g.gruvbox_baby_function_style = "NONE"
vim.g.gruvbox_baby_background_color = "dark"

vim.cmd [[
try
  colorscheme gruvbox-baby
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]

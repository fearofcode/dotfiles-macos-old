vim.g.gruvbox_baby_telescope_theme = 1
vim.g.gruvbox_baby_function_style = "NONE"
vim.g.gruvbox_baby_background_color = "dark"

-- set gruvbox-baby colorscheme. make line numbers
-- and comments more visible by overriding colors
vim.cmd [[
try
  colorscheme gruvbox-baby
  hi LineNr guifg=#bdae93
  hi Comment guifg=#FB4934 cterm=bold
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]

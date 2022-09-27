-- vim.g.gruvbox_baby_telescope_theme = 1
-- vim.g.gruvbox_baby_function_style = "NONE"
-- vim.g.gruvbox_baby_background_color = "dark"
--
-- -- set gruvbox-baby colorscheme. make line numbers
-- -- more visible. i want to make comments ugly but the world
-- -- uses so many comments that it makes something like an i3 config
-- -- file incredibly ugly to look at
-- vim.cmd [[
-- try
--   colorscheme gruvbox-baby
--   hi LineNr guifg=#bdae93
-- catch /^Vim\%((\a\+)\)\=:E185/
--   colorscheme default
--   set background=dark
-- endtry
-- ]]

-- vim.cmd [[ colorscheme monotone]]

vim.cmd [[ colorscheme alabaster_dark ]]

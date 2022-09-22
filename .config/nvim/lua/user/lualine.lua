local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "gruvbox-baby",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	-- sections = {
	-- 	lualine_a = { branch, diagnostics },
	-- 	lualine_b = { mode },
	-- 	lualine_c = {},
	-- 	-- lualine_x = { "encoding", "fileformat", "filetype" },
	-- 	lualine_x = { diff, "encoding", filetype },
	-- },
	-- inactive_sections = {
	-- 	lualine_a = {},
	-- 	lualine_b = {},
	-- 	lualine_c = { "filename" },
	-- 	lualine_x = { "location" },
	-- 	lualine_y = {},
	-- 	lualine_z = {},
	-- },
	-- tabline = {},
	-- extensions = {},
})

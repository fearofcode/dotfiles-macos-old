local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- delete word with Ctrl-Delete when in insert mode
keymap("i", "<C-BS>", "<C-W>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)


-- toggle tree
keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)

-- basic telescope and spectre commands
vim.cmd [[ 
  nnoremap <leader>ff <cmd>Telescope find_files<cr>
  nnoremap <leader>lg <cmd>Telescope live_grep<cr>
  nnoremap <leader>fb <cmd>Telescope buffers<cr>
  nnoremap <leader>fh <cmd>Telescope help_tags<cr>

  nnoremap <leader>S <cmd>lua require('spectre').open()<CR>

  "search current word
  nnoremap <leader>sw <cmd>lua require('spectre').open_visual({select_word=true})<CR>
  vnoremap <leader>s <esc>:lua require('spectre').open_visual()<CR>
  "  search in current file
  nnoremap <leader>sp viw:lua require('spectre').open_file_search()<cr>
  " run command :Spectre
]]

-- debugging keybindings
local ok, _ = pcall(require, "dap")
if not ok then return end

-- sort of like Super + Alt + L for IntelliJ but Alacritty doesn't recognize
-- super key shortcut apparently
-- https://vi.stackexchange.com/questions/37212/super-key-not-working-in-neovim-on-linux
vim.keymap.set("n", "<leader>l", ":lua vim.lsp.buf.format()<CR>", opts)
-- based off IntelliJ debugger shortcuts
vim.keymap.set("n", "<F9>", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F8>", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F7>", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<Shift-F8>", ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set("n", "<leader>dro", ":lua require'dap'.repl.open()<CR>")
vim.keymap.set("n", "<leader>drc", ":lua require'dap'.repl.close()<CR>")
vim.keymap.set("n", "<leader>dt", ":lua require'dap-go'.debug_test()<CR>")
-- no fucking way I'm going to remember these keyboard shortcuts but whatever
-- the cure to vim plugin issues is MORE VIM PLUGIN (which-key in this case)
vim.keymap.set('n', '<Alt-F9>', function() require"dap".run_to_cursor() end)
vim.keymap.set('n', '<Ctrl-F2>', function() require"dap".terminate() end)
vim.keymap.set('n', '<leader>cb', function() require"dap".clear_breakpoints() end)
vim.keymap.set('n', '<leader>seb', function() require"dap".set_exception_breakpoints({"all"}) end)
vim.keymap.set('n', '<leader>dha', function() require"debugHelper".attach() end)
vim.keymap.set('n', '<leader>dhra', function() require"debugHelper".attachToRemote() end)
vim.keymap.set('n', '<leader>dwh', function() require"dap.ui.widgets".hover() end)
vim.keymap.set('n', '<leader>df', function() local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes) end)
vim.keymap.set('n', '<leader>dk', ':lua require"dap".up()<CR>zz')
vim.keymap.set('n', '<leader>dj', ':lua require"dap".down()<CR>zz')
vim.keymap.set('n', '<leader>dr', ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l')

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end


-- Emacs bindings
--
--- Navigation

-- backward-char
vim.keymap.set("!", "<C-b>", "<Left>", { silent = true })

-- forward-char
vim.keymap.set("!", "<C-f>", "<Right>", { silent = true })

-- previous-line
vim.keymap.set("i", "<C-p>", "<Up>", { silent = true })

-- next-line
vim.keymap.set("i", "<C-n>", "<Down>", { silent = true })

-- move-beginning-of-line
vim.keymap.set("!", "<C-a>", "<Home>", { silent = true })

-- move-end-of-line
vim.keymap.set("!", "<C-e>", "<End>", { silent = true })

-- backward-sentence
vim.keymap.set("i", "<M-a>", "<C-o>(", { silent = true })

-- forward-sentence
vim.keymap.set("i", "<M-e>", "<C-o>)", { silent = true })

-- backward-word
vim.keymap.set("i", "<M-b>", "<C-Left>", { silent = true })
vim.keymap.set("c", "<M-b>", "<S-Left>", { silent = true })

-- forward-word
vim.keymap.set("i", "<M-f>", "<C-o>e<Right>", { silent = true })
vim.keymap.set("c", "<M-f>", "<S-Right>", { silent = true })

-- scroll-down-command
vim.keymap.set("i", "<M-v>", "<PageUp>", { silent = true })

-- scroll-up-command
vim.keymap.set("i", "<C-v>", "<PageDown>", { silent = true })

--
--- Copy & Paste

-- delete-char
vim.keymap.set("!", "<C-d>", "<Del>", { silent = true })

--
--- Editing

-- kill-region
vim.keymap.set("!", "<M-BS>", "<C-w>", { silent = true })
vim.keymap.set("i", "<C-BS>", "<C-w>", { silent = true })

-- kill-line
vim.keymap.set("i", "<C-k>", function()
	local col = vim.api.nvim_win_get_cursor(0)[2]
	local line = vim.api.nvim_get_current_line()

	if #line <= col then
		return "<Del><C-o>dw"
	end

	return "<C-o>dw"
end, { silent = true, expr = true })
vim.keymap.set("c", "<C-k>", "<C-f>d$<C-c><End>", { silent = true })

-- kill-word
vim.keymap.set("i", "<M-d>", function()
	local col = vim.api.nvim_win_get_cursor(0)[2]
	local line = vim.api.nvim_get_current_line()

	if #line <= col then
		return "<Del>"
	end

	return "<C-o>d$"
end, { silent = true, expr = true })

-- kill-sentence
vim.keymap.set("i", "<M-k>", "<C-o>d)", { silent = true })


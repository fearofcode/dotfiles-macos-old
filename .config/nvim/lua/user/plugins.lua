local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing Packer. Close and reopen Neovim when it is complete.")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	use({ "wbthomason/packer.nvim", commit = "6afb674" }) -- Have packer manage itself
	use({ "nvim-lua/plenary.nvim", commit = "9e7c628" }) -- Useful lua functions used by lots of plugins
	use({ "windwp/nvim-autopairs", commit = "14cc2a4" }) -- Autopairs, integrates with both cmp and treesitter
	use({ "numToStr/Comment.nvim", commit = "d9cfae1" })
	use({ "kyazdani42/nvim-web-devicons", commit = "563f363" })
	use({ "kyazdani42/nvim-tree.lua", commit = "45d386a" })
	use({ "nvim-lualine/lualine.nvim", commit = "a52f078026b27694d2290e34efa61a6e4a690621" })
	use({ "lewis6991/impatient.nvim", commit = "b842e16ecc1a700f62adb9802f8355b99b52a5a6" })
  use({ "romgrk/barbar.nvim", commit = "855dbe9e148fb211e079adfb9bab8dfc4c904ac1"})

	-- Color scheme
  -- use({ "luisiacc/gruvbox-baby", commit = "a7dd15a89fba420b73d712ca9cfc0c08158b2904"})
  -- use 'rktjmp/lush.nvim'
  -- use 'Lokaltog/monotone.nvim'
  use 'p00f/alabaster_dark.nvim'

	-- cmp plugins
	use({ "hrsh7th/nvim-cmp", commit = "2427d06" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer", commit = "3022dbc" }) -- buffer completions
	use({ "hrsh7th/cmp-path", commit = "447c87c" }) -- path completions
	use({ "saadparwaiz1/cmp_luasnip", commit = "a9de941" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp", commit = "affe808" })

	-- snippets
	use({ "L3MON4D3/LuaSnip", commit = "8f8d493" }) --snippet engine

  use({ "NvChad/nvim-colorizer.lua", commit = "9dd7ecde55b06b5114e1fa67c522433e7e59db8b"})

	-- LSP asdf
	use({ "neovim/nvim-lspconfig", commit = "e5ba5d2b96843903108b00f07fea782268cdd6af" }) -- enable LSP
  use({
    "glepnir/lspsaga.nvim",
    commit = "264994f7ff6ce07d117e005e6d093938a8157318",
    config = function()
        local saga = require("lspsaga")

        saga.init_lsp_saga({
            -- your configuration
        })
    end,
  })
  use({
    "williamboman/mason.nvim",
    commit = "6f706712ec0363421e0988cd48f512b6a6cf7d6e",
    config = function() require("mason").setup() end
  })
  use({
    "williamboman/mason-lspconfig.nvim",
    commit = "0051870",
    config = function ()
      require("mason-lspconfig").setup({
          -- see also server list in lsp/configs.lua
          ensure_installed = { "jsonls", "sumneko_lua", "gopls", "rust_analyzer" }
      })
  end
  })

	-- Telescope
	use({ "nvim-telescope/telescope.nvim", commit = "76ea9a898d3307244dce3573392dcf2cc38f340f" })

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		commit = "aebc6cf",
	})

  -- DAP (must dab before using DAP)
  use({
    "mfussenegger/nvim-dap",
    commit = "0b320f5bd4e5f81e8376f9d9681b5c4ee4483c25",
    config = function()
      -- change breakpoint marker from default 'B' to little dot thing
      vim.fn.sign_define('DapBreakpoint', {text='', texthl='', linehl='', numhl=''})
      vim.fn.sign_define('DapBreakpointCondition', {text='', texthl='', linehl='', numhl=''})
      vim.fn.sign_define('DapBreakpointRejected', {text='', texthl='', linehl='', numhl=''})
      vim.fn.sign_define('DapStopped', {text='', texthl='', linehl='', numhl=''})
      vim.fn.sign_define('DapLogPoint', {text='朗', texthl='', linehl='', numhl=''})
    end
  })

  use({
    "theHamsta/nvim-dap-virtual-text",
    commit = "2971ce3e89b1711cc26e27f73d3f854b559a77d4",
    config = function ()
      require("nvim-dap-virtual-text").setup()
    end
  })
  use({
    "rcarriga/nvim-dap-ui",
    commit = "c8ce83a66deb0ca6f5af5a9f9d5fcc05a6d0f66b",
    config =function ()
      require("dapui").setup()
    end
  })
  -- motion. leap is cool but confusing (I am stupid)
  use({
    "ggandor/leap.nvim",
    commit = "5a09c30bf676d1392ff00eb9a41e0a1fc9b60a1b",
    config = function()
      require('leap').set_default_keymaps()
    end
  })

  use({
    'simrat39/rust-tools.nvim',
    commit = "86a2b4e31f504c00715d0dd082a6b8b5d4afbf03",
    config = function()
      local rt = require("rust-tools")

      rt.setup({
        server = {
          on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>ca", rt.code_action_group.code_action_group, { buffer = bufnr })
          end,
        },
      })
    end 
  })
  -- Emacs/bash keybindings when in insert mode
  use({
    "tpope/vim-rsi",
    commit = "4c673fb6c70652a09682c50a0e308184731ca70b"
  })
  -- old school shit right here. helpers for adding/changing parens, quotes etc
  use({
    "tpope/vim-surround",
    commit = "bf3480dc9ae7bea34c78fbba4c65b4548b5b1fea"
  })
  -- EditorConfig support
  use({
    "gpanders/editorconfig.nvim",
    commit = "7d10fe6bc340fd783c0b61cf627dd235100284db"
  })

  use({
    "nvim-pack/nvim-spectre",
    commit = "6d877bc1f2262af1053da466e4acd909ad61bc18",
    config = function() require('spectre').setup() end
  })
	-- Git
	use({ "lewis6991/gitsigns.nvim", commit = "f98c85e7c3d65a51f45863a34feb4849c82f240f" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end

  local colorizer_ok, colorizer = pcall(require, "colorizer")
  if not colorizer_ok then
    return
  end
  colorizer.setup()
end)

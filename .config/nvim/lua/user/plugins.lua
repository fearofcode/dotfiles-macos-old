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
	use({ "wbthomason/packer.nvim", commit = "00ec5adef58c5ff9a07f11f45903b9dbbaa1b422" }) -- Have packer manage itself
	use({ "nvim-lua/plenary.nvim", commit = "968a4b9afec0c633bc369662e78f8c5db0eba249" }) -- Useful lua functions used by lots of plugins
	use({ "windwp/nvim-autopairs", commit = "fa6876f832ea1b71801c4e481d8feca9a36215ec" }) -- Autopairs, integrates with both cmp and treesitter
	use({ "numToStr/Comment.nvim", commit = "2c26a00f32b190390b664e56e32fd5347613b9e2" })
	use({ "kyazdani42/nvim-web-devicons", commit = "8d2c5337f0a2d0a17de8e751876eeb192b32310e" })
	use({ "kyazdani42/nvim-tree.lua", commit = "bdb6d4a25410da35bbf7ce0dbdaa8d60432bc243" })
	use({ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" })
	use({ "nvim-lualine/lualine.nvim", commit = "3362b28f917acc37538b1047f187ff1b5645ecdd" })
	use({ "lewis6991/impatient.nvim", commit = "969f2c5c90457612c09cf2a13fee1adaa986d350" })
	use({ "lukas-reineke/indent-blankline.nvim", commit = "6177a59552e35dfb69e1493fd68194e673dc3ee2" })
  use({ "nvim-zh/better-escape.vim", commit = "6b16a45a839727977277f6ab11bded63e9ed86bb"})
  use({ "romgrk/barbar.nvim", commit = "c41ad6e3f68c2c9f6aa268c6232cdef885107303"})

	-- Colorschemes
  use({ "luisiacc/gruvbox-baby", commit = "a7dd15a89fba420b73d712ca9cfc0c08158b2904"})

	-- cmp plugins
	use({ "hrsh7th/nvim-cmp", commit = "df6734aa018d6feb4d76ba6bda94b1aeac2b378a" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer", commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323" }) -- buffer completions
	use({ "hrsh7th/cmp-path", commit = "466b6b8270f7ba89abd59f402c73f63c7331ff6e" }) -- path completions
	use({ "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" })
	use({ "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" })

	-- snippets
	use({ "L3MON4D3/LuaSnip", commit = "79b2019c68a2ff5ae4d732d50746c901dd45603a" }) --snippet engine

  use({ "NvChad/nvim-colorizer.lua", commit = "004a2b3ef62b01d3d1db454d1efe76d31934d43b"})

	-- LSP
	use({ "neovim/nvim-lspconfig", commit = "148c99bd09b44cf3605151a06869f6b4d4c24455" }) -- enable LSP
  use({
    "williamboman/mason.nvim",
    commit = "4a5aaf7d4cf91b595b8defc0f3ed9b5c995755ad",
    config = function() require("mason").setup() end
  })
  use({
    "williamboman/mason-lspconfig.nvim",
    commit = "1f7948fd516d922fcbf922788e56afe3bea93de1",
    config = function ()
      require("mason-lspconfig").setup({
          -- see also server list in lsp/configs.lua
          ensure_installed = { "jsonls", "sumneko_lua", "gopls", "rust_analyzer" }
      })
  end
  })
	use({ "jose-elias-alvarez/null-ls.nvim", commit = "ff40739e5be6581899b43385997e39eecdbf9465" }) -- for formatters and linters

  -- Adds go-specific functions for running, testing, gofmt, etc
  use({ "fatih/vim-go", commit = "22b2273cfe562ac1c1af976ce77f18a3b1776f3c"})

	-- Telescope
	use({ "nvim-telescope/telescope.nvim", commit = "d96eaa914aab6cfc4adccb34af421bdd496468b0" })

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		commit = "518e27589c0463af15463c9d675c65e464efc2fe",
	})

  -- DAP (must dab before using DAP)
  use({
    "mfussenegger/nvim-dap",
    commit = "bbd3e7e15ac6b5e7aceb680515f7352d6a0953be",
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
    commit = "4af75ae48a213aede653b1954459a47b3fc18dac",
    config =function ()
      require("dapui").setup()
    end
  })
  use({
    "leoluz/nvim-dap-go",
    commit = "c2902bb96c45e872d947d7e174775e652439add4",
    config =function ()
      require("dap-go").setup()
    end
  })

  -- motion. leap is cool but I found it confusing (I am stupid)
  -- use({
  --   "ggandor/leap.nvim",
  --   commit = "aba53d7a8870426bea89eeca6c3b265d1f94c584",
  --   config = function()
  --     require('leap').set_default_keymaps()
  --   end
  -- })
  use({
    "ggandor/lightspeed.nvim",
    commit = "a5b79ddbd755ac8d21a8704c370b5f643dda94aa",
  })

  use({
    "nvim-pack/nvim-spectre",
    commit = "6f990755c46cb9b11a37c3e334ee06ad866a4bf8",
    config = function() require('spectre').setup() end
  })
	-- Git
	use({ "lewis6991/gitsigns.nvim", commit = "c18e016864c92ecf9775abea1baaa161c28082c3" })

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

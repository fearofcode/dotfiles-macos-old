local lspconfig = require("lspconfig")

local servers = { 
  {name = "gopls", call_setup = true}, 
  {name = "rust_analyzer", call_setup = true}, -- rust-tools will call setup for us
}

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server.name)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end
  if server.call_setup then
	  lspconfig[server.name].setup(opts)
  end
end

local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "user.lsp.configs"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"

require "trouble".setup {
  use_diagnostic_signs = true,
  auto_open = true,
  auto_close = true
}

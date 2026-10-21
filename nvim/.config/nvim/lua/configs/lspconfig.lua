require("nvchad.configs.lspconfig").defaults()

-- Language servers to enable (install with :Mason)
-- Per-server options: see :h vim.lsp.config
local servers = {}
vim.lsp.enable(servers)

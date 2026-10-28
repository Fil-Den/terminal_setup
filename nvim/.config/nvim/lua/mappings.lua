require "nvchad.mappings"

-- My mappings
-- Defaults: <leader>ch shows the cheatsheet, :Telescope keymaps searches all keymaps

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })
map("n", "gs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "LSP document symbols" })

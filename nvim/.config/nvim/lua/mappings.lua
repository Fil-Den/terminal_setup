require "nvchad.mappings"

-- My mappings
-- Defaults: <leader>ch shows the cheatsheet, :Telescope keymaps searches all keymaps

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })
map("n", "gs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "LSP document symbols" })

-- zf on a visual selection creates a fold; that needs foldmethod=manual, and switching to it
-- keeps the treesitter folds already in the window
map("x", "zf", function()
  vim.wo.foldmethod = "manual"
  return "zf"
end, { expr = true, desc = "Fold selected region" })

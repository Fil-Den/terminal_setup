require "nvchad.mappings"

-- My mappings
-- Defaults: <leader>ch shows the cheatsheet
-- <C-p> is a VS Code-style palette: fuzzy-search keymaps by key or desc, Enter runs it.
-- <leader>fc does the same for :commands

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })
map("n", "ds", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "LSP document symbols" })
map("n", "<C-p>", "<cmd>Telescope keymaps<CR>", { desc = "Command palette (search keymaps)" })
map("n", "<leader>fc", "<cmd>Telescope commands<CR>", { desc = "telescope find commands" })

-- zf on a visual selection creates a fold; that needs foldmethod=manual, and switching to it
-- keeps the treesitter folds already in the window
map("x", "zf", function()
  vim.wo.foldmethod = "manual"
  return "zf"
end, { expr = true, desc = "Fold selected region" })

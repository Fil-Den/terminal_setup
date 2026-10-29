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

-- Fold/unfold the treesitter block under the cursor (no selection needed). These are Vim's
-- built-in keys, mapped to themselves so they show up with a description in <C-p>
map("n", "zc", "zc", { desc = "Fold block under cursor" })
map("n", "zo", "zo", { desc = "Unfold block under cursor" })
map("n", "za", "za", { desc = "Toggle fold under cursor" })
map("n", "zM", "zM", { desc = "Fold all" })
map("n", "zR", "zR", { desc = "Unfold all" })

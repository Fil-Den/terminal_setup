require "nvchad.options"

-- My options

-- local o = vim.o
-- o.cursorlineopt = "both"

-- Font for GUI clients (e.g. Neovide); terminal nvim uses the terminal's font
vim.o.guifont = "JetBrains Mono:h14"

-- Vertical ruler at 100 characters
vim.o.colorcolumn = "100"

-- Folding: fold by treesitter syntax (functions, classes, blocks), all open on file load
-- za toggle, zc close, zo open, zM close all, zR open all
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldtext = ""
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99

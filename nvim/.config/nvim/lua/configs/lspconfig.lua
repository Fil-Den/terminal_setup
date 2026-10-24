require("nvchad.configs.lspconfig").defaults()

-- Language servers to enable: uncomment a line to turn that server on.
-- Install the server binary with :MasonInstall <package> (package name in the comment).
-- Check what is attached to the current buffer with :checkhealth vim.lsp
local servers = {
  "clangd", -- C/C++, :MasonInstall clangd (needs compile_commands.json in the project)
  "marksman", -- Markdown links/headings, :MasonInstall marksman
  -- "starpls", -- Starlark/Bazel, :MasonInstall starpls
  -- "basedpyright", -- Python types/navigation, reads [tool.basedpyright] / [tool.pyright] in pyproject.toml
  -- "ruff", -- Python lint/format, reads [tool.ruff] in pyproject.toml
}

-- Per-server options (only used when the server is enabled above). See :h vim.lsp.config
vim.lsp.config("clangd", {
  cmd = { "clangd", "--background-index", "--clang-tidy", "--header-insertion=never" },
})

vim.lsp.config("basedpyright", {
  settings = {
    basedpyright = {
      -- Defaults when pyproject.toml doesn't set them; pyproject.toml settings take precedence
      analysis = { typeCheckingMode = "standard" },
    },
  },
})

vim.lsp.enable(servers)

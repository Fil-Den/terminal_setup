-- Linters per filetype (install with :Mason)
local lint = require "lint"

lint.linters_by_ft = {
  markdown = { "markdownlint-cli2" }, -- :MasonInstall markdownlint-cli2, reads .markdownlint.{json,yaml} / .markdownlint-cli2.* in the project
}

vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
  group = vim.api.nvim_create_augroup("lint", { clear = true }),
  callback = function()
    lint.try_lint()
  end,
})

require "nvchad.autocmds"

-- My autocommands

-- `nvim path/to/dir` -> make that dir the cwd so Telescope/grep/tree are scoped to it
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local arg = vim.fn.argv(0)
    if arg ~= "" and vim.fn.isdirectory(arg) == 1 then
      vim.cmd.cd(vim.fn.fnameescape(arg))
    end
  end,
})

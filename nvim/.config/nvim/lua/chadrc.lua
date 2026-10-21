-- NvChad UI config. Same structure as nvconfig.lua:
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Switch themes live with <leader>th

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "github_light",

  -- hl_override = {
  --   Comment = { italic = true },
  --   ["@comment"] = { italic = true },
  -- },
}

-- M.nvdash = { load_on_startup = true }

return M

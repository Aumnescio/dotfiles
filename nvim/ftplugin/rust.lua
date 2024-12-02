-- `ftplugin/rust.lua`

vim.api.nvim_cmd({ cmd = "set", args = { "list" }}, {})
vim.api.nvim_cmd({ cmd = "set", args = { "nu" }}, {})

-- NOTE: Causes lag in files with more than 500-1000 lines.
--  - Also probably not strictly required. ( Something else automatically enables Treesitter. )
vim.api.nvim_cmd({ cmd = "TSEnable", args = { "highlight", "rust" }}, {})
vim.treesitter.start(vim.api.nvim_get_current_buf(), "rust")

-- End of File

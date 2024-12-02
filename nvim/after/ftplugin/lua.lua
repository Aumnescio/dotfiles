-- In `ftplugin/lua.lua`, this did not work.
-- In `after/ftplugin/lua.lua`, this seems to work.
vim.treesitter.stop()

vim.api.nvim_cmd({ cmd = "syntax", args = { "on" }}, {})

-- End of File

-- File:        `NeovimPlugins/Aumnescio/auto-trim-whitespace.lua`
-- Author:      Aumnescio

-- Init Module
local Module = {}

-- Core Functionality
function Module.trim_nearby_whitespace()
    local cur_row, cur_col  = unpack(vim.api.nvim_win_get_cursor(0))
    local line_count = vim.api.nvim_buf_line_count(0)
    local range_start = 0
    local range_end = 0

    if cur_row - 4 <= 0 then
        range_start = 0
    else
        range_start = cur_row - 4
    end

    if cur_row + 4 >= line_count then
        range_end = line_count
    else
        range_end = cur_row + 4
    end

    local command_string = "silent! " .. range_start .. "," .. range_end .. [[s/\s\+$//e]]

    vim.cmd(command_string)
    vim.api.nvim_win_set_cursor(0, {cur_row, cur_col})
end

-- Setup Function
function Module.setup(opts)
    local auto_trim_whitespace_augroup = vim.api.nvim_create_augroup("AutoTrimWhitespace", { clear = true })
    vim.api.nvim_create_autocmd("InsertLeave", {
        callback = function()
            Module.trim_nearby_whitespace()
        end,
        group = auto_trim_whitespace_augroup,
    })
end

-- Return
return Module

-- End of File

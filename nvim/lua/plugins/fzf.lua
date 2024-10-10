-- File:                `nvim/lua/plugins/fzf.lua`
-- Purpose:             `lazy.nvim` Plugin Specification    ( fzf / fzf.vim )

return {
    {
        "junegunn/fzf",
        lazy = false,
    },

    {
        "junegunn/fzf.vim",
        lazy = false,
        config = function()
            vim.g.fzf_vim = {
                preview_window = { "up,45%", "ctrl-/" },
                tags_command = { "rusty-tags vi" },
            }

            -- Buffer-local bindings for the `fzf` buffer.
            local fzf_buffer_bindings_aumgroup = vim.api.nvim_create_augroup("AumFzfBufferBindingsAumgroup", { clear = true })
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "fzf" },
                callback = function()
                    local current_buffer = vim.api.nvim_get_current_buf()

                    vim.api.nvim_buf_set_keymap(current_buffer, "n", "<Esc>", "<Cmd>close<CR>", { noremap = true, silent = true } )
                end,
                group = fzf_buffer_bindings_aumgroup
            })
        end,
    },
}

-- End of File

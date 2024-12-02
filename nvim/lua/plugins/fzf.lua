-- File:                `nvim/lua/plugins/fzf.lua`
-- Purpose:             `lazy.nvim` Plugin Specification    ( fzf / fzf.vim )

return {
    {
        "junegunn/fzf",
        enabled = true,
        cond = vim.g.aum_plugin_fzf_enabled,
        lazy = false,
    },

    {
        "junegunn/fzf.vim",
        enabled = true,
        cond = vim.g.aum_plugin_fzfvim_enabled,
        lazy = false,

        config = function()
            vim.g.fzf_vim = {
                preview_window = { "up,45%", "ctrl-/" },
                tags_command = { "rusty-tags vi" },
            }

            -- |> I can't figure out how to remove the bindings, and have the FZF_DEFAULT_OPTS bindings work within Neovim. (TODO)
            -- vim.g.fzf_action = {
            --     ["ctrl-t"] = "tab split",
            -- }

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

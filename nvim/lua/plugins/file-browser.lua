-- File:                `nvim/lua/plugins/file-browser.lua`
-- Purpose:             `lazy.nvim` Plugin Specification    ( `trek.nvim` )

return {
    {   -- File Browser.                                                ( STATE: Testing )
        --  - Some sort of combination of `lf/ranger`, `mini.files` and `oil.nvim`.
        "Aumnescio/trek.nvim",
        -- "stefanwatt/trek.nvim",
        enabled = true,
        cond = vim.g.aum_plugin_trek_enabled,
        lazy = true,
        version = false,
        dev = true,

        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },

        keys = {
            {
                "<C-f>",
                mode = { "n" },
                function()
                    require("trek").open(vim.api.nvim_buf_get_name(0))
                end,
                desc = "[Aum/Trek] Open File Explorer/Browser/Manager",
            },
        },

        opts = {
            keymaps = {
                close = "<C-q>",
                go_in = "zt",
                go_out = "zh",
                synchronize = "=",
                mark_entry = "<Tab>",
            }
        },

        config = function(_, opts)
            require("trek").setup(opts)
        end
    }
}

-- End of File

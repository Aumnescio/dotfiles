-- File:

return {
    {   -- Main Colorscheme / Theme                 ( STATE: Good )
        "Aumnescio/aumnechroma.nvim",
        enabled = true,
        cond = vim.g.aum_plugin_aumnechroma_enabled,
        lazy = false,
        dev = true,
        priority = 1000,

        config = function()
            vim.api.nvim_cmd({ cmd = "colorscheme", args = { "aumnechroma" } }, {})
        end,
    },

    {
        "catppuccin/nvim", name = "catppuccin",
        enabled = false,            -- Not using catppuccin. Using my own custom theme which is better.
        cond = vim.g.aum_plugin_catppuccin_enabled,
        lazy = true,
        cmd = "LoadThemeCatppuccin",

        config = function()
            vim.api.nvim_cmd({ cmd = "colorscheme", args = { "catppuccin-mocha" } }, {})
        end,
    },
}

-- End of File

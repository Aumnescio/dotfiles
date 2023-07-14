-- File:

return {
    {   -- Main Colorscheme / Theme                 ( STATE: Good )
        "Aumnescio/aumnechroma.nvim",
        lazy = false,
        dev = true,
        priority = 1000,

        config = function()
            vim.api.nvim_cmd({ cmd = "colorscheme", args = { "aumnechroma" } }, {})
        end,
    },
    {
        "catppuccin/nvim", name = "catppuccin",
        enabled = false,        -- Not using catppuccin.
        lazy = true,
        cmd = "LoadThemeCatppuccin",

        config = function()
            vim.api.nvim_cmd({ cmd = "colorscheme", args = { "catppuccin-mocha" } }, {})
        end,
    },
}

-- End of File

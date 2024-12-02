-- File:                `nvim/lua/plugins/init.lua`
-- Purpose:             `lazy.nvim` Plugin Specification    ( Default Entry Point: Mostly for plugins that haven't been categorized yet. )

return {
    {   -- `Keymap Manager` and `Command Palette`.      ( STATE: Extremely Good )
        --  - NOTE: Needed to configure things in Telescope Spec for all lazy-loading to work without errors.
        "mrjones2014/legendary.nvim",
        enabled = true,
        cond = vim.g.aum_plugin_legendary_enabled,
        lazy = false,           -- Setting to `true` doesn't really do anything, because binds are required quite early.
        priority = 1005,
        version = "*",          -- Should be fine.

        dependencies = {
            "kkharji/sqlite.lua",
            "stevearc/dressing.nvim",
        },
    },
}

-- End of File

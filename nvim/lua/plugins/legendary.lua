-- File:                `nvim/lua/plugins/init.lua`
-- Purpose:             `lazy.nvim` Plugin Specification    ( Default Entry Point: Mostly for plugins that haven't been categorized yet. )

return {
    {   -- `Keymap Manager` and `Command Palette`.      ( STATE: Extremely Good )
        --  - NOTE: Needed to configure things in Telescope Spec for all lazy-loading to work without errors.
        "mrjones2014/legendary.nvim",
        cond = true,            -- Overwrite VS-Code condition. Allow in VS-Code, because legendary sets keymaps.
        lazy = false,           -- Setting to `true` doesn't really do anything, because binds are required quite early.
        version = "*",          -- Should be fine.
        dependencies = {
            "kkharji/sqlite.lua",
            "stevearc/dressing.nvim",
        },
    },
}

-- End of File

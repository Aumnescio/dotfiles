-- File:                `nvim/lua/plugins/kitty.lua`
-- Purpose:             `lazy.nvim` Plugin Specification    ( Kitty-related Plugins )

return {
    {   -- This is quite nice.. But the keymap config is a mess.
        --  - Might just clone this locally and fix in source.
        --  - 'mikesmithgh/kitty-scrollback.nvim',                  -- Original
        'Aumnescio/kitty-scrollback.nvim',                          -- Fork
        enabled = true,
        -- cond = vim.g.aum_plugin_kitty_scrollback_enabled,
        dev = true,

        -- version = '^5.0.0',      -- Pin major version, include fixes and features that do not have breaking changes.
        -- version = '*',           -- Latest stable version, may have breaking changes if major version changed.

        lazy = true,
        cmd = { 'KittyScrollbackGenerateKittens', 'KittyScrollbackCheckHealth' },
        event = { 'User KittyScrollbackLaunch' },

        config = function()
            require("kitty-scrollback").setup()
        end,
    }
}

-- End of File

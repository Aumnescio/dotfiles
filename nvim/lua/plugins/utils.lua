-- File:                `nvim/lua/plugins/utils.lua`
-- Purpose:             `lazy.nvim` Plugin Specification    ( Utilities )

-- `plenary.nvim`
-- `vim-repeat`
-- `sqlite.lua`

return {
    {   -- Helper functions                             ( STATE: Good )
        --  - Dependency for some plugins.
        "nvim-lua/plenary.nvim",
        enabled = true,
        cond = vim.g.aum_plugin_plenary_enabled,
        lazy = false,
        version = false,
    },

    {   -- SQLite/LuaJIT Bindings                      ( STATE: Fine I suppose )
        --  - Dependency for some plugins.
        "kkharji/sqlite.lua",
        enabled = true,
        cond = vim.g.aum_plugin_sqlite_enabled,
        lazy = false,
        version = false,
    },

    {   -- Makes a number of plugins dot-repeatable.    ( STATE: Good, mostly. )
        "tpope/vim-repeat",
        enabled = true,
        cond = vim.g.aum_plugin_vim_repeat_enabled,
        lazy = false,
        version = false,
    },

    {   -- Some util functions.                         ( STATE: Testing. Probably fine. )
        "tpope/vim-eunuch",
        enabled = true,
        cond = vim.g.aum_plugin_vim_eunuch_enabled,
        lazy = false,
        version = false,
    },
}

-- End of File

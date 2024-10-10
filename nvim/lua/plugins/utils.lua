-- File:                `nvim/lua/plugins/utils.lua`
-- Purpose:             `lazy.nvim` Plugin Specification    ( Utilities )

-- `plenary.nvim`
-- `vim-repeat`
-- `sqlite.lua`

return {
    {   -- Helper functions                             ( STATE: Good )
        --  - Dependency for some plugins.
        "nvim-lua/plenary.nvim",
        lazy = false,
        version = false,
    },

    {   -- SQLite/LuaJIT Bindings                      ( STATE: Fine I suppose )
        --  - Dependency for some plugins.
        "kkharji/sqlite.lua",
        lazy = false,
        version = false,
    },

    {   -- Makes a number of plugins dot-repeatable.    ( STATE: Good, mostly. )
        "tpope/vim-repeat",
        lazy = false,
        version = false,
    },

    {   -- Some util functions.                         ( STATE: Testing. Probably fine. )
        "tpope/vim-eunuch",
        lazy = false,
        version = false,
    },
}

-- End of File

-- File:                `nvim/lua/plugins/splits.lua`
-- Purpose:             `lazy.nvim` Plugin Specification    ( Split/Window management )

return {
    {   -- Smart Splits                                     ( STATE: TODO/WIP )
        "mrjones2014/smart-splits.nvim",
        lazy = true,
        version = "*",

        opts = {

        },

        config = function(_, opts)
            require("smart-splits").setup(opts)
        end,
    },
}

-- End of File

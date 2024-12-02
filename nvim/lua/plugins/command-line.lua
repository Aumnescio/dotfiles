-- File:                `nvim/lua/plugins/command-line.lua`
-- Purpose:             `lazy.nvim` Plugin Specification    ( Command Line )

return {
    {   -- Editable command line.                           ( STATE: Command-line search flickers. )
        -- - The edit/close bindings are also hard to make comfy.
        "smilhey/ed-cmd.nvim",
        lazy = false,       -- Fine I guess.
        version = false,
        enabled = false,
        config = function()
            require("ed-cmd").setup({
                cmdline = {
                    keymaps = {
                        edit = "<Esc>",
                        execute = "<CR>",
                        close = { "<Esc>", "<C-c>", "<C-g>" },
                    },
                },

                pumenu = { max_items = 100 },
            })
        end,
    }
}

-- End of File

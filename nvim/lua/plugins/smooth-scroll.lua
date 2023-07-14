-- File:                `nvim/lua/plugins/smooth-scroll.lua`
-- Purpose:             `lazy.nvim` Plugin Specification    ( Smooth Scroll )

-- This is a dummy command which can be used to lazy-load Cinnamon.
-- vim.api.nvim_create_user_command("EnableSmoothScroll", 'echo "Activated SmoothScroll!"', {})

return {
    {   -- Bad Smooth Scrolling                         ( STATE: Bad )
        "psliwka/vim-smoothie",
        enabled = false,            -- Disabled
        lazy = true,
        version = false,
        cmd = "EnableSmoothScroll",
        init = function()
            vim.g.smoothie_no_default_mappings = 1
        end,
        config = function()
            -- Bindings
            require("legendary").keymaps({
                -- { "h",      "<Cmd>call smoothie#do('\<C-d>')<CR>", description = "`Vim-Smoothie`: Move cursor down to the next line.",      mode = { 'n', 'v', 'o' }, opts = { noremap = true } },
                -- { "t",      "<Cmd>call smoothie#do('\<C-d>')<CR>", description = "`Vim-Smoothie`: Move cursor up to the previous line.",    mode = { 'n', 'v', 'o' }, opts = { noremap = true } },
                { "<S-h>",  "<Cmd>call smoothie#do('<C-d>')<CR>", description = "`Vim-Smoothie`: Move cursor down by 5 lines.",            mode = { 'n', 'v', 'o' }, opts = { noremap = true } },
                { "<S-t>",  "<Cmd>call smoothie#do('<C-u>')<CR>", description = "`Vim-Smoothie`: Move cursor up by 5 lines.",              mode = { 'n', 'v', 'o' }, opts = { noremap = true } },
            })

            -- Dummy Command
            vim.api.nvim_create_user_command("EnableSmoothScroll", 'echo "Activated Cinnamon!"', {})
        end,
    },
    {   -- Bad Linear Smooth Scrolling.                     ( STATE: Bad )
        "declancm/cinnamon.nvim",
        enabled = false,            -- Disabled.
        lazy = true,
        version = false,
        cmd = "EnableSmoothScroll",
        opts = {
            -- |> OPTIONS:
            disabled            = false,    -- Disables the plugin.
            always_scroll       = false,    -- Scroll the cursor even when the window hasn't scrolled.
            centered            = false,    -- Keep cursor centered in window when using window scrolling.
            hide_cursor         = false,    -- Hide the cursor while scrolling.
            horizontal_scroll   = true,     -- Enable smooth horizontal scrolling when view shifts left or right.
            default_delay       = 5,        -- The default delay (in ms) between each line when scrolling.

            -- Maximum length (in ms) of a command.
            --  - The line delay will be re-calculated.
            --  - Setting to `-1` will disable this option.
            max_length          = -1,

            -- Max number of lines moved before scrolling is skipped.
            --  - Setting to `-1` will disable this option.
            scroll_limit        = 150,

            -- |> KEYMAPS:
            default_keymaps     = false,    -- Create default keymaps.
            extra_keymaps       = false,    -- Create extra keymaps.
            extended_keymaps    = false,    -- Create extended keymaps.
            override_keymaps    = false,    -- The plugin keymaps will override any existing keymaps.
        },
        config = function(_, opts)
            -- Start Cinnamon
            require("cinnamon").setup()

            -- Bindings
            require("legendary").keymaps({
                { "h",      "<Cmd>lua Scroll('j',  1, 1)<CR>", description = "`Cinnamon`: Move cursor down to the next line.",      mode = { 'n', 'v', 'o' }, opts = { noremap = true } },
                { "t",      "<Cmd>lua Scroll('k',  1, 1)<CR>", description = "`Cinnamon`: Move cursor up to the previous line.",    mode = { 'n', 'v', 'o' }, opts = { noremap = true } },
                { "<S-h>",  "<Cmd>lua Scroll('5j', 1, 0)<CR>", description = "`Cinnamon`: Move cursor down by 5 lines.",            mode = { 'n', 'v', 'o' }, opts = { noremap = true } },
                { "<S-t>",  "<Cmd>lua Scroll('5k', 1, 0)<CR>", description = "`Cinnamon`: Move cursor up by 5 lines.",              mode = { 'n', 'v', 'o' }, opts = { noremap = true } },
            })

            -- Dummy Command
            vim.api.nvim_create_user_command("EnableSmoothScroll", 'echo "Activated Cinnamon!"', {})
        end,
    },
}

-- End of File

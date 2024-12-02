-- File:                `nvim/lua/plugins/text-editing.lua`
-- Purpose:             `lazy.nvim` Plugin Specification        ( Text Editing )

return {
    {   -- Trim nearby trailing whitespace on "InsertLeave".    ( STATE: Good )
        "Aumnescio/auto-trim-nearby-whitespace.nvim",
        enabled = true,
        cond = vim.g.aum_plugin_auto_trim_nearby_whitespace_enabled,
        lazy = true,

        event = "InsertLeave",

        config = function()
            require("auto-trim-whitespace").setup()
        end,
    },

    {   -- Line Movement Up/Down.                               ( STATE: Good, when it builds. )
        --  - Written in Rust.
        --  - Extremely fast load-time and also performant actions.
        "willothy/moveline.nvim",
        enabled = true,
        cond = vim.g.aum_plugin_moveline_enabled,
        lazy = true,
        version = "0.3.1",
        -- build = "make",      -- Ran it manually in the folder, and it worked better.
        -- NOTE: Also ran `cargo update` first.

        keys = function()
            local ret = {}
            for _, key in ipairs({ "<A-h>", "<A-t>" }) do
                ret[#ret + 1] = { key, mode = { "n", "x" } }
            end
            return ret
        end,

        config = function()
            local opts = { noremap = true, silent = true }
            require("legendary").keymaps({
                { "<A-t>",      "<Cmd>lua require('moveline').up()<CR>",            description = "Move current line up by one.",                           mode = { "n" },     opts = opts },
                { "<A-h>",      "<Cmd>lua require('moveline').down()<CR>",          description = "Move current line down by one.",                         mode = { "n" },     opts = opts },
                { "<A-t>",      "<Cmd>lua require('moveline').block_up()<CR>",      description = "Move selected block up by one line. (Visual)",           mode = { "x" },     opts = opts },
                { "<A-h>",      "<Cmd>lua require('moveline').block_down()<CR>",    description = "Move selected block down by one line. (Visual)",         mode = { "x" },     opts = opts },
            })
        end,
    },

    {   -- Select More / Expand Selection                       ( STATE: Sadly still the best one I've found. )
        --  - Looking for similar but better plugin.
        --  - NOTE: The `tree_climber_rust.nvim` plugin accomplishes extremely good incremental selection, but only for Rust files.
        --  - NOTE: Maybe name conflict with the other `wildfire`, so one of them has to be commented out.
        "Aumnescio/wildfire.nvim",
        enabled = true,
        cond = vim.g.aum_plugin_wildfire_enabled,
        lazy = true,
        dev = true,

        -- Don't activate in `.rs` files.
        cond = function()
            return not string.match(vim.fn.fnamemodify(vim.fn.bufname("%"), ":t"), ".*%.rs")
        end,

        keys = function()
            local ret = {}
            for _, key in ipairs({ "<S-l>" }) do
                ret[#ret + 1] = { key, mode = { "n", "x", "o" } }
            end
            return ret
        end,

        config = function()
            local opts = { noremap = true, silent = true }
            require("legendary").keymaps({
                -- Key:         Shift-l         ( Normal, Visual, Operator )
                { "<S-l>",      "<Plug>(wildfire-fuel)",    description = "[Aum/Selection] Wildfire: Expand incremental selection.",    mode = { "n", "x", "o" },   opts = opts },
                -- Key:         Ctrl-l          ( Visual )
                { "<C-l>",      "<Plug>(wildfire-water)",   description = "[Aum/Selection] Wildfire: Shrink selection.",                mode = { "x" },             opts = opts },
            })
        end,
    },

    -- {   -- Incremental Selection: `wildfire.nvim`               ( STATE: I hate this. )
    --     "sustech-data/wildfire.nvim",
    --     enabled = false,
    --     lazy = true,
    --     event = "VeryLazy",
    --
    --     dependencies = {
    --         "nvim-treesitter/nvim-treesitter",
    --     },
    --
    --     opts = {
    --         surrounds = {
    --             { "(", ")" },
    --             { "{", "}" },
    --             { "<", ">" },
    --             { "[", "]" },
    --         },
    --
    --         keymaps = {
    --             init_selection = "<S-l>",
    --             node_incremental = "<S-l>",
    --             node_decremental = "<C-l>",
    --         },
    --
    --         filetype_exclude = { "qf" },  -- Keymaps will be unset in excluded filetypes.
    --     },
    --
    --     config = function(_, opts)
    --         require("wildfire").setup(opts)
    --     end,
    -- },

    {
        "adaszko/tree_climber_rust.nvim",
        enabled = true,
        -- cond = vim.g.aum_plugin_tree_climber_rust_enabled,
        lazy = true,
        ft = { "rust" },
    },

    {
        "Vonr/align.nvim",
        enabled = true,
        -- cond = vim.g.aum_plugin_align_enabled,
        lazy = true,
        version = false,

        keys = function()
            local ret = {}
            for _, key in ipairs({ "ar", "al" }) do
                ret[#ret + 1] = { key, mode = "x" }
            end
            return ret
        end,

        config = function()
            local alignvim = require("align")

            require("legendary").keymaps({
                {
                    -- Align to rightmost char
                    "ar",
                    function()
                        alignvim.align_to_char({
                            length = 1,
                        })
                    end,
                    description = "Align selection to the rightmost character.",
                    mode = "x",
                    opts = { noremap = true, silent = true }
                },
                {   -- Align to leftmost char
                    "al",
                    function()
                        alignvim.align_to_char({
                            length = 1,
                            reverse = true,
                        })
                    end,
                    description = "Align selection to the leftmost character.",
                    mode = "x",
                    opts = { noremap = true, silent = true }
                },
            })
        end,
    },

    {   -- Comment Toggling                                     ( STATE: Generally been good. )
        -- - Having minor issue, `gcc` bind sometimes not working.
        -- NOTE/TODO: Might be looking to move to `mini.comment` or something.
        "numToStr/Comment.nvim",
        enabled = true,
        -- cond = vim.g.aum_plugin_comment_enabled,
        lazy = true,
        version = false,
        -- version = "0.8.0",

        -- This might or might not work.
        keys = function()
            local ret = {}
            for _, key in ipairs({ "gc", "gcc" }) do
                ret[#ret + 1] = { key, mode = "n" }
            end
            for _, key in ipairs({ "gc" }) do
                ret[#ret + 1] = { key, mode = "x" }
            end
            return ret
        end,

        opts = {
            padding = true,     -- Add a space between comment and the line.
            sticky = true,      -- Whether the cursor should stay at its position.
            ignore = nil,

            toggler = {
                line = 'gcc',
                block = 'gbc',
            },

            opleader = {
                line = 'gc',
                block = 'gb',
            },

            extra = {
                above = 'gcO',
                below = 'gco',
                eol = 'gcA',
            },

            -- Whether to automatically create keybindings.
            --  - `false`: no automatic creation of mappings.
            --  - NOTE: Bindings created manually below, using `Legendary.nvim`.
            mappings = {
                basic = false,
                extra = false,
            },

            -- Function to call before (un)comment.
            pre_hook = nil,

            -- Function to call after (un)comment.
            post_hook = nil,
        },

        config = function(_, opts)
            require("Comment").setup(opts)

            require("legendary").keymaps({
                { "gc",     "<Plug>(comment_toggle_linewise)",              description = "Comment Operator.",          mode = "n", opts = { noremap = true, silent = true } },
                { "gcc",    "<Plug>(comment_toggle_linewise_current)",      description = "Comment current line.",      mode = "n", opts = { noremap = true, silent = true } },
                { "gc",     "<Plug>(comment_toggle_linewise_visual)",       description = "Comment selected lines.",    mode = "x", opts = { noremap = true, silent = true } },
            })
        end,
    },
}

-- End of File

-- File:                `nvim/lua/plugins/text-editing.lua`
-- Purpose:             `lazy.nvim` Plugin Specification        ( Text Editing )

return {
    {   -- Trim nearby trailing whitespace on "InsertLeave".    ( STATE: Good )
        "Aumnescio/auto-trim-nearby-whitespace.nvim",
        lazy = true,
        event = "InsertLeave",
        config = function()
            require("auto-trim-whitespace").setup()
        end,
    },

    {   -- Line Movement Up/Down.                               ( STATE: Good, when it builds. )
        --  - Extremely fast load-time and also performant actions.
        --  - Written in Rust.
        "willothy/moveline.nvim",
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

    {   -- Select More / Expand Selection                       ( STATE: Better than nothing, but kind of weak. )
        --  - Looking for similar but better plugin.
        "Aumnescio/wildfire.nvim",
        enabled = true,
        lazy = true,
        dev = true,

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
                { "<S-l>",                      "<Plug>(wildfire-fuel)",                description = "Wildfire: Expand selection.",        mode = { "n", "x", "o" },       opts = opts },
                -- Key:         Ctrl-l          ( Visual )
                { "<C-l>",                      "<Plug>(wildfire-water)",               description = "Wildfire: Shrink selection.",        mode = { "x" },                 opts = opts },
            })
        end,
    },

    {
        "Vonr/align.nvim",
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
                        alignvim.align_to_char(1, false, false, false)
                    end,
                    description = "Align selection to the rightmost character.",
                    mode = "x",
                    opts = { noremap = true, silent = true }
                },
                {   -- Align to leftmost char
                    "al",
                    function()
                        alignvim.align_to_char(1, true, false, false)
                    end,
                    description = "Align selection to the leftmost character.",
                    mode = "x",
                    opts = { noremap = true, silent = true }
                },
            })
        end,
    },

    {   -- Comment Toggling                                     ( STATE: Good )
        "numToStr/Comment.nvim",
        cond = true,        -- Allow in VS-Codium.
        lazy = true,
        -- NOTE: These work, but I they are not available in `legendary.nvim`.
        -- TODO: Do the keys function thing and config function legendary bindings.
        keys = {
            { "gc",     "<Plug>(comment_toggle_linewise)",          mode = "n", desc = "Comment Operator." },
            { "gcc",    "<Plug>(comment_toggle_linewise_current)",  mode = "n", desc = "Comment current line." },
            { "gc",     "<Plug>(comment_toggle_linewise_visual)",   mode = "x", desc = "Comment selected lines." },
        },
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
            mappings = {
                basic = false,
                extra = false,
            },

            -- Function to call before (un)comment.
            pre_hook = nil,

            -- Function to call after (un)comment.
            post_hook = nil,
        },
    },
}

-- End of File

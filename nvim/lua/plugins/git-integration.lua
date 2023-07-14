-- File:                `nvim/lua/plugins/git-integration.lua`
-- Purpose:             `lazy.nvim` Plugin Specification    ( Git Integration )

return {
    {   -- Git signs in the side gutter.
        "lewis6991/gitsigns.nvim",
        lazy = true,
        -- event = { "BufReadPre", "BufNewFile" },      -- Not sure if I want this event. (I guess I want to enable this with a keybinding.)
        -- TODO: opts, config, setup
        opts = {
            signs = {
                -- Might just want all to be a line, but different color.
                add = { text = "▎" },
                change = { text = "▎" },
                delete = { text = "" },
                topdelete = { text = "" },
                changedelete = { text = "▎" },
                untracked = { text = "▎" },
            },
            -- TODO: Do these attach binds using `legendary.nvim` mappings. There prolly is some api to add mappings.
            -- on_attach = function(buffer)
            --     local gs = package.loaded.gitsigns
            --
            --     local function map(mode, l, r, desc)
            --         vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
            --     end
            --
            --     map("n", "]h", gs.next_hunk, "Next Hunk")
            --     map("n", "[h", gs.prev_hunk, "Prev Hunk")
            --     map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
            --     map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
            --     map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
            --     map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
            --     map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
            --     map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
            --     map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
            --     map("n", "<leader>ghd", gs.diffthis, "Diff This")
            --     map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
            --     map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
            -- end,
        },
    },
    {
        "f-person/git-blame.nvim",
        lazy = true,

        -- TODO: Finish config. Test this.
        cmd = {
            "GitBlameToggle",
        },

        keys = function()
            ---@type LazyKeys[]
            local ret = {}
            -- TODO: Add proper keybind.
            for _, key in ipairs({ "<Leader><Leader>gb" }) do
                ret[#ret + 1] = { key, mode = "n" }
            end
            return ret
        end,

        -- config = function(_, opts)
        --     -- do legendary mapping
        -- end,
    },
}

-- End of File

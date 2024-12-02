-- File:                `nvim/lua/plugins/mini.lua`
-- Purpose:             `lazy.nvim` Plugin Specification    ( `mini.nvim` stuff )

return {
    {   -- Surround operations, text objects, and more.         ( STATE: Good )
        "echasnovski/mini.nvim",
        enabled = true,
        cond = vim.g.aum_plugin_mini_enabled,

        -- TODO: Add `keys` function and Legendary Binding Creation in `config` function, to lazy-load this.
        -- Unless this takes like 0.5ms.

        lazy = true,
        version = false,
        event = "VeryLazy",         -- TODO: Could be loaded more lazily. ( Though this takes only 5'ish ms. )

        config = function(_, opts)
            -- |> mini-bufremove            ( Maybe looking for something better and more multipurpose. )
            require("mini.bufremove").setup()

            -- |> AroundIn                                      ( STATE: Probably decent / WIP )
            require("mini.ai").setup({
                -- Table with textobject id as fields, textobject specification as values.
                -- Also use this to disable builtin textobjects. See |MiniAi.config|.
                custom_textobjects = nil,

                -- Module mappings. Use `''` (empty string) to disable one.
                -- NOTE: These bindings are for Visual Mode.
                mappings = {
                    -- Main textobject prefixes
                    around = "a",       -- Should be fine?
                    inside = "zi",      -- Issue if just `i`.

                    -- Next/last textobjects
                    around_next = "an",
                    inside_next = "zin",
                    around_last = "al",
                    inside_last = "zil",

                    -- Move cursor to corresponding edge of `a` textobject
                    goto_left = "g[",
                    goto_right = "g]",
                },

                -- Number of lines within which textobject is searched
                n_lines = 32,

                -- How to search for object (first inside current line, then inside
                -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
                -- 'cover_or_nearest', 'next', 'prev', 'nearest'.
                search_method = 'cover_or_next',

                -- Whether to disable showing non-error feedback
                silent = false,
            })

            -- |> Surround Operations                           ( STATE: Good )
            require("mini.surround").setup({
                -- Add custom surroundings to be used on top of builtin ones. For more
                -- information with examples, see `:h MiniSurround.config`.
                custom_surroundings = nil,

                -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
                highlight_duration = 360,

                -- Module mappings. Use `''` (empty string) to disable one.
                mappings = {
                    add = "gsa",                -- Add surrounding in Normal and Visual mode.
                    delete = "gsd",             -- Delete surrounding.
                    find = "gsn",               -- Find surrounding (to the right).
                    find_left = "gso",          -- Find surrounding (to the left).
                    highlight = "gsh",          -- Highlight surrounding.
                    replace = "gsr",            -- Replace surrounding.
                    update_n_lines = "gsl",     -- Update `n_lines`.

                    suffix_next = "b",          -- Suffix to search with `next` method.
                    suffix_last = "B",          -- Suffix to search with `prev` method.
                },

                -- Number of lines within which surrounding is searched.
                n_lines = 12,

                -- How to search for surrounding (first inside current line, then inside
                -- neighborhood). One of `cover`, `cover_or_next`, `cover_or_prev`,
                -- `cover_or_nearest`, `next`, `prev`, `nearest`. For more details,
                -- see `:h MiniSurround.config`.
                search_method = "cover_or_next",
            })

            -- NOTE: Basically like `which-key` functionality, but extremely good, requiring no config.
            --  - Reads descriptions set in `Legendary.nvim` keybinds.
            local miniclue = require("mini.clue")               -- ( STATE: Extremely Good )
            miniclue.setup({
                -- To config these triggers, I think I need to understand the way my keys have been setup.
                -- I use the following keys as `Leader-like` keys: '\', '<Space>', `g`, 'z', 'i'.
                triggers = {
                    -- Leader triggers
                    { mode = 'n', keys = [[\]] },
                    { mode = 'x', keys = [[\]] },
                    { mode = 'n', keys = '<Space>' },
                    { mode = 'x', keys = '<Space>' },
                    { mode = 'n', keys = 'g' },
                    { mode = 'x', keys = 'g' },
                    { mode = 'n', keys = 'z' },
                    { mode = 'x', keys = 'z' },
                    { mode = 'n', keys = 'i' },
                    { mode = 'x', keys = 'i' },
                    { mode = 'n', keys = 'y' },     -- Yank <something>.
                    { mode = 'n', keys = 's' },     -- Delete <something>.
                    { mode = 'n', keys = 'k' },     -- Delete <something> and enter Insert Mode. (Replace)
                    -- { mode = 'n', keys = 'm' },
                    -- { mode = 'x', keys = 'm' },

                    -- Window commands
                    { mode = 'n', keys = '<C-w>' },

                    -- |> Built-in completion
                    --  - NOTE: I think I have this disabled, so it's not really relevant.
                    -- { mode = 'i', keys = '<C-x>' },

                    -- -- |> Marks
                    -- { mode = 'n', keys = "'" },
                    -- { mode = 'n', keys = '`' },
                    -- { mode = 'x', keys = "'" },
                    -- { mode = 'x', keys = '`' },

                    -- -- |> Registers
                    -- { mode = 'n', keys = '"' },
                    -- { mode = 'x', keys = '"' },
                    -- { mode = 'i', keys = '<C-r>' },
                    -- { mode = 'c', keys = '<C-r>' },
                },

                -- I'm not quite sure what these are so I'm gonna test mostly without these.
                --  - Enhance this by adding descriptions for `<Leader>` mapping groups. (?)
                clues = {
                    miniclue.gen_clues.windows(),
                    -- miniclue.gen_clues.builtin_completion(),
                    -- miniclue.gen_clues.marks(),
                    -- miniclue.gen_clues.registers(),
                    -- miniclue.gen_clues.g(),
                    -- miniclue.gen_clues.z(),
                },

                window = {
                    delay = 500,    -- I kind of rarely need the clues, so somewhat high delay is preferred.

                    config = {
                        border = "rounded",
                        width = "auto",
                    },

                    -- Don't think these bindings work. (TODO: Fix)
                    --  - NOTE: Not that high prio though.
                    scroll_down = "<C-d>",
                    scroll_down = "<C-u>",
                }
            })

            -- |> NOTE: File browser/management plugin.
            -- local minifiles = require("mini.files")                 -- ( STATE: Weak. Disabled. )
            -- minifiles.setup({
            --     -- TODO: Config the opts.
            --
            --     -- Customization of shown content.
            --     content = {
            --         -- Predicate for which file system entries to show.
            --         filter = nil,
            --         -- What prefix to show to the left of file system entry.
            --         prefix = nil,
            --         -- In which order to show file system entries.
            --         sort = nil,
            --     },
            --
            --     -- Module mappings created only inside explorer.
            --     -- Use `''` (empty string) to not create one.
            --     mappings = {
            --         close       = '<C-q>',
            --         go_in       = 'e',
            --         go_in_plus  = 'E',
            --         go_out      = 'q',
            --         go_out_plus = 'Q',      -- NOTE: This overwrites the macro running key.
            --         reset       = '<BS>',
            --         reveal_cwd  = '@',
            --         show_help   = 'g?',
            --         synchronize = '=',
            --         trim_left   = '<',
            --         trim_right  = '>',
            --     },
            --
            --     -- General options.
            --     options = {
            --         -- Whether to delete permanently or move into module-specific trash.
            --         permanent_delete = true,
            --         -- Whether to use for editing directories.
            --         use_as_default_explorer = true,
            --     },
            --
            --     -- Customization of explorer windows.
            --     windows = {
            --         -- Maximum number of windows to show side by side.
            --         max_number = math.huge,
            --         -- Whether to show preview of file/directory under cursor.
            --         preview = false,                     -- TODO: Test this.
            --         -- Width of focused window.
            --         width_focus = 50,
            --         -- Width of non-focused window.
            --         width_nofocus = 15,
            --         -- Width of preview window.
            --         width_preview = 25,
            --     }
            -- })
        end,
    },
}

-- End of File

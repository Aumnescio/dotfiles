-- File:                `nvim/lua/plugins/telescope.lua`
-- Purpose:             `lazy.nvim` Plugin Specification    ( Telescope )

-- TOC
--  - `telescope.nvim`
--  - `telescope.nvim` extensions

return {
    {   -- Telescope: Fuzzy Search UI                   ( STATE: Good )     ( Dependency for a number of plugins. )
        "nvim-telescope/telescope.nvim",
        lazy = true,
        version = false,        -- Telescope releases are very out of date.

        cmd = {
            "Telescope",
        },

        -- `keys`: Defines keys that will activate the loading of: `telescope.nvim`.
        --  - Initially, these bindings do nothing else.
        --  - Telescope keybindings are dynamically configured with Legendary, after the plugin loads.
        --      - As defined in `config` below.
        --  - This setup allows good lazy-loading of Telescope, without errors or awkwardness, even when Legendary is configured at startup.
        keys = function()
            local ret = {}
            for _, key in ipairs({ "<C-p>", "<C-s>" }) do
                ret[#ret + 1] = { key, mode = "n", opts = { noremap = true } }
            end
            return ret
        end,

        dependencies = {
            -- NOTE: Also should have `ripgrep` and `fd` installed on system.
            "folke/trouble.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "nvim-treesitter/nvim-treesitter",
            "nvim-telescope/telescope-ui-select.nvim",
            "nvim-telescope/telescope-fzf-native.nvim",
        },  --> END - `dependencies`

        opts = function()
            local actions = require("telescope.actions")
            local telescope_themes = require("telescope.themes")
            local trouble_telescope = require("trouble.providers.telescope")

            -- Related helpdoc:
            -- `:help telescope.setup()`
            return {
                defaults = {
                    sorting_strategy = "ascending",         -- Default: `descending`
                    selection_strategy = "reset",
                    scroll_strategy = "cycle",
                    layout_strategy = "vertical",
                    layout_config = {
                        bottom_pane = {
                            height = 25,
                            preview_cutoff = 120,
                            prompt_position = "top"
                        },
                        center = {
                            height = 0.8,
                            preview_cutoff = 40,
                            prompt_position = "top",
                            width = 0.8
                        },
                        cursor = {
                            height = 0.9,
                            preview_cutoff = 40,
                            width = 0.8
                        },
                        horizontal = {
                            height = 0.84,
                            preview_cutoff = 120,
                            prompt_position = "top",
                            width = 0.84
                        },
                        vertical = {
                            prompt_position = "top",
                            height = 0.88,
                            preview_cutoff = 8,
                            width = 0.82
                        }
                    },

                    path_display = {
                        "smart"
                    },

                    -- Requires `ripgrep` (rg)
                    find_command = {"rg", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case"},
                    prompt_prefix = " ",
                    selection_caret = "  ",
                    entry_prefix = "   ",
                    initial_mode = "insert",
                    color_devicons = true,
                    set_env = {['COLORTERM'] = 'truecolor'},

                    mappings = {
                        i = {
                            ["<C-n>"] = function(...)
                                return actions.move_selection_next(...)
                            end,
                            ["<C-p>"] = function(...)
                                return actions.move_selection_previous(...)
                            end,
                            ["<Tab>"] = function(...)
                                return actions.move_selection_next(...)
                            end,
                            ["<S-Tab>"] = function(...)
                                return actions.move_selection_previous(...)
                            end,
                            ["<C-t>"] = function()
                                -- Potential problem: added ()
                                return trouble_telescope.open_with_trouble()    -- This overwrites 'open in new tab', which is okay.
                            end
                        },
                        n = {
                            ["q"] = function(...)
                                return actions.close(...)
                            end,
                            ["<C-n>"] = function(...)
                                return actions.move_selection_next(...)
                            end,
                            ["<C-p>"] = function(...)
                                return actions.move_selection_previous(...)
                            end,
                            ["<Tab>"] = function(...)
                                return actions.move_selection_next(...)
                            end,
                            ["<S-Tab>"] = function(...)
                                return actions.move_selection_previous(...)
                            end,
                            ["<C-t>"] = function(...)
                                -- Potential problem: added ()
                                return trouble_telescope.open_with_trouble()   -- This overwrites 'open in new tab', which is okay.
                            end,
                        }
                    }
                },

                extensions = {
                    fzf = {
                        fuzzy = true,                       -- `false` will only do exact matching.
                        override_generic_sorter = true,     -- Override the generic sorter.
                        override_file_sorter = true,        -- Override the file sorter.
                        case_mode = "smart_case",           -- `smart_case` | `ignore_case` | `respect_case`
                    },
                    -- `ui-select`: NOTE: These are changing how Legendary looks.
                    --  - Might be too widely scoped right now.
                    --  - Might get overridden by `dressing`, or overwrite dressing's things.
                    ["ui-select"] = {
                        telescope_themes.get_dropdown({
                            prompt_position = "top",
                            layout_config = {
                                width = 0.92,
                                height = 0.8,
                            },
                        })
                    },
                },
            }
        end,    --> END `opts` function

        config = function(_, opts)
            require("telescope").setup(opts)
            require("telescope").load_extension("fzf")
            require("telescope").load_extension("ui-select")

            -- |> Re-creating my normal bindings, which got overwritten by the activation `keys` table.
            --  - Very happy that this seems to work well.
            require("legendary").keymaps({
                { "<C-s>",      "<Cmd>Telescope current_buffer_fuzzy_find<CR>", description = "Telescope: Fuzzy Search/Find Text in Current Buffer",    mode = "n", opts = { noremap = true } },
                { "<C-p>",      "<Cmd>Legendary<CR>",                           description = "Legendary: Search/Find Keymaps/Commands/Autocommands",   mode = "n", opts = { noremap = true } },

                -- Using `fzf.vim` instead for this.
                -- { "<C-S-p>",    "<Cmd>Telescope find_files<CR>",                description = "Telescope: Search/Find Files",                           mode = "n", opts = { noremap = true } },
            })
        end,    --> END `config` function
    },

    {   -- Telescope UI Extension                       ( STATE: Good )
        "nvim-telescope/telescope-ui-select.nvim",
        lazy = true,
    },

    {   -- Telescope `fzf` Extension                    ( STATE: Good )     ( Dependency for `fuzzy.nvim` and `cmp-fuzzy-buffer`. )
        "nvim-telescope/telescope-fzf-native.nvim",
        lazy = true,    -- Had some semi-related issues, but this should be fine now.
        build = {
            "make",
        },
    },

    {   -- Telescope `TailwindCSS` Extension            ( STATE: Testing )
        "danielvolchek/tailiscope.nvim",
        enabled = false,
        lazy = true,
        ft = "svelte",

        config = function(_, opts)
            require("telescope").setup({
                extensions = {
                    tailiscope = {
                        register = "",
                        default = "all",
                        doc_icon = "󰈙",
                        no_dot = true,

                        -- NOTE: If mappings are left empty, the plugin will error.
                        maps = {
                            n = {
                                back = "b",
                                open_doc = "od",
                            },
                            i = {
                                back = "<C-h>",
                                open_doc = "<C-d>",
                            }
                        }
                    }
                }
            })

            -- Not quite sure if this is required.
            -- require("telescope").load_extension("tailiscope")

            require("legendary").keymaps({
                { "<Leader>tw",      "<Cmd>Telescope tailiscope<CR>",       description = "Telescope: Search/Find TailwindCSS Classes",   mode = "n", opts = { noremap = true } },
            })
        end
    },
}

-- End of File

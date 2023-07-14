-- File:                `nvim/lua/plugins/init.lua`
-- Purpose:             `lazy.nvim` Plugin Specification    ( Default Entry Point: Mostly for plugins that haven't been categorized yet. )

-- NOTE:                Highly configured plugins or plugins with many configuration options
--                      have been extracted into their own `nvim/lua/plugins/*.lua` files.
-- For example:
--  - LSP:              In `lsp.lua`
--  - Treesitter:       In `treesitter.lua`
--  - Telescope:        In `telescope.lua`
--  - Dressing:         In `user-interface.lua`
--  - Nui.nvim:         In `user-interface.lua`
--  - Heirline:         In `user-interface.lua`
--  - Alpha:            In `user-interface.lua`
--  - LuaSnip:          In `autocompletion.lua`
--  - Nvim-cmp:         In `autocompletion.lua`
--  - Polyglot:         In `syntax-highlighting.lua`
--  - Legendary:        In `legendary.lua`

--  - urlview.nvim:     TODO?
--  - wf.nvim:          TODO: Maybe move to `whichkey.lua`.

return {
    {   -- Neovim Config                                ( STATE: Unknown )
        "folke/neoconf.nvim",
        lazy = true,
        cmd = "Neoconf",
        -- TODO/NOTE: Supposed to be `setup` before `lua_ls`.
        -- TODO: Move opts to module file.
        opts = {
            -- Name of the global settings file in your Neovim config directory.
            global_settings = "neoconf.json",

            -- Name of the local settings files.
            local_settings = ".neoconf.json",

            -- Import existing settings from other plugins.
            import = {
                vscode  = true,     -- Local `.vscode/settings.json`.
                coc     = false,    -- Global/Local `coc-settings.json`.
                nlsp    = false,    -- Global/Local `nlsp-settings.nvim` json settings.
            },

            -- Send new configuration to lsp clients when changing json settings.
            live_reload = true,

            -- Set the filetype to jsonc for settings files, so you can use comments
            -- make sure you have the jsonc treesitter parser installed!
            filetype_jsonc = true,

            plugins = {
                -- Configures lsp clients with settings in the following order:
                --  - lua settings passed in lspconfig setup
                --  - global json settings
                --  - local json settings
                lspconfig = {
                    enabled = true,
                },

                -- Configures `jsonls` to get completion in .nvim.settings.json files
                jsonls = {
                    enabled = true,
                    -- only show completion in json settings for configured lsp servers
                    configured_servers_only = true,
                },

                -- Configures `lua_ls` to get completion of lspconfig server settings.
                lua_ls = {
                    -- By default, `lua_ls` annotations are only enabled in your neovim config directory.
                    enabled_for_neovim_config = true,
                    -- Explicitely enable adding annotations. Mostly relevant to put in your local .nvim.settings.json file
                    enabled = false,
                },
            },
        },
    },
    {   -- Neovim API Development                       ( STATE: Unknown | Probably Good )
        "folke/neodev.nvim",
        lazy = true,
        -- TODO: Move opts to module file.
        opts = {
            library = {
                enabled = true,     -- When not enabled, `neodev` will not change any LSP server settings.

                -- These settings will be used for your Neovim config directory.
                runtime = true,     -- `runtime path`.
                types   = true,     -- Full signature, docs and completion of `vim.api`, `vim.treesitter`, `vim.lsp` and others.
                plugins = true,     -- Installed `opt` or `start` plugins in `packpath`.

                -- You can also specify the list of plugins to make available as a workspace library.
                -- plugins = { "<plugin.nvim>", "<other-plugin>" },
            },

            setup_jsonls = true,    -- Configures `jsonls` to provide completion for project specific `.luarc.json` files.

            -- For your Neovim config directory;
            --  - `config.library` settings will be used as is for plugin directories (root_dirs having a /lua directory).
            --  - `config.library.plugins` will be disabled for any other directory.
            --  - `config.library.enabled` will be set to `false`.
            -- override = function(root_dir, options) end,

            -- With `lspconfig`, Neodev will automatically setup your `lua-language-server`.
            --  - If you disable this, then you have to set `{ before_init = require("neodev.lsp").before_init }`
            --    in your lsp start options.
            lspconfig = true,

            -- Much faster, but needs a recent built of `lua-language-server`.
            --  - Needs lua-language-server >= 3.6.0    ( I have recent enough build. )
            pathStrict = true,
        },
    },
    {   -- DebuggerAdapterProtocol                      ( STATE: Unknown )
        --  - TODO: Test and configure.
        "mfussenegger/nvim-dap",
        lazy = true,
        dependencies = {
            "rcarriga/nvim-dap-ui",
        },
    },
    {   -- Debugger UI                                  ( STATE: Unknown )
        --  - TODO: Test and configure.
        "rcarriga/nvim-dap-ui",
        lazy = true,
    },
    {   -- Diagnostic Viewer                            ( STATE: Good )
        --  - TODO: Test and config more.
        "folke/trouble.nvim",
        lazy = true,
    },
    {   -- Surround operations, text objects, and more.         ( STATE: Good )
        "echasnovski/mini.nvim",
        -- TODO: Add `keys` function and Legendary Binding Creation in `config` function, to lazy-load this.
        -- Unless this takes like 0.5ms.
        lazy = true,
        version = false,
        event = "VeryLazy",         -- TODO: Could be loaded more lazily.

        config = function(_, opts)
            -- |> mini-bufremove            ( Maybe looking for something better and more multipurpose. )
            require("mini.bufremove").setup()

            -- |> AroundIn                  ( STATE: Some issues )
            require("mini.ai").setup({
                -- Table with textobject id as fields, textobject specification as values.
                -- Also use this to disable builtin textobjects. See |MiniAi.config|.
                custom_textobjects = nil,

                -- Module mappings. Use `''` (empty string) to disable one.
                -- NOTE: These bindings are for Visual Mode.
                mappings = {
                    -- Main textobject prefixes
                    around = "a",
                    inside = "zi",

                    -- Next/last textobjects
                    around_next = "an",
                    inside_next = "zn",
                    around_last = "ao",
                    inside_last = "zo",

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

            -- |> Surround Operations       ( STATE: Good )
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
        end,
    },
    {   -- Live preview for `normal` command.                   ( STATE: Fine, but meh. )
        "smjonas/live-command.nvim",
        lazy = true,
        version = false,

        event = "VeryLazy",          -- TODO: Could have a lazyer load-event probably.

        config = function()
            require("live-command").setup {
                commands = {
                    Normal = { cmd = "normal" },
                },
            }
        end,
    },

    {   -- Fix Scrolloff near end of file.                      ( STATE: Seems Good )
        --  - Scrolloff misbehaving was a really large paper cut issue for me.
        --  - This seems to fix it well, without causing issues.
        "Aasim-A/scrollEOF.nvim",
        cond = false,
        lazy = true,
        version = false,
        event = "VeryLazy",

        opts = {
            -- The pattern used for the internal autocmd to determine where to run `ScrollEOF`.
            --  - See "https://neovim.io/doc/user/autocmd.html#autocmd-pattern"
            pattern = '*',

            -- Whether or not `ScrollEOF` should be enabled in insert mode.
            --  - I changed this to true, hopefully it does not cause issues.
            --  - NOTE: The plugin still does not work in insert mode, even with this enabled.
            insert_mode = true,

            -- List of filetypes to disable scrollEOF for.
            disabled_filetypes = {},

            -- List of modes to disable scrollEOF for.
            --  - See "https://neovim.io/doc/user/builtin.html#mode()" for available modes.
            disabled_modes = {},
        },

        config = function(_, opts)
            require("scrollEOF").setup(opts)
        end,
    },

    {   -- Multiple Cursors. Configured in source code.
        --  - Fuck the way this plugin does keybindings...
        "Aumnescio/vim-visual-multi",
        cond = false,           -- TODO: Config and make this work proper.
        lazy = false,
        dev = true,
    },

    {
        "axieax/urlview.nvim",
        lazy = true,
        version = false,

        cmd = "UrlView",
        keys = function()
            local ret = {}
            for _, key in ipairs({ "[u", "]u" }) do
                ret[#ret + 1] = { key, mode = { "n" } }
            end
            return ret
        end,

        opts = {
            default_title   = "Links  ",
            default_picker  = "telescope",
            default_action  = "system",

            -- Keymaps for jumping to previous / next URL in buffer
            jump = {
                prev = "[u",
                next = "]u",
            },
        },

        config = function(_, opts)
            require("urlview").setup(opts)
        end,
    },

    {   -- Which Key System                         ( STATE: Useful, but buggy. )
        --  - Quite pleasant UI and works well with bindings created using `Legendary.nvim`.
        --  - A bit buggy and horribly reliant on the `timeout` option, which I hate.
        --  - But I found a way to make this work, with the custom binds below.
        "Cassin01/wf.nvim",
        lazy = false,           -- TODO: Make lazy with Keybind-activation.
        version = "*",          -- Seems fine.

        opts = {
            theme = "default",
        },

        config = function(_, opts)
            -- Setup
            require("wf").setup(opts)

            local which_key = require("wf.builtin.which_key")

            -- Bind a couple keys for chord-starter (Leader-key-like keys) based which-key popups.
            --  - I can't set the binds to just <Space> and <Leader> because I need `timeout=false`,
            --    which would make the keys never activate.
            vim.keymap.set(
                "n",
                "<Leader>o",
                which_key(),
                {
                    noremap = true,
                    silent = true,
                    desc = "[WhichKey] Activate",
                }
            )

            vim.keymap.set(
                "n",
                "<Leader>n",
                which_key({
                    text_insert_in_advance = [[<Leader>]],
                }),
                {
                    noremap = true,
                    silent = true,
                    desc = "[WhichKey] <Leader> Chords",
                }
            )

            vim.keymap.set(
                "n",
                "<Space>w",
                which_key({
                    text_insert_in_advance = [[<Space>]],
                }),
                {
                    noremap = true,
                    silent = true,
                    desc = "[WhichKey] <Space> Chords",
                }
            )

            vim.keymap.set(
                "n",
                "<Space>g",
                which_key({
                    text_insert_in_advance = "g",
                }),
                {
                    noremap = true,
                    silent = true,
                    desc = "[WhichKey] g-Chords",
                }
            )

            vim.keymap.set(
                "n",
                "<Space>i",
                which_key({
                    text_insert_in_advance = "i",
                }),
                {
                    noremap = true,
                    silent = true,
                    desc = "[WhichKey] i-Chords",
                }
            )

            vim.keymap.set(
                "n",
                "<Space>z",
                which_key({
                    text_insert_in_advance = "z",
                }),
                {
                    noremap = true,
                    silent = true,
                    desc = "[WhichKey] z-Chords",
                }
            )
        end
    },

    {   -- Expand-region selections.            ( STATE: Does not do what I want )
        --  - Would have to extract the good parts and modify the bad parts for this to be useable.
        "olambo/vi-viz",
        enabled = false,
        lazy = true,
    },
}

-- End of File

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

return {
    {   -- Neovim Config                                            ( STATE: Unknown )
        "folke/neoconf.nvim",
        enabled = true,
        cond = vim.g.aum_plugin_neoconf_enabled,
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

    {   -- Neovim API Development                                   ( STATE: TODO: Update to `lazydev`? )
        "folke/neodev.nvim",
        enabled = true,
        cond = vim.g.aum_plugin_neodev_enabled,
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

    {   -- DebuggerAdapterProtocol                                  ( STATE: Unknown )
        --  - TODO: Test and configure.
        "mfussenegger/nvim-dap",
        enabled = true,
        cond = vim.g.aum_plugin_nvim_dap_enabled,
        lazy = true,

        dependencies = {
            "rcarriga/nvim-dap-ui",
        },
    },

    {   -- Debugger UI                                              ( STATE: Unknown )
        --  - TODO: Test and configure.
        "rcarriga/nvim-dap-ui",
        enabled = true,
        cond = vim.g.aum_plugin_nvim_dap_ui_enabled,
        lazy = true,
    },

    {   -- Diagnostic Viewer                                        ( STATE: Good )
        --  - TODO: Test and config more.
        "folke/trouble.nvim",
        enabled = true,
        cond = vim.g.aum_plugin_trouble_enabled,
        lazy = true,
    },

    {   -- Live preview for `normal` command.                       ( STATE: Fine, but meh. )
        "smjonas/live-command.nvim",
        enabled = true,
        cond = vim.g.aum_plugin_live_command_enabled,
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

    {   -- Fix Scrolloff near end of file.                          ( STATE: Maybe fine. )
        "Aasim-A/scrollEOF.nvim",
        branch = "pr/large-scrolloff-support",
        enabled = true,
        cond = vim.g.aum_plugin_scrolleof_enabled,
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
        --  - Disabled.
        "Aumnescio/vim-visual-multi",
        enabled = false,
        cond = vim.g.aum_plugin_vim_visual_multi_enabled,           -- Temporary disable toggle.
        lazy = false,
        dev = true,
    },

    {
        "axieax/urlview.nvim",
        enabled = true,
        cond = vim.g.aum_plugin_urlview_enabled,
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

    {   -- Expand-region selections.                                ( STATE: Does not do what I want. (Disabled) )
        --  - Would have to extract the good parts and modify the bad parts for this to be useable.
        "olambo/vi-viz",
        enabled = false,
        cond = vim.g.aum_plugin_vi_viz_enabled,
        lazy = true,
    },

    {   -- Browse keybindings and find free ones.                   ( STATE: Useable. )
        --  - Can be very useful.
        --  - Implementation seems good.
        --  - NOTE/TODO: Would be good to fork this and make the the keyboard layout match mine.
        --  - NOTE: Does not show `<Space>` bindings.
        "meznaric/key-analyzer.nvim",
        enabled = true,
        cond = vim.g.aum_plugin_key_analyzer_enabled,
        lazy = true,            -- Lazy is good.

        cmd = "KeyAnalyzer",

        opts = {},
    },
}

-- End of File

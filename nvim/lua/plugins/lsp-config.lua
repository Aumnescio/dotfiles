-- File:                `nvim/lua/plugins/lsp-config.lua`
-- Purpose:             `lazy.nvim` Plugin Specification    ( Language Server Protocol )

-- NOTE/TODO: Missing Lua's Language Server.

-- Dummy commands which can be used as an event to lazy-load language servers.
vim.api.nvim_create_user_command("LspSetupSlint", 'echo "Setting up `Slint-LSP`."', {})
vim.api.nvim_create_user_command("LspSetupTypescript", 'echo "Setting up `TS-Server`."', {})
vim.api.nvim_create_user_command("LspSetupSvelte", 'echo "Setting up `Svelte`."', {})
vim.api.nvim_create_user_command("LspSetupUnoCSS", 'echo "Setting up `UnoCSS`."', {})
vim.api.nvim_create_user_command("LspSetupPhp", 'echo "Setting up `PhpActor`."', {})
vim.api.nvim_create_user_command("LspSetupOmniSharp", 'echo "Setting up `OmniSharp`."', {})
vim.api.nvim_create_user_command("LspSetupCSharpLS", 'echo "Setting up `CSharp-LS`."', {})
vim.api.nvim_create_user_command("LspSetupTailwindCSS", 'echo "Setting up `TailwindCSS-LS`."', {})
vim.api.nvim_create_user_command("LspSetupSQLS", 'echo "Setting up `SQLS`."', {})
vim.api.nvim_create_user_command("LspSetupGodot", 'echo "Setting up `Godot-LS`."', {})

-- |> Note: Using `RustLsp("start")` from `rustacean.nvim` instead of this.
-- vim.api.nvim_create_user_command("LspSetupRust", 'echo "Setting up `Rust-Analyzer`. (`rustacean.nvim`)"', {})

return {
    {   -- LangServerProtocol Configs                   ( STATE: Good'ish )
        "neovim/nvim-lspconfig",
        lazy = true,
        version = "*",          -- Latest commits have issues => using latest release instead.

        cmd = {
            -- "AumLspInfo",
            "LspInfo",          -- NOTE/TODO: Using this while it works, but it is getting deprecated soon.
            "LspStart",
        },

        dependencies = {
            -- Very possible that `NeoDev` should only be loaded for Lua files.
            "folke/neoconf.nvim",       -- Still not really sure what this does.
            -- "folke/neodev.nvim",        -- This might make `lua_ls` heavier. (Latency in completion)    -- TODO: This has some updated alternative plugin: `lazydev`
            "j-hui/fidget.nvim",        -- Generally, I really like `fidget`, but I don't want it to display constant spam messages.
            "hrsh7th/cmp-nvim-lsp",     -- LSP Source for `nvim-cmp`. Important. Some servers are laggy.
        },

        opts = {
            diagnostics = {
                -- virtual_text = {
                --     spacing = 4,
                --
                --     prefix = "",
                --
                --     -- prefix = function(diagnostic, i, total)
                --     --     local severity = vim.diagnostic.severity[diagnostic.severity]
                --     --     severity = string.sub(severity, 0, 1) .. string.sub(severity, 2, -1):lower()
                --     --
                --     --     return {
                --     --         "",
                --     --         "LspDiagnosticSign" .. severity
                --     --     }
                --     -- end,
                --
                --     format = function(diagnostic)
                --         return ""
                --     end,
                -- },
                virtual_text = false,       -- Virtual text updates slowly and mostly looks like shit.
                signs = false,
                underline = true,           -- Underline updates faster than virtual text and looks nice. (Style is `undercurl`)
                update_in_insert = true,    -- Not too sure about this, but without it, the diagnostics are a bit unresponsive.
                severity_sort = true,
                float = {
                    source = "always",
                    border = "rounded",
                },
            },

            inlay_hints = {
                enabled = true,
            },

            -- LSP Server Settings      ( TODO: Working on getting rid of this. )
            ---@type lspconfig.options
            servers = {
                rust_analyzer = {},
                lua_ls = {
                    mason = false,  -- Set to `false` if you don't want this server to be installed with mason.
                    settings = {
                        Lua = {
                            workspace = {
                                checkThirdParty = false,
                            },
                            completion = {
                                callSnippet = "Replace",
                            },
                        },
                    },
                },
            },
        },

        config = function(_, opts)
            -- vim.lsp.set_log_level("debug")       -- Not sure if this works and is not always required.

            -- LSP UI border-style:
            --  - This is probably fine to set here.
            require("lspconfig.ui.windows").default_options.border = "rounded"

            -- Diagnostics style:
            --  - This is probably fine to set here.
            vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

            -- |> `lspconfig` checkhealth wrapper with a proper command name.  (Otherwise can't be used as `cmd` in `lazy.nvim` spec)
            -- vim.api.nvim_create_user_command("AumLspInfo", "checkhealth lspconfig", {})
        end,
    },

    -- {   -- Rust LangServer++                            ( STATE: Was good, now moving to `rustacean.nvim`. )
    --     "simrat39/rust-tools.nvim",
    --     enabled = false,        -- Disabled while `rustacean` in use.
    --     lazy = true,
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --         "neovim/nvim-lspconfig",
    --         "mfussenegger/nvim-dap",
    --     },
    -- },

    {   -- Rust LangServer++                            ( STATE: Prolly good, but WIP. )
        "mrcjkb/rustaceanvim",
        version = "^5",

        lazy = true,
        ft = { "rust" },

        dependencies = {
            "j-hui/fidget.nvim",        -- The fidget stuff was not displaying until I added this here.
        },

        opts = {
            server = {
                -- If this is disabled, LangServer needs to be manually attached to every buffer?
                -- - TODO: Implement autocommand for attaching `Rust-Analyzer` to newly opened buffers.
                auto_attach = false,    -- This can be used to disable the attaching of `Rust-Analyzer`. ( Issues though. )
                autostart = false,      -- `Rustacean.nvim` seems to hard-skip this setting. It is essentially ignored and does not seem to do anything.

                flags = {
                    allow_incremental_sync = true,  -- This used to be buggy, but maybe it is fine now.
                    debounce_text_changes = 120     -- 150 is default, and is probably fine.
                },

                handlers = {
                    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
                        border = {
                            { "╭", "FloatBorder" }, { "─", "FloatBorder" },
                            { "╮", "FloatBorder" }, { "│", "FloatBorder" },
                            { "╯", "FloatBorder" }, { "─", "FloatBorder" },
                            { "╰", "FloatBorder" }, { "│", "FloatBorder" },
                        },
                    }),
                    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
                        border = {
                            { "╭", "FloatBorder" }, { "─", "FloatBorder" },
                            { "╮", "FloatBorder" }, { "│", "FloatBorder" },
                            { "╯", "FloatBorder" }, { "─", "FloatBorder" },
                            { "╰", "FloatBorder" }, { "│", "FloatBorder" },
                        },

                        -- `max_width`: This is critical to ensure documentation highlighting, until some bug is fixed somewhere.
                        -- - Too wide window breaks highlighting.
                        max_width   = 76,
                        max_height  = 16,
                        silent = true,
                    }),
                    ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
                        virtual_text = false
                    }),
                },

                standalone = false,

                on_attach = function(client, bufnr)
                    -- Toggle `Semantic Tokens Highlighting`:
                    -- client.server_capabilities.semanticTokensProvider = nil  -- Set to `nil` to disable semantic highlights.

                    require("legendary").keymaps({
                        { "<F2>",           vim.lsp.buf.rename,                     description = "[LSP] Rename Symbol",                mode = "n", opts = { noremap = true, buffer = bufnr } },
                        { "g<S-h>",         vim.lsp.buf.hover,                      description = "[LSP] Hover Docs",                   mode = "n", opts = { noremap = true, buffer = bufnr } },
                        { "gd",             vim.lsp.buf.definition,                 description = "[LSP] Go to Definition",             mode = "n", opts = { noremap = true, buffer = bufnr } },
                        { "<Space><S-d>",   vim.lsp.buf.type_definition,            description = "[LSP] Go to Type Definition",        mode = "n", opts = { noremap = true, buffer = bufnr } },
                        { "g<S-d>",         vim.lsp.buf.declaration,                description = "[LSP] Go to Declaration",            mode = "n", opts = { noremap = true, buffer = bufnr } },
                        { "gi",             vim.lsp.buf.implementation,             description = "[LSP] Go to Implementation",         mode = "n", opts = { noremap = true, buffer = bufnr } },
                        { "gr",             "<Cmd>Telescope lsp_references<CR>",    description = "[LSP] Telescope -> References",      mode = "n", opts = { noremap = true, buffer = bufnr } },
                        { "<Space>ca",      vim.lsp.buf.code_action,                description = "[LSP] Code Actions",                 mode = "n", opts = { noremap = true, buffer = bufnr } },
                        { "<C-k>",          vim.lsp.buf.signature_help,             description = "[LSP] Signature Help",               mode = "n", opts = { noremap = true, buffer = bufnr } },

                        -- `Rustacean.nvim` specific ones.
                        -- - TODO: Test these and add more bindings.
                        -- - TODO: How to add border to the RustLsp hover?
                        { "<Leader>ca",     function() vim.cmd.RustLsp("codeAction") end,           description = "[LSP] Rustacean Code Actions",            mode = "n",     opts = { noremap = true, buffer = bufnr } },
                        { "gh",             function() vim.cmd.RustLsp("hover", "actions") end,     description = "[LSP] Rustacean Hover Docs (+ Actions)",  mode = "n",     opts = { noremap = true, buffer = bufnr } },

                        -- Formatting
                        { "<Space>f",       function()
                            vim.lsp.buf.format({ async = true })
                        end,    description = "LSP: Format Buffer",    mode = "n", opts = { noremap = true, buffer = bufnr } },

                        -- Incremental Selection            ( Better than `Wildfire`, but only for Rust. )
                        { "<S-l>",    "<Cmd>lua require('tree_climber_rust').init_selection()<CR>",         description = "[Aum/Selection] Initialize incremental selection.",          mode = { 'n' },     opts = { noremap = true, buffer = bufnr } },
                        { "<S-l>",    "<Cmd>lua require('tree_climber_rust').select_incremental()<CR>",     description = "[Aum/Selection] Expand/Increase incremental selection.",     mode = { 'x' },     opts = { noremap = true, buffer = bufnr } },
                        { "<C-l>",    "<Cmd>lua require('tree_climber_rust').select_previous()<CR>",        description = "[Aum/Selection] Shrink/Decrease incremental selection.",     mode = { 'x' },     opts = { noremap = true, buffer = bufnr } },
                    })
                end,

                default_settings = {
                    ["rust-analyzer"] = {
                        diagnostics = {
                            enable = true,
                            enableExperimental = false
                        },
                        imports = {
                            granularity = {
                                group = "module",
                            },
                            prefix = "self",
                        },
                        cargo = {
                            allFeatures = true,
                            loadOutDirsFromCheck = true,
                            runBuildScripts = true,
                        },
                        procMacro = {
                            enable = true,
                            ignored = {
                                ["async-trait"] = { "async_trait" },
                                ["napi-derive"] = { "napi" },
                                ["async-recursion"] = { "async_recursion" },
                            },
                        },
                        checkOnSave = {
                            allFeatures = true,
                            command = "clippy",
                            -- Testing these, if they affect performance. (No idea, but it doesn't seem to have broken anything.)
                            extraArgs = {
                                "--no-deps",
                                "--target-dir",
                                "/tmp/rust-analyzer-check"
                            }
                        },
                    },
                },
            },

            tools = {
                float_win_config = {
                    border = "rounded",
                },
            },

            -- Debugging stuff. (TODO, low'ish prio)
            -- dap = {
            --     adapter = {
            --         type = "executable",
            --         command = "/usr/bin/lldb-vscode-14",  -- This is probably already outdated.
            --         name = "rt_lldb",
            --     },
            -- },
        },

        config = function(_, opts)
            vim.g.rustaceanvim = vim.tbl_deep_extend(
                "force",
                {},
                opts or {}
            )
        end,
    },

    {   -- TypeScript LangServer++                      ( STATE: Testing )
        "pmizio/typescript-tools.nvim",
        lazy = true,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "neovim/nvim-lspconfig",
        },
        opts = {},
    },

    {   -- C / C++ LangServer++                         ( STATE: Okay )
        --  - TODO: Might need reconfiguration
        "ranjithshegde/ccls.nvim",
        lazy = true,
    },

    {   -- Global LanguageServer preferences            ( STATE: Good )
        "Aumnescio/langserver-prefs.nvim",
        lazy = true,        -- Required by the setups.
        dev = true,
        dependencies = {
            "yioneko/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
        },
    },

    {   -- Setup Config for Rust Analyzer               ( STATE: Good, but now not in use. )
        -- NOTE: This was for `Rust-tools`, not `Rustacean.nvim`.
        "Aumnescio/rust-langserver-setup.nvim",
        enabled = false,
        lazy = true,
        dev = true,

        cmd = {
            "LspSetupRust",
        },

        dependencies = {
            "neovim/nvim-lspconfig",
            "Aumnescio/langserver-prefs.nvim",
            "simrat39/rust-tools.nvim",
        },

        config = function()
            vim.api.nvim_create_user_command("LspSetupRust", 'echo "Setting up `Rust-Analyzer`."', {})
            require("rust-langserver-setup").setup()
            vim.api.nvim_create_user_command("LspSetupRust", 'echo "Setting up `Rust-Analyzer`."', {})
        end,
    },

    {   -- Setup Config for Slint-LS                    ( STATE: Fine )
        "Aumnescio/slint-langserver-setup.nvim",
        lazy = true,
        dev = true,

        cmd = {
            "LspSetupSlint",
        },

        dependencies = {
            "neovim/nvim-lspconfig",
            "Aumnescio/langserver-prefs.nvim",
        },

        config = function()
            vim.api.nvim_create_user_command("LspSetupSlint", 'echo "Setting up `Slint-LSP`."', {})
            require("slint-langserver-setup").setup()
            vim.api.nvim_create_user_command("LspSetupSlint", 'echo "Setting up `Slint-LSP`."', {})
        end,
    },

    {   -- Setup Config for GLSL_Analyzer               ( STATE: TODO )
        "Aumnescio/glsl-langserver-setup.nvim",
        lazy = true,
        dev = true,

        cmd = {
            "LspSetupGlsl",
        },

        dependencies = {
            "neovim/nvim-lspconfig",
            "Aumnescio/langserver-prefs.nvim",
        },

        config = function()
            vim.api.nvim_create_user_command("LspSetupGlsl", 'echo "Setting up `Glsl-Analyzer`."', {})
            require("glsl-langserver-setup").setup()
            vim.api.nvim_create_user_command("LspSetupGlsl", 'echo "Setting up `Glsl-Analyzer`."', {})
        end,
    },

    {   -- Setup Config for TS-Server               ( STATE: Testing )
        "Aumnescio/ts-langserver-setup.nvim",
        lazy = true,
        dev = true,

        cmd = {
            "LspSetupTypescript",
        },

        dependencies = {
            "neovim/nvim-lspconfig",
            "Aumnescio/langserver-prefs.nvim",
            "pmizio/typescript-tools.nvim",
        },

        config = function()
            require("ts-langserver-setup").setup()
            vim.api.nvim_create_user_command("LspSetupTypescript", 'echo "Setting up `TS-Server`."', {})
        end,
    },

    {   -- Setup Config for CSS-LS                      ( STATE: Good )
        "Aumnescio/css-langserver-setup.nvim",
        lazy = true,
        dev = true,
        ft = "css",      -- I might want a lazier event for this than the filetype recognizition.
        dependencies = {
            "neovim/nvim-lspconfig",
            "Aumnescio/langserver-prefs.nvim",
        },

        config = function()
            require("css-langserver-setup").setup()
        end,
    },

    {   -- Setup Config for HTML-LS                     ( STATE: Fine )
        "Aumnescio/html-langserver-setup.nvim",
        lazy = true,
        dev = true,
        ft = "html",     -- I might want a lazier event for this than the filetype recognizition.
        dependencies = {
            "neovim/nvim-lspconfig",
            "Aumnescio/langserver-prefs.nvim",
        },
        config = function()
            require("html-langserver-setup").setup()
        end,
    },

    {   -- Setup Config for Emmet-LS                    ( STATE: Fine )
        --  - There was a new emmet-ls alternative version that I might want to try:
        --  - Here: "https://github.com/olrtg/emmet-ls"
        "Aumnescio/emmet-langserver-setup.nvim",
        lazy = true,
        dev = true,
        ft = {
            "html",
            "css",
        },  -- I might want a lazier event for this than the filetype recognizition.
        dependencies = {
            "neovim/nvim-lspconfig",
            "Aumnescio/langserver-prefs.nvim",
        },
        config = function()
            require("emmet-langserver-setup").setup()
        end,
    },

    {   -- Setup Config for Svelte-LS                   ( STATE: Okay )
        "Aumnescio/svelte-langserver-setup.nvim",
        lazy = true,
        dev = true,
        ft = { "svelte" },
        cmd = {
            "LspSetupSvelte",
        },
        dependencies = {
            "neovim/nvim-lspconfig",
            "Aumnescio/langserver-prefs.nvim",
            "yioneko/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            require("svelte-langserver-setup").setup()
            vim.api.nvim_create_user_command("LspSetupSvelte", 'echo "Setting up `Svelte`."', {})
        end,
    },

    {   -- Setup Config for TailwindCSS-LS                  ( STATE: Suppose it works. )
        "Aumnescio/tailwind-langserver-setup.nvim",
        enabled = true,
        lazy = true,
        dev = true,
        ft = { "svelte" },  -- Will autostart in Svelte files.
        cmd = {
            "LspSetupTailwindCSS",
        },
        dependencies = {
            "neovim/nvim-lspconfig",
            "Aumnescio/langserver-prefs.nvim",
            "yioneko/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            require("tailwind-langserver-setup").setup()
            vim.api.nvim_create_user_command("LspSetupTailwindCSS", 'echo "Setting up `TailwindCSS-LS`."', {})
        end,
    },

    {   -- Setup Config for UnoCSS-LS                   ( STATE: Very weak )
        "Aumnescio/unocss-langserver-setup.nvim",
        enabled = false,        -- Disabled, because it is not good enough. Prefer tailwind for now.
        lazy = true,
        dev = true,
        ft = {
            "svelte", "html",
        },
        cmd = {
            "LspSetupUnoCSS",
        },
        dependencies = {
            "neovim/nvim-lspconfig",
            "Aumnescio/langserver-prefs.nvim",
            "yioneko/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            require("unocss-langserver-setup").setup()
            vim.api.nvim_create_user_command("LspSetupUnoCSS", 'echo "Setting up `UnoCSS`."', {})
        end,
    },

    {   -- Setup Config for PHP-LS                  ( STATE: Good )
        --  - NOTE: Uses `intelephense`, which is much better than `phpactor`.
        "Aumnescio/php-langserver-setup.nvim",
        lazy = true,
        dev = true,
        ft = "php",
        cmd = {
            "LspSetupPhp",
        },
        dependencies = {
            "neovim/nvim-lspconfig",
            "Aumnescio/langserver-prefs.nvim",
            "yioneko/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            require("php-langserver-setup").setup()
            vim.api.nvim_create_user_command("LspSetupPhp", 'echo "Setting up `PHP`."', {})
        end,
    },

    {   -- Setup Config for Typst-LS                    ( STATE: Quite decent. )
        --  - NOTE: To config the `pdf` export settings, see:
        --      - "NeovimPlugins/Aumnescio/typst-langserver-setup.nvim"
        "Aumnescio/typst-langserver-setup.nvim",
        lazy = true,
        dev = true,
        ft = "typst",

        dependencies = {
            "neovim/nvim-lspconfig",
            "Aumnescio/langserver-prefs.nvim",
        },

        config = function()
            require("typst-langserver-setup").setup()
        end,
    },

    {   -- Setup Config for OmniSharp (C#)              ( STATE: Launches, but crashes easily. )
        "Aumnescio/omnisharp-langserver-setup.nvim",
        lazy = true,
        dev = true,

        cmd = {
            "LspSetupOmniSharp",
        },

        dependencies = {
            "neovim/nvim-lspconfig",
            "Aumnescio/langserver-prefs.nvim",
        },

        config = function()
            vim.api.nvim_create_user_command("LspSetupOmniSharp", 'echo "Setting up `OmniSharp`."', {})
            require("omnisharp-langserver-setup").setup()
            vim.api.nvim_create_user_command("LspSetupOmniSharp", 'echo "Setting up `OmniSharp`."', {})
        end,
    },

    {   -- Setup Config for OmniSharp (C#)              ( STATE: Testing )
        "Aumnescio/csharp-langserver-setup.nvim",
        lazy = true,
        dev = true,

        cmd = {
            "LspSetupCSharpLS",
        },

        dependencies = {
            "neovim/nvim-lspconfig",
            "Aumnescio/langserver-prefs.nvim",
        },

        config = function()
            vim.api.nvim_create_user_command("LspSetupCSharpLS", 'echo "Setting up `CSharp-LS`."', {})
            require("csharp-langserver-setup").setup()
            vim.api.nvim_create_user_command("LspSetupCSharpLS", 'echo "Setting up `CSharp-LS`."', {})
        end,
    },

    {   -- Setup Config for SQLS (SQL)                  ( STATE: Testing )
        -- Note: A potential alternative does exist if this is not good.
        "Aumnescio/sql-langserver-setup.nvim",
        lazy = true,
        dev = true,

        ft = { "sql", "mysql" },

        cmd = {
            "LspSetupSQLS",
        },

        dependencies = {
            "neovim/nvim-lspconfig",
            "Aumnescio/langserver-prefs.nvim",
            "nanotee/sqls.nvim",
        },

        config = function()
            require("sql-langserver-setup").setup()
            vim.api.nvim_create_user_command("LspSetupSQLS", 'echo "Setting up `SQLS`."', {})
        end,
    },

    {   -- Setup Config for Godot-LS                    ( STATE: Testing. )
        "Aumnescio/godot-langserver-setup.nvim",
        enabled = true,
        lazy = true,
        dev = true,

        ft = { "gd", "gdscript" },
        cmd = { "LspSetupGodot" },

        dependencies = {
            "neovim/nvim-lspconfig",
            "Aumnescio/langserver-prefs.nvim",
            "yioneko/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
        },

        config = function()
            require("godot-langserver-setup").setup()
            vim.api.nvim_create_user_command("LspSetupGodot", 'echo "Setting up `Godot-LS`."', {})
        end,
    },

    {   -- EoL Inlay Hints                          ( STATE: Good )
        "chrisgrieser/nvim-lsp-endhints",
        event = "LspAttach",

        opts = {},

        config = function(_, opts)
            require("lsp-endhints").setup({
	            icons = {
		            type = "󰜁 ",
		            parameter = "󰏪 ",
		            offspec = " ",         -- hint kind not defined in official LSP spec
		            unknown = " ",         -- hint kind is nil
	            },
	            label = {
		            padding = 1,
		            marginLeft = 0,
		            bracketedParameters = true,
	            },
	            autoEnableHints = true,
            })
        end,
    },
}

-- End of File

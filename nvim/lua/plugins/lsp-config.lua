-- File:                `nvim/lua/plugins/lsp-config.lua`
-- Purpose:             `lazy.nvim` Plugin Specification    ( Language Server Protocol )

-- NOTE: Missing Lua's Language Server.         ( TODO )

-- Dummy commands which can be used as an event to lazy-load language servers.
vim.api.nvim_create_user_command("LspSetupRust", 'echo "Setting up `Rust-Analyzer`."', {})
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

return {
    {   -- LangServerProtocol Configs                   ( STATE: Good'ish )
        "neovim/nvim-lspconfig",
        lazy = true,

        cmd = {
            "LspInfo",
            "LspStart",
        },

        dependencies = {
            -- Very possible that `NeoDev` should only be loaded for Lua files.
            "folke/neoconf.nvim",       -- Still not really sure what this does.
            "folke/neodev.nvim",        -- This might make `lua_ls` heavier. (Latency in completion)
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
        end,
    },

    {   -- Rust LangServer++                            ( STATE: Good )
        -- NOTE: If issues with this, there might have been a fork of this that is worth trying.
        -- - Should swap to the maintained fork when can. (`rustacean.nvim`)
        "simrat39/rust-tools.nvim",
        lazy = true,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "neovim/nvim-lspconfig",
            "mfussenegger/nvim-dap",
        },
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
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
        },
    },

    {   -- Setup Config for Rust Analyzer               ( STATE: Good )
        "Aumnescio/rust-langserver-setup.nvim",
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
            "hrsh7th/nvim-cmp",
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
            "hrsh7th/nvim-cmp",
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
            "hrsh7th/nvim-cmp",
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
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            require("php-langserver-setup").setup()
            vim.api.nvim_create_user_command("LspSetupPhp", 'echo "Setting up `PHP`."', {})
        end,
    },

    {   -- Setup Config for Typst-LS                    ( STATE: Testing )
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
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
        },

        config = function()
            require("godot-langserver-setup").setup()
            vim.api.nvim_create_user_command("LspSetupGodot", 'echo "Setting up `Godot-LS`."', {})
        end,
    },
}

-- End of File

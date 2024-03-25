--================================================--+
-- === -    LSP -> Rust-analyzer Setup      - === --|
--================================================--+

-- NOTE: This file depends on `langserver-prefs.nvim` and `rust-tools.nvim`.

local Module = {}

function Module.setup()
    -- |> Fetch default LSP preferences from `langserver-prefs.nvim`.
    local lsp_prefs = require("langserver-prefs")
    local rust_tools = require("rust-tools")

    -- |> Rust LSP / rust-analyzer Setup    ( STATE: Good )
    rust_tools.setup({
        tools = {
            -- How to execute terminal commands.
            -- Options right now: termopen / quickfix
            executor = require("rust-tools/executors").termopen,

            -- Callback to execute once rust-analyzer is done initializing the workspace.
            -- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
            on_initialized = nil,

            -- Automatically call RustReloadWorkspace when writing to a Cargo.toml file.
            reload_workspace_from_cargo_toml = true,

            -- These apply to the default RustSetInlayHints command.
            inlay_hints = {
                -- Automatically set inlay hints. (type hints)
                -- Default: true
                auto = true,

                -- Only show inlay hints for the current line.
                only_current_line = false,

                -- Whether to show parameter hints with the inlay hints or not.
                -- Default: true
                show_parameter_hints = true,

                -- Prefix for parameter hints.
                -- Default: "<-"
                parameter_hints_prefix = " ⮜ ",

                -- Prefix for all the other hints. (type, chaining)
                -- Default: "=>"
                other_hints_prefix = "  🙙  ",

                -- Whether to align to the length of the longest line in the file.
                max_len_align = false,

                -- Padding from the left if `max_len_align` is `true`.
                max_len_align_padding = 1,

                -- Whether to align to the extreme right or not.
                right_align = false,

                -- Padding from the right if `right_align` is `true`.
                right_align_padding = 7,

                -- The color of the hints.
                highlight = "AumInlayHint",  -- Configured in my theme: `Aumnechroma`.
            },

            -- Options same as lsp hover / vim.lsp.util.open_floating_preview()
            hover_actions = {
                border = lsp_prefs.lsp_default_borderstyle,
                auto_focus = true,  -- Unsure? But might like this.
            },

            -- This is just copy paste from rust-tools github and not yet tested. (TODO, low prio)
            crate_graph = {
                -- Backend used for displaying the graph
                -- See: https://graphviz.org/docs/outputs/
                -- default: x11
                backend = "x11",
                -- Where to store the output, nil for no output stored.
                -- Relative path from current directory.
                -- Default: nil
                output = nil,
                -- True for all crates.io and external crates, false only the local
                -- crates.
                -- Default: true
                full = true,

                -- List of backends found on: https://graphviz.org/docs/outputs/
                -- Is used for input validation and autocompletion.
                -- Last updated: 2021-08-26
                enabled_graphviz_backends = {
                    "bmp",
                    "cgimage",
                    "canon",
                    "dot",
                    "gv",
                    "xdot",
                    "xdot1.2",
                    "xdot1.4",
                    "eps",
                    "exr",
                    "fig",
                    "gd",
                    "gd2",
                    "gif",
                    "gtk",
                    "ico",
                    "cmap",
                    "ismap",
                    "imap",
                    "cmapx",
                    "imap_np",
                    "cmapx_np",
                    "jpg",
                    "jpeg",
                    "jpe",
                    "jp2",
                    "json",
                    "json0",
                    "dot_json",
                    "xdot_json",
                    "pdf",
                    "pic",
                    "pct",
                    "pict",
                    "plain",
                    "plain-ext",
                    "png",
                    "pov",
                    "ps",
                    "ps2",
                    "psd",
                    "sgi",
                    "svg",
                    "svgz",
                    "tga",
                    "tiff",
                    "tif",
                    "tk",
                    "vml",
                    "vmlz",
                    "wbmp",
                    "webp",
                    "xlib",
                    "x11",
                },
            },
        },

        -- All the opts to send to nvim-lspconfig.
        -- These override the defaults set by `rust-tools.nvim`.
        -- See https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
        server = {
            autostart       = lsp_prefs.lsp_default_autostart,
            flags           = lsp_prefs.lsp_default_flags,
            handlers        = lsp_prefs.lsp_default_handlers,
            capabilities    = lsp_prefs.lsp_default_capabilities,
            standalone      = lsp_prefs.lsp_default_singlefile_support,

            on_attach = function(client, bufnr)
                -- Toggle `Semantic Tokens Highlighting`:
                client.server_capabilities.semanticTokensProvider = nil  -- Set to `nil` to disable semantic highlights.

                require("legendary").keymaps({
                    { "<F2>",           vim.lsp.buf.rename,                 description = "LSP: Rename",                        mode = "n", opts = { noremap = true, buffer = bufnr } },
                    { "gh",             vim.lsp.buf.hover,                  description = "LSP: Hover Docs",                    mode = "n", opts = { noremap = true, buffer = bufnr } },
                    { "gd",             vim.lsp.buf.definition,             description = "LSP: Definition",                    mode = "n", opts = { noremap = true, buffer = bufnr } },
                    { "<Space><S-d>",   vim.lsp.buf.type_definition,        description = "LSP: Type Definition",               mode = "n", opts = { noremap = true, buffer = bufnr } },
                    { "g<S-d>",         vim.lsp.buf.declaration,            description = "LSP: Declaration",                   mode = "n", opts = { noremap = true, buffer = bufnr } },
                    { "gi",             vim.lsp.buf.implementation,         description = "LSP: Implementation",                mode = "n", opts = { noremap = true, buffer = bufnr } },
                    { "gr",             "<Cmd>Telescope lsp_references",    description = "LSP: Telescope -> References",       mode = "n", opts = { noremap = true, buffer = bufnr } },
                    { "<Space>ca",      vim.lsp.buf.code_action,            description = "LSP: Code Action",                   mode = "n", opts = { noremap = true, buffer = bufnr } },
                    { "<C-k>",          vim.lsp.buf.signature_help,         description = "LSP: Signature Help",                mode = "n", opts = { noremap = true, buffer = bufnr } },

                    -- RustTools specific ones.
                    { "<Leader>ca",     rust_tools.code_action_group.code_action_group,     description = "LSP: RustTools Code Action",     mode = "n", opts = { noremap = true, buffer = bufnr } },
                    { "g<S-h>",         rust_tools.hover_actions.hover_actions,             description = "LSP: RustTools Hover Action",    mode = "n", opts = { noremap = true, buffer = bufnr } },

                    -- Formatting
                    { "<Space>f",       function()
                        vim.lsp.buf.format({ async = true })
                    end,    description = "LSP: Format Buffer",    mode = "n", opts = { noremap = true, buffer = bufnr } },
                })
            end,

            -- |> |settings| is for Language Server specific settings. (In this case, rust-analyzer.)
            settings = {
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
                        buildScripts = {
                            enable = true,
                        },
                    },
                    procMacro = {
                        enable = true,
                    },
                    checkOnSave = {
                        -- command = "check",  -- This causes some lag.
                        command = "clippy",  -- Might cause even more lag.  ( Is fine and good. )
                        -- Can also set to `"check"`, but `clippy` is a superset.

                        -- Testing these, if they affect performance. (No idea, but it doesn't seem to have broken anything.)
                        extraArgs = {
                            "--target-dir",
                            "/tmp/rust-analyzer-check"
                        }
                    },
                }
            },
        },

        -- Debugging stuff. (TODO, low'ish prio)
        dap = {
            adapter = {
                type = "executable",
                command = "/usr/bin/lldb-vscode-14",  -- This might change as things get updated, I suppose.
                name = "rt_lldb",
            },
        },
    })
end

--================================================--+
-- === END - LSP -> Rust-analyzer Setup - END === --|
--================================================--+

return Module

-- End of File

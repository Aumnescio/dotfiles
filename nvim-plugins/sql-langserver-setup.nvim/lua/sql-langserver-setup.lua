--====================================================--+
-- === -    LSP -> `SQLS` and `SQLLS` Setup     - === --|
--====================================================--+

-- NOTE: This file depends on `langserver-prefs.nvim`, `nvim-lspconfig` and `sqls.nvim`.

local Module = {}

function Module.setup()
    -- |> Fetch default LSP preferences from `langserver-prefs.nvim`.
    local lsp_prefs = require("langserver-prefs")
    local nvim_lsp = require("lspconfig")

    -- NOTE: This contains 2 SQL Language Servers, maybe just use one of them and comment the other one out.

    -- |> SQL LSP (`SQLS`) Setup                                ( STATE: Maybe okay )
    nvim_lsp.sqls.setup({
        cmd = { "sqls" },
        filetypes = { "sql", "mysql" },

        autostart               = true,
        flags                   = lsp_prefs.lsp_default_flags,
        handlers                = lsp_prefs.lsp_default_handlers,
        capabilities            = lsp_prefs.lsp_default_capabilities,
        single_file_support     = lsp_prefs.lsp_default_singlefile_support,

        root_dir = require("lspconfig.util").root_pattern({
            ".git",
        }),

        -- |> LSP Keybindings, `Semantic Token` toggle, and the `sqls.nvim` on_attach.
        on_attach = function(client, bufnr)
            -- Toggle `Semantic Tokens Highlighting`:
            client.server_capabilities.semanticTokensProvider = nil

            require("legendary").keymaps({
                { "<F2>",           vim.lsp.buf.rename,                     description = "LSP: Rename",                    mode = "n", opts = { noremap = true, buffer = bufnr } },
                { "gh",             vim.lsp.buf.hover,                      description = "LSP: Hover Docs",                mode = "n", opts = { noremap = true, buffer = bufnr } },
                { "gd",             vim.lsp.buf.definition,                 description = "LSP: Definition",                mode = "n", opts = { noremap = true, buffer = bufnr } },
                { "<Space><S-d>",   vim.lsp.buf.type_definition,            description = "LSP: Type Definition",           mode = "n", opts = { noremap = true, buffer = bufnr } },
                { "g<S-d>",         vim.lsp.buf.declaration,                description = "LSP: Declaration",               mode = "n", opts = { noremap = true, buffer = bufnr } },
                { "gi",             vim.lsp.buf.implementation,             description = "LSP: Implementation",            mode = "n", opts = { noremap = true, buffer = bufnr } },
                { "gr",             "<Cmd>Telescope lsp_references<CR>",    description = "LSP: Telescope -> References",   mode = "n", opts = { noremap = true, buffer = bufnr } },
                { "<Space>ca",      vim.lsp.buf.code_action,                description = "LSP: Code Action",               mode = "n", opts = { noremap = true, buffer = bufnr } },
                { "<C-k>",          vim.lsp.buf.signature_help,             description = "LSP: Signature Help",            mode = "n", opts = { noremap = true, buffer = bufnr } },
                { "<Space>f",       function()
                    vim.lsp.buf.format({ async = true })
                end,    description = "LSP: Format Buffer",    mode = "n", opts = { noremap = true, buffer = bufnr } },
            })

            -- Does this behave fine here? Hopefully.
            require("sqls").on_attach(client, bufnr)
        end
    })

    -- |> SQL LSP (`SQLLS`) Setup                ( STATE: TODO/WIP )
    -- nvim_lsp.sqlls.setup({
    --     cmd = { "sql-language-server", "up", "--method", "stdio" },
    --     filetypes = { "sql", "mysql" },
    --
    --     autostart               = true,
    --     flags                   = lsp_prefs.lsp_default_flags,
    --     handlers                = lsp_prefs.lsp_default_handlers,
    --     capabilities            = lsp_prefs.lsp_default_capabilities,
    --     single_file_support     = lsp_prefs.lsp_default_singlefile_support,
    --
    --     root_dir = require("lspconfig.util").root_pattern({
    --         ".git",
    --     }),
    --
    --     -- Attaching the `sqls.nvim` plugin.
    --     on_attach = function(client, bufnr)
    --         require("sqls").on_attach(client, bufnr)
    --     end
    -- })
end

--============================================--+
-- === END - LSP -> Svelte-LS Setup - END === --|
--============================================--+

return Module

-- End of File

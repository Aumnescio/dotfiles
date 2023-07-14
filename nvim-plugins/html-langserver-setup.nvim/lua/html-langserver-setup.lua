--========================================--+
-- === -    LSP -> HTML-LS Setup    - === --|
--========================================--+

-- NOTE: This file depends on `langserver-prefs.nvim` and `nvim-lspconfig`.

local Module = {}

function Module.setup()
    -- |> Fetch default LSP preferences from `langserver-prefs.nvim`.
    local lsp_prefs = require("langserver-prefs")
    local nvim_lsp = require("lspconfig")

    -- |> HTML LSP Setup                 ( STATE: Fine )
    nvim_lsp.html.setup({
        cmd = { "vscode-html-language-server", "--stdio" },
        filetypes = { "html" },
        root_dir = nvim_lsp.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git", "pnpm-lock.yaml", "yarn.lock"),

        init_options = {
            configurationSection = { "html", "css", "javascript" },
            embeddedLanguages = {
                css = true,
                javascript = true
            },
            provideFormatter = true
        },

        autostart               = true,
        flags                   = lsp_prefs.lsp_default_flags,
        handlers                = lsp_prefs.lsp_default_handlers,
        capabilities            = lsp_prefs.lsp_default_capabilities,
        on_attach               = lsp_prefs.lsp_default_on_attach,
        single_file_support     = lsp_prefs.lsp_default_singlefile_support,

        settings = {},
    })
end

return Module

-- End of File

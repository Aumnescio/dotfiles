--========================================--+
-- === -    LSP -> Slint-LS Setup   - === --|
--========================================--+

-- NOTE: This file depends on `langserver-prefs.nvim` and `nvim-lspconfig`.

local Module = {}

function Module.setup()
    -- |> Fetch default LSP preferences from `langserver-prefs.nvim`.
    local lsp_prefs = require("langserver-prefs")
    local nvim_lsp = require("lspconfig")

    -- |> Slint LSP Setup               ( STATE: Fine )
    nvim_lsp.slint_lsp.setup({
        cmd = { "slint-lsp" },
        filetypes = { "slint" },
        root_dir = nvim_lsp.util.root_pattern("cargo.toml", ".git"),

        autostart               = lsp_prefs.lsp_default_autostart,
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

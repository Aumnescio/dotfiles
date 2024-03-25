--============================================--+
-- === -    LSP -> CSharp-LS Setup      - === --|
--============================================--+

-- NOTE: This file depends on `langserver-prefs.nvim`.

local Module = {}

function Module.setup()
    -- |> Fetch default LSP preferences from `langserver-prefs.nvim`.
    local lsp_prefs = require("langserver-prefs")
    local nvim_lsp = require("lspconfig")

    -- |> CSharp-LS Setup               ( STATE: Might work. )
    nvim_lsp.csharp_ls.setup({
        cmd = { "csharp-ls" },
        filetypes = { "cs" },

        init_options = {
            AutomaticWorkspaceInit = true
        },

        autostart       = lsp_prefs.lsp_default_autostart,
        flags           = lsp_prefs.lsp_default_flags,
        handlers        = lsp_prefs.lsp_default_handlers,
        capabilities    = lsp_prefs.lsp_default_capabilities,
        on_attach       = lsp_prefs.lsp_default_on_attach,
        standalone      = lsp_prefs.lsp_default_singlefile_support,
    })
end

--============================================--+
-- === END - LSP -> OmniSharp Setup - END === --|
--============================================--+

return Module

-- End of File

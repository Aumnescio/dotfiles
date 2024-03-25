--============================================--+
-- === -    LSP -> OmniSharp Setup      - === --|
--============================================--+

-- NOTE: This file depends on `langserver-prefs.nvim`.

local Module = {}

function Module.setup()
    -- |> Fetch default LSP preferences from `langserver-prefs.nvim`.
    local lsp_prefs = require("langserver-prefs")
    local nvim_lsp = require("lspconfig")

    local pid = vim.fn.getpid()
    local omnisharp_path = "/home/aum/.nix-profile/bin/OmniSharp"

    -- |> OmniSharp Setup           ( STATE: Works initially, but crashes easily. )
    nvim_lsp.omnisharp.setup({
        cmd = {
            omnisharp_path
            -- "--languageserver",
            -- "--hostPID",
            -- tostring(pid)
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

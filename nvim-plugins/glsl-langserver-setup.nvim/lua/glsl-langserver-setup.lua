--================================================--+
-- === -    LSP -> GLSL-Analyzer Setup      - === --|
--================================================--+

-- NOTE: This file depends on `langserver-prefs.nvim`.

local Module = {}

function Module.setup()
    -- |> Fetch default LSP preferences from `langserver-prefs.nvim`.
    local lsp_prefs = require("langserver-prefs")
    local nvim_lsp = require("lspconfig")

    -- |> GLSL LSP / GLSL-Analyzer Setup    ( STATE: TBD )
    nvim_lsp.glsl_analyzer.setup({
        autostart               = lsp_prefs.lsp_default_autostart,
        flags                   = lsp_prefs.lsp_default_flags,
        handlers                = lsp_prefs.lsp_default_handlers,
        capabilities            = lsp_prefs.lsp_default_capabilities,
        on_attach               = lsp_prefs.lsp_default_on_attach,
        single_file_support     = true,
    })
end

--================================================--+
-- === END - LSP -> Rust-analyzer Setup - END === --|
--================================================--+

return Module

-- End of File

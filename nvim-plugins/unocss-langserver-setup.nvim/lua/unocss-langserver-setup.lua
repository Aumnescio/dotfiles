--============================================--+
-- === -    LSP -> UnoCSS-LS Setup      - === --|
--============================================--+

-- NOTE: This file depends on `langserver-prefs.nvim` and `nvim-lspconfig`.

local Module = {}

function Module.setup()
    -- |> Fetch default LSP preferences from `langserver-prefs.nvim`.
    local lsp_prefs = require("langserver-prefs")
    local nvim_lsp = require("lspconfig")

    -- |> UnoCSS LSP Setup                  ( STATE: Very Weak, no hover )
    nvim_lsp.unocss.setup({
        cmd = { "unocss-language-server", "--stdio" },
        filetypes = { "html", "svelte" },
        root_dir = nvim_lsp.util.root_pattern("unocss.config.js", "unocss.config.ts", "uno.config.js", "uno.config.ts"),

        autostart               = true,
        -- autostart               = lsp_prefs.lsp_default_autostart,       -- is: `false`
        flags                   = lsp_prefs.lsp_default_flags,
        handlers                = lsp_prefs.lsp_default_handlers,
        capabilities            = lsp_prefs.lsp_default_capabilities,
        on_attach               = lsp_prefs.lsp_default_on_attach,
        single_file_support     = lsp_prefs.lsp_default_singlefile_support,
    })
end

return Module

-- End of File

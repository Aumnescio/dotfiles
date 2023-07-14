--========================================--+
-- === -    LSP -> Svelte Setup     - === --|
--========================================--+

-- NOTE: This file depends on `langserver-prefs.nvim` and `nvim-lspconfig`.

local Module = {}

function Module.setup()
    -- |> Fetch default LSP preferences from `langserver-prefs.nvim`.
    local lsp_prefs = require("langserver-prefs")
    local nvim_lsp = require("lspconfig")

    -- |> Svelte LSP Setup              ( STATE: Seems Good )
    -- NOTE: Didn't configure many of the server specific things yet. Possible TODO.
    nvim_lsp.svelte.setup({
        cmd = { "svelteserver", "--stdio" },
        filetypes = { "svelte" },
        -- Could add the `root_dir` field, but the default should be fine.

        autostart               = true,
        flags                   = lsp_prefs.lsp_default_flags,
        handlers                = lsp_prefs.lsp_default_handlers,
        capabilities            = lsp_prefs.lsp_default_capabilities,
        on_attach               = lsp_prefs.lsp_default_on_attach,
        single_file_support     = lsp_prefs.lsp_default_singlefile_support,
    })
end

--============================================--+
-- === END - LSP -> Svelte-LS Setup - END === --|
--============================================--+

return Module

-- End of File

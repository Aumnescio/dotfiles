--========================================--+
-- === -    LSP -> Emmet-LS Setup   - === --|
--========================================--+

-- NOTE: This file depends on `langserver-prefs.nvim` and `nvim-lspconfig`.

local Module = {}

function Module.setup()
    -- |> Fetch default LSP preferences from `langserver-prefs.nvim`.
    local lsp_prefs = require("langserver-prefs")
    local nvim_lsp = require("lspconfig")

    -- |> Emmet LSP Setup                 ( STATE: Fine )
    nvim_lsp.emmet_ls.setup({
        cmd = { "emmet-ls", "--stdio" },
        filetypes = { "html", "css" },
        root_dir = nvim_lsp.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git", "pnpm-lock.yaml", "yarn.lock"),

        autostart               = true,
        flags                   = lsp_prefs.lsp_default_flags,
        handlers                = lsp_prefs.lsp_default_handlers,
        capabilities            = lsp_prefs.lsp_default_capabilities,
        on_attach               = lsp_prefs.lsp_default_on_attach,
        single_file_support     = lsp_prefs.lsp_default_singlefile_support,

        -- |> NOTE: See [this](https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267) for info on how to set these options.
        -- init_options = {
        --     html = {
        --         options = {
        --             ["something"] = true,
        --         }
        --     }
        -- }
    })
end

return Module

-- End of File

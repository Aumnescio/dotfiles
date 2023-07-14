--========================================--+
-- === -    LSP -> PHP-LS Setup     - === --|
--========================================--+

-- NOTE: This file depends on `langserver-prefs.nvim` and `nvim-lspconfig`.

local Module = {}

function Module.setup()
    -- |> Fetch default LSP preferences from `langserver-prefs.nvim`.
    local lsp_prefs = require("langserver-prefs")
    local nvim_lsp = require("lspconfig")

    -- |> PHP-LS Setup              ( STATE: Testing )
    -- Alternatives: `phpactor` | `intelephense`
    --  - `phpactor` is not great.
    --  - Testing `intelephense`.
    nvim_lsp.intelephense.setup({
        cmd = { "intelephense", "--stdio" },

        -- Alternative `cmd` for `phpactor`:
        -- cmd = { "phpactor", "language-server" },

        filetypes = { "php" },
        root_dir = nvim_lsp.util.root_pattern("composer.json", ".git"),

        autostart       = true,
        -- autostart       = lsp_prefs.lsp_default_autostart,  -- is: `false`
        flags           = lsp_prefs.lsp_default_flags,
        handlers        = lsp_prefs.lsp_default_handlers,
        capabilities    = lsp_prefs.lsp_default_capabilities,
        on_attach       = lsp_prefs.lsp_default_on_attach,
        standalone      = lsp_prefs.lsp_default_singlefile_support,

        -- Options for `phpactor`:
        -- init_options = {
        --     ["completion_worse.completor.declared_function.enabled"] = true,
        --     ["completion_worse.completor.declared_constant.enabled"] = true,
        --     ["completion_worse.completor.declared_class.enabled"] = true,
        -- }
    })
end

return Module

-- End of File

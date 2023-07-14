--============================================--+
-- === -    LSP -> TS-Server Setup      - === --|
--============================================--+

-- NOTE: This file depends on `langserver-prefs.nvim` and `typescript-tools.nvim`.

local Module = {}

function Module.setup()
    -- |> Fetch default LSP preferences from `langserver-prefs.nvim`.
    local lsp_prefs = require("langserver-prefs")

    -- |> TS LSP Setup              ( STATE: Seems Good )
    -- NOTE: Didn't configure many of the server specific things yet. Possible TODO.
    require("typescript-tools").setup({
        autostart               = lsp_prefs.lsp_default_autostart,
        flags                   = lsp_prefs.lsp_default_flags,
        handlers                = lsp_prefs.lsp_default_handlers,
        capabilities            = lsp_prefs.lsp_default_capabilities,
        on_attach               = lsp_prefs.lsp_default_on_attach,
        single_file_support     = lsp_prefs.lsp_default_singlefile_support,

        settings = {
            -- Spawn additional tsserver instance to calculate diagnostics on it.
            separate_diagnostic_server = true,
            -- "change" | "insert_leave": Determine when the client asks the server about diagnostic.
            publish_diagnostic_on = "insert_leave",

            tsserver_file_preferences = {
                includeInlayParameterNameHints = "all",
                -- includeCompletionsForModuleExports = true,
                -- quotePreference = "auto",
            },

            -- Specify a list of plugins to load by tsserver, e.g., for support `styled-components`
            -- (see 💅 `styled-components` support section)
            tsserver_plugins = {},
            tsserver_format_options = {},
            tsserver_file_preferences = {},
        },
    })
end

--============================================--+
-- === END - LSP -> TS-Server Setup - END === --|
--============================================--+

return Module

-- End of File

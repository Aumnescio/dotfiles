--========================================--+
-- === -    LSP -> CSS-LS Setup     - === --|
--========================================--+

-- NOTE: This file depends on `langserver-prefs.nvim` and `nvim-lspconfig`.

local Module = {}

function Module.setup()
    -- |> Fetch default LSP preferences from `langserver-prefs.nvim`.
    local lsp_prefs = require("langserver-prefs")
    local nvim_lsp = require("lspconfig")

    -- |> CSS LSP Setup                 ( STATE: Decent, I think. )
    nvim_lsp.cssls.setup({
        cmd = { "vscode-css-language-server", "--stdio" },
        filetypes = { "css", "scss", "less" },
        root_dir = nvim_lsp.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git", "pnpm-lock.yaml", "yarn.lock"),

        autostart               = true,
        flags                   = lsp_prefs.lsp_default_flags,
        handlers                = lsp_prefs.lsp_default_handlers,
        capabilities            = lsp_prefs.lsp_default_capabilities,
        on_attach               = lsp_prefs.lsp_default_on_attach,
        single_file_support     = lsp_prefs.lsp_default_singlefile_support,

        settings = {
            css = {
                validate = true,
                lint = {
                    unknownAtRules = "ignore",          -- Using because of `@tailwind` `AtRules` warning.
                    -- idSelector = "warning",
                    zeroUnits = "warning",
                    duplicateProperties = "warning"
                },
                completion = {
                    completePropertyWithSemicolon = true,
                    triggerPropertyValueCompletion = true
                }
            },

            scss = {
                validate = true,
                lint = {
                    unknownAtRules = "ignore",          -- Using because of `@tailwind` `AtRules` warning.
                    idSelector = "warning",
                    zeroUnits = "warning",
                    duplicateProperties = "warning"
                },
                completion = {
                    completePropertyWithSemicolon = true,
                    triggerPropertyValueCompletion = true
                }
            },

            less = {
                validate = true,
                lint = {
                    unknownAtRules = "ignore"           -- Using because of `@tailwind` `AtRules` warning.
                }
            }
        },
    })
end

return Module

-- End of File

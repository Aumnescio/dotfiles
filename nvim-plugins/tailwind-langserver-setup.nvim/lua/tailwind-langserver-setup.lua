--============================================--+
-- === -    LSP -> TailwindCSS Setup    - === --|
--============================================--+

-- NOTE: This file depends on `langserver-prefs.nvim` and `nvim-lspconfig`.

local Module = {}

function Module.setup()
    -- |> Fetch default LSP preferences from `langserver-prefs.nvim`.
    local lsp_prefs = require("langserver-prefs")
    local nvim_lsp = require("lspconfig")

    -- |> TailwindCSS LSP Setup             ( STATE: Testing )
    nvim_lsp.tailwindcss.setup({
        cmd = { "tailwindcss-language-server", "--stdio" },
        filetypes = {
            "aspnetcorerazor", "astro", "astro-markdown", "blade", "clojure",
            "django-html", "htmldjango", "edge", "eelixir", "elixir", "ejs",
            "erb", "eruby", "gohtml", "gohtmltmpl", "haml", "handlebars",
            "hbs", "html", "html-eex", "heex", "jade", "leaf", "liquid",
            "markdown", "mdx", "mustache", "njk", "nunjucks", "php", "razor",
            "slim", "twig", "css", "less", "postcss", "sass", "scss", "stylus",
            "sugarss", "javascript", "javascriptreact", "reason", "rescript",
            "typescript", "typescriptreact", "vue", "svelte", "templ"
        },

        settings = {
            tailwindCSS = {
                classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
                lint = {
                    cssConflict = "warning",
                    invalidApply = "error",
                    invalidConfigPath = "error",
                    invalidScreen = "error",
                    invalidTailwindDirective = "error",
                    invalidVariant = "error",
                    recommendedVariantOrder = "warning",
                },
                validate = true,
            }
        },

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

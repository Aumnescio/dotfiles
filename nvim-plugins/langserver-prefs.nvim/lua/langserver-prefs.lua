-- File:        `langserver-prefs.lua`
-- Purpose:     Encapsulate language server related preferences and options,
--              which are used in all language server setup calls.

-- |> Module Table
local Module = {}

-- |> Autostart
Module.lsp_default_autostart = false

-- |> Single File Support
Module.lsp_default_singlefile_support = false

-- |> Flags
Module.lsp_default_flags = {
    allow_incremental_sync = true,  -- This used to be buggy, but maybe it is fine now.
    debounce_text_changes = 120     -- 150 is default, and is probably fine.
}

-- |> Borderstyle
Module.lsp_default_borderstyle = {
    { "╭", "FloatBorder" }, { "─", "FloatBorder" },
    { "╮", "FloatBorder" }, { "│", "FloatBorder" },
    { "╯", "FloatBorder" }, { "─", "FloatBorder" },
    { "╰", "FloatBorder" }, { "│", "FloatBorder" },
}

-- This requires that `cmp-nvim-lsp` package I suppose.
--  - Is this the source package or what?
--  - Remember to add nvim-cmp things as dependencies into the lazy spec config.
local aum_capabilities = require("cmp_nvim_lsp").default_capabilities();
aum_capabilities.textDocument.completion.completionItem.snippetSupport = true

-- |> Completion capabilities.
--  - TODO: Need to test if this even works like this.
Module.lsp_default_capabilities = vim.tbl_deep_extend(
    "force",
    {},
    vim.lsp.protocol.make_client_capabilities(),
    aum_capabilities
)

-- |> LSP Handler Setup, UI customization.
--  - NOTE: There is a good chance `noice.nvim` or `nui.nvim` might overwrite these.
Module.lsp_default_handlers = {
    ["textDocument/signatureHelp"]  = vim.lsp.with(vim.lsp.handlers.signature_help, { border = Module.lsp_default_borderstyle }),
    ["textDocument/hover"]          = vim.lsp.with(vim.lsp.handlers.hover,          { border = Module.lsp_default_borderstyle }),
}

-- |> LSP Keybindings and `Semantic Token` toggle.
Module.lsp_default_on_attach = function(client, bufnr)
    -- Toggle `Semantic Tokens Highlighting`:
    -- client.server_capabilities.semanticTokensProvider = nil     -- Set to `nil` to disable semantic highlights.
    -- - NOTE: Having this on nil might have caused something to error.
    -- I might just disable the groups themselves in my theme.

    local bufmap = function(mode, lhs, rhs)
        local lsp_opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set(mode, lhs, rhs, lsp_opts)
    end

    -- NOTE/TODO: There's a decent possibility that I want to bind these keys using
    -- `Legendary.nvim`

    -- === - LSP Mappings - ===
    bufmap("n", "<F2>",         vim.lsp.buf.rename)                     -- STATE: Good  ( I think `dressing.nvim` is overwriting the UI for this, and its good. )
    bufmap("n", "gh",           vim.lsp.buf.hover)                      -- STATE: Good, expect that it occasionally lags.   ( Rust-Analyzer, Pyright )
    bufmap("n", "gd",           vim.lsp.buf.definition)                 -- STATE: Good
    bufmap("n", "<Space>D",     vim.lsp.buf.type_definition)            -- STATE: Probably good
    bufmap("n", "gD",           vim.lsp.buf.declaration)                -- STATE: Probably good
    bufmap("n", "gi",           vim.lsp.buf.implementation)             -- STATE: Probably good
    bufmap("n", "gr",           vim.lsp.buf.references)                 -- STATE: Bit awkward to use window. Some Aerial-like or Navigator plugin might be better.
    bufmap("n", "<Space>ca",    vim.lsp.buf.code_action)                -- STATE: Probably good     ( Bind could be better. )
    bufmap("n", "<C-k>",        vim.lsp.buf.signature_help)             -- STATE: Good. Displays good info and is responsive.

    bufmap("n", "<Space>f",     function()                              -- STATE: Seems to be good.
        vim.lsp.buf.format({ async = true })
    end)

    bufmap("n", "<Space>wa",    vim.lsp.buf.add_workspace_folder)       -- STATE: Not sure, not really often used or required.
    bufmap("n", "<Space>wr",    vim.lsp.buf.remove_workspace_folder)    -- STATE: Not sure, not really often used or required.
    bufmap("n", "<Space>wl",    function()                              -- STATE: Not sure, not really often used or required.
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end)
end

-- |> Return all preferences
return Module

-- End of File

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

Module.lsp_semantic_tokens = nil    -- Disabled generally good.

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
    ["textDocument/hover"]          = vim.lsp.with(vim.lsp.handlers.hover, {
        border = Module.lsp_default_borderstyle,
        -- `max_width`: This is critical to ensure documentation highlighting, until some bug is fixed somewhere.
        -- - Too wide window breaks highlighting.
        max_width   = 76,
        max_height  = 16,
        silent = true,
    }),
}

-- |> LSP Keybindings and `Semantic Token` toggle.
Module.lsp_default_on_attach = function(client, bufnr)
    -- Toggle `Semantic Tokens Highlighting`:
    client.server_capabilities.semanticTokensProvider = Module.lsp_semantic_tokens  -- Set to `nil` to disable semantic highlights.
    -- - NOTE: Having this on nil might have caused something to error.
    -- I might just disable the groups themselves in my theme.

    require("legendary").keymaps({
        { "<F2>",           vim.lsp.buf.rename,                     description = "LSP: Rename",                    mode = "n", opts = { noremap = true, buffer = bufnr } },
        { "gh",             vim.lsp.buf.hover,                      description = "LSP: Hover Docs",                mode = "n", opts = { noremap = true, buffer = bufnr } },
        { "gd",             vim.lsp.buf.definition,                 description = "LSP: Definition",                mode = "n", opts = { noremap = true, buffer = bufnr } },
        { "<Space><S-d>",   vim.lsp.buf.type_definition,            description = "LSP: Type Definition",           mode = "n", opts = { noremap = true, buffer = bufnr } },
        { "g<S-d>",         vim.lsp.buf.declaration,                description = "LSP: Declaration",               mode = "n", opts = { noremap = true, buffer = bufnr } },
        { "gi",             vim.lsp.buf.implementation,             description = "LSP: Implementation",            mode = "n", opts = { noremap = true, buffer = bufnr } },
        { "gr",             "<Cmd>Telescope lsp_references<CR>",    description = "LSP: Telescope -> References",   mode = "n", opts = { noremap = true, buffer = bufnr } },
        { "<Space>ca",      vim.lsp.buf.code_action,                description = "LSP: Code Action",               mode = "n", opts = { noremap = true, buffer = bufnr } },
        { "<C-k>",          vim.lsp.buf.signature_help,             description = "LSP: Signature Help",            mode = "n", opts = { noremap = true, buffer = bufnr } },
        { "<Space>f",       function()
            vim.lsp.buf.format({ async = true })
        end,    description = "LSP: Format Buffer",    mode = "n", opts = { noremap = true, buffer = bufnr } },
    })

    -- local bufmap = function(mode, lhs, rhs)
    --     local lsp_opts = { noremap = true, silent = true, buffer = bufnr }
    --     vim.keymap.set(mode, lhs, rhs, lsp_opts)
    -- end

    -- bufmap("n", "<Space>wa",    vim.lsp.buf.add_workspace_folder)       -- STATE: Not sure, not really often used or required.
    -- bufmap("n", "<Space>wr",    vim.lsp.buf.remove_workspace_folder)    -- STATE: Not sure, not really often used or required.
    -- bufmap("n", "<Space>wl",    function()                              -- STATE: Not sure, not really often used or required.
    --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end)
end

-- |> Return all preferences
return Module

-- End of File

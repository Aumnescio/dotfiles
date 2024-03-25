--============================================--+
-- === -    LSP -> Godot-LS Setup       - === --|
--============================================--+

-- NOTE: This file depends on `langserver-prefs.nvim` and `nvim-lspconfig`.

local Module = {}

function Module.setup()
    -- |> Fetch default LSP preferences from `langserver-prefs.nvim`.
    local lsp_prefs = require("langserver-prefs")
    local nvim_lsp = require("lspconfig")

    -- |> Godot LSP Setup               ( STATE: Testing )
    nvim_lsp.gdscript.setup({
        cmd = vim.lsp.rpc.connect('127.0.0.1', os.getenv("GDScript_Port") or "6005"),
        filetypes = { "gd", "gdscript" },
        root_dir = nvim_lsp.util.root_pattern("project.godot", ".git"),

        autostart               = lsp_prefs.lsp_default_autostart,
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

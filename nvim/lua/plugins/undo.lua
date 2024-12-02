-- File:                `nvim/lua/plugins/undo.lua`
-- Purpose:             `lazy.nvim` Plugin Specification    ( Undo related functionality )

return {
    {
        "mbbill/undotree",
        enabled = true,
        cond = vim.g.aum_plugin_undotree_enabled,
        lazy = false,

        -- opts = {},

        config = function(_, opts)
            vim.g.undotree_SplitWidth = 48              -- Width of `UndoTree Sidebar`
            vim.g.undotree_DiffpanelHeight = 12         -- Height of `Diff Panel`
            vim.g.undotree_SetFocusWhenToggle = 1       -- Auto-focus
        end,
    },
}

-- End of File

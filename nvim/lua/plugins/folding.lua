-- File:                `nvim/lua/plugins/folding.lua`
-- Purpose:             `lazy.nvim` Plugin Specification    ( Folding )

-- ToC
--  -> nvim-ufo

return {
    {   -- An attempt at good folding for nvim.                             ( STATE: Decent, quite good. )
        "kevinhwang91/nvim-ufo",
        enabled = true,                             -- `true` to enable.
        lazy = true,                                -- TODO: Config some lazy-loading maybe.
        version = false,

        ft = {
            "norg",
            "lua",
            "rust",
        },

        dependencies = {
            "kevinhwang91/promise-async",
            "nvim-treesitter/nvim-treesitter",      -- Required for treesitter based folds.
        },

        config = function()
            -- Handler:
            local ufo_handler = function(virtText, lnum, endLnum, width, truncate)
                local newVirtText = {}
                local suffix = (' ⋯ ⮟ %d '):format(endLnum - lnum)
                local sufWidth = vim.fn.strdisplaywidth(suffix)
                local targetWidth = width - sufWidth
                local curWidth = 0

                for _, chunk in ipairs(virtText) do
                    local chunkText = chunk[1]
                    local chunkWidth = vim.fn.strdisplaywidth(chunkText)

                    if targetWidth > curWidth + chunkWidth then
                        table.insert(newVirtText, chunk)
                    else
                        chunkText = truncate(chunkText, targetWidth - curWidth)
                        local hlGroup = chunk[2]
                        table.insert(newVirtText, {chunkText, hlGroup})
                        chunkWidth = vim.fn.strdisplaywidth(chunkText)

                        if curWidth + chunkWidth < targetWidth then
                            suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
                        end

                        break
                    end

                    curWidth = curWidth + chunkWidth
                end

                table.insert(newVirtText, {suffix, 'UfoVirtualText'})

                return newVirtText
            end

            -- `nvim-ufo` setup
            require("ufo").setup({
                -- Duration of range-highlight applied to the folded area, when opening a fold.
                open_fold_hl_timeout = 0,       -- `0`: Good

                -- close_fold_kinds = { "imports", "comment" },

                provider_selector = function(bufnr, filetype, buftype)
                    return { "treesitter", "indent" }
                end,

                fold_virt_text_handler = ufo_handler,
            })

            -- Add bindings.
            require("legendary").keymaps({
                { "z<S-m>",     require("ufo").closeAllFolds,       description = "ufo: Close all folds.",      mode = "n",     opts = { noremap = true } },
                { "z<S-r>",     require("ufo").openAllFolds,        description = "ufo: Open all folds.",       mode = "n",     opts = { noremap = true } },
            })
        end,
    },
}

-- End of File

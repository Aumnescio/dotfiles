-- File:                `nvim/lua/plugins/folding.lua`
-- Purpose:             `lazy.nvim` Plugin Specification    ( Folding )

-- ToC
--  -> nvim-ufo

return {
    {   -- Supposed to give better folding, but is either not working at all,
        -- or giving errors, which I can't be arsed to deal with right now.
        "kevinhwang91/nvim-ufo",
        enabled = false,                            -- `true` to enable.
        lazy = true,
        version = false,
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

                table.insert(newVirtText, {suffix, 'MoreMsg'})

                return newVirtText
            end

            -- `nvim-ufo` setup
            require("ufo").setup({
                open_fold_hl_timeout = 120,
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

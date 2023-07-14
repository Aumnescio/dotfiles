-- File:                `nvim/lua/plugins/navigation.lua`
-- Purpose:             `lazy.nvim` Plugin Specification    ( Plugins for faster and easier buffer-local navigation. )

return {
    {   -- Improved Word Motions.                       ( STATE: Very Good )
        "chrisgrieser/nvim-spider",
        cond = true,        -- Allow in VS-Code.
        lazy = true,        -- Seems to be fine without further config.
        opts = {
            skipInsignificantPunctuation = true,
        },
    },

    {   -- Quick search-type leap motion.
        "ggandor/leap.nvim",
        lazy = true,
        keys = function()
            local ret = {}
            for _, key in ipairs({ "d" }) do
                ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
            end
            return ret
        end,
        config = function()
            -- Add leap binding using Legendary.
            require("legendary").keymaps({
                { "d", "<Plug>(leap-forward-to)", description = "`leap.nvim`: Leap forward.", mode = { "n", "x", "o" }, opts = opts },
            })
        end,
    },

    {   -- Enhanced `f` and `t` motions for `leap.nvim`.
        "ggandor/flit.nvim",
        -- TODO/NOTE: Configured acceptably, but these keys haven't/can't be added to the
        -- core bindings file, or `legendary.nvim`, unless I configure the config function
        -- to bind Legendary Keys using the `flit.nvim` API. (Which im not sure if it offers.)
        lazy = true,

        dependencies = {
            "ggandor/leap.nvim",
        },

        keys = function()
            ---@type LazyKeys[]
            local ret = {}
            for _, key in ipairs({ "j", "J", "gj", "gJ" }) do
                ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
            end
            return ret
        end,

        opts = {
            keys = { f = 'j', F = 'J', t = 'gj', T = 'gJ' },
            labeled_modes = "nx",

            -- `multiline` notes:
            --  - Having this on `false` allows a more consistent and probably faster single-line usage experience.
            --      - Also clutters the screen less.
            --  - Jumping to other lines is generally better to do using search or leap.
            multiline = false,
        },
    },
}

-- End of File

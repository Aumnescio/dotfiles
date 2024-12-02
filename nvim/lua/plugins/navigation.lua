-- File:                `nvim/lua/plugins/navigation.lua`
-- Purpose:             `lazy.nvim` Plugin Specification    ( Plugins for faster and easier buffer-local navigation. )

return {
    {   -- Improved Word Motions.                       ( STATE: Really good, but could potentially be better. )
        "chrisgrieser/nvim-spider",
        enabled = true,
        cond = vim.g.aum_plugin_nvim_spider_enabled,
        lazy = true,        -- Seems to be fine without further config.

        opts = {
            skipInsignificantPunctuation = true,
        },

        -- -- |> Fixes UTF-8 issue, takes 200 ms to load. Unuseable.
        -- dependencies = {
        --      "theHamsta/nvim_rocks",
        --     build = "pip3 install --user hererocks && python3 -mhererocks . -j2.1.0-beta3 -r3.0.0 && cp nvim_rocks.lua lua",
        --     config = function()
        --         require("nvim_rocks").ensure_installed("luautf8")
        --     end,
        -- },
    },

    {   -- Quick search-type leap motion.
        "ggandor/leap.nvim",
        enabled = false,
        cond = vim.g.aum_plugin_leap_enabled,
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
        enabled = false,
        cond = vim.g.aum_plugin_flit_enabled,
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

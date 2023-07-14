-- File:                `nvim/lua/plugins/color-utils.lua`
-- Purpose:             `lazy.nvim` Plugin Specification    ( Utilities for working with colors )

return {
    {   -- Show Colors as VirtualText                       ( STATE: Good )
        "NvChad/nvim-colorizer.lua",
        lazy = true,

        cmd = {
            "ColorizerAttachToBuffer",
            "ColorizerToggle",
        },

        ft = {
            "css",
            "svelte",
            "scss",
        },

        opts = {
            filetypes = {
                "html", "css", "javascript", "typescript", "lua", "rust", "svelte",
            },

            user_default_options = {
                names       = false,    -- "Name" codes like Blue or blue

                RGB         = true,     -- #RGB hex codes
                RRGGBB      = true,     -- #RRGGBB hex codes
                RRGGBBAA    = true,     -- #RRGGBBAA hex codes
                AARRGGBB    = false,    -- 0xAARRGGBB hex codes

                css         = false,    -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                css_fn      = true,     -- Enable all CSS *functions*: rgb_fn, hsl_fn
                rgb_fn      = true,     -- CSS rgb() and rgba() functions
                hsl_fn      = true,     -- CSS hsl() and hsla() functions

                -- `foreground` | `background` | `virtualtext`
                mode = "virtualtext",   -- Set the display mode.

                -- Available methods are: [ `false` | `true | `"normal"` | `"lsp"` | `"both"` ]
                tailwind = false,       -- Enable Tailwind colors

                -- Parsers can contain values used in |user_default_options|
                sass = { enable = false, parsers = { "css" }, },    -- Enable sass colors

                virtualtext = " · Color   ·",

                -- Update color values even if buffer is not focused.
                -- Example use: cmp_menu, cmp_docs
                always_update = false
            },

            -- All the sub-options of filetypes apply to buftypes
            buftypes = {},
        },

        config = function(_, opts)
            require("colorizer").setup(opts)
        end,
    },
    {   -- Color Picker                                     ( STATE: Don't really like this. )
        "nvim-colortils/colortils.nvim",
        enabled = false,
        lazy = true,
        cmd = {
            "Colortils",
        },

        -- TODO: Bind some colortils picker function to a key and do the lazy-load with Legendary Binding thing.
        -- keys = {
        --
        -- },

        opts = function()
            return {
                -- Register in which color codes will be copied.
                register = "+",
                -- Preview for colors, if it contains `%s` this will be replaced with a hex color code of the color.
                color_preview =  "█████████ %s",
                -- `default_format` can be "hex", "hsl" or "rgb".
                default_format = "hex",
                border = "rounded",
                -- Some mappings which are used inside the tools.
                mappings = {
                    -- Increment values
                    increment = "e",
                    -- Decrement values
                    decrement = "q",
                    -- Increment values with bigger steps
                    increment_big = "n",
                    -- Decrement values with bigger steps
                    decrement_big = "o",
                    -- Set values to the minimum
                    min_value = "go",
                    -- Set values to the maximum
                    max_value = "gn",
                    -- Save the current color in the register specified above with the format specified above
                    set_register_default_format = "<M-CR>",
                    -- Save the current color in the register specified above with a format you can choose
                    set_register_cjoose_format = "g<M-CR>",
                    -- Replace the color under the cursor with the current color in the format specified above
                    replace_default_format = "<CR>",
                    -- Replace the color under the cursor with the current color in a format you can choose
                    replace_choose_format = "g<CR>",
                    -- Export the current color to a different tool
                    export = "E",
                    -- Set the value to a certain number (done by just entering numbers)
                    set_value = "c",
                    -- Toggle transparency
                    transparency = "T",
                    -- Choose the background (for transparent colors)
                    choose_background = "B",
                },
            }
        end,

        config = function(_, opts)
            require("colortils").setup(opts)
        end,
    },
}

-- End of File

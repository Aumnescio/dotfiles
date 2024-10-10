-- File:                `nvim/lua/plugins/neorg.lua`
-- Purpose:             `lazy.nvim` Plugin Specification    ( Neorg )

-- NOTE: The concealer at least used to be relatively broken, and did not start up properly if Neorg was lazy-loaded.
-- NOTE: Neorg has often had issues with very large startup times. (Hopefully latest versions properly configured are okay'ish.)

return {
    {   -- Neorg | Knowledge management and organization.
        "nvim-neorg/neorg",
        enabled = true,
        lazy = true,
        version = "*",

        -- Filetype lazy-loading does not work great with Neorg.
        -- - Neorg sometimes fails to activate concealer properly when lazy-loaded with this.
        ft = "norg",

        cmd = {
            "Neorg",
        },

        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },

        -- |> Old config which almost certainly will not work with latest version.
        opts = {
            load = {
                -- `defaults`: Loads default behaviour.
                ["core.defaults"] = {},

                -- Attempting to load the basic exporting functionality.
                ["core.export"] = {},

                -- `concealer`: Adds pretty icons to your documents.    ( TODO: Config this to work with new Neorg. )
                ["core.concealer"] = {
                    config = {
                        -- NOTE: `diamond` is the best preset.
                        --  - This overwrites custom icons, so can't use this.
                        -- icon_preset = "diamond",     -- `basic` | `diamond` | `varied`

                        -- `icons`: STATE: Fine?.
                        icons = {
                            -- `heading`: STATE: Fine?.
                            heading = {
                                -- `icons`: This sets the conceal icons used for Headings.
                                --  - NOTE: It works like this now, in latest version of `main`.
                                --  - Icons Options: `⟐ `, ` `, `󰺕 `, `󱥸 `, `◈`, `⟁ `, `⯈`
                                icons = {
                                    " ",
                                    "󰺕 ",
                                    "󱥸 ",
                                    "◈",
                                    "⟐ ",
                                    "⯈",
                                },
                            },  -- `heading`

                            -- `code_block`: STATE: No idea / TODO.
                            code_block = {
                                conceal = true,
                            },

                        },  -- `icons`

                        -- No idea if this does anything. Also not quite sure if this is correct location, should be though.
                        --  - NOTE: There is a very decent likelyhood that this is better to disable when using `nvim-ufo`.
                        folds = false,
                        init_open_folds = "never",
                    },  -- `config`
                },  -- `core.concealer`

                ["core.dirman"] = {      -- Manages Neorg workspaces.
                    config = {
                        workspaces = {
                            vault = "~/Secondbrain/Vault",
                        },
                        default_workspace = "vault"
                    },
                },  -- End `core.dirman`
            }
        },

        config = function(_, opts)
            local neorg = require("neorg")
            neorg.setup(opts)
        end,
    },
}

-- End of File

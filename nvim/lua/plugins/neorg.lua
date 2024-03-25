-- File:                `nvim/lua/plugins/neorg.lua`
-- Purpose:             `lazy.nvim` Plugin Specification    ( Neorg )

-- NOTE: This plugin has *extremely* bad startup performance.
--  - Loading the plugin takes 150ms to 1000ms.      ( Which is 3 to 40 times the base startup time. )
--  - Recent version are even worse. The startup time doubled in v4.5.0.    ( In my current config, not so much in a minimal config. )

-- NOTE: The concealer is also relatively broken, and does not start up properly if this is lazy-loaded.

-- STATE: Problems with Neorg itself, but this config should be mostly okay.
-- Some things are still WIP, like the completion module.
--  - But if I use the completion module, the startuptime will increase even more.

-- This is a dummy command which can be used as an event to lazy-load Neorg.
-- vim.api.nvim_create_user_command("StartNeorg", '', {})

return {
    {   -- Knowledge management and organization.
        --  - Tested some versions, and I think the startup time is around 500 ms for all versions from 3.0.0 to 4.4.1, but 4.5.0+ doubles that startuptime.
        --  - NOTE: Posted issue in the github about this: "https://github.com/nvim-neorg/neorg/issues/898"
        --  - But, there is something hidden and weird going on, since in a
        --    very minimal setup, the startup time is noticeably better,
        --    even if still not very good.
        "nvim-neorg/neorg",
        enabled = true,
        lazy = true,

        -- Commonly issues with versions and Neorg's stability.
        version = "7.0.0",

        -- Filetype lazy-loading does not work great with Neorg.
        -- Neorg fails to activate concealer properly when lazy-loaded with this.
        ft = "norg",

        cmd = {
            "Neorg",
        },

        build = ":Neorg sync-parsers",

        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },

        opts = {
            load = {
                -- `defaults`: Loads default behaviour.
                [ "core.defaults" ] = {},

                -- TODO: Configure code-block conceal.

                -- `concealer`: Adds pretty icons to your documents.    ( TODO: Config this to work with new Neorg. )
                [ "core.concealer" ] = {
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
                            },  -- `code_block`
                        },  -- `icons`
                    },  -- `config`
                },  -- `core.concealer`

                [ "core.dirman" ] = {      -- Manages Neorg workspaces.
                    config = {
                        workspaces = {
                            vault = "~/Secondbrain/Vault",
                        },
                        default_workspace = "vault"
                    },
                },  -- End `core.dirman`
            },
        },

        config = function(_, opts)
            local neorg = require("neorg")

            -- |> Setup, and config icons after. (TODO'ish)
            neorg.setup(opts)
        end,
    },
}

-- End of File

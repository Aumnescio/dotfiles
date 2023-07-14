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

        -- Right now using the 4.4.1 version performs much better than the later versions.
        --  - But the concealer performance is better on the latest `main`.
        version = false,

        -- Filetype lazy-loading does not work great with Neorg.
        -- Neorg fails to activate concealer properly when lazy-loaded with this.
        ft = "norg",

        cmd = {
            "Neorg",
        },

        build = ":Neorg sync-parsers",

        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "lukas-reineke/headlines.nvim",             -- Bit rough load-time, but I do like it.
                dependencies = {
                    "nvim-treesitter/nvim-treesitter",      -- This way, treesitter should load first, and there should be no problems.
                },
            },
        },

        opts = {
            load = {
                -- `defaults`: Loads default behaviour.
                [ "core.defaults" ] = {},

                -- `concealer`: Adds pretty icons to your documents.    ( TODO: Config this to work with new Neorg. )
                [ "core.concealer" ] = {
                    config = {
                        -- NOTE: `diamond` is the best preset.
                        --  - This overwrites custom icons, so can't use this.
                        -- icon_preset = "diamond",     -- `basic` | `diamond` | `varied`

                        -- `icons`: STATE: TODO.
                        icons = {
                            -- `heading`: STATE: TODO.
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

                                -- level_1 = {
                                --     enabled = true,
                                --     highlight = "@neorg.headings.1.prefix",
                                --     icon = " ",        -- Options: `⟐ `, ` `, `󰺕 `, `󱥸 `, `◈`, `⟁ `, `⯈`
                                --     query = "[ (heading1_prefix) (link_target_heading1) @no-conceal ] @icon",
                                -- },
                                --
                                -- level_2 = {
                                --     enabled = true,
                                --     highlight = "@neorg.headings.2.prefix",
                                --     icon = " 󰺕 ",
                                --     query = "[ (heading2_prefix) (link_target_heading2) @no-conceal ] @icon",
                                -- },
                                --
                                -- level_3 = {
                                --     enabled = true,
                                --     highlight = "@neorg.headings.3.prefix",
                                --     icon = "  󱥸 ",
                                --     query = "[ (heading3_prefix) (link_target_heading3) @no-conceal ] @icon",
                                -- },
                                --
                                -- level_4 = {
                                --     enabled = true,
                                --     highlight = "@neorg.headings.4.prefix",
                                --     icon = "   ◈",
                                --     query = "[ (heading4_prefix) (link_target_heading4) @no-conceal ] @icon",
                                -- },
                                --
                                -- level_5 = {
                                --     enabled = true,
                                --     highlight = "@neorg.headings.5.prefix",
                                --     icon = "    ⟐ ",
                                --     query = "[ (heading5_prefix) (link_target_heading5) @no-conceal ] @icon",
                                -- },
                                --
                                -- level_6 = {
                                --     enabled = true,
                                --     highlight = "@neorg.headings.6.prefix",
                                --     icon = "     ⯈",
                                --     query = "[ (heading6_prefix) (link_target_heading6) @no-conceal ] @icon",
                                -- },
                            },  -- `heading`
                        },  -- `icons`
                    },  -- `config`
                },  -- `core.concealer`

                -- [ "core.concealer" ] = {        -- Adds pretty icons to your documents.
                --     config = {
                --
                --         -- NOTE: `diamond` is the best preset, but need to disable preset to use custom icons.
                --         -- icon_preset = "diamond",     -- `basic` | `diamond` | `varied`
                --
                --         icons = {
                --             definition = {              -- TODO: Make sure the icons work as they should. Customize better ones.
                --                 enabled = true,
                --                 multi_prefix = {
                --                     enabled = true,
                --                     icon = "⋙ ",
                --                     query = "(multi_definition_prefix) @icon",
                --                 },
                --                 multi_suffix = {
                --                     enabled = true,
                --                     icon = "⋘ ",
                --                     query = "(multi_definition_suffix) @icon",
                --                 },
                --                 single = {
                --                     enabled = true,
                --                     icon = "≡",
                --                     query = "[ (single_definition_prefix) (link_target_definition) @no-conceal ] @icon",
                --                 },
                --             },
                --
                --             delimiter = {               -- TODO: Make sure the icons work as they should. Customize better ones.
                --                 enabled = true,
                --                 horizontal_line = {
                --                     enabled = true,
                --                     highlight = "@neorg.delimiters.horizontal_line",
                --                     icon = "─",
                --                     query = "(horizontal_line) @icon",
                --                 },
                --                 strong = {
                --                     enabled = true,
                --                     highlight = "@neorg.delimiters.strong",
                --                     icon = "⟪",
                --                     query = "(strong_paragraph_delimiter) @icon",
                --                 },
                --                 weak = {
                --                     enabled = true,
                --                     highlight = "@neorg.delimiters.weak",
                --                     icon = "⟨",
                --                     query = "(weak_paragraph_delimiter) @icon",
                --                 },
                --             },
                --
                --             footnote = {                -- TODO: Make sure the icons work as they should. Customize better ones.
                --                 enabled = true,
                --                 multi_prefix = {
                --                     enabled = true,
                --                     icon = "⁑",
                --                     query = "(multi_footnote_prefix) @icon",
                --                 },
                --                 multi_suffix = {
                --                     enabled = true,
                --                     icon = "⁑",
                --                     query = "(multi_footnote_suffix) @icon",
                --                 },
                --                 single = {
                --                     enabled = true,
                --                     icon = "⁎",
                --                     query = "[ (single_footnote_prefix) (link_target_footnote) @no-conceal ] @icon",
                --                 },
                --             },
                --
                --             heading = {                 -- STATE: Okay.
                --                 enabled = true,
                --                 level_1 = {
                --                     enabled = true,
                --                     highlight = "@neorg.headings.1.prefix",
                --                     icon = " ",        -- Options: `⟐ `, ` `, `󰺕 `, `󱥸 `, `◈`, `⟁ `, `⯈`
                --                     query = "[ (heading1_prefix) (link_target_heading1) @no-conceal ] @icon",
                --                 },
                --                 level_2 = {
                --                     enabled = true,
                --                     highlight = "@neorg.headings.2.prefix",
                --                     icon = " 󰺕 ",
                --                     query = "[ (heading2_prefix) (link_target_heading2) @no-conceal ] @icon",
                --                 },
                --                 level_3 = {
                --                     enabled = true,
                --                     highlight = "@neorg.headings.3.prefix",
                --                     icon = "  󱥸 ",
                --                     query = "[ (heading3_prefix) (link_target_heading3) @no-conceal ] @icon",
                --                 },
                --                 level_4 = {
                --                     enabled = true,
                --                     highlight = "@neorg.headings.4.prefix",
                --                     icon = "   ◈",
                --                     query = "[ (heading4_prefix) (link_target_heading4) @no-conceal ] @icon",
                --                 },
                --                 level_5 = {
                --                     enabled = true,
                --                     highlight = "@neorg.headings.5.prefix",
                --                     icon = "    ⟐ ",
                --                     query = "[ (heading5_prefix) (link_target_heading5) @no-conceal ] @icon",
                --                 },
                --                     level_6 = {
                --                     enabled = true,
                --                     highlight = "@neorg.headings.6.prefix",
                --                     icon = "     ⯈",
                --                     query = "[ (heading6_prefix) (link_target_heading6) @no-conceal ] @icon",
                --                 },
                --             },
                --
                --             list = {                    -- STATE: Okay.     ( Could be more unique and custom. )
                --                 enabled = true,
                --                 level_1 = {
                --                     enabled = true,
                --                     icon = "•",
                --                     query = "(unordered_list1_prefix) @icon",
                --                 },
                --                 level_2 = {
                --                     enabled = true,
                --                     icon = " •",
                --                     query = "(unordered_list2_prefix) @icon",
                --                 },
                --                 level_3 = {
                --                     enabled = true,
                --                     icon = "  •",
                --                     query = "(unordered_list3_prefix) @icon",
                --                 },
                --                 level_4 = {
                --                     enabled = true,
                --                     icon = "   •",
                --                     query = "(unordered_list4_prefix) @icon",
                --                 },
                --                 level_5 = {
                --                     enabled = true,
                --                     icon = "    •",
                --                     query = "(unordered_list5_prefix) @icon",
                --                 },
                --                 level_6 = {
                --                     enabled = true,
                --                     icon = "     •",
                --                     query = "(unordered_list6_prefix) @icon",
                --                 },
                --             },
                --
                --             markup = {
                --                 enabled = true,
                --                 spoiler = {
                --                     enabled = true,
                --                     highlight = "@neorg.markup.spoiler",
                --                     icon = "•",
                --                     query = '(spoiler ("_open") _ @icon ("_close"))',
                --                 },
                --             },
                --
                --             quote = {
                --                 enabled = true,
                --                 level_1 = {
                --                     enabled = true,
                --                     highlight = "@neorg.quotes.1.prefix",
                --                     icon = "│",
                --                     query = "(quote1_prefix) @icon",
                --                 },
                --                 level_2 = {
                --                     enabled = true,
                --                     highlight = "@neorg.quotes.2.prefix",
                --                     icon = "│",
                --                     query = "(quote2_prefix) @icon",
                --                 },
                --                 level_3 = {
                --                     enabled = true,
                --                     highlight = "@neorg.quotes.3.prefix",
                --                     icon = "│",
                --                     query = "(quote3_prefix) @icon",
                --                 },
                --                     level_4 = {
                --                     enabled = true,
                --                     highlight = "@neorg.quotes.4.prefix",
                --                     icon = "│",
                --                     query = "(quote4_prefix) @icon",
                --                 },
                --                 level_5 = {
                --                     enabled = true,
                --                     highlight = "@neorg.quotes.5.prefix",
                --                     icon = "│",
                --                     query = "(quote5_prefix) @icon",
                --                 },
                --                 level_6 = {
                --                     enabled = true,
                --                     highlight = "@neorg.quotes.6.prefix",
                --                     icon = "│",
                --                     query = "(quote6_prefix) @icon",
                --                 },
                --             },
                --
                --             todo = {                    -- STATE: Most of them are good, some could be better.
                --                 enabled = true,
                --                 undone = {
                --                     enabled = true,
                --                     icon = "−",         -- Options: `֎ `, `¤`, `⊟`, ``, `−`.
                --                     query = "(todo_item_undone) @icon",
                --                 },
                --                 urgent = {
                --                     enabled = true,
                --                     icon = "",         -- Options: ` `, ` `, `⚠`, ``.
                --                     query = "(todo_item_urgent) @icon",
                --                 },
                --                 done = {
                --                     enabled = true,
                --                     icon = "✓",         -- Options: `✓`.
                --                     query = "(todo_item_done) @icon",
                --                 },
                --                 uncertain = {
                --                     enabled = true,
                --                     icon = "",         -- Options: `⯑ `, ` `, ``.
                --                     query = "(todo_item_uncertain) @icon",
                --                 },
                --                 pending = {
                --                     enabled = true,
                --                     icon = "",         -- Options: ``, ``.
                --                     query = "(todo_item_pending) @icon",
                --                 },
                --                 on_hold = {
                --                     enabled = true,
                --                     icon = "",
                --                     query = "(todo_item_on_hold) @icon",
                --                 },
                --                 cancelled = {
                --                     enabled = true,
                --                     icon = "",         -- Options: ``, ``, `󰩺`, ``.
                --                     query = "(todo_item_cancelled) @icon",
                --                 },
                --                 recurring = {
                --                     enabled = true,
                --                     icon = "↺",
                --                     query = "(todo_item_recurring) @icon",
                --                 },
                --             },
                --         },
                --
                --         -- TODO: Report this problem as issue.
                --         -- The todo marker's ("(x)", etc) conceal character is offset in the foldtext.
                --         --  - "(X) Heading Name" becomes:
                --         --  - "( ) HeaXding Name" when folded.
                --         folds = false,              -- Disabling this solves some visual issues related to folds.
                --         dim_code_blocks = {
                --             enabled = true,
                --             content_only = true,
                --             conceal = true,
                --             adaptive = false,
                --             padding = {
                --                 left = 2,
                --                 right = 4,
                --             },
                --             width = "fullwidth",    -- `fullwidth` | `content`
                --         },
                --     },
                -- },  -- End `core.concealer`

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

            -- |> Setup, and config icons after.
            neorg.setup(opts)

            -- `ordered list icons` config for Neorg.

            -- Fetch the concealer config table for modification.
            -- local neorg_ordered_config = neorg.modules.get_module_config("core.concealer").icons.ordered
            -- local ordered_concealer_module = neorg.modules.get_module("core.concealer").concealing.ordered
            --
            -- -- Set `ordered.level_<n>.icon` functions.
            -- neorg_ordered_config.level_1.icon = ordered_concealer_module.punctuation.unicode_dot(ordered_concealer_module.enumerator.numeric)
            -- neorg_ordered_config.level_2.icon = ordered_concealer_module.enumerator.latin_lowercase
            -- neorg_ordered_config.level_3.icon = ordered_concealer_module.punctuation.unicode_dot(ordered_concealer_module.enumerator.numeric)
            -- neorg_ordered_config.level_4.icon = ordered_concealer_module.enumerator.latin_lowercase
            -- neorg_ordered_config.level_5.icon = ordered_concealer_module.punctuation.unicode_dot(ordered_concealer_module.enumerator.numeric)
            -- neorg_ordered_config.level_6.icon = ordered_concealer_module.enumerator.latin_lowercase
        end,
    },
}

-- End of File

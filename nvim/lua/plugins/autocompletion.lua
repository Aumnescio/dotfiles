-- File:                `nvim/lua/plugins/autocompletion.lua`
-- Purpose:             `lazy.nvim` Plugin Specification    ( Autocompletion )

-- ToC
-- `LuaSnip`
-- `nvim-cmp`
-- `nvim-cmp` sources
-- `codeium`

vim.api.nvim_create_user_command("CodeiumActivate", 'echo "Setting up `Codeium AI`."', {})

return {
    {   -- Snippet Support                              ( STATE: Very Good )
        -- Just a bit bad startup time.
        "L3MON4D3/LuaSnip",
        lazy = true,
        version = "v2.1.0",            -- Releases are rare.

        event = {
            "InsertEnter",
            "CmdlineEnter",
        },

        opts = function()
            local node_type = require("luasnip.util.types")

            return {
                history = true,                 -- Had some issues with too long history, but that is being handled in a `autocmd`.
                enable_autosnippets = true,     -- I suspect I like this.

                -- NOTE: A single character wrong in this string makes it fail, like a space after comma.
                update_events       = "TextChanged,TextChangedI",   -- Without this, the repeat nodes are really clunky.
                delete_check_events = "TextChanged,InsertLeave",
                -- region_check_events = "CursorMoved,CursorMovedI",    -- Might cause lag.

                ext_opts = {
                    [node_type.insertNode] = {
                        active = {},
                        visited = {},
                        passive = {},
                        snippet_passive = {},
                    },
                    [node_type.choiceNode] = {
                        active = {
                            virt_text = {
                                {
                                    "<- ChoiceNode 󱈅 ",
                                    "AumLuaSnipChoiceNodeVirtualText",
                                },
                            },
                        },
                        unvisited = {},
                    },
                    [node_type.snippet] = {
                        passive = {},
                    },
                },
            }
        end,

        config = function(_, opts)
            require("luasnip").setup(opts)
            -- Snipmate snippets are working. (I will use these snippets for simple snippets.)
            require("luasnip.loaders.from_snipmate").load({ paths = { "./snippets" } })
            -- Lua snippets are working when created in a file and fetched. (I will use these snippets for more complicated things.)
            require("luasnip.loaders.from_lua").load({ paths = { "./snippets" } })

            -- |> LuaSnip `add_snippets` function is not working.
            --  - NOTE: It's deprecated I suppose, maybe something to explore, but not too relevant right now.
            -- require("luasnip/snippets")

            -- |> Testing if this works here:
            -- LuaSnip Snippet History Fix (Seems to work really well, I think.)
            local luasnip_fix_augroup = vim.api.nvim_create_augroup("MyLuaSnipHistory", { clear = true })
            vim.api.nvim_create_autocmd("ModeChanged", {
                pattern = '*',
                callback = function()
                    if ((vim.v.event.old_mode == 's' and vim.v.event.new_mode == 'n') or vim.v.event.old_mode == 'i')
                        and require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()]
                        and not require('luasnip').session.jump_active
                    then
                        require('luasnip').unlink_current()
                    end
                end,
                group = luasnip_fix_augroup
            })
        end,
    },

    {   -- `nvim-cmp`: Autocompletion                   ( STATE: Good )
        -- "hrsh7th/nvim-cmp",      -- Original
        "yioneko/nvim-cmp",         -- Performance fork
        -- enabled = false,
        branch = "perf",
        commit = "6c3d595f3223c1ae7392d4fde1626355439af6c1",
        lazy = true,
        -- version = false,        -- `nvim-cmp` does not release often, so fetch from master should be good.

        event = {
            "InsertEnter",
            "CmdlineEnter",
        },

        dependencies = {
            "L3MON4D3/LuaSnip",
            {   -- Completion Icons                     ( STATE: Good )
                "onsails/lspkind-nvim",
                -- NOTE: The config for this is inside the `nvim-cmp` `formatting` section.
            },
            -- `nvim-cmp` completion sources:
            "hrsh7th/cmp-nvim-lsp",                     -- ( STATE: Good )
            -- "hrsh7th/cmp-nvim-lua",                  -- ( STATE: Okay, not sure if useful when using `neodev.nvim`. )
            "hrsh7th/cmp-cmdline",                      -- ( STATE: Fine, could be better. )
            -- "FelipeLema/cmp-async-path",             -- ( STATE: Generally good, but erroring right now. )
            "hrsh7th/cmp-path",                         -- ( STATE: Good )
            "saadparwaiz1/cmp_luasnip",                 -- ( STATE: Very Good )

            -- |> I fixed autocompletion issues with this source.
            "Aumnescio/cmp-luasnip-choice",                -- ( STATE: Good )
            -- "doxnit/cmp-luasnip-choice",                -- ( STATE: Issues )
            -- "L3MON4D3/cmp-luasnip-choice",              -- ( STATE: Issues )

            "nvim-telescope/telescope-fzf-native.nvim", -- ( STATE: Good )
            "tzachar/fuzzy.nvim",                       -- ( STATE: Good )
            "tzachar/cmp-fuzzy-buffer",                 -- ( STATE: Very Good )
        },

        opts = function()
            local cmp = require("cmp")
            local cmp_compare = require("cmp.config.compare")
            local lspkind = require("lspkind")
            local cmpkind = cmp.lsp.CompletionItemKind
            local luasnip = require("luasnip")

            -- |> CUSTOM <CR> FUNCTIONS - START
            local function get_indent_level()
                local line_text = vim.api.nvim_get_current_line()
                local stripped = string.gsub(line_text, "^%s+", "")
                local indent_level = string.len(line_text) - string.len(stripped)
                return indent_level
            end

            local function UberEnter()
                local pairs_dict = {
                    ["("] = ")",
                    ["{"] = "}",
                    ["["] = "]",
                    ["<"] = ">",
                    [">"] = "<",    -- HTML Tags    (Testing)
                }

                local row, col = unpack(vim.api.nvim_win_get_cursor(0))
                local line_text = vim.api.nvim_get_current_line()
                local left_char = string.sub(line_text, col, col)
                local right_char = string.sub(line_text, col + 1, col + 1)

                -- What I want to do: Indent on next line when cursor like this: `>|`
                -- left_char == ">"
                -- - Hard xd.

                if pairs_dict[left_char] == right_char then  -- New Line with Indent
                    local bufnr = vim.api.nvim_get_current_buf()
                    local contents_left = string.sub(line_text, 0, col)
                    local contents_right = string.sub(line_text, col + 1, -1)
                    local indent_level = get_indent_level()

                    vim.api.nvim_buf_set_lines(bufnr, row - 1,  row, false, { contents_left })
                    vim.api.nvim_buf_set_lines(bufnr, row,      row, false, { string.rep(" ", indent_level) .. contents_right })
                    vim.api.nvim_buf_set_lines(bufnr, row,      row, false, { string.rep(" ", indent_level + 4) })
                    vim.api.nvim_win_set_cursor(0, { row + 1, indent_level + 4 })
                else  -- Normal New Line
                    vim.api.nvim_input("<NL>")      -- New Line     ( Return / Enter / <CR> )
                end
            end
            -- |> CUSTOM <CR> FUNCTIONS - END

            return {
                enabled = function()
                    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
                    return true
                end,  -- Disables completion in Telescope.

                -- `performance`: Low values feel good. Half of these feel like they do not work at all.
                performance = {  -- STATE: Very good.
                    -- `debounce`: Delays updating the `nvim-cmp` `Completion Popup Menu` by `debounce` milliseconds.
                    --  - The fetching/filling/adding of most sources' contents to the `Completion Popup Menu` is also delayed by `debounce` milliseconds.
                    --  - Very low values cause very noticeably flickering.   (0-20)
                    --  - Larger values will noticeably delay getting completions from most sources.
                    --  - There is absolutely no benefit to a very large value. It does not improve input lag.
                    debounce = 18,               -- Low Value (20-50) = Probably Good   ( `26`'ish seems to work best for me. )

                    -- `throttle`:
                    --  - Delays the closing of the `nvim-cmp` `Completion Popup Menu` by `throttle` milliseconds.
                    --  - Increases duration of updating completion results when deleting characters. ( backspacing )
                    --  - Does not seem to affect initial activation duration.
                    --  - Does not seem to affect forwards completion updates.  ( At least not much. )
                    --  - Increased a bit to fight flickering.
                    --  - There is absolutely no benefit to a very large value. It does not improve input lag.
                    throttle = 24,               -- Low Value (6-64) = Probably Good    ( `48`'ish seems to work best for me. )

                    -- `fetching_timeout`: Not sure what this is supposed to.
                    --  - I'd think it might discard slow results, but it doesn't seem to be doing that.
                    --  - Feels horribly irrelevant.
                    fetching_timeout = 80,     -- Was 200 earlier. Testing lower value.

                    -- `async_budget`: I'm not quite sure how this affects things, what the default value is, or what good values might be.
                    --  - Just arbitrarily/randomly selected 50, so testing how that'll work.
                    --  - Feels horribly irrelevant.
                    async_budget = 12,          -- `50ms` seems like quite a lot, not sure what value good here. Don't even know what the default value is.

                    -- No idea about this really.
                    --  - Feels horribly irrelevant.
                    confirm_resolve_timeout = 80,

                    -- I feel like 200 might be default. Could maybe use a lower value?
                    --  - I wonder how this affects performance?
                    --  - From most sources, most of the time, only like the top 5 to 16 entries are really relevant.
                    --  - But sometimes it is nice to have more entries when exploring fields and such.
                    --  - Does not seem to help performance really. (Tailwind)
                    max_view_entries = 32,      -- Maximum count of total completion entries to show in the completion popup.
                },

                -- Disabled because of a bug with preselection: It skipped over snippets.
                preselect = cmp.PreselectMode.None,  -- Disables automatic preselection of the first item in the menu.
                -- NOTE: `<CR>` still forces `select = true`, so it can be used to complete the first entry even without preselect.

                -- Snippet support. (Very good, I think.)
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)    -- For LuaSnip.
                    end,
                },

                completion = {
                    -- autocomplete = false,                        -- if `false`, autocompletion popup needs to be manually activated.
                    -- autocomplete = cmp.triggerEvent,             -- Don't know how to use this.

                    -- NOTE: Individual `keyword_length` can be set for each completion source in the `sources` section below.
                    keyword_length = 1,                             -- Show completion after a single character by default.
                    completeopt = "menu,menuone,preview,noselect",  -- These work.
                },

                matching = {
                    -- `Partial Matching`:          Enabled => Good     ( Basically required )
                    disallow_partial_matching       = false,    -- `false`: Allow matching `trosihi` | `sihi` to `TroubleSignHint`. Very useful.

                    -- `Prefix Unmatching`:         Enabled => Good     ( Basically required )
                    disallow_prefix_unmatching      = false,    -- `false`: Allow matching `cmd` to `nvim_cmd`. Very useful.

                    -- `Fuzzy Matching`:            Enabled => Good     ( Basically required )
                    disallow_fuzzy_matching         = false,    -- `false`: Allow matching `comion` to `completion`.

                    -- These two probably require `disallow_fuzzy_matching = false` to do anything.
                    --  - Disallowing these reduces a good chunk of crap completions, but also loses some good matches like `blue8` to `--blue-008`.
                    disallow_fullfuzzy_matching     = false,    -- Not sure what this is supposed to do. Not noticing any difference.

                    -- `Partial Fuzzy Matchin`:     Enabled => Good
                    disallow_partial_fuzzy_matching = false,    -- `false`: Allow matching `sugcryl` to `sugar_crystal`. ( `l` not connected to `y` => partial )
                },

                window = {
                    completion = {
                        border = "rounded",
                        winhighlight = "Normal:CmpNormal,FloatBorder:CmpFloatBorder,Pmenu:CmpPmenu,CursorLine:CmpCursorLine,Search:CmpSearch",  -- STATE: Good
                        col_offset = 0,
                        side_padding = 0,
                        width = 24,
                        height = 12,
                        max_width = 52,
                        max_height = 16,
                    },
                    documentation = {
                        border = "rounded",
                        winhighlight = "Normal:CmpDocNormal,FloatBorder:CmpDocFloatBorder,Pmenu:CmpDocPmenu,CursorLine:CmpDocCursorLineSearch,Search:CmpDocSearch,Comment:CmpDocComment",
                        col_offset = 0,
                        side_padding = 0,
                        max_width = 80,
                        max_height = 32,
                    }
                },

                experimental = {
                    -- Using `ghost_text` is mostly fine. ( The highlight color I'm using is very dim. )
                    --  - If `ghost_text` color is too visible or similar to normal text, it can be really annoying.
                    --  - But ghost text is another thing that will flicker, if you experience flicker with `nvim-cmp`.
                    -- ghost_text = { hl_group = "AumCmpGhostText" }
                    ghost_text = false
                },

                -- Not sure if I need to swap to this new syntax at some point... (Kinda hope not because my stuff is working very well right now.)
                -- mapping = cmp.mapping.preset.insert({})

                mapping = {
                    -- `Select Next Item` if autocompletion popup is open, otherwise jump tabstops if available, otherwise indent.
                    ["<Tab>"] = cmp.mapping({
                        c = function()
                            if cmp.visible() then
                                cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                            else
                                cmp.complete()
                            end
                        end,
                        i = function(fallback)
                            -- if luasnip.choice_active() then
                            --     luasnip.change_choice(1)    -- Next choice.
                            if cmp.visible() then
                                cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                            elseif luasnip.in_snippet() and luasnip.expand_or_jumpable() then
                                luasnip.expand_or_jump()
                            else
                                fallback()
                            end
                        end,
                        s = function(fallback)
                            if luasnip.in_snippet() and luasnip.expand_or_jumpable() then
                                luasnip.expand_or_jump()
                            else
                                fallback()
                            end
                        end,
                    }),
                    -- `Select Previous Item` if autocompletion popup is open, otherwise jump tabstops if available, else unindent.
                    ["<S-Tab>"] = cmp.mapping({
                        c = function()
                            if cmp.visible() then
                                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                            else
                                cmp.complete()
                            end
                        end,
                        i = function(fallback)
                            -- if luasnip.choice_active() then
                            --     luasnip.change_choice(-1)    -- Previous choice.
                            if cmp.visible() then
                                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                            elseif luasnip.in_snippet() and luasnip.jumpable(-1) then
                                luasnip.jump(-1)
                            else
                                fallback()
                            end
                        end,
                        s = function(fallback)
                            if luasnip.in_snippet() and luasnip.jumpable(-1) then
                                luasnip.jump(-1)
                            else
                                fallback()
                            end
                        end,
                    }),
                    -- Alternative `Select Next Item`
                    ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }), { "i" }), -- Alternative `Select Previous Item`
                    ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }), { "i" }), -- Alternative `Select Next Item`
                    ["<C-n>"] = cmp.mapping({
                        c = function()
                            if cmp.visible() then
                                cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                            else
                                vim.api.nvim_feedkeys(repterm('<Down>'), 'n', true)
                            end
                        end,
                        i = function(fallback)
                            if cmp.visible() then
                                cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                            else
                                fallback()
                            end
                        end
                    }),
                    -- Alternative `Select Previous Item`
                    ["<C-p>"] = cmp.mapping({
                        c = function()
                            if cmp.visible() then
                                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                            else
                                vim.api.nvim_feedkeys(repterm('<Up>'), 'n', true)
                            end
                        end,
                        i = function(fallback)
                            if cmp.visible() then
                                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                            else
                                fallback()
                            end
                        end
                    }),
                    -- Scrolling documentation. (Maybe TODO/WIP)
                    ["<C-x>"] = cmp.mapping(cmp.mapping.scroll_docs(-2), {'i', 'c'}),
                    ["<C-m>"] = cmp.mapping(cmp.mapping.scroll_docs(2), {'i', 'c'}),
                    -- Force `Tabstop Jump Forward`
                    --  - NOTE: Matches the Insert-Mode `Move Cursor Forward` binding,
                    --          but overwrites the behaviour in snippets.
                    ["<C-e>"] = cmp.mapping({
                        i = function(fallback)
                            if luasnip.in_snippet() and luasnip.jumpable(1) then
                                luasnip.jump(1)
                            else
                                fallback()
                            end
                        end,
                        s = function(fallback)
                            if luasnip.in_snippet() and luasnip.jumpable(1) then
                                luasnip.jump(1)
                            else
                                fallback()
                            end
                        end,
                    }),
                    -- Force `Tabstop Jump Backward`
                    --  - NOTE: Matches the Insert-Mode `Move Cursor Backward` binding,
                    --          but overwrites the behaviour in snippets.
                    ["<C-q>"] = cmp.mapping({
                        i = function(fallback)
                            if luasnip.in_snippet() and luasnip.jumpable(-1) then
                                luasnip.jump(-1)
                            else
                                fallback()
                            end
                        end,
                        s = function(fallback)
                            if luasnip.in_snippet() and luasnip.jumpable(-1) then
                                luasnip.jump(-1)
                            else
                                fallback()
                            end
                        end,
                    }),
                    -- |> Force Open Autocompletion Popup Menu
                    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
                    -- |> Force Close Autocompletion Popup Menu     ( Semantics: `<C-h>` => `Hide`)
                    ["<C-h>"] = cmp.mapping({
                        -- NOTE: Tried changing the layout of these into
                        -- `cmp.mapping.abort(), {'i', 'c'})`, but that errored.
                        i = cmp.mapping.abort(),
                        s = cmp.mapping.abort(),
                        c = cmp.mapping.close(),
                    }),
                    -- |> Accept completion (also expand snippets), and do smart indenting when using <CR> (Enter).
                    ["<CR>"] = cmp.mapping({
                        -- Arg `fallback` optional.
                        i = function()
                            if cmp.visible() then
                                cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })
                            else
                                -- fallback()
                                UberEnter()
                            end
                        end,
                        c = function(fallback)
                            if cmp.visible() then
                                cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })
                            else
                                fallback()
                            end
                        end
                    }),
                },

                -- Completion popup formatting.
                formatting = {
                    format = lspkind.cmp_format({
                        -- Ex: "<> Snippet"
                        mode = 'symbol_text',

                        -- Add completion source information.
                        -- Ex: "<> Snippet `[Luasnip]`"
                        menu = ({
                            luasnip                     = "[LuaSnip]",
                            luasnip_choice              = "[SnipChoice]",
                            nvim_lsp                    = "[LSP]",
                            -- nvim_lua                    = "[NvimLua]",       -- Disabled, in favor of `neodev.nvim`.
                            -- nvim_lsp_signature_help     = "[SigHelp]",       -- Disabled, in favor of the Native LSP Sig-Help binding.
                            path                        = "[Path]",
                            async_path                  = "[AsyncPath]",
                            crates                      = "[Crates]",
                            fuzzy_buffer                = "[FuzBuf]",
                        }),

                        -- Maximum Width of `nvim-cmp` Autocompletion Popup.
                        maxwidth = 52,
                        -- When popup menu exceeds `maxwidth`, the truncated part will show `ellipsis_char` instead. ( `maxwidth` must be defined first. )
                        ellipsis_char = '...',

                        symbol_map = {
                            -- NOTE:    As of 01.06.2023, none of these are broken with a non-3.0+ Nerd Font,
                            --          and Kitty's `symbol_map`.
                            Text = "󰉿",
                            Method = "󰆧",
                            Function = "󰊕",
                            Constructor = "",
                            Field = "󰜢",
                            Variable = "󰀫",
                            Class = "󰠱",
                            Interface = "",
                            Module = "",
                            Property = "󰜢",
                            Unit = "󰑭",
                            Value = "⊳",
                            Enum = "",
                            Keyword = "󰌋",
                            Snippet = "",
                            Color = "󰏘",
                            File = "󰈙",
                            Reference = "󰈇",
                            Folder = "󰉋",
                            EnumMember = "",
                            Constant = "󰏿",
                            Struct = "󰙅",
                            Event = "",
                            Operator = "󰆕",
                            TypeParameter = "፨",
                        },

                        -- |> NOTE: This could be used to add more custom styling to the completions entries.
                        -- before = function (entry, vim_item)
                        --     -- The below line needs [Tailwind-Colorizer](https://github.com/roobert/tailwindcss-colorizer-cmp.nvim).
                        --     -- vim_item = require('tailwindcss-colorizer-cmp').formatter(entry, vim_item)
                        --     return vim_item
                        -- end
                    })
                },

                sorting = {
                    -- STATE: Very good, somewhat WIP.
                    priority_weight = 1,
                    -- The higher up in the list a comparator is, the more
                    -- priority is given for that type of completion in the sorting.
                    comparators = {
                        -- No idea what this is.
                        --  - Presumably want this quite high.
                        cmp_compare.score,

                        -- Don't quite understand what `offset` is, but noticed benefit when placing it high.
                        --  - Example: When completing `ifee` => Prioritise `if_elseif_else` over `if_else`.
                        --  - Because `if`, `e`, and `e` denote the exact starting sections seperated by the underscores.
                        cmp_compare.offset,

                        -- Value of: `short-length` completion items.
                        --  - Generally shorter completions are more common, so maybe this is fine around the middle.
                        cmp_compare.length,

                        -- `Exact Text Match` (?)
                        --  - Should probably have some effect, but can cause cases where irrelevant completions get 100% priority.
                        --      - Like completing `thing` to `thing`.
                        --  - Example: When completing `var` => Prioritise `var` over `variable`.
                        cmp_compare.exact,

                        -- Prioritise based on `Completion Type`.
                        --  - Maybe `LSP` vs `Snippet` vs `Buffer`, etc, but really no idea.
                        --  - I probably want this to have some effect.
                        cmp_compare.kind,

                        -- Value of: `Exact Order of Input Characters` (?)
                        --  - Somewhat relevant.
                        --  - Very fuzzy matching is less important than more exact matching.
                        cmp_compare.order,

                        -- No idea what this is.
                        --  - Arbitrarily tested, deemed this horrible.
                        cmp_compare.sort_text,

                        -- Sorting based on `Recently Used` status.
                        --  - Fucks with the stability.
                        --  - Don't want this to have effect on sorting.
                        --  - The same input should give the same output every time.
                        -- cmp_compare.recently_used,       -- Commenting this out seems to work fine.
                    }
                },

                -- Testing some new things.
                view = {
                    docs = {
                        auto_open = true,
                    },
                    entries = {
                        follow_cursor = false,
                    },
                },

                -- `nvim-cmp`: Completion Sources   ( STATE: Very Good )
                --  - NOTE: Larger priority value is placed higher in sorting.
                sources = cmp.config.sources({
                    -- LuaSnip: High priority because I want to use snippets often. ( Generally over LSP completion. )
                    --  - Well behaving source.
                    { name = "luasnip", priority = 80, keyword_length = 1, max_item_count = 16, option = { use_show_condition = true, show_autosnippets = false } },

                    -- `luasnip_choice`: High priority, because special case. (Could maybe even have the group_index thing.)
                    --  - Very good after fixing the source code of this source a bit to allow proper autocompletion.
                    { name = "luasnip_choice", priority = 100 },

                    -- Signature Help: Don't really like this.
                    --  - NOTE: Comment out `nvim_lsp_signature_help` if using `Noice.nvim` for signature-help.
                    -- { name = "nvim_lsp_signature_help", priority = 56, keyword_length = 2, max_item_count = 4 },

                    -- LSP Completion: Very good and useful. High'ish priority.
                    --  - Can be quite laggy to update.
                    --  - `Emmet` kind of requires `keyword_length = 1`.
                    --  - The `trigger_characters` is a bit WIP, but might be working okay like this.
                    { name = "nvim_lsp", priority = 79, keyword_length = 1, max_item_count = 24, trigger_characters = { ".", "#", "-" } },

                    -- Neovim Lua Completion: High'ish priority, as it is special-case. Not used a whole lot though.
                    --  - NOTE: There is a very decent chance that `Neodev.nvim` covers everything this used to, and more, so this is no longer required.
                    -- { name = "nvim_lua", priority = 48, keyword_length = 1, max_item_count = 8 },

                    -- File System / Path Completion: Seems to work well. Special Case, so high'ish priority, but might not really need it.
                    { name = "path", priority = 90, max_item_count = 24, option = { trailing_slash = true, label_trailing_slash = true } },

                    -- NOTE: Async version is erroring as of May 26th, 2023.
                    -- { name = "async_path", priority = 52, max_item_count = 24, option = { trailing_slash = true, label_trailing_slash = true } },

                    -- Way better than using 'buffer' source. Fuzzy, more responsive, and less laggy.
                    --  - However, This source can cause flicker relatively easily.
                    --    But it might not, with the correct `nvim-cmp` `performance` settings.
                    {
                        name = "fuzzy_buffer",
                        priority = 32,          -- Maybe still adjusting this.
                        keyword_length = 1,     -- There is some awkwardess related to having this higher than 1, but like 3 can be used.
                        max_item_count = 8,

                        -- `keyword_pattern`: This seems to determine what input text will activate autocompletion.
                        --  - nvim-cmp will only gives completion results from this source when the text before cursor matches this regex.
                        --  - `something` would only give completions when the user types literally `something`.
                        -- keyword_pattern = [[something]],     -- Don't really know how to config this better, and it won't affect search results themselves.

                        option = {
                            -- identifier_pattern = [[something]],
                            -- non_identifier_pattern = [[something]],
                            max_matches = 8,            -- This works
                            max_match_length = 60,      -- This works, not sure if this helps performance at all.
                            max_buffer_lines = 6000,    -- I suspect this works
                            fuzzy_extra_arg = 0,        -- I think this works.
                            -- TODO: Optimize this to get like 2-3 most recent buffers or something.
                            get_bufnrs = function()     -- This works.
                                local bufs = {}
                                for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                                    local buftype = vim.api.nvim_buf_get_option(buf, 'buftype')
                                    if buftype ~= 'nofile' and buftype ~= 'prompt' then
                                        bufs[#bufs + 1] = buf
                                    end
                                end
                                return bufs
                            end,
                        }
                    },

                    -- Rust Crates Completion: Haven't tested much yet.
                    { name = "crates", priority = 42, max_item_count = 16 },
                }),
            } end,

        config = function(_, opts)
            local cmp = require("cmp")

            cmp.setup(opts)

            -- Setup `sources` for `/`.     ( Search )
            cmp.setup.cmdline('/', {
                completion = { autocomplete = false },  -- `true` seems to cause errors... ( And requires manual completion with `<Tab>` )
                sources = cmp.config.sources({
                    { name = "fuzzy_buffer", option = { max_matches = 8, max_match_length = 30, max_buffer_lines = 8000, fuzzy_extra_arg = 1 } },
                })
            })

            -- Use cmdline & path source for ':'.
            cmp.setup.cmdline(':', {
                completion = { autocomplete = false },  -- `true` seems to cause errors... ( And requires manual completion with `<Tab>` )
                sources = cmp.config.sources({
                    { name = "async_path", option = { trailing_slash = true, label_trailing_slash = true } },
                    { name = "cmdline" }
                })
            })
        end,
    },

    {   -- `Language Server` source for `nvim-cmp`.
        "hrsh7th/cmp-nvim-lsp",
        -- NOTE: The way conds work was changed and now this cond does not work anymore.
        -- cond = function()
        --     return require("lazy.core.config").plugins["nvim-cmp"] ~= nil
        -- end,
        lazy = true,
        -- dependencies = {
        --     "yioneko/nvim-cmp",
        -- },
    },

    {   -- LuaSnip: ChoiceNodes source for `nvim-cmp`.              ( STATE: TODO: Make it work. )
        "Aumnescio/cmp-luasnip-choice",
        lazy = true,
        dev = true,
        -- version = false,
        -- dependencies = {
        --     "yioneko/nvim-cmp",
        -- },
        config = function()
            require("cmp_luasnip_choice").setup()
        end,
    },

    {   -- `nvim-cmp` completion source for fuzzy matching buffer contents.     ( STATE: Really Good )
        "tzachar/cmp-fuzzy-buffer",
        lazy = true,
        version = false,
        dependencies = {
            "tzachar/fuzzy.nvim",
            "nvim-telescope/telescope-fzf-native.nvim",
        },
    },

    {   -- Nvim `fzf` wrapper                           ( STATE: Good )     ( Dependency for `cmp-fuzzy-buffer`. )
        "tzachar/fuzzy.nvim",
        lazy = true,
        version = false,
        dependencies = {
            "nvim-telescope/telescope-fzf-native.nvim",
        },
    },

    {   -- Codeium AI Autocompletion                    ( STATE: Testing )
        "Exafunction/codeium.vim",
        -- I want to load it only manually.
        lazy = true,
        version = false,

        -- `init` might work for setting these global variables which affect behaviour.
        init = function()
            -- Disabling defaults and configuring my custom binding below in the config function.
            vim.g.codeium_disable_bindings = 1

            -- `true`: Requires manually calling `codeium#Complete()`
            -- to activate suggestions.
            vim.g.codeium_manual = false            -- This is relatively clunky to use.
        end,

        cmd = {
            "CodeiumActivate",
        },

        config = function(_, opts)
            -- TODO: Preferably with Legendary.
            vim.keymap.set(
                "i",
                "<C-/>",
                function()
                    return vim.fn["codeium#Complete"]()
                end,
                { expr = true }
            )
            vim.keymap.set(
                "i",
                "<C-d>",
                function()
                    return vim.fn["codeium#CycleCompletions"](1)
                end,
                { expr = true }
            )
            vim.keymap.set(
                "i",
                "<C-u>",
                function()
                    return vim.fn["codeium#CycleCompletions"](-1)
                end,
                { expr = true }
            )
            vim.keymap.set(
                "i",
                "<C-x>",
                function()
                    return vim.fn["codeium#Clear"]()
                end,
                { expr = true }
            )
            vim.keymap.set(
                "i",
                "<C-b>",
                function()
                    return vim.fn["codeium#Accept"]()
                end,
                { expr = true }
            )

            -- Dummy Command for activating the plugin.
            vim.api.nvim_create_user_command("CodeiumActivate", 'echo "Setting up `Codeium AI`."', {})
        end,
    },
}

-- End of File

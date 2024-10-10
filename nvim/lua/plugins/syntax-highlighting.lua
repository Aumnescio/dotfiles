-- File:                `nvim/lua/plugins/syntax-highlighting.lua`
-- Purpose:             `lazy.nvim` Plugin Specification    ( Syntax Highlighting )

-- NOTES
--  - Polyglot won't lazy-load properly, and causes startup time penalty. Looking to get rid of polyglot.
--  - Base HTML and CSS syntax highlighting in `.html` and `.css` files is acceptable, even without polyglot.

return {
    {   -- |> Syntax Highlighting for many filetypes.       ( STATE: Meh )
        --  - Fallback Highlighting. Treesitter Alternative.
        --      - Faster in many cases, however:
        --          - There can be a very large performance drop in files that have broken syntax structures.
        --          - Treesitter suffers from the same issue, and the performance drop is even larger.
        --      - Gives a good amount of unique capture groups, which can be used to set custom highlight colors.
        --          - Colors configured in: `Aumnechroma` Neovim Theme.
        --  - NOTE/TODO: I could probably save startuptime if I install the individual syntax files that I want, instead of polyglot.
        "sheerun/vim-polyglot",
        enabled = false,            -- Semi-permanently disabled.
        lazy = false,               -- Apparently lazy-loading this is giving errors.
        version = false,

        -- ft = {
        --     "lua",
        --     "rust",
        --     "go",
        --     "c",
        --     "cpp",
        --     "html",
        --     "css",
        --     "javascript",
        --     "typescript",
        --     "javascriptreact",
        --     "typescriptreact",
        --     "svelte",
        --     "vue",
        -- },
    },

    {   -- Rust Syntax Highlighting                         ( STATE: At least okay )
        --  - Hurts performance: Input latency and delay in saving files.
        "rust-lang/rust.vim",
        lazy = true,            -- TODO: I don't think this is loaded at all right now.
        version = false,
        -- ft = {
        --     "rust",
        -- },
    },

    {   -- Rust Syntax Highlighting Extension               ( STATE: Okay )
        --  - Hurts performance: Input latency and delay in saving files.
        "arzg/vim-rust-syntax-ext",
        lazy = true,            -- TODO: I don't think this is loaded at all right now.
        version = false,
        -- ft = {
        --     "rust",
        -- },
        dependencies = {
            "rust-lang/rust.vim",
        },
    },

    {   -- Argument Highlighting                            ( STATE: Good when not broken. )
        "m-demare/hlargs.nvim",
        cond = false,        -- This started erroring, so disabled.
        lazy = true,
        version = false,

        cmd = {
            "EnableHLArgs",
        },

        dependencies = {
            -- Seems like this dependency is required for hlargs to kick in,
            -- but loading treesitter takes 15-25ms.
            --  - Avoiding startup-time penalty by lazy-loading on `cmd`.
            "nvim-treesitter/nvim-treesitter",
        },

        config = function()
            require("hlargs").setup({
                color = '#EF9062',
                paint_arg_declarations = true,
                paint_arg_usages = true,

                paint_catch_blocks = {
                    declarations = false,
                    usages = false,
                },

                hl_priority = 10000,

                excluded_argnames = {
                    declarations = {},
                    usages = {
                        python = { 'self', 'cls' },
                        lua = { 'self' },
                    },
                },
            })

            -- This command is created just to remove the warning/error from `lazy.nvim`,
            -- about the command not existing.
            vim.api.nvim_create_user_command("EnableHLArgs", "lua require('hlargs').enable()", {})
        end,
    },

    {   -- Heading Highlighting                             ( STATE: Was Okay, might be having issues. )
        --  - Really bad load-time: `150ms`
        "lukas-reineke/headlines.nvim",
        enabled = false,
        lazy = true,        -- Loaded by dependency requirement in Neorg setup.
        version = false,

        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },

        config = function()
            require("headlines").setup({
                norg = {
                    query = vim.treesitter.query.parse(
                        "norg",
                        [[
                            [
                                (heading1_prefix)
                                (heading2_prefix)
                                (heading3_prefix)
                                (heading4_prefix)
                                (heading5_prefix)
                                (heading6_prefix)
                            ] @headline

                            (weak_paragraph_delimiter) @dash
                            (strong_paragraph_delimiter) @doubledash

                            ((ranged_tag
                            name: (tag_name) @_name
                            (#eq? @_name "code")
                            ) @codeblock (#offset! @codeblock 0 0 1 0))

                            [
                                (quote1_prefix)
                                (quote2_prefix)
                                (quote3_prefix)
                                (quote4_prefix)
                                (quote5_prefix)
                                (quote6_prefix)
                            ] @quote
                        ]]
                    ),

                    -- NOTE: Theme needs to support these colors, or they need to be manually added.
                    headline_highlights = { "Headline1", "Headline2", "Headline3", "Headline4", "Headline5", "Headline6" },
                    fat_headlines = false,
                    -- fat_headline_upper_string = "▃",
                    -- fat_headline_lower_string = "🬂",
                    -- codeblock_highlight = "CodeBlock",
                    -- dash_highlight = "Dash",
                    -- dash_string = "-",
                    -- doubledash_highlight = "DoubleDash",
                    -- doubledash_string = "=",
                    -- quote_highlight = { "Quote" },
                    -- quote_string = "┃",
                },

                markdown = {
                    query = vim.treesitter.query.parse(
                        "markdown",
                        [[
                            (atx_heading [
                                (atx_h1_marker)
                                (atx_h2_marker)
                                (atx_h3_marker)
                                (atx_h4_marker)
                                (atx_h5_marker)
                                (atx_h6_marker)
                            ] @headline)

                            (thematic_break) @dash

                            (fenced_code_block) @codeblock

                            (block_quote_marker) @quote
                            (block_quote (paragraph (inline (block_continuation) @quote)))
                        ]]
                    ),

                    headline_highlights = { "Headline1", "Headline2", "Headline3", "Headline4", "Headline5", "Headline6" },
                    fat_headlines = false,
                },

                rmd = {
                    query = vim.treesitter.query.parse(
                        "markdown",
                        [[
                            (atx_heading [
                                (atx_h1_marker)
                                (atx_h2_marker)
                                (atx_h3_marker)
                                (atx_h4_marker)
                                (atx_h5_marker)
                                (atx_h6_marker)
                            ] @headline)

                            (thematic_break) @dash

                            (fenced_code_block) @codeblock

                            (block_quote_marker) @quote
                            (block_quote (paragraph (inline (block_continuation) @quote)))
                        ]]
                    ),

                    headline_highlights = { "Headline1", "Headline2", "Headline3", "Headline4", "Headline5", "Headline6" },
                    fat_headlines = false,
                },
            })
        end,
    },

    {   -- Fast, Local, Cursorword Highlight                    ( STATE: Quite Good )
        --  - Loads fast. Good Performance.
        --  - ISSUE:    With `scrolloff` enabled, the highlight flickers annoyingly
        --              when scroling.
        --  - TODO:     Maybe post a issue on Github.
        "Aumnescio/cursorword-highlight.nvim",
        lazy = true,
        dev = true,

        cmd = {
            "CursorwordHighlightOn",
        },

        config = function()
            require("cursorword-highlight").setup({
                file_types = {
                    "markdown", "latex", "tex", "html", "css", "sass", "scss",
                    "lua", "rust", "python", "fish", "bash", "sh", "shell", "go", "json",
                    "javascript", "javascriptreact", "typescript", "typescriptreact",
                },
                cw_hlgroup = "AumCursorwordCurrent",
                hlgroup = "AumCursorwordMatches",
            })
        end,
    },

    {   -- HTML Syntax Matchgroups                              ( STATE: Works, but very WIP )
        --  - NOTE: Built-in html indentation is relatively good, when configured with the variables.
        --          - See `:help html-indent`.
        --  - TODO: Fetch some base syntax from `html.vim`, `html5.vim` or some such.
        "Aumnescio/html-syntax.nvim",
        lazy = true,
        dev = true,
        ft = "html",
        config = function()
            require("html-syntax").setup()
            require("html-syntax").add_basic_highlight_groups()     -- TODO: Remove once the groups have been added to the theme.
        end,
    },

    -- {   -- Typst Syntax Matchgroups                          ( STATE: Somewhat functional, but Treesitter might have made enough progress to be better. )
    --     "Aumnescio/typst-syntax.nvim",
    --     lazy = true,
    --     dev = true,
    --     ft = "typst",
    --     dependencies = {
    --         "Aumnescio/typst-ftdetect.nvim",
    --         "Aumnescio/typst-indent.nvim",   -- Temporarily disabled.
    --     },
    --     config = function()
    --         require("typst-syntax").setup()
    --     end,
    -- },

    {   -- Typst Filetype Detection                             ( STATE: I think this works, and even Treesitter needs this. )
        "Aumnescio/typst-ftdetect.nvim",
        lazy = true,
        dev = true,
        event = "BufReadPre *.typ",
    },

    -- {   -- Custom Typst Indentation Rules
    --     "Aumnescio/typst-indent.nvim",
    --     lazy = true,
    --     dev = true,
    --     config = function()
    --         require("typst-indent").setup()
    --     end,
    -- },

    {   -- RON | Rusty Object Notation                          ( STATE: Probably fine. )
        "ron-rs/ron.vim",
        lazy = true,
        ft = "ron",
    },

    {   -- Rainbow CSV Syntax Highlighting                      ( STATE: Maybe fine. )
        "mechatroner/rainbow_csv",
        lazy = true,
        ft = "csv",
    },

    {   -- For C# / C-Sharp indenting                           ( STATE: Dunno. )
        "jlcrochet/vim-cs",
        lazy = true,
        ft = "cs",
    },

    {   -- `just` / justfiles                                   ( STATE: Maybe fine. )
        "NoahTheDuke/vim-just",
        lazy = true,
        ft = "just",
    },

    {   -- `Slint`                                              ( STATE: Testing. )
        "slint-ui/vim-slint",
        lazy = true,
        ft = "slint",
    },

    -- {   -- `Svelte`                                          ( STATE: Testing. )
    --     -- - Not great.
    --     -- - The things that don't work in Treesitter do work with this, but overall this might still be worse.
    --     -- - These plugins are also years old and might not be receiving updates.
    --     "evanleck/vim-svelte",
    --     lazy = true,
    --     ft = "svelte",
    --     dependencies = {
    --         "othree/html5.vim",
    --         "pangloss/vim-javascript",
    --     },
    -- },

    {   -- Lua syntax highlighting without Treesitter.          ( STATE: Testing )
        "euclidianAce/BetterLua.vim",
        lazy = true,
        ft = "lua",
    },
}

-- End of File

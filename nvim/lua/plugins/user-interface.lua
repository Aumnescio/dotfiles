-- File:                `nvim/lua/plugins/user-interface.lua`
-- Purpose:             `lazy.nvim` Plugin Specification    ( UI Extensions )

-- ToC
--  - `alpha.nvim`              Startup Screen
--  - `heirline.nvim`           Statusline, and other lines.
--  - `nvim-web-devicons`       Icons
--  - `hlchunk.nvim`            Indent Guides
--  - `dressing.nvim`           UI Lib
--  - `nui.nvim`                UI Lib
--  - `scrollbar.nvim`          Scrollbar
--  - `scrollview.nvim`         Scrollbar

return {
    {   -- Startup Dashboard                            ( STATE: Good )
        "goolord/alpha-nvim",
        enabled = true,
        cond = function()       -- Could probably be simplified, but this seems to work now.
            return
                vim.bo.filetype == "" or
                vim.bo.filetype == nil or
                vim.o.filetype == nil or
                vim.o.filetype == ""
        end,
        lazy = true,
        event = "VimEnter",     -- Seemingly required to lazy-load properly.

        -- NOTE/TODO: Move my alpha config here?
        -- opts = function()
        --     local dashboard = require("alpha.themes.dashboard")
        --     local logo = [[
        --     ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
        --     ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z
        --     ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z
        --     ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z
        --     ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
        --     ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
        --     ]]
        --
        --     dashboard.section.header.val = vim.split(logo, "\n")
        --     dashboard.section.buttons.val = {
        --         dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
        --         dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
        --         -- dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
        --         -- dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
        --         -- dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
        --         -- dashboard.button("s", " " .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
        --         -- dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
        --         -- dashboard.button("q", " " .. " Quit", ":qa<CR>"),
        --     }
        --
        --     for _, button in ipairs(dashboard.section.buttons.val) do
        --         button.opts.hl = "AlphaButtons"
        --         button.opts.hl_shortcut = "AlphaShortcut"
        --     end
        --
        --     dashboard.section.header.opts.hl = "AlphaHeader"
        --     dashboard.section.buttons.opts.hl = "AlphaButtons"
        --     dashboard.section.footer.opts.hl = "AlphaFooter"
        --     dashboard.opts.layout[1].val = 8
        --
        --     return dashboard
        -- end,

        config = function(_, dashboard)
            -- Close Lazy and re-open when the dashboard is ready.
            if vim.o.filetype == "lazy" then
                vim.cmd.close()
                vim.api.nvim_create_autocmd("User", {
                    pattern = "AlphaReady",
                    callback = function()
                        require("lazy").show()
                    end,
                })
            end

            require("alpha/startup-screen")
        end,
    },

    {   -- Status-/Tab-/Buffer-line                     ( STATE: Good )
        "rebelot/heirline.nvim",
        lazy = true,
        event = "UiEnter",                  -- Load `heirline` on `UiEnter`.

        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },

        config = function()
            require("heirline/aumneline")   -- Load my config.
        end,
    },

    {   -- LSP Progresss UI
        "j-hui/fidget.nvim",
        lazy = true,                        -- Loaded by `lspconfig`.
        -- version = false,
        tag = "legacy",         -- To avoid breaking changes for now. Maybe test newer versions at some point.

        -- Related documentation: "https://github.com/j-hui/fidget.nvim/blob/main/doc/fidget.md"
        config = function()
            require("fidget").setup({
                text = {
                    spinner = "dots_snake",     -- Animation shown when tasks are ongoing.
                    done = "✔",                 -- Character shown when all tasks are complete.
                    commenced = "Started",      -- Message shown when task starts.
                    completed = "Completed",    -- Message shown when task completes.
                },

                align = {
                    bottom = true,              -- Align fidgets along bottom edge of buffer.
                    right = true,               -- Align fidgets along right edge of buffer.
                },

                timer = {
                    spinner_rate = 125,         -- Frame rate of spinner animation, in ms.
                    fidget_decay = 2000,        -- How long to keep around empty fidget, in ms.
                    task_decay = 1000,          -- How long to keep around completed task, in ms.
                },

                window = {
                    relative = "win",           -- Where to anchor, either "win" or "editor".
                    blend = 100,                -- &winblend for the window.
                    zindex = nil,               -- The zindex value for the window.
                    border = "none",            -- Style of border for the fidget window.
                },

                fmt = {
                    leftpad = true,             -- Right-justify text in fidget box.
                    stack_upwards = true,       -- List of tasks grows upwards.
                    max_width = 0,              -- Maximum width of the fidget box.

                    fidget = function(fidget_name, spinner)
                        return string.format("%s %s", spinner, fidget_name)
                    end,

                    task = function(task_name, message, percentage)
                        return string.format(
                        "%s%s [%s]",
                        message,
                        percentage and string.format(" (%s%%)", percentage) or "",
                        task_name
                        )
                    end,
                },
            })
        end,
    },

    {   -- Icons                                        ( STATE: Good )     ( Nice simple visual addition. Dependency for some plugins. )
        --  - NOTE: Dependency of `heirline.nvim`, bit awkward to disable this.
        "nvim-tree/nvim-web-devicons",
        lazy = true,

        opts = {
            -- `default = true`:        Enable default icons.
            --  - Default Value:        `false`
            --  - Overriden by the `get_icons` option.
            default = true;

            -- `color_icons = true`:    Enable different highlight colors per icon.
            --  - Default Value:        `true`
            --  - If set to `false`, all icons will have the default color.
            color_icons = true;

            -- `strict = true`:         Globally enable "strict" selection of icons.
            --  - Default Value:        `false`
            strict = true;

            -- Personal icon overrides.
            --  - 'DevIcon' will be appended to `name`.
            override = {
                -- |> Example:
                -- zsh = {
                --     icon         = "",
                --     color        = "#428850",
                --     name         = "Zsh"         -- => "ZshDevIcon"
                -- },
            },

            -- Same as `override` but specifically for overrides by filename.
            -- Takes effect when `strict` is true.
            override_by_filename = {
                -- |> Example:
                -- [".gitignore"] = {
                --     icon = "",
                --     color = "#f1502f",
                --     name = "Gitignore",
                -- },
            },

            -- Same as `override` but specifically for overrides by extension.
            -- Takes effect when `strict` is true.
            override_by_extension = {
                -- |> Example:
                -- ["log"] = {
                --     icon = "",
                --     color = "#81e043",
                --     name = "Log",
                -- },
            },
        },
    },

    {   -- Indent Guides                                ( STATE: Quite Good )
        --  - NOTE: The treesitter and chunk things are laggy.
        --  - Base indent-guides are fine.
        "shellRaining/hlchunk.nvim",
        enabled = true,
        lazy = true,
        version = false,

        -- event = "UIEnter",
        ft = {
            "lua",
            "rust",
            "sh",
            "bash",
            "fish",
            "typst",
        },

        config = function()
            require("hlchunk").setup({
                indent = {
                    enable = true,
                    use_treesitter = false,     -- Could maybe test this at some point, but I think I prefer no treesitter.
                    chars = { "│" },
                    style = {
                        { fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("AumIndentGuide")), "fg", "gui") },
                    },
                },

                blank = {
                    enable = false,
                },
                chunk = {
                    enable = false,
                },
                line_num = {
                    enable = false,
                },
            })
        end,
    },

    {   -- UI Lib, better `vim.ui`                      ( STATE: Good )
        "stevearc/dressing.nvim",
        lazy = true,
        -- event = "VeryLazy",      -- As this is required by Legendary, this wouldn't really do anything.

        opts = {
            input = {
                -- Set to false to disable the `vim.ui.input` implementation.
                enabled = true,

                -- Default prompt string.
                default_prompt = "Input:",

                -- Can be 'left', 'right', or 'center'.
                prompt_align = "left",

                -- When true, <Esc> will close the modal
                insert_only = false,

                -- When true, input will start in insert mode.
                start_in_insert = false,

                -- These are passed to nvim_open_win
                anchor      = "SW",
                border      = "rounded",
                -- -- 'editor' and 'win' will default to being centered
                relative    = "cursor",

                -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
                prefer_width = 24,
                width = nil,
                -- min_width and max_width can be a list of mixed types.
                -- min_width = {20, 0.2} means "the greater of 20 columns or 20% of total"
                max_width = { 120, 0.9 },
                min_width = { 20, 0.20 },

                win_options = {
                    -- Window transparency (0-100)
                    winblend = 0,
                    -- Change default highlight groups (see :help winhl)
                    winhighlight = "Normal:DressingInputNormal,FloatBorder:DressingInputFloatBorder,Pmenu:DressingInputPmenu,Search:DressingInputSearch,Visual:DressingInputVisual",
                },

                -- Set to `false` to disable
                mappings = {
                    n = {
                        ["<Esc>"] = "Close",
                        ["<CR>"] = "Confirm",
                    },

                    i = {
                        ["<C-c>"] = "Close",
                        ["<CR>"] = "Confirm",
                        ["<Up>"] = "HistoryPrev",
                        ["<Down>"] = "HistoryNext",
                    },
                },

                override = function(conf)
                    return conf
                end,

                -- see :help dressing_get_config
                get_config = nil,
            },

            select = {
                -- Set to false to disable the vim.ui.select implementation
                enabled = true,

                -- Priority list of preferred vim.select implementations
                backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },

                -- Trim trailing `:` from prompt
                trim_prompt = true,

                -- Options for telescope selector
                -- These are passed into the telescope picker directly. Can be used like:
                -- telescope = require('telescope.themes').get_ivy({...})
                telescope = nil,

                -- Options for fzf selector
                fzf = {
                    window = {
                        width = 0.86,
                        height = 0.66,
                    },
                },

                -- Options for fzf_lua selector
                fzf_lua = {
                    winopts = {
                        width = 0.86,
                        height = 0.66,
                    },
                },

                -- Options for nui Menu
                nui = {
                    position = "50%",
                    size = nil,
                    relative = "editor",

                    border = {
                        style = "rounded",
                    },

                    buf_options = {
                        swapfile = false,
                        filetype = "DressingSelect",
                    },

                    win_options = {
                        winblend = 10,
                    },

                    max_width = 120,
                    max_height = 60,
                    min_width = 60,
                    min_height = 20,
                },

                -- Options for built-in selector.
                builtin = {
                    -- These are passed to nvim_open_win.
                    anchor = "NW",
                    border = "rounded",
                    -- `editor` and `win` will default to being centered.
                    relative = "editor",

                    win_options = {
                        -- Window transparency (0-100)
                        winblend = 0,
                        -- Change default highlight groups. (see :help winhl)
                        winhighlight = "Normal:DressingBuiltinNormal,FloatBorder:DressingBuiltinFloatBorder,Pmenu:DressingBuiltinPmenu,Search:DressingBuiltinSearch,Visual:DressingBuiltinVisual",
                    },

                    -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
                    -- the min_ and max_ options can be a list of mixed types.
                    -- max_width = {140, 0.8} means "the lesser of 140 columns or 80% of total"
                    width = 120,
                    max_width = { 140, 0.8 },
                    min_width = { 80, 0.6 },
                    height = 80,
                    max_height = 0.9,
                    min_height = { 40, 0.4 },

                    -- Set to `false` to disable
                    mappings = {
                        ["<Esc>"] = "Close",
                        ["<C-c>"] = "Close",
                        ["<CR>"] = "Confirm",
                    },

                    override = function(conf)
                        -- This is the config that will be passed to nvim_open_win.
                        -- Change values here to customize the layout
                        return conf
                    end,
                },

                -- Used to override format_item. See :help dressing-format
                format_item_override = {},

                -- see :help dressing_get_config
                -- get_config = nil
                get_config = function(opts)
                    if opts.kind == "legendary.nvim" then
                        return {
                            backend = 'telescope',

                            telescope = {
                                width = 0.86,
                                height = 0.76,
                            },

                            fzf = {
                                case_mode = "smart_case",
                            },
                        }
                    else
                        return {}
                    end
                end,
            },
        },

        -- From LazyVim, not really quite sure what this does.
        --  - NOTE: Not sure if I want this.
        --  - I suspect this might overwrite the Telescope ui-select config.
        --      - If this is the case, should I disable some telescope-ui-select things?
        init = function()
            vim.ui.select = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.select(...)
            end

            vim.ui.input = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.input(...)
            end
        end,
    },

    {   -- UI Components Library                ( STATE: Good )
        "MunifTanjim/nui.nvim",
        lazy = true,
    },

    {   -- Vertical Scrollbar                   ( STATE: Quite meh, occasionally annoying. )
        --  - It's not interactive, just visual.
        --  - I do feel like I want a scrollbar, but this is quite buggy right now.
        "petertriho/nvim-scrollbar",
        enabled = false,    -- TODO: Test simpler plugin for performance: "https://github.com/ojroques/nvim-scrollbar"
        lazy = true,
        version = false,

        cmd = "EnableScrollbar",
        ft = {
            "lua",
            "rust",
            "norg",
        },

        opts = {
            show                    = true,
            show_in_active_only     = false,
            hide_if_all_visible     = false,     -- Hides everything if all lines are visible.
            set_highlights          = false,    -- `false`: Highlight groups need to be manually defined in the config?
            folds                   = 1000,     -- Handle folds. Set a value to disable folds if number of lines in buffer exceeds this.
            max_lines               = false,    -- Disables if number of lines in buffer exceeds this.
            throttle_ms             = 80,

            handle = {
                text                = "‖",      -- Default: `" "`, `‖`, `█`
                -- |> Blend: `0` for fully opaque and `100` for fully transparent.
                --  - Defaults to 30.
                blend               = 0,
                highlight           = "ScrollbarHandle",
                hide_if_all_visible = false,     -- Hides handle if all lines are visible.
            },

            marks = {
                Cursor = {
                    text        = "█",
                    priority    = 0,
                    highlight   = "ScrollbarCursor",
                },

                Search = {
                    text        = { " ", " " },     -- Options: ` `, ` `
                    priority    = 1,
                    highlight   = "ScrollbarSearch",
                },

                Error = {
                    text        = { "", " " },    -- Options: ` `, ``
                    priority    = 2,
                    highlight   = "ScrollbarError",
                },

                Warn = {
                    text        = { "-", " " },    -- Options: ` `,
                    priority    = 3,
                    highlight   = "ScrollbarWarn",
                },

                Info = {
                    text        = { "", " " },    -- Options: ``, ` `
                    priority    = 4,
                    highlight   = "ScrollbarInfo",
                },

                Hint = {
                    text        = { "-", " " },     -- Options: ` `,
                    priority    = 5,
                    highlight   = "ScrollbarHint",
                },

                Misc = {
                    text        = { "-", "=" },
                    priority    = 6,
                    highlight   = "ScrollbarMisc",
                },

                GitAdd = {
                    text        = "┆",
                    priority    = 7,
                    highlight   = "ScrollbarGitAdd",
                },

                GitChange = {
                    text        = "┆",
                    priority    = 7,
                    highlight   = "ScrollbarGitChange",
                },

                GitDelete = {
                    text        = "▁",
                    priority    = 7,
                    highlight   = "ScrollbarGitDelete",
                },
            },

            excluded_buftypes = {
                "terminal",
                "prompt",
                "quickfix",
                "nofile",
                "help",
            },

            excluded_filetypes = {
                "cmp_docs",
                "cmp_menu",
                "noice",
                "prompt",
                "TelescopePrompt",
                "popup",
                "lazy",
                "wf",           -- Not quite sure how to disable the scrollbar in `wf.nvim` window.
                "whichkey",
                "scratch",
                "",
                " ",
            },

            autocmd = {
                render = {
                    "BufWinEnter",
                    "TabEnter",
                    "TermEnter",
                    "WinEnter",
                    "CmdwinLeave",
                    "TextChanged",
                    "VimResized",
                    "WinScrolled",
                },

                clear = {
                    "BufWinLeave",
                    "TabLeave",
                    "TermLeave",
                    "WinLeave",
                },
            },

            handlers = {
                handle      = true,     -- The scrollbar
                diagnostic  = true,     -- Diagostics   ( LSP )
                cursor      = false,    -- Cursor location in the scrollbar. Makes it look horrible.
                gitsigns    = false,    -- Requires `gitsigns.nvim`. (Maybe TODO)
                search      = false,    -- Requires `hlslens`
                ale         = false,    -- Requires `ALE`
            },
        },

        config = function(_, opts)
            require("scrollbar").setup(opts)
            vim.api.nvim_create_user_command("EnableScrollbar", '', {})
        end,
    },

    {   -- Another ScrollBar
        "dstein64/nvim-scrollview",
        enabled = true,
        lazy = true,
        version = "*",

        cmd = "ScrollViewEnable",

        opts = {
            excluded_filetypes = {
                "nerdtree",
                "cmp_docs",
                "cmp_menu",
                "noice",
                "prompt",
                "TelescopePrompt",
                "popup",
                "lazy",
                "wf",           -- Not quite sure how to disable the scrollbar in `wf.nvim` window.
                "whichkey",
                "scratch",
                "",
                " ",
            },

            current_only            = true,
            base                    = "right",
            column                  = 1,
            signs_column            = 0,
            winblend                = 20,
            diagnostics_severities  = { vim.diagnostic.severity.ERROR },

            signs_on_startup        = {
                "diagnostics",
                "search",
                "trail",
            },

            trail_symbol            = "~",
        },

        config = function(_, opts)
            require("scrollview").setup(opts)
        end,
    },
}

-- End of File

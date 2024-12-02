-- File:                `nvim/lua/plugins/treesitter.lua`
-- Purpose:             `lazy.nvim` Plugin Specification    ( Treesitter )

--===============================--+
-- |> START - Treesitter Toggles --|
--===============================--+

-- NOTE:    Neovim treesitter implementation is too slow for any file above 500-1000 lines.
--          Which sucks a lot. ( Extra Note: Helix treesitter performance is hundreds of times more performant. )

-- |> Enable `Treesitter` for `markdown` files.         ( If this causes noticeable lag, can disable. )
local treesitter_aumgroup = vim.api.nvim_create_augroup("MyTreesitterFiletypes", { clear = true })

-- TODO: Delete these autocmds from here if they are not required, and move these to `ftplugin` files.

vim.api.nvim_create_autocmd("BufReadPre", {
    pattern = { "*.md" },
    command = "TSEnable highlight markdown",
    group = treesitter_aumgroup,
})

-- |> Enable `Treesitter` for `norg` files.
vim.api.nvim_create_autocmd("BufReadPre", {
    pattern = { "*.norg" },
    command = "TSEnable highlight norg",
    group = treesitter_aumgroup,
})

-- |> Enable `Treesitter` for `typst` files.
--  - Testing...
vim.api.nvim_create_autocmd("BufReadPre", {
    pattern = { "*.typ" },
    command = "TSEnable highlight typst",
    group = treesitter_aumgroup,
})

-- |> Enable `Treesitter` for `html` files.
vim.api.nvim_create_autocmd("BufReadPre", {
    pattern = { "*.html" },
    command = "TSEnable highlight html",
    group = treesitter_aumgroup,
})

-- |> Enable `Treesitter` for `css` files.
vim.api.nvim_create_autocmd("BufReadPre", {
    pattern = { "*.css" },
    command = "TSEnable highlight css",
    group = treesitter_aumgroup,
})

-- |> Enable `Treesitter` for `javascript` files.
vim.api.nvim_create_autocmd("BufReadPre", {
    pattern = { "*.js" },
    command = "TSEnable highlight javascript",
    group = treesitter_aumgroup,
})

-- |> Enable `Treesitter` for `typescript` files.
vim.api.nvim_create_autocmd("BufReadPre", {
    pattern = { "*.ts" },
    command = "TSEnable highlight typescript",
    group = treesitter_aumgroup,
})

-- |> Enable `Treesitter` for `svelte` files.
--  - Haven't found better alternative so far.
vim.api.nvim_create_autocmd("BufReadPre", {
    pattern = { "*.svelte" },
    command = "TSEnable highlight svelte",
    group = treesitter_aumgroup,
})

-- |> Enable `Treesitter` for `php` files.
-- vim.api.nvim_create_autocmd("BufReadPre", {
--     pattern = { "*.php" },
--     command = "TSEnable highlight php",
--     group = treesitter_aumgroup,
-- })

-- |> Enable `Treesitter` for `fish` files.
vim.api.nvim_create_autocmd("BufReadPre", {
    pattern = { "*.fish" },
    command = "TSEnable highlight fish",
    group = treesitter_aumgroup,
})

-- |> Enable `Treesitter` for `sh` files.
vim.api.nvim_create_autocmd("BufReadPre", {
    pattern = { "*.sh" },
    command = "TSEnable highlight sh",
    group = treesitter_aumgroup,
})

-- |> Enable `Treesitter` for `json` files.
vim.api.nvim_create_autocmd("BufReadPre", {
    pattern = { "*.json" },
    command = "TSEnable highlight json",
    group = treesitter_aumgroup,
})

-- |> Enable `Treesitter` for `yaml` files.
vim.api.nvim_create_autocmd("BufReadPre", {
    pattern = { "*.yml", "*.yaml" },
    command = "TSEnable highlight yaml",
    group = treesitter_aumgroup,
})

-- |> Enable `Treesitter` for `C-Sharp` files.
vim.api.nvim_create_autocmd("BufReadPre", {
    pattern = { "*.cs" },
    command = "TSEnable highlight c_sharp",
    group = treesitter_aumgroup,
})

-- |> Enable `Treesitter` for `<insert-filetype-here>` files.
-- TODO

--=============================--+
-- |> END - Treesitter Toggles --|
--=============================--+

return {
    {   -- Treesitter                                   ( STATE: Config quite fine. TS itself quite weak. )
        --  - Occasionally useful for highlighting. Common optional dependency for many plugins.
        --  - But gets very laggy, very easily.
        "nvim-treesitter/nvim-treesitter",
        enabled = true,
        cond = vim.g.aum_plugin_treesitter_enabled,
        lazy = true,
        version = false,

        cmd = {
            "TSEnable",
            "TSUpdate",
        },

        -- |> TODO: Maybe enable this at some point?
        -- build = function()
        --     require("nvim-treesitter.install").update({ with_sync = true })
        -- end,

        dependencies = {
            {
                "nvim-treesitter/nvim-treesitter-textobjects",
                enabled = true,
                cond = vim.g.aum_plugin_treesitter_textobjects_enabled,
                init = function()
                    -- PERF: No need to load the plugin, if we only need its queries for `mini.ai`.
                    local plugin = require("lazy.core.config").spec.plugins["nvim-treesitter"]
                    local opts = require("lazy.core.plugin").values(plugin, "opts", false)
                    local enabled = false
                    if opts.textobjects then
                        for _, mod in ipairs({ "move", "select", "swap", "lsp_interop" }) do
                            if opts.textobjects[mod] and opts.textobjects[mod].enable then
                                enabled = true
                                break
                            end
                        end
                    end
                    if not enabled then
                        require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
                    end
                end,
            },
        },

        opts = function()
            -- Function for situationally disabling `Treesitter Highlighting`.
            -- STATE: Seems to work.
            local function ts_disable(lang, buf)
                -- Filetypes which have been caused very noticeable slowdowns for me:
                --  - `lua`         ( 3000 lines long file, really slow. )

                local languages = {
                    "lua",          -- Lua's `Treesitter Highlighting` has very bad performance. ( Causes input latency. )
                    "php",          -- Testing...
                    "toml",         -- `toml` is fine without treesitter.
                    "go",           -- Either might be fine.
                    "python",       -- Either might be fine.
                    -- "rust",      -- Treesitter lags very easily...
                    -- "html",      -- Not sure which highlighting I want.
                    -- "css",       -- Not sure which highlighting I want.

                    -- Treesitter might be really beneficial in Svelte, as it contains like 5+ languages.
                    --  - Can't get other highlighters/indenters to work well for Svelte.
                    -- "svelte",
                }

                for _key, language in pairs(languages) do
                    if lang == language then
                        return true
                    end
                end

                -- Disable if file has too many lines.
                local max_filesize = 50 * 1024 -- 50 KB
                local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))

                if ok and stats and stats.size > max_filesize then
                    return true
                end

                return false
            end

            return {
                -- NOTE: `norg` and `norg_meta` installed through `:Neorg sync-parsers` command. (OUTDATED Info)
                -- - Presumably, `Neorg` still handles the installation of the `norg` TS parsers and stuff.
                ensure_installed = {
                    "bash", "fish", "c", "cpp", "cmake", "make", "rust", "go", "python",
                    "css", "scss", "html", "javascript", "typescript", "vue", "svelte",
                    "lua", "vim", "markdown", "toml", "yaml", "rst", "pug", "json",
                    "jsonc", "glsl", "java", "kotlin", "tsx", "regex", "elm", "latex",
                    "query", "commonlisp", "v", "markdown_inline", "vimdoc", "php",
                    "ron", "c_sharp", "slint", "typst", "scheme", "nix", "gdscript", "gdshader"
                },  

                auto_install = false,

                highlight = {
                    enable = true,

                    -- Parser speeds apparently vary quite a lot.
                    -- Disable `Treesitter` for any filetype where it causes noticeable lag.
                    --  - NOTE: This should work. Though I might have had some issues with it not working at some point.
                    disable = function(lang, buf)
                        return ts_disable(lang, buf)
                    end,

                    -- disable = ts_disable(lang, bufnr),

                    additional_vim_regex_highlighting = false,
                },

                indent = {
                    -- Probably prefer `false` right now.
                    -- Testing `true` occasionally.
                    --  - Sometimes seemed to do okay in Svelte files, but not really good.
                    enable = true,
                    disable = {
                        "lua",              -- Non-treesitter defaults work in Lua.
                        -- "rust",          -- TODO: Testing...
                        "html",             -- HTML indent settings are configurable and good without treesitter.
                        "css",              -- Non-treesitter default indentation might be fine for CSS.
                        "php",              -- TODO: Testing...

                        "c_sharp",          -- TODO: Make `C#` indentation work. (Enabling this does not work.)

                        -- TODO: Might need to install some svelte vim plugin which provides indentation.
                        -- - Hard to find though.
                        -- "svelte",           -- Indentation is not great yet either way.

                        -- "norg",             -- TODO: Testing. Doesn't seem to make much of a difference.
                        "c",                -- Testing disabling, to get performance increase.
                        "cpp",              -- Testing disabling, to get performance increase.
                    },
                },

                -- rainbow = {
                --     enable = false,             -- `true` has some minor issues. Prefer not to have my crap borked.
                --     extended_mode = false,
                --     max_file_lines = 3000,
                -- },

                -- |> Disabled right now.
                -- matchup = {
                --     enable = true,
                --     disable_virtual_text = true,
                --     -- disable = { "c" },           -- Optional list of languages for which the plugin would be disabled.
                -- },

                -- NOTE: Disabled atm, but generally okay to use.
                -- textobjects = {
                --     select = {
                --         enable = true,
                --
                --         -- Automatically jump forward to textobj, similar to targets.vim
                --         lookahead = true,
                --
                --         keymaps = {
                --             -- You can use the capture groups defined in "textobjects.scm".
                --             -- You can optionally set descriptions to the mappings (used in the desc parameter of nvim_buf_set_keymap
                --             ["if"] = { query = "@function.inner", desc = "Select inner part of a function region" },
                --             ["af"] = { query = "@function.outer", desc = "Select outer part of a function  region" },
                --             ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                --             ["ac"] = { query = "@class.outer", desc = "Select outer part of a class region" },
                --         },
                --
                --         -- You can choose the select mode (default is charwise 'v')
                --         selection_modes = {
                --             ['@parameter.outer'] = 'v', -- charwise
                --             ['@function.outer'] = 'V', -- linewise
                --             ['@class.outer'] = '<c-v>', -- blockwise
                --         },
                --
                --         -- If you set this to `true` (default is `false`) then any textobject is
                --         -- extended to include preceding xor succeeding whitespace. Succeeding
                --         -- whitespace has priority in order to act similarly to eg the built-in
                --         -- `ap`.
                --         include_surrounding_whitespace = true,
                --
                --         swap = {
                --             enable = true,
                --             swap_next = {
                --                 ["<leader>a"] = "@parameter.inner",
                --             },
                --             swap_previous = {
                --                 ["<leader>A"] = "@parameter.inner",
                --             },
                --         },
                --     },
                --
                --     move = {
                --         enable = true,
                --         set_jumps = true, -- whether to set jumps in the jumplist
                --         goto_next_start = {
                --             ["]m"] = "@function.outer",
                --             ["]]"] = "@class.outer",
                --         },
                --         goto_next_end = {
                --             ["]M"] = "@function.outer",
                --             ["]["] = "@class.outer",
                --         },
                --         goto_previous_start = {
                --             ["[m"] = "@function.outer",
                --             ["[["] = "@class.outer",
                --         },
                --         goto_previous_end = {
                --             ["[M"] = "@function.outer",
                --             ["[]"] = "@class.outer",
                --         },
                --     },
                --
                --     -- TODO: Enable and test after LSP active.
                --     lsp_interop = {
                --         enable = false,
                --         border = 'none',
                --         peek_definition_code = {
                --             ["<leader>df"] = "@function.outer",
                --             ["<leader>dF"] = "@class.outer",
                --         },
                --     },
                -- },
            }
        end,

        ---@param opts TSConfig
        config = function(_, opts)
            if type(opts.ensure_installed) == "table" then
                ---@type table<string, boolean>
                local added = {}
                opts.ensure_installed = vim.tbl_filter(function(lang)
                    if added[lang] then
                        return false
                    end
                    added[lang] = true
                    return true
                end, opts.ensure_installed)
            end

            require("nvim-treesitter.configs").setup(opts)
        end,
    },

    {
        "haringsrob/nvim_context_vt",
        enabled = true,
        cond = vim.g.aum_plugin_nvim_context_vt_enabled,
        lazy = true,
        version = false,

        opts = {
            enabled = true,

            -- Prefix added to the `Context Indicator Virtual Text`.
            prefix = "⇐",      -- Options: `⇐`,

            -- Override the Highlight Group name.
            highlight = "TreesitterContextVirtualText",

            -- Disable `Virtual Text` for given filetypes.
            disable_ft = { "markdown" },

            -- Disable display of Virtual Text below blocks for indentation based languages like Python.
            disable_virtual_lines = false,

            -- Same as above but only for spesific filetypes.
            disable_virtual_lines_ft = {},

            -- How many lines required after starting position to show Virtual Text.
            -- Default: 1 (equals two lines total)
            --  - TODO: Test how this works and feels.
            min_rows = 4,

            -- Same as above but only for spesific filetypes.
            min_rows_ft = {},
        },

        config = function(_, opts)
            require("nvim_context_vt").setup(opts)
        end,
    },
}

-- End of File

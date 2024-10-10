--==============================================--+
-- === - Aumnescio's Neovim Configuration - === --|
--==============================================--+

-- => Core Vim/Neovim opts
require("config/core-options")

--===========================================--+
-- === - START - `lazy.nvim` Bootstrap - === --|
--===========================================--+

-- |> Bootstrap Plugin Manager: `lazy.nvim`
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",  -- Latest stable release
        lazypath,
    })
end

-- Add `lazy.nvim` data path to `runtime path`.
vim.opt.rtp:prepend(lazypath)

--===========================================--+
-- === - END - `lazy.nvim` Bootstrap - === --|
--===========================================--+
--|--------------------------------------------|
-- ======================================================--+
-- === - START - `lazy.nvim` Configuration Options - === --|
-- ======================================================--+

-- JumpMarker: lazy config
local lazy_opts = {
    root = vim.fn.stdpath("data") .. "/lazy",   -- Directory where plugins will be installed.

    defaults = {
        lazy = false,                           -- Should plugins be lazy-loaded?
        version = nil,

        -- Default condition you can use to globally disable a lot of plugins,
        -- when running inside VSCode for example.
        cond = not vim.g.vscode,  ---@type boolean|fun(self:LazyPlugin):boolean|nil
        -- version = "*",  -- Enable this to try installing the latest stable versions of plugins.
    },

    -- Leave nil when passing the spec as the first argument to `setup()`.
    spec = nil, ---@type LazySpec
    lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json",  -- lockfile generated after running update.
    concurrency = nil,  ---@type number limit the maximum amount of concurrent tasks.

    git = {
        -- Defaults for the `Lazy log` command
        -- log = { "-10" },  -- Show the last 10 commits.
        log = { "--since=3 days ago" },  -- Show commits from the last 3 days.
        timeout = 120,  -- Kill processes that take more than 2 minutes.
        url_format = "https://github.com/%s.git",
        -- `lazy.nvim` requires `git` >=2.19.0. If you really want to use `lazy` with an older version,
        -- then set the below to false. This should work, but is NOT supported and will
        -- increase downloads a lot.
        filter = true,
    },

    dev = {
        -- Directory where you store your local plugin projects.
        path = "~/Dev/NeovimPlugins/Aumnescio",
        ---@type string[] Plugins that match these patterns will use your local versions instead of being fetched from GitHub.
        patterns = { "Aumnescio" },     -- For example `{ "folke" }`.
        fallback = false,               -- Fallback to git when local plugin doesn't exist.
    },

    install = {
        -- Install missing plugins on startup.
        missing = false,    -- `false`: Requires running Sync I guess. (I don't exactly like the UI popping up automatically.)
        -- Try to load one of these colorschemes when starting an installation during startup.
        colorscheme = { "aumnechroma" },
    },

    ui = {
        -- A number <1 is a percentage, >1 is a fixed size.
        size = { width = 0.8, height = 0.8 },
        wrap = true,  -- `true`: Wrap the lines in the UI.  ( Looks a bit wonky without this. )

        -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
        -- TODO: Set the custom border here.
        border = "rounded",

        icons = {
            cmd         = " ",
            config      = " ",
            event       = "",
            ft          = " ",
            init        = " ",
            import      = " ",
            keys        = " ",
            lazy        = "󰒲 ",
            loaded      = "󰄴 ",
            not_loaded  = "󰝦 ",
            plugin      = " ",
            runtime     = " ",
            source      = " ",
            start       = "🟆 ",
            task        = "✔",
            list = {
                "∈",
                "➜",
                "‒",
                "·",
            },
        },

        -- Leave `nil`, to automatically select a browser depending on your OS.
        -- If you want to use a specific browser, you can define it here.
        browser = nil,  ---@type string?
        throttle = 20,  -- How frequently should the UI process render events.

        -- I want to configure the keybindings inside of the `lazy.nvim` UI,
        -- but I do not quite understand how.
        custom_keys = {
            -- You can define custom keymaps here.
            -- To disable one of the defaults, set it to `false`

            -- This binding should only be active inside of the Lazy UI window.
            -- NOTE: This does not work anywhere.
            ["<S-t>"] = function()
                require("lazy").home()
            end,

            -- NOTE: If these are not set to false, they are created by default, even if the keybindings are commented out.
            ["<localleader>l"] = false,
            ["<localleader>t"] = false,
        },
    },

    diff = {
        -- `diff` command <d> can be one of:
        -- * `browser`: opens the github compare view. Note that this is always mapped to `<K>` as well,
        --   so you can have a different command for diff `<d>`.
        -- * `git`: will run git diff and open a buffer with filetype git.
        -- * `terminal_git`: will open a pseudo terminal with git diff.
        -- * `diffview.nvim`: will open Diffview to show the diff.
        cmd = "git",
    },

    checker = {
        -- `true`: Automatically check for plugin updates.
        enabled = false,    -- Don't like this.
        concurrency = nil,  ---@type number? set to 1 to check for updates very slowly.
        notify = true,  -- Get a notification when new updates are found.
        frequency = 3600,  -- Check for updates every hour.
    },

    change_detection = {
        -- Automatically check for config file changes and reload the UI.
        enabled = false,
        notify = true,          -- Get a notification when changes are found.
    },

    performance = {
        cache = {
            enabled = true,
        },
        reset_packpath = true,  -- Reset the package path to improve startup time.
        rtp = {
            reset = true,  -- Reset the runtime path to $VIMRUNTIME and your config directory.
            ---@type string[]
            paths = {   -- Add any custom paths here that you want to includes in the rtp.
                -- "~/Dev/NeovimPlugins/Aumnescio/*",      -- I don't think I want this here.
                -- "~/Dev/NeovimPlugins/Aumnescio/cursorword-highlight.nvim/",
                -- "~/Dev/NeovimPlugins/Aumnescio/cmp-fuzzy-buffer.nvim/",
                -- "~/Dev/NeovimPlugins/Aumnescio/auto-trim-nearby-whitespace.nvim/",
                -- "~/Dev/NeovimPlugins/Aumnescio/html-syntax.nvim/",
            },
            ---@type string[] list any plugins you want to disable here
            disabled_plugins = {
                "netrwPlugin",
                "matchit",
                "matchparen",
                "zipPlugin",
                "tarPlugin",
                "gzip",
                "tohtml",        -- This is kind of cute, but it does not seem to work with treesitter colors.
                "tutor",
            },
        },
    },

    -- `lazy` can generate helptags from the headings in `markdown` readme files,
    -- so `:help` works even for plugins that don't have vim docs.
    -- when the readme opens with `:help` it will be correctly displayed as markdown
    readme = {
        enabled = true,
        root = vim.fn.stdpath("state") .. "/lazy/readme",
        files = { "README.md", "lua/**/README.md" },
        -- Only generate markdown helptags for plugins that dont have docs.
        skip_if_doc_exists = true,
    },

    state = vim.fn.stdpath("state") .. "/lazy/state.json",  -- State info for checker and other things.
}

--=====================================================--+
-- === - END - `lazy.nvim` Configuration Options - === --|
--=====================================================--+
--|--------------------------------------|
--=====================================--+
-- === - START - Plugin Settings - === --|
--=====================================--+

-- |> Git Blame     ( `git-blame.nvim` )
--  - NOTE/TODO:    Looking to maybe try `blam.nvim` instead, even though this plugin works fine. ( Has 20ms load time though, which is quite large. )
vim.g.gitblame_enabled                          = false     -- Can be enabled by calling the command: `GitBlameEnable`
vim.g.gitblame_display_virtual_text             = 1
vim.g.gitblame_delay                            = 225       -- Milliseconds.
vim.g.gitblame_highlight_group                  = "AumGitBlame"
vim.g.gitblame_message_template                 = '    <summary> ⍿ <date> ⍿ <author>'
vim.g.gitblame_message_when_not_committed       = '    Not committed'
vim.g.gitblame_date_format                      = '%r'
-- vim.g.gitblame_date_format                   = '%c %r'   -- To also show exact date and time.
-- vim.g.gitblame_ignored_filetypes = [ "lua", "norg" ]

--===================================--+
-- === - END - Plugin Settings - === --|
--===================================--+
--|------------------------------------|
--=========================================================================--+
-- === - START - `lazy.nvim` Plugin Spec (Plugin Configuration List) - === --|
--=========================================================================--+

-- NOTE: `"plugins"` is the `~/.config/nvim/lua/plugins/` directory, where the spec is pulled from.
require("lazy").setup("plugins", lazy_opts)

--=======================================================================--+
-- === - END - `lazy.nvim` Plugin Spec (Plugin Configuration List) - === --|
--=======================================================================--+
--|-----------------------------------|
--==================================--+
-- === - START - Autocommands - === --|
--==================================--+

require("config/autocommands")

--================================--+
-- === - END - Autocommands - === --|
--================================--+
--|---------------------------------|
--=========================================================================================--+
-- === - START - Old commented out crap that is in the process of getting cleaned up - === --|
--=========================================================================================--+

-- === |> Packer Plugin Management (Plugins)
-- require("packer").startup({function()
--     -- === |> - END - Visual / UI
--
--     -- NOTE: Looking to test file explorers like `carbon.nvim`, `oil.nvim`, and `telescope-filebrowser`.
--     -- Also `zoxide` extension for `Telescope`.
--
--     -- === |> - END - File Explorer
--
--     -- |> - START - Neovim Terminal Functionality
--     use { "numToStr/FTerm.nvim" }                                       -- FloatingTerminal             ( STATE: Fine )
--     -- |> - END - Neovim Terminal Functionality
--
--     -- |> - START - Database stuff
--     -- NOTE: Not using any of these at the moment.
--     -- use { "tpope/vim-dadbod" }                                       -- Good for activating SQL queries.
--     -- use { "kristijanhusak/vim-dadbod-ui" }                           -- This is okay, but not very necessary.
--     -- use { "kristijanhusak/vim-dadbod-completion" }                   -- Having mild issues with this.
--     -- |> - END - Database stuff
--
--     -- === |> - START - Interactive Workflow
--     use { "luk400/vim-jukit" }                                          -- Jupyter alternative          ( STATE: TODO: Config and Test )
--     -- === |> - END - Interactive Workflow
--
--     -- === |> - START - Misc Nice Things - ===
--     use { "folke/zen-mode.nvim" }                                       -- Zen-Mode                     ( STATE: Some lag issues, some toggling issues. )
--     use { "mhartington/formatter.nvim" }                                -- FormatRunner                 ( STATE: Fine )
--     use { "tpope/vim-repeat" }                                          -- Improved Repeat              ( STATE: Good )
--     use { "tpope/vim-endwise" }                                         -- Minor Autocompletions        ( STATE: Bit unknown )
--     use { "tpope/vim-eunuch" }                                          -- Shell commands from vim.     ( STATE: Bit unknown )
--
--     -- Colorization:
--     -- use { "aklt/plantuml-syntax" }                                   -- PlantUML SyntaxHL            ( STATE: Fine, but really not used much. )
--
--     -- Misc:
--     use { "Saecki/crates.nvim", tag = "v0.3.0" }                        -- Rust Crates Helper           ( STATE: Testing )
--
--     -- Disabled
--     -- use { "beauwilliams/focus.nvim" }                                -- SplitResizing                ( STATE: TODO: Re-enable and test. )
--     -- use { "abecodes/tabout.nvim" }                                   -- Tabout                       ( STATE: TODO: Re-enable and test. )
--     -- use { "lervag/vimtex" }                                          -- LaTeX Support                ( STATE: Unknown )

-- -- |> Dadbod-Completion settings.
-- g.completion_chain_complete_list = {sql = {{ complete_items = {"vim-dadbod-completion"} }} }
-- g.completion_matching_strategy_list = {"exact", "substring"}
-- g.completion_matching_ignore_case = 1

-- |> START -> Autopairs (with cmp) (Disabled, testing mini-pairs.)
-- local npairs = require('nvim-autopairs')
-- npairs.setup({
--     disable_filetype = { "TelescopePrompt" },
--     disable_in_macro = false,
--     disable_in_visualblock = false,
--     ignored_next_char = [=[[%w%%%'%[%"%.]]=],  -- Wtf is this.
--     enable_moveright = true,
--     enable_afterquote = true,
--     enable_check_bracket_line = true,
--     enable_bracket_in_quote = true,
--     enable_abbr = false,
--     break_undo = true,
--     check_ts = false,  -- Wat is this?
--     map_cr = true,
--     map_bs = true,
--     map_c_h = false,
--     map_c_w = false,
-- })

-- local cmp_autopairs = require("nvim-autopairs.completion.cmp")
-- local autopair_handlers = require('nvim-autopairs.completion.handlers')
-- |> END -> Autopairs (Nvim-Cmp)

-- TODO: Lua choice node `next_choice` binding. (Had difficulty binding this to `C-e` so not sure what to bind to.)
-- if luasnip.choice_active() then
--     luasnip.next_choice()
-- end

-- === |> - crates.nvim (START)
-- TODO: Customize keybindings.
-- Link: "https://github.com/Saecki/crates.nvim"
-- require("crates").setup({
--     smart_insert = true,
--     insert_closing_quote = true,
--     avoid_prerelease = true,
--     autoload = true,
--     autoupdate = true,
--     -- autoupdate_throttle = 250,
--     loading_indicator = true,
--     date_format = "%Y-%m-%d",
--     thousands_separator = ".",
--     notification_title = "Crates",
--     -- curl_args = { "-sL", "--retry", "1" },
--     disable_invalid_feature_diagnostic = false,
--
--     text = {
--         loading = "   Loading",
--         version = "   %s",
--         prerelease = "   %s",
--         yanked = "   %s",
--         nomatch = "   No match",
--         upgrade = "   %s",
--         error = "   Error fetching crate",
--     },
--
--     highlight = {
--         loading = "CratesNvimLoading",
--         version = "CratesNvimVersion",
--         prerelease = "CratesNvimPreRelease",
--         yanked = "CratesNvimYanked",
--         nomatch = "CratesNvimNoMatch",
--         upgrade = "CratesNvimUpgrade",
--         error = "CratesNvimError",
--     },
--
--     popup = {
--         autofocus = false,
--         -- hide_on_select = false,
--         copy_register = '"',
--         style = "minimal",
--         border = "none",
--         show_version_date = false,
--         show_dependency_version = true,
--         max_height = 30,
--         min_width = 20,
--         padding = 1,
--
--         text = {
--             title = " %s",
--             pill_left = "",
--             pill_right = "",
--             description = "%s",
--             created_label = " created        ",
--             created = "%s",
--             updated_label = " updated        ",
--             updated = "%s",
--             downloads_label = " downloads      ",
--             downloads = "%s",
--             homepage_label = " homepage       ",
--             homepage = "%s",
--             repository_label = " repository     ",
--             repository = "%s",
--             documentation_label = " documentation  ",
--             documentation = "%s",
--             crates_io_label = " crates.io      ",
--             crates_io = "%s",
--             categories_label = " categories     ",
--             keywords_label = " keywords       ",
--             version = "  %s",
--             prerelease = " %s",
--             yanked = " %s",
--             version_date = "  %s",
--             feature = "  %s",
--             enabled = " %s",
--             transitive = " %s",
--             normal_dependencies_title = " Dependencies",
--             build_dependencies_title = " Build dependencies",
--             dev_dependencies_title = " Dev dependencies",
--             dependency = "  %s",
--             optional = " %s",
--             dependency_version = "  %s",
--             loading = "  ",
--         },
--
--         highlight = {
--             title = "CratesNvimPopupTitle",
--             pill_text = "CratesNvimPopupPillText",
--             pill_border = "CratesNvimPopupPillBorder",
--             description = "CratesNvimPopupDescription",
--             created_label = "CratesNvimPopupLabel",
--             created = "CratesNvimPopupValue",
--             updated_label = "CratesNvimPopupLabel",
--             updated = "CratesNvimPopupValue",
--             downloads_label = "CratesNvimPopupLabel",
--             downloads = "CratesNvimPopupValue",
--             homepage_label = "CratesNvimPopupLabel",
--             homepage = "CratesNvimPopupUrl",
--             repository_label = "CratesNvimPopupLabel",
--             repository = "CratesNvimPopupUrl",
--             documentation_label = "CratesNvimPopupLabel",
--             documentation = "CratesNvimPopupUrl",
--             crates_io_label = "CratesNvimPopupLabel",
--             crates_io = "CratesNvimPopupUrl",
--             categories_label = "CratesNvimPopupLabel",
--             keywords_label = "CratesNvimPopupLabel",
--             version = "CratesNvimPopupVersion",
--             prerelease = "CratesNvimPopupPreRelease",
--             yanked = "CratesNvimPopupYanked",
--             version_date = "CratesNvimPopupVersionDate",
--             feature = "CratesNvimPopupFeature",
--             enabled = "CratesNvimPopupEnabled",
--             transitive = "CratesNvimPopupTransitive",
--             normal_dependencies_title = "CratesNvimPopupNormalDependenciesTitle",
--             build_dependencies_title = "CratesNvimPopupBuildDependenciesTitle",
--             dev_dependencies_title = "CratesNvimPopupDevDependenciesTitle",
--             dependency = "CratesNvimPopupDependency",
--             optional = "CratesNvimPopupOptional",
--             dependency_version = "CratesNvimPopupDependencyVersion",
--             loading = "CratesNvimPopupLoading",
--         },
--
--         -- Hopefully these do not break existing binds. (WIP)
--         keys = {
--             hide = { "q", "<Esc>" },
--             open_url = { "<CR>" },
--             select = { "<CR>" },
--             select_alt = { "s" },
--             toggle_feature = { "<CR>" },
--             copy_value = { "yy" },
--             goto_item = { "gd", "K", "<C-LeftMouse>" },
--             jump_forward = { "<C-i>" },
--             jump_back = { "<C-o>", "<C-RightMouse>" },
--         },
--     },
--
--     src = {
--         insert_closing_quote = true,
--         text = {
--             prerelease = "  pre-release ",
--             yanked = "  yanked ",
--         },
--         coq = {
--             enabled = false,
--             name = "Crates",
--         },
--     },
--
--     null_ls = {
--         enabled = false,
--         name = "Crates",
--     },
-- })
-- === |> - crates.nvim (END)

-- |> Configure custom mappings. (These mappings do work, but not using dadbod atm.)
-- vim.cmd([[
-- augroup dbui_mappings
-- autocmd!
    -- -- " Dadbod-Completion -> I would like to figure out how to get it to reset on. "
    -- autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'ultisnips', priority = 50 }, { name = 'vim-dadbod-completion', priority = 20 }, { name = 'path' }} })
    -- -- " Dadbod-Mappings "
    -- autocmd FileType dbui nmap <buffer> <Enter> <Plug>(DBUI_SelectLine)
    -- autocmd FileType dbui nmap <buffer> d <Plug>(DBUI_DeleteLine)
    -- autocmd FileType dbui nmap <buffer> <S-r> <Plug>(DBUI_Redraw)
    -- autocmd FileType dbui nmap <buffer> r <Plug>(DBUI_RenameLine)
    -- autocmd FileType dbui nmap <buffer> q <Plug>(DBUI_Quit)
    -- -- " Explore help and github more. "
-- augroup END
-- ]])

--=============================================--+
-- === END - Nvim-cmp Extra Settings - END === --|
--=============================================--+
--|----------------------------------------------|
--======================================================--+
-- === END - Autocompletion Setup -> Nvim-Cmp - END === --|
--======================================================--+
--|------------------------------------|
--===================================--+
-- === START - LSP Setup - START === --|
--===================================--+

-- TODO: Move to lazy plugins directory and lazy-load.

--=========================================--+
-- === START - LSP Keymappings - START === --|
--=========================================--+

-- STATE: Good?

-- |> START -> LSP Attach
-- local nvim_lsp = require("lspconfig")

-- |> START -> Typescript/Javascript LSP 'on_attach' Keybindings and stuff.
-- TODO/WIP: Needs testing, maybe cleanup, maybe further configuration.
-- local ts_lsp_on_attach = function(client, bufnr)
--     local ts_utils = require("nvim-lsp-ts-utils")
--
--     ts_utils.setup({
--         debug = false,
--         disable_commands = false,
--         enable_import_on_completion = false,
--
--         -- Import all.
--         import_all_timeout = 5000,  -- ms
--
--         -- Lower numbers = higher priority
--         import_all_priorities = {
--             same_file = 1,          -- Add to existing import statement.
--             local_files = 2,        -- Git files or files with relative path markers.
--             buffer_content = 3,     -- Loaded buffer content.
--             buffers = 4,            -- Loaded buffer names.
--         },
--
--         import_all_scan_buffers = 100,
--         import_all_select_source = false,
--
--         -- If `false` will avoid organizing imports.
--         always_organize_imports = false,
--
--         -- Filter Diagnostics.
--         filter_out_diagnostics_by_severity = {},
--         filter_out_diagnostics_by_code = {},
--
--         -- Inlay Hints.
--         auto_inlay_hints = true,
--         inlay_hints_highlight = "AumInlayHint",
--         inlay_hints_priority = 200,     -- Priority of the hint extmarks.
--         inlay_hints_throttle = 150,     -- Throttle the inlay hint request.
--         inlay_hints_format = {          -- Format options for individual hint kind.
--             Type = {},
--             Parameter = {},
--             Enum = {},
--         },
--
--         -- Update imports on file move.
--         update_imports_on_move = false,
--         require_confirmation_on_move = false,
--         watch_dir = nil,
--     })
--
--     -- Required to fix Code Action ranges and Filter Diagnostics.
--     ts_utils.setup_client(client)
--
--     -- === - TS-LSP Mappings - ===
--
--     -- Defining TS-Server LSP bindings.
--     local ts_lsp_opts = { noremap = true, silent = true, buffer = true }
--     local keymap = vim.keymap.set
--
--     keymap('n', '<F2>',         vim.lsp.buf.rename,             ts_lsp_opts)    -- STATE: Good  ( I think `dressing.nvim` is overwriting the UI for this, and its good. )
--     keymap('n', 'gh',           vim.lsp.buf.hover,              ts_lsp_opts)    -- STATE: Good, expect that it occasionally lags.   ( Rust-Analyzer, Pyright )
--     keymap('n', 'gd',           vim.lsp.buf.definition,         ts_lsp_opts)    -- STATE: Good  ( Note potential conflicts when using multiple language servers for the same buffer. )
--     keymap('n', '<space>D',     vim.lsp.buf.type_definition,    ts_lsp_opts)    -- STATE: Probably good
--     keymap('n', 'gD',           vim.lsp.buf.declaration,        ts_lsp_opts)    -- STATE: Probably good
--
--     keymap('n', 'gi',           vim.lsp.buf.implementation,     ts_lsp_opts)    -- STATE: Probably good ( TODO: Note potential conflicts when using multiple language servers for the same buffer. )
--                                                                                 -- - I might want to disable this for tsserver and use the one from `css-modules`?
--
--     keymap('n', 'gr',           vim.lsp.buf.references,         ts_lsp_opts)    -- STATE: Bit awkward to use window. Some Aerial-like or Navigator plugin might be better.
--     keymap('n', '<space>ca',    vim.lsp.buf.code_action,        ts_lsp_opts)    -- STATE: Probably good (Bind could be better.)
--
--     keymap('n', '<C-k>',        vim.lsp.buf.signature_help,     ts_lsp_opts)    -- STATE: Good. Displays good info and is responsive.
--
--     keymap('n', '<space>f',     function() vim.lsp.buf.format({ async = true }) end, ts_lsp_opts)  -- STATE: Seems to be good.
--
--     keymap('n', '<space>wa',    vim.lsp.buf.add_workspace_folder,       ts_lsp_opts)    -- STATE: Not sure, not really often used or required.
--     keymap('n', '<space>wr',    vim.lsp.buf.remove_workspace_folder,    ts_lsp_opts)    -- STATE: Not sure, not really often used or required.
--     keymap('n', '<space>wl',    function()                                              -- STATE: Not sure, not really often used or required.
--         print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--     end, ts_lsp_opts)
--
--     -- Show diagnostics in floating window.
--     -- |> Default NvimLSP "open_float" Command.
--     keymap("n", "<Leader>e",    vim.diagnostic.open_float(),    ts_lsp_opts)
--
--     -- Next and Previous Diagnostic.
--     -- |> Nvim-LSP Defaults:
--     keymap("n", "]e",           vim.diagnostic.goto_next(),     ts_lsp_opts)
--     keymap("n", "[e",           vim.diagnostic.goto_prev(),     ts_lsp_opts)
--
--     -- Diagnostics lists.
--     -- |> Default NvimLSP "Diagnostics LocList". (Seems to be the same as qflist)
--     keymap("n", "<Leader>ll",   vim.diagnostic.setloclist(),    ts_lsp_opts)
--     -- |> Default NvimLSP "Diagnostics QF-list". (Seems to work)
--     keymap("n", "<Leader>qf",   vim.diagnostic.setqflist(),     ts_lsp_opts)
--
--     keymap("n", "<Leader>org",  "<Cmd>TSLspOrganize<CR>",       ts_lsp_opts)
--     keymap("n", "<Leader>rn",   "<Cmd>TSLspRenameFile<CR>",     ts_lsp_opts)
--     keymap("n", "<Leader>ia",   "<Cmd>TSLspImportAll<CR>",      ts_lsp_opts)
-- end
-- |> END -> Typescript/Javascript LSP 'on_attach' Keybindings and stuff.

-- |> END -> LSP Attach

--=====================================--+
-- === END - LSP Keymappings - END === --|
--=====================================--+
--|--------------------------------------|
--============================================--+
-- === START - LSP Debugger Paths - START === --|
--============================================--+

-- TODO: Config debuggers.

-- local lldb_path = "/home/aum/git/vscode-lldb/"       -- TODO: This does not work like this.
-- local lldb_adapter_path = lldb_path .. "adapter/codelldb"
-- local liblldb_path = lldb_path .. "lldb/lib/liblldb.so"

--========================================--+
-- === END - LSP Debugger Paths - END === --|
--========================================--+
--|-----------------------------------------|
--==================================================================--+
-- === START - LSP -> ClangD / CCLS / CPP / C++ - Setup - START === --|
--==================================================================--+

-- local lsp_util = require("lspconfig.util")

-- => 'ccls.nvim' setup (STATE: Good / Disabled)
-- require("ccls").setup({
    --lsp = {
        ---- Check `:help vim.lsp.start` for config options.
        --server = {
            --name = "ccls",  -- String name.
--
            --cmd = { "ccls-extra.sh" },  -- Point to your binary, has to be a table.
            --args = {},
            --offset_encoding = "utf-32",  -- Default value set by plugin.
--
            --root_dir = vim.fs.dirname(vim.fs.find({ "compile_commands.json", ".git" }, { upward = true })[1]),
--
            --init_options = {
                --index = {
                    --threads = 0;
                --};
--
                --clang = {
                    --excludeArgs = { "-frounding-math" };
                --};
            --},
--
            ---- |> Fix diagnostics.
            --flags = lsp_flags,
            ---- |> Attach LSP keybindings & other crap.
            --on_attach = aum_general_on_attach,
            ---- |> Add nvim-cmp or snippet completion capabilities.
            --capabilities = aum_capabilities,
            ---- |> Activate custom handlers.
            --handlers = aum_handler_config,
        --},
    --},
--
    --win_config = {
        ---- Sidebar configuration.
        --sidebar = {
            --size = 50,
            --position = "topleft",
            --split = "vnew",
            --width = 50,
            --height = 20,
        --},
--
        ---- Floating window configuration. check :help nvim_open_win for options.
        --float = {
            --style = "minimal",
            --relative = "cursor",
            --width = 50,
            --height = 20,
            --row = 0,
            --col = 0,
            --border = "rounded",
        --},
    --},
--
    --filetypes = {"c", "cpp"},  -- Should this include "h" and "hpp"? ( Low prio TODO: Test )
--})

-- State: Presumably fine, but unused, in favor of `ccls.nvim`.
-- nvim_lsp.clangd.setup({
--     -- |> Fix diagnostics.
--     flags = lsp_flags,
--     -- |> Attach LSP keybindings & other crap.
--     on_attach = aum_general_on_attach,
--     -- |> Add nvim-cmp or snippet completion capabilities.
--     capabilities = aum_capabilities,
--     -- |> Activate custom handlers.
--     handlers = aum_handler_config,
-- })

--=====================================================--+
-- === END - LSP -> CCLS / CPP / C++ - Setup - END === --|
--=====================================================--+
--==============================================--+
-- === START - LSP -> Bash LS Setup - START === --|
--==============================================--+

-- STATE: Good (I think.)
-- nvim_lsp.bashls.setup({
--     cmd = { "bash-language-server", "start" },
--     filetypes = { "sh", "bash" },
--     single_file_support = true,
--     autostart = false,
--
--     -- |> Fix diagnostics.
--     flags = lsp_flags,
--     -- |> Attach LSP keybindings & other crap.
--     on_attach = aum_general_on_attach,
--     -- |> Add completion (nvim-cmp, luasnip) and fold capabilities.
--     capabilities = aum_capabilities,
--     -- |> Activate custom handlers.
--     handlers = aum_handler_config,
-- })

--==========================================--+
-- === END - LSP -> Bash LS Setup - END === --|
--==========================================--+
--|-------------------------------------------|
--==========================================================--+
-- === START - LSP -> Lua Language Server Setup - START === --|
--==========================================================--+

-- nvim_lsp.lua_ls.setup({
--     cmd = { "lua-language-server" },
--     filetypes = { "lua" },
--     single_file_support = true,
--     autostart = false,
--
--     -- |> Fix diagnostics.
--     flags = lsp_flags,
--
--     -- |> Attach LSP keybindings & other crap.
--     on_attach = aum_general_on_attach,
--
--     -- |> Add completion (nvim-cmp, luasnip) and fold capabilities.
--     capabilities = aum_capabilities,
--
--     -- |> Activate custom handlers.
--     handlers = aum_handler_config,
--
--     settings = {
--         Lua = {
--             runtime = {
--                 -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--                 version = "LuaJIT",
--             },
--             diagnostics = {
--                 -- NOTE: Diagnostics from this server cause a lot of message spam and lag. Not too important for Lua, either.
--                 enable = false,
--                 -- Get the language server to recognize the `vim` global
--                 globals = { "vim" },
--                 -- Adjust workspace diagnostics.
--                 workspaceDelay = 50000,
--                 workspaceEvent = "OnSave",
--                 workspaceRate = 50,
--             },
--             workspace = {
--                 -- Optionally make the server aware of Neovim runtime files.
--                 -- NOTE: I suspect this causes lag.
--                 -- library = vim.api.nvim_get_runtime_file("", true),
--                 checkThirdParty = false,
--                 ignoreDir = {
--                     "/plugin/",
--                     "/snippets/",
--                     "/UltiSnips/",
--                 },
--                 maxPreload = 1000,
--                 preloadFileSize = 500,
--             },
--             window = {
--                 progressBar = false,
--                 statusBar = false,
--             },
--             telemetry = {
--                 enable = false,
--             },
--         },
--     }
-- })

--======================================================--+
-- === END - LSP -> Lua Language Server Setup - END === --|
--======================================================--+
--============================================================================--+
-- === START - LSP -> CSS-Modules LangServer Setup - START === --|
--============================================================================--+

-- |> START -> CSS-Modules-LS Setup
-- STATE: Haven't gotten this to work yet.
-- nvim_lsp.cssmodules_ls.setup({
--     cmd = { "cssmodules-language-server" },
--     filetypes = { "html", "javascript", "javascriptreact", "typescript", "typescriptreact" },
--     root_dir = nvim_lsp.util.root_pattern("package.json"),
--
--     autostart = false,
--     single_file_support = false,
--
--     -- Trying to add a extra setting to the default custom values.
--     -- - NOTE: Does this want a buffer number? How do I give it? Does this work?
--     -- - If does not work, try just removing the bufnr parameter.
--     on_attach = function(client, bufnr)
--         -- Avoid accepting `definitionProvider` responses from this LSP
--         client.server_capabilities.definitionProvider = false
--         aum_general_on_attach(client, bufnr)
--     end,
--
--     flags = lsp_flags,
--     capabilities = aum_capabilities,
--     handlers = aum_handler_config,
--
--     -- Not sure if this works like this.
--     -- - NOTE: Implemented in the `on_attach` instead right now.
--     -- settings = {
--     --     cssmodules_ls = {
--     --         capabilities = {
--     --             -- To avoid conflict with `tsserver`.       ( Go to implementation can maybe still be used? )
--     --             definitionProvider = false,
--     --         },
--     --     },
--     -- },
--
--     -- init_options = {}
-- })
-- |> END -> CSS-Modules-LS Setup

--================================================================--+
-- === END - LSP -> CSS Language Servers  Setup - END === --|
--================================================================--+
--|--------------------------------------------------------|
--=======================================================--+
-- === START - LSP -> Python Language Server - START === --|
--=======================================================--+

-- NOTE: Pyright is way better than Jedi-LSP.
-- nvim_lsp.pyright.setup({
--     -- |> Fix diagnostics.
--     flags = lsp_flags,
--
--     -- |> Attach LSP keybindings & other crap.
--     on_attach = aum_general_on_attach,
--
--     -- |> Add completion (nvim-cmp, luasnip) and fold capabilities.
--     capabilities = aum_capabilities,
--
--     -- |> Activate custom handlers.
--     handlers = aum_handler_config,
--
--     cmd = { "pyright-langserver", "--stdio" },
--     filetypes = { "python" },
--     single_file_support = true,
--     autostart = false,
--
--     settings = {
--         pyright = {
--             disableOrganizeImports = false,
--             analysis = {
--                 useLibraryCodeForTypes = true,
--                 autoSearchPaths = true,
--                 diagnosticMode = "workspace",
--                 autoImportCompletions = true,
--             },
--         },
--     },
-- })

--===================================================--+
-- === END - LSP -> Python Language Server - END === --|
--===================================================--+
--|---------------------------------------------------|
--==================================================--+
-- === START - LSP -> Diagnostics Setup - START === --|
--==================================================--+

-- START => trouble.nvim
-- require("trouble").setup({
--     position = "bottom",  -- Position of the list can be: bottom, top, left, righ.
--     height = 10,  -- Height of the trouble list when position is top or botto.
--     width = 50,  -- Width of the list when position is left or righ.
--     icons = true,  -- Use devicons for filename.
--     mode = "workspace_diagnostics",  -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
--     fold_open = "",  -- Icon used for open fold.
--     fold_closed = "",  -- Icon used for closed folds.
--     group = true,  -- Group results by file.
--     padding = true,  -- Add an extra new line on top of the list.
--
--     action_keys = {  -- Key mappings for actions in the trouble list.
--         -- Map to {} to remove a mapping, for example:
--         -- Close = {},
--         close = "q",  -- Close the list. (TODO: Config better)
--         cancel = "<esc>",  -- Cancel the preview and get back to your last window / buffer / cursor.
--         refresh = "r",  -- Manually refresh. (TODO: Config better)
--         jump = {"<cr>", "<tab>"},  -- Jump to the diagnostic or open / close folds.
--         open_split = { "<c-x>" },  -- Open buffer in new split.
--         open_vsplit = { "<c-v>" },  -- Open buffer in new vsplit.
--         open_tab = { "<c-t>" },  -- Open buffer in new tab.
--         jump_close = {"o"},  -- Jump to the diagnostic and close the list. (TODO: Config better)
--         toggle_mode = "m",  -- Toggle between "workspace" and "document" diagnostics mode.
--         toggle_preview = "P",  -- Toggle auto_preview.
--         hover = "K",  -- Opens a small popup with the full multiline message.
--         preview = "p",  -- Preview the diagnostic location.
--         close_folds = {"zM", "zm"},  -- Close all folds.
--         open_folds = {"zR", "zr"},  -- Open all folds.
--         toggle_fold = {"zA", "za"},  -- Toggle fold of current file.
--         previous = "t",  -- Previous item.  (STATE: Good)
--         next = "h"  -- Next item.  (STATE: Good)
--     },
--
--     indent_lines = true,  -- Add an indent guide below the fold icons.
--     auto_open = false,  -- Automatically open the list when you have diagnostics.
--     auto_close = false,  -- Automatically close the list when you have no diagnostics.
--     auto_preview = true,  -- Automatically preview the location of the diagnostic. <esc> to close preview and go back to last window.
--     auto_fold = false,  -- Automatically fold a file trouble list at creation.
--     auto_jump = {"lsp_definitions"},  -- For the given modes, automatically jump if there is only a single result.
--
--     signs = {
--         -- Icons / Text used for a diagnostic.
--         error = "",
--         warning = "",
--         hint = "",
--         information = "",
--         other = "﫠"
--     },
--     use_diagnostic_signs = false  -- Enabling this will use the signs defined in your lsp client.
-- })
-- END => trouble.nvim

--==============================================--+
-- === END - LSP -> Diagnostics Setup - END === --|
--==============================================--+
--|--------------------------------|
--===============================--+
-- === END - LSP Setup - END === --|
--===============================--+

-- |> START -> Floating Terminal Setup
-- require("FTerm").setup({  -- STATE: Good (Though in Neovide the colors are wrong, but no idea how to fix that.)
--     cmd = 'fish',
--     border = 'single',
--     dimensions  = {
--         height = 0.80,
--         width = 0.80,
--     },
--     auto_close = true,
-- })
-- |> END -> Floating Terminal Setup

--=========================================--+
-- === START -> Formatter.nvim - Setup === --|
--=========================================--+

-- STATE: Good for c++. (Run with ':Format')
-- NOTE: Not sure how required this is, as `lsp` has a format option, too.

-- Utilities for creating configurations.
-- local format_util = require("formatter.util")

-- Provides the `Format`, `FormatWrite`, `FormatLock`, and `FormatWriteLock` commands.
-- require("formatter").setup {
--     logging = true,
--     log_level = vim.log.levels.WARN,
--
--     filetype = {
--         cpp = {
--             function()
--                 return {
--                     exe = "clang-format",
--                     args = {
--                         '-style="{BasedOnStyle: LLVM, IndentWidth: 4}"',
--                         "-assume-filename",
--                         format_util.escape_path(format_util.get_current_buffer_file_name()),
--                     },
--                     stdin = true,
--                 }
--             end
--         },
--
--         -- TODO: Haven't really tested this yet.        ( LSP might do a better job. )
--         rust = {
--             require("formatter.filetypes.rust").rustfmt
--         },
--
--         -- TODO: Haven't really tested this yet.
--         lua = {
--             require("formatter.filetypes.lua").stylua
--         },
--
--         -- TODO: Haven't really tested this yet.
--         javascript = {
--             require("formatter.filetypes.javascript").prettier
--         },
--
--         -- Use the special "*" filetype for defining formatter configurations on any filetype.
--         ["*"] = {
--             -- `formatter.filetypes.any` defines default configurations for any filetype.
--             require("formatter.filetypes.any").remove_trailing_whitespace
--         },
--     }
-- }

--=======================================--+
-- === END -> Formatter.nvim - Setup === --|
--=======================================--+

-- |> START -> Zen Mode Setup
-- require("zen-mode").setup({
--     window = {
--         backdrop = 0.92,  -- Shade the backdrop of the Zen window. Set to 1 to keep the same as Normal.
--         width = 0.80,  -- Width of the Zen window (Below 1 values are percentages) (0.80'ish, 110'ish.)
--         height = 0.96,  -- Height of the Zen window (Below 1 values are percentages) (0.96'ish, 42'ish.)
--         options = {
--             -- signcolumn = "no",       -- Disable signcolumn
--             -- number = false,          -- Disable number column
--             -- relativenumber = false,  -- Disable relative numbers
--             -- cursorline = false,      -- Disable cursorline
--             -- cursorcolumn = false,    -- Disable cursor column
--             -- foldcolumn = "0",        -- Disable fold column
--             -- list = false,            -- Disable whitespace characters
--         },
--     },
--
--     plugins = {
--         options = {
--             enabled = true,
--             ruler = false, -- disables the ruler text in the cmd line area
--             showcmd = false, -- disables the command in the last line of the screen
--         },
--         twilight = { enabled = false }, -- enable to start Twilight when zen mode opens
--         gitsigns = { enabled = false }, -- disables git signs
--         tmux = { enabled = false }, -- disables the tmux statusline
--     },
-- })
-- |> END -> Zen Mode Setup


-- -- |> START -> Focus.nvim Setup
-- require("focus").setup({})
-- -- |> END -> Focus.nvim Setup

-- -- |> START -> Pretty-Fold Setup
-- require("pretty-fold").setup({
    -- fill_char = '•',
    -- sections = {
        -- left = {
            -- -- 'content',
        -- },
        -- right = {
            -- -- ' ', 'number_of_folded_lines', ': ', 'percentage', ' ',
            -- function(config) return config.fill_char:rep(3) end
        -- }
    -- },

    -- remove_fold_markers = true,

    -- keep_indentation = true,

    -- -- Possible values:
    -- -- "delete" : Delete all comment signs from the fold string.
    -- -- "spaces" : Replace all comment signs with equal number of spaces.
    -- -- false    : Do nothing with comment signs.
    -- process_comment_signs = false,

    -- add_close_pattern = true, -- true, 'last_line' or false
-- })
-- -- |> END -> Pretty-Fold Setup

-- -- |> START -> Tabout.nvim Setup
-- require('tabout').setup {
    -- tabkey = "<Tab>",
    -- backwards_tabkey = "<S-tab>",
    -- act_as_tab = true,
    -- act_as_shift_tab = false,
    -- enable_backwards = true,
    -- completion = true,
    -- tabouts = {
        -- -- { open = "'", close = "'" },
        -- -- { open = '"', close = '"' },
        -- -- { open = '`', close = '`' },
        -- -- { open = '(', close = ')' },
        -- -- { open = '[', close = ']' },
        -- -- { open = '{', close = '}' }
    -- },
    -- ignore_beginning = true,
    -- exclude = {}
-- }

-- |> START -> VimTex Setup
-- g.vimtex_mappings_enabled = false

-- === |> - Noice.nvim (START)
-- if not g.neovide then
--     require("noice").setup({
--         cmdline = {
--             enabled = true,             -- Enables the Noice cmdline UI.
--             view = "cmdline_popup",     -- View for rendering the cmdline. ( "cmdline" | "cmdline_popup" )
--             opts = {},                  -- Global options for the cmdline. See section on views.
--
--             --@type table<string, CmdlineFormat>
--             format = {
--                 -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
--                 -- view: (default is cmdline view)
--                 -- opts: any options passed to the view
--                 -- icon_hl_group: optional hl_group for the icon
--                 -- title: set to anything or empty string to hide
--                 cmdline = { pattern = "^:", icon = "", lang = "vim" },
--                 search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
--                 search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
--                 filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
--                 lua = { pattern = "^:%s*lua%s+", icon = "", lang = "lua" },
--                 help = { pattern = "^:%s*h%s+", icon = "" },
--                 input = {},  -- Used by input()
--                 -- To disable a format, set to `false`.
--             },
--         },
--
--         messages = {
--             -- NOTE: If you enable messages, then the cmdline is enabled automatically.
--             -- This is a current Neovim limitation.
--             enabled = true,             -- Enables the Noice messages UI.
--             view = "mini",              -- Default view for messages.
--             view_error = "mini",        -- View for errors.
--             view_warn = "mini",         -- View for warnings.
--             view_history = "messages",  -- View for :messages.
--             view_search = false,        -- View for search count messages. Set to `false` to disable.
--         },
--
--         popupmenu = {
--             enabled = true,  -- Enables the Noice popupmenu UI.
--             -- @type "nui" | "cmp"
--             backend = "cmp",  -- Backend to use for showing regular cmdline completions. (This does not seem to make a difference.)
--             -- @type NoicePopupmenuItemKind | false
--             -- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
--             kind_icons = {},  -- Set to `false` to disable icons
--         },
--
--         -- You can add any custom commands below that will be available with `:Noice command`.
--         -- @type table<string, NoiceCommand>
--         commands = {
--             history = {
--                 -- Options for the message history that you get with `:Noice`
--                 view = "split",
--                 opts = { enter = true, format = "details" },
--                 filter = {
--                     any = {
-- --                         { event = "notify" },
-- --                         { error = true },
-- --                         { warning = true },
-- --                         { event = "msg_show" },
-- --                         { event = "lsp", kind = "message" },
--                     },
--                 },
--             },
--
--             -- :Noice last
--             last = {
--                 view = "split",
--                 opts = { enter = true, format = "details" },
--                 filter = {
--                     any = {
-- --                         { event = "notify" },
-- --                         { error = true },
-- --                         { warning = true },
-- --                         { event = "msg_show" },
-- --                         { event = "lsp", kind = "message" },
--                     },
--                 },
--                 filter_opts = { count = 1 },
--             },
--
--             -- :Noice errors
--             errors = {
--                 view = "split",
--                 opts = { enter = true, format = "details" },
--                 filter = { error = true },
--                 filter_opts = { reverse = true },
--             },
--         },
--
--         notify = {
--             enabled = true,
--             view = "notify",
--         },
--
--         lsp = {
--             progress = {  -- This is nice when it only shows the startup progress. Workspace diagnosis messages can get really spammy.
--                 enabled = true,
--                 -- Lsp Progress is formatted using the builtins for lsp_progress. See `config.format.builtin`.
--                 -- See the section on formatting for more details on how to customize.
--                 -- @type NoiceFormat|string
--                 format = "lsp_progress",
--                 -- @type NoiceFormat|string
--                 format_done = "lsp_progress_done",
--                 throttle = 1000 / 30,  -- frequency to update lsp progress message
--                 -- throttle = 2000 / 30,  -- frequency to update lsp progress message
--                 view = "mini",
--             },
--
--             override = {
--                 -- Override the Default LSP Markdown Formatter with Noice.
--                 ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
--                 ["vim.lsp.util.stylize_markdown"] = true,
--                 -- Override `nvim-cmp` documentation with Noice. (Needs the other options to work.)
--                 ["cmp.entry.get_documentation"] = true,
--             },
--
--             -- What does this do exactly?
--             hover = {
--                 enabled = true,
--                 view = "hover", -- When nil, use defaults from documentation.
--                 -- @type NoiceViewOptions
--                 opts = {}  -- Merged with defaults from documentation.
--             },
--
--             signature = {
--                 enabled = true,         -- If this is enabled, the nvim-cmp sig-help should be disabled.
--                 auto_open = {           -- NOTE: `Signature Help` seems to go away when starting to type characters.
--                     enabled = true,
--                     trigger = true,     -- Automatically show signature help when typing a trigger character from the LSP.
--                     luasnip = true,     -- Will open signature help when jumping to Luasnip insert nodes.
--                     throttle = 50,      -- Debounce lsp signature help request by 50-ms.
--                 },
--
--                 view = nil,             -- When nil, use defaults from documentation.
--
--                 -- @type NoiceViewOptions
--                 -- Reference: `https://github.com/folke/noice.nvim/blob/main/lua/noice/config/views.lua`
--                 opts = {  -- Having some issue with the placement of this window. Config here.
--                     view = "popup",
--                     relative = "cursor",
--                     -- NOTE: Having some issue with anchor or position.
--                     anchor = "auto",
--                     position = { row = 2, col = 1 },
--                     zindex = 45,
--                     enter = false,
--
--                     size = {
--                         width = "auto",
--                         height = "auto",
--                         max_height = 16,
--                         max_width = 100,
--                     },
--
--                     border = {
--                         style = "rounded",
--                         padding = { 0, 2 },
--                     },
--
--                     -- Not sure what linebreak does. I probably want to enable wrap.
--                     win_options = {
--                         wrap = false,
--                         linebreak = true,
--                     },
--                 },  -- Merged with defaults from documentation.
--             },
--
--             message = {
--                 -- Messages shown by LSP servers.
--                 enabled = true,
--                 view = "mini",
--                 filter = {
--                     any = {
-- --                         { error = true },
-- --                         { warning = true },
--                     },
--                 }
--             },
--
--             -- Defaults for hover and signature help.
--             documentation = {
--                 view = "hover",
--                 ---@type NoiceViewOptions
--                 opts = {
--                     lang = "markdown",
--                     replace = true,
--                     render = "plain",
--                     format = { "{message}" },
--                     win_options = { concealcursor = "", conceallevel = 2 },
--                 },
--             },
--         },
--
--         markdown = {
--             hover = {
--                 ["|(%S-)|"] = vim.cmd.help,  -- Vim help links.
--                 ["%[.-%]%((%S-)%)"] = require("noice.util").open,  -- Markdown links.
--             },
--
--             highlights = {
--                 ["|%S-|"] = "@text.reference",
--                 ["@%S+"] = "@parameter",
--                 ["^%s*(Parameters:)"] = "@text.title",
--                 ["^%s*(Return:)"] = "@text.title",
--                 ["^%s*(See also:)"] = "@text.title",
--                 ["{%S-}"] = "@parameter",
--             },
--         },
--
--         health = {
--             checker = false,  -- Disable if you don't want health checks to run. (Enable if you do.)
--         },
--
--         smart_move = {
--             -- Noice tries to move out of the way of existing floating windows.
--             enabled = true,
--             -- Add any filetypes here, that shouldn't trigger smart move.
--             excluded_filetypes = { "cmp_menu", "cmp_docs", "notify", "zen-mode", "zen_mode" },
--         },
--
--         -- @type NoicePresets
--         presets = {
--             -- You can enable a preset by setting it to true, or a table that will override the preset config.
--             -- You can also add custom presets that you can enable/disable with `enabled=true`.
--             bottom_search = true,           -- Use a classic bottom cmdline for search.
--             command_palette = true,        -- Position the cmdline and popupmenu together.
--             long_message_to_split = true,   -- Long messages will be sent to a split.
--             inc_rename = false,             -- Enables an input dialog for `inc-rename.nvim`.
--         },
--
--         throttle = 1000 / 30,  -- How frequently does Noice need to check for ui updates? This has no effect when in blocking mode.
--
--         -- @type NoiceConfigViews
--         -- @see section on views
--         views = {
--             mini = {
--                 align = "message-right",
--                 position = {
--                     row = -2,  -- Lifts the messages away from the status bar, so they don't overlap. If `mini` messages are enabled, -2 should be good.
--                     col = "100%",
--                 },
--                 win_options = {
--                     winblend = 0,
--                     winhighlight = {
--                         Normal = "AumNoiceMiniNormal",
--                         IncSearch = "AumNoiceMiniIncSearch",
--                         CurSearch = "AumNoiceMiniCurSearch",
--                         Search = "AumNoiceMiniSearch",
--                     }
--                 }
--             },
--
--             hover = {
--                 relative = "cursor",
--                 anchor = "auto",
--                 position = { row = 2, col = 1 },
--                 zindex = 45,
--                 enter = false,
--
--                 size = {
--                     width = "auto",
--                     height = "auto",
--                     max_height = 42,
--                     max_width = 100,
--                 },
--
--                 border = {
--                     style = "rounded",
--                     padding = { 0, 2 },
--                 },
--
--                 -- Not sure what linebreak does.
--                 win_options = {
--                     wrap = false,
--                     linebreak = true,
--                 },
--             },
--         },
--
--         -- @type NoiceRouteConfig[]
--         routes = {},    -- @see section on routes
--         -- @type table<string, NoiceFilter>
--         status = {},    -- @see section on statusline components
--         -- @type NoiceFormatOptions
--         format = {},    -- @see section on formatting
--     })
-- end
-- === |> - Noice.nvim (END)

-- Jukit:
-- g.jukit_mappings = false
-- g.jukit_terminal = "nvimterm"
-- g.jukit_shell_cmd = "ipython"
-- g.jukit_auto_output_hist = false
-- g.jukit_inline_plotting = false
-- g.jukit_enable_textcell_bg_hl = true
-- g.jukit_enable_textcell_syntax = true

--========================================--+
-- === END - 8. Plugin Settings - END === --|
--========================================--+
--|-----------------------------------------|
--==============================================================================================--+
-- === START - 9. Mappings/Keymaps/Keymappings/Keybindings/Remaps/Shortcuts/Hotkeys - START === --|
--==============================================================================================--+

-- NOTE: Loading binds using `Legendary` takes about 5ms on startup.
-- `legendary.setup()` is called when requiring `good-binds`.
require("keybindings/good-binds")

--==========================================================================================--+
-- === END - 9. Mappings/Keymaps/Keymappings/Keybindings/Remaps/Shortcuts/Hotkeys - END === --|
--==========================================================================================--+
--|----------------------------------------------|
--=============================================--+
-- === START - 10. Custom Commands - START === --|
--=============================================--+

require("config/rust-fzf-rg")

--=========================================--+
-- === END - 10. Custom Commands - END === --|
--=========================================--+

-- End of File

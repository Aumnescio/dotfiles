--==============================================--+
-- === - Aumnescio's Neovim Configuration - === --|
--==============================================--+

-- => Custom plugin state management stuff
require("config/enabled_plugins").create_globals()

-- => Core opts
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
        "--branch=stable",  -- Latest stable release.
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
            -- ["<S-t>"] = function()
            --     require("lazy").home()
            -- end,

            -- NOTE: If these are not set to false, they are created by default, even if the keybindings are commented out.
            ["<LocalLeader>l"] = false,
            ["<LocalLeader>t"] = false,

            -- Testing disabling these, as I don't want them to bound to anything in the Lazy UI.
            -- NOTE: Does not work. The binding for `<S-h>` -> `Home` is still active.
            ["h"] = false,
            ["H"] = false,
            ["<S-h>"] = false,
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

-- This works (not well though) to change the keybinding, but the UI does not update to match.
-- require("lazy.view.config").commands.home.key = "W"
-- require("lazy.view.config").commands.restore.key = "<C-r>"

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

-- -- |> Dadbod-Completion settings.
-- g.completion_chain_complete_list = {sql = {{ complete_items = {"vim-dadbod-completion"} }} }
-- g.completion_matching_strategy_list = {"exact", "substring"}
-- g.completion_matching_ignore_case = 1

-- -- |> Jukit
-- g.jukit_mappings = false
-- g.jukit_terminal = "nvimterm"
-- g.jukit_shell_cmd = "ipython"
-- g.jukit_auto_output_hist = false
-- g.jukit_inline_plotting = false
-- g.jukit_enable_textcell_bg_hl = true
-- g.jukit_enable_textcell_syntax = true

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

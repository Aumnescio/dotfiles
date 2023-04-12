--=====================================--+
-- === Aumnescio's Neovim Settings === --|
--=====================================--+
--|--------------------------------------|
--===========================================--+
-- === START - Table of Contents - START === --|  --=>><⚡START⚡>[
--===========================================--+

-- | 0. API Aliases  --=>><⚡START⚡>[
local g             = vim.g
local opt           = vim.opt
--  --=>><⚡END⚡>]

-- This probably does nothing.
g.do_filetype_lua = true

-- | 1. Essential Settings  --=>><⚡START⚡>[
-- | |> - Hidden                (true)
-- | |> - Swapfile              (false)
-- | |> - Backup                (false)
-- | |> - Autoread              (true)
-- | |> - Error Bell            (false)
--  --=>><⚡END⚡>]

-- | 2. System Settings  --=>><⚡START⚡>[
-- | |> - Mouse                 (enabled)
-- | |> - Clipboard             (enabled)
-- | |> - grep-prg              (ripgrep)
-- | |> - python-path           (set)
-- | |> - Shell                 (set => Fish)
--  --=>><⚡END⚡>]

-- | 3. General Settings  --=>><⚡START⚡>[
-- | |> - Ruler                 (disabled/enabled)
-- | |> - Responsiveness        (fast / instant)
-- | |> - Listchars             (configured)
--  --=>><⚡END⚡>]

-- | 4. Functionality Settings  --=>><⚡START⚡>[
-- | |> - Virtual Space         (true)
-- | |> - Backspace             (enabled / fixed)
-- | |> - Completion popup      (configured)
-- | |> - Indentation           (configured)
-- | |> - Tabs / Spaces         (tab = 4 spaces)
-- | |> - Searching             (incsearch, etc)
-- | |> - Folding               (enabled, manual, marker based)
-- | |> - Scrolling             (some offset)
-- | |> - Splits                (right/bottom)
-- | |> - Wrapping              (off by default)
--  --=>><⚡END⚡>]

-- | 5. Visual Settings  --=>><⚡START⚡>[
-- | |> - Line Numbers          (generally off)
-- | |> - Sign Column           (enabled, smol)
-- | |> - Cursorline            (on/off)
-- | |> - Showmatch             (disabled)
--  --=>><⚡END⚡>]

-- | 6. GUI Settings  --=>><⚡START⚡>[
-- | |> - Colors                (guitermcolors, 16 million colors.)
-- | |> - Font                  (Nerd Font)
--  --=>><⚡END⚡>]

-- | 7. Neovide Settings  --=>><⚡START⚡>[
-- | |> - Refresh Rate          (165)
-- | |> - Cursor Effects        (enabled / fast)
--  --=>><⚡END⚡>]

-- | 8. Plugin Settings  --=>><⚡START⚡>[
-- | |> - Packer                (Plugin Manager)                                    [Installed / STATE: Good]
-- | |> - Treesitter            (Not doing much)                                    [Installed / STATE: Too effin laggy.]
-- | |> - Polyglot              (Syntax highlighting)                               [Installed / STATE: Testing]
-- | |> - LSP                   (Native)                                            [Installed / STATE: Good]
-- | |> - LSP-extras            (trouble, etc)                                      [Installed / STATE: Good]
-- | |> - Rust Tools            (Rust-LSP stuff)                                    [Installed / STATE: Good]
-- | |> - Telescope             (Fuzzy Finder)                                      [Installed / STATE: Good]
-- | |> - fzf                   (Telescope Extension, improved fuzzy-finding)       [Installed / STATE: Good]
-- | |> - Nvim-cmp              (Autocompletion)                                    [Installed / STATE: Good]
-- | |> - Comment.nvim          (Commenting keybindings)                            [Installed / STATE: Good]
-- | |> - Zen-Mode              (zen-mode)                                          [Installed / STATE: Meh]
-- | |> - LuaSnips              (Snippets)                                          [Installed / STATE: Good]
-- | |> - focus.nvim            (Split resizing)                                    [TODO]
-- | |> - Windows.nvim          (Split resizing)                                    [TODO]
-- | |> - And lots of other smaller plugins.                                        [Installed / STATE: Good]
--  --=>><⚡END⚡>]

-- | 9. Keymapping Settings  --=>><⚡START⚡>[
--
-- | NOTE: I use a custom keyboard layout and very configured bindings.
--
-- | |> - h, j, k, l    => q, h, t, e
-- | |> - w, b          => o, n
-- | |> - i             => w
-- | |> - d             => s
-- | |> - c             => k
-- | |> - /             => r
-- | |> - n             => b
-- | |> - l             => :
--
-- Stuff that is (at least mostly) default:
--
-- | |> - v, V
-- | |> - a, A
-- | |> - '.'
--
--  --=>><⚡END⚡>]

--=======================================--+
-- === END - Table of Contents - END === --|  --=>><⚡END⚡>]
--=======================================--+
--|----------------------------------------|
--===============================================--+
-- === START - 1. Essential Settings - START === --|  --=>><⚡START⚡>[
--===============================================--+

-- => STATE: Good

opt.hidden = true           -- Keeps unsaved buffers open in the background. (Seems to be good as 'true' for some reasons.)
opt.swapfile = false        -- Not exactly sure what this is. Default is 'true', but off seems good?
opt.backup = false          -- `false` is default.
opt.writebackup = true      -- `true` is default. Not having this seemed unsafe. (This combo of backups should create backups on save but delete them after successful saves.)
opt.autoread = true         -- Automatically read changed file.
opt.undofile = true         -- Save undo history for all files.

-- |> Error Bell settings.
opt.visualbell = false      -- Don't flash my screen.
opt.errorbells = false      -- No PING/BANG sounds plz.

--===========================================--+
-- === END - 1. Essential Settings - END === --|  --=>><⚡END⚡>]
--===========================================--+
--|--------------------------------------------|
--============================================--+
-- === START - 2. System Settings - START === --|  --=>><⚡START⚡>[
--============================================--+

-- => STATE: Good

opt.mouse = "a"                     -- Enable mouse-support in all modes: "a".
opt.mousehide = true                -- Hide mouse cursor/pointer when typing.

-- Clipboard related things causing major issues, like Neovim not starting up properly or long startup time.
g.clipboard = {                     -- Trying to resolve issues using this. (Enable System-clipboard functionality.)
    name = "xsel",
    copy = {
        ["+"] = "xsel --nodetach -ib",
        ["*"] = "xsel --nodetach -ip"
    },
    paste = {
        ["+"] = "xsel -ob",
        ["*"] = "xsel -op"
    },
    cache_enabled = true,
}
vim.cmd([[set clipboard+=unnamedplus]])  -- Enable System-clipboard functionality. (This might be working well with the above thing.)

opt.grepprg = "rg\\ --vimgrep\\ --noheading\\ --smart-case"     -- Use ripgrep.
opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"                         -- Grep format.
-- g.loaded_python_provider = 1     -- Unsure what this is. Supposed to speed something up.
-- g.python_host_skip_check = 1     -- Unsure what this is. Supposed to speed something up.
-- g.python3_host_skip_check = 1    -- Unsure what this is. Supposed to speed something up.
g.python3_host_prog = "/usr/bin/python3"     -- Path to Python3.
opt.shell = "/usr/bin/fish"         -- Set default shell to fish. (Might cause issues with some stuff so be a tad aware.)
g.tex_flavor = "latex"              -- Set LaTeX flavor. (Changes syntax highlighting.)
opt.formatprg = "fmt"
opt.equalprg = ""                   -- NOTE: I want something else here prolly. Dunno where to find formatter that works on all filetypes.

--========================================--+
-- === END - 2. System Settings - END === --|  --=>><⚡END⚡>]
--========================================--+
--|-----------------------------------------|
--=============================================--+
-- === START - 3. General Settings - START === --|  --=>><⚡START⚡>[
--=============================================--+

-- => STATE: Good

opt.ruler = false               -- Toggle visibility for line/column number in status bar. (They still show up in most statuslines.)
opt.spell = false               -- Toggle spellchecking. (Dynamic toggle: `:set spell` | `:set nospell`) (This is a too intrusive by default.)
opt.spelllang = "en_us"         -- Languages to spellcheck.

-- |> Responsiveness settings.
opt.timeout = false             -- Infinite operator pending wait time.
opt.timeoutlen = 0
-- |> 'ttimeout' is potentially risky at false? (Seems to be working for me.)
opt.ttimeout = false            -- Makes leaving Insert mode using <Esc> faster, so keys don't fuckup.
opt.ttimeoutlen = 8
opt.lazyredraw = false          -- Stop updating screen when running a macro. (If true) (False is more consistently responsive. No freeze.)
opt.updatetime = 50             -- Some update-rate thing to help smoothness.

-- |> Virtual characters.
opt.listchars = "eol:↵,space:·,leadmultispace:.,tab:»›,trail:~,extends:❯,precedes:❮"
opt.fillchars = "eob: "
opt.list = false         -- To toggle: ":set list" and ":set nolist".

-- |> Command line settings.
opt.showmode = false    -- Normal/Insert/Visual Mode command line visiblity toggle
opt.showcmd = false     -- Toggle partial command info in command line.
opt.cmdheight = 1       -- Short command line height. (1 pref without noice, but noice sets this to 0 and its good.)
opt.cmdwinheight = 10   -- Window height of command line history window. (Activated by pressing Ctrl-F in command mode.)

--=========================================--+
-- === END - 3. General Settings - END === --|  --=>><⚡END⚡>]
--=========================================--+
--|------------------------------------------|
--===================================================--+
-- === START - 4. Functionality Settings - START === --|  --=>><⚡START⚡>[
--===================================================--+

-- => STATE: Good

-- |> Misc
-- opt.virtualedit = ""                         -- Virtual Space => Disabled
opt.virtualedit = "all"                         -- Virtual Space => Enabled
opt.backspace = { "indent", "eol", "start" }    -- Backspace functionality.
opt.inccommand = ""                             -- Disable incremental preview of commands, because this is buggy.      ( "nosplit" to enable. )

-- |> Completion popup settings.
-- NOTE: nvim-cmp opts effectively include also "noselect" and "noinsert". (noselect and noinsert are not doing anything.)
opt.completeopt = "menu,menuone,preview,noselect,noinsert"      -- Completion menu settings.    ( Probably quite heavily ignored by `nvim-cmp`. )
opt.pumheight = 12          -- Completion popup menu height.                                    ( `nvim-cmp` ignores this, apparently. )
opt.pumwidth = 64           -- Completion popup menu width.                                     ( `nvim-cmp` ignores this, apparently. )
opt.pumblend = 0            -- Transparency percentage for popup menu. (Prolly prefer no transparency.)
-- NOTE: Wildmenu seems to be active by default in Neovim.

-- |> Indentation Settings. ( STATE: Okay. ) [ NOTE: Can be overwritten by `polyglot.vim` filetype indentation rules. ]
opt.autoindent = true       -- Automatic indentation.
opt.smartindent = true      -- More automatic/smart indentation.
opt.cindent = false         -- Some c-like indentation rule.        ( AutoCmd enabling this for C / C++ files. )
opt.copyindent = true       -- Copy indentation characters from previous line.
opt.preserveindent = false  -- Preserve indent whitespace style.    ( `Tabs` vs `Spaces` I suppose. )
opt.indentkeys = ""         -- Don't reindent when typing characters.

-- Disable removing whitespace automatically. (In practice this probably does absolutely nothing.)
local cpo = "aABceFs_I"
vim.api.nvim_set_option_value('cpoptions', cpo, {})

-- Disable polyglot autoindent.
g.polyglot_disable = {
    "autoindent"
}

-- |> Tabbing settings.
opt.expandtab = true    -- Covenrt Tabs to Spaces automatically.
opt.smarttab = true     -- Navigation on indentation by tab-size.
opt.tabstop = 4         -- Tab-size.
opt.softtabstop = -1    -- -1 Automatically inherits 'tabstop' value.
opt.shiftwidth = 0      -- 0 Automatically inherits 'tabstop' value.

-- |> Search settings.
opt.hlsearch = false    -- No permanent highlight after search.
opt.incsearch = false   -- Highlight search results while typing. ( Generally I really like this, but when using `Noice.nvim`, this is a lil bugged. )
-- NOTE: The highlights flicker during search, and the whole screen flashes when the first search match is off-screen.
opt.ignorecase = true   -- Disable Case-sensitivity from search,
opt.smartcase = true    -- except for when search contains uppercase characters.
opt.wrapscan = true     -- Toggle searching to wrap from end of buffer to beginning of buffer.

-- |> Folding settings.
opt.foldenable = true           -- Folding => Enabled
vim.wo.foldmethod = "manual"    -- Fold Method.
vim.wo.foldmarker = "  --=>><⚡START⚡>[,  --=>><⚡END⚡>]"  -- Fold Markers. (TODO: Change these.)
vim.wo.foldexpr = "0"           -- Fold expression.
opt.foldcolumn = "0"            -- Disable fold icons in sign-column.
opt.foldlevel = 99              -- High value preferred by `nvim-ufo`.
opt.foldlevelstart = 99         -- Start unfolded => 99

-- |> Scrolling settings.
opt.scrolloff = 14      -- Vertical scroll offset.      ( 0-20'ish )                ( NOTE: `neovide --multigrid` doesn't really behave great with scrolloffs. )
opt.sidescrolloff = 6   -- Horizontal scroll offset.    ( 0-10'ish )
opt.sidescroll = 24     -- Number of columns to jump for each `horizontal scroll`.  ( At a low number, this is extremely laggy. )

-- |> Split settings.
opt.splitright = true   -- Split direction right instead of left.
opt.splitbelow = true   -- Split direction below instead of above.

-- |> Wrap settings.
opt.wrap = false            -- Base text wrapping. (Virtual)
opt.linebreak = false       -- Break at specific column instead of last char that fits on screen.
opt.breakindent = true      -- When wrapping, visually indent lines.
opt.breakindentopt = "sbr"  -- `showbreak`
opt.showbreak = "❯ "
-- opt.textwidth = 80          -- Hard break column limit.      ( Enabled for Markdown in autocmd at bottom of file. )

--===============================================--+
-- === END - 4. Functionality Settings - END === --|  --=>><⚡END⚡>]
--===============================================--+
--|------------------------------------------------|
--============================================--+
-- === START - 5. Visual Settings - START === --|  --=>><⚡START⚡>[
--============================================--+

-- => STATE: Good

opt.cursorline = false       -- Visual Line-highlight Toggle.
opt.number = false           -- Line Numbers.
opt.relativenumber = false   -- Relative Line Numbers.
opt.signcolumn = "yes"      -- Signcolumn. (Gutter) (NOTE: 'no' did not fully disable LSP signcolumn.)
opt.showmatch = false       -- Jump to matching pairs when inserting them. (This is horrible. Do not enable.)
opt.laststatus = 3          -- 0 = Never, 3 = Global StatusLine, maybe.
opt.conceallevel = 0        -- Never/Always hide conceal. (0/3)
opt.concealcursor = ""      -- Options: "nivc" - Empty: Disable conceal on cursorline.

--========================================--+
-- === END - 5. Visual Settings - END === --|  --=>><⚡END⚡>]
--========================================--+
--|-----------------------------------------|
--=========================================--+
-- === START - 6. GUI Settings - START === --|  --=>><⚡START⚡>[
--=========================================--+

-- => STATE: In-progress.

opt.termguicolors = true  -- 24-bit colors in terminal ui.
opt.guicursor = "n-v-sm:block,i-c-ci-ve:ver25,r-cr-o:hor20"  -- Cursor Settings

--=====================================--+
-- === END - 6. GUI Settings - END === --|  --=>><⚡END⚡>]
--=====================================--+
--|--------------------------------------|
--===================================================--+
-- === START - 7. Neovide Settings (GUI) - START === --|  --=>><⚡START⚡>[
--===================================================--+

-- => STATE: Good

-- |> Fullscreen / AA / Refresh Rate
g.neovide_no_idle = true
g.neovide_fullscreen = false
g.neovide_remember_window_size = false
g.neovide_input_use_logo = false
g.neovide_cursor_antialiasing = true
g.neovide_refresh_rate = 165
g.neovide_refresh_rate_idle = 165
g.neovide_transparency = 1
g.neovide_scroll_animation_length = 0.24
g.neovide_cursor_unfocused_outline_width = 0.125
g.neovide_confirm_quit = true
g.neovide_hide_mouse_when_typing = true
g.neovide_underline_automatic_scaling = false
g.neovide_profiler = false

-- |> Cursor Effect.
g.neovide_cursor_vfx_mode = "pixiedust"
g.neovide_cursor_vfx_opacity = 150
g.neovide_cursor_vfx_particle_lifetime = 0.90
g.neovide_cursor_vfx_particle_density = 12.0
g.neovide_cursor_vfx_particle_speed = 8.0
g.neovide_cursor_vfx_particle_phase = 2.5
g.neovide_cursor_vfx_particle_curl = 2.5
g.neovide_cursor_animation_length = 0.020
g.neovide_cursor_trail_length = 0.06
g.neovide_curser_animate_in_insert_mode = true
g.neovide_curser_animate_command_line = false

--===============================================--+
-- === END - 7. Neovide Settings (GUI) - END === --|  --=>><⚡END⚡>]
--===============================================--+
--|------------------------------------------------|
--======================================================--+
-- === START - 8. Plugin Settings (Plugins) - START === --|  --=>><⚡START⚡>[
--======================================================--+

-- === |> Packer Plugin Management (Plugins)  --=>><⚡START⚡>[
require("packer").startup({function()

    -- === |> - Misc / Helper  --=>><⚡START⚡>[
    use { "wbthomason/packer.nvim" }                                    -- Plugin Manager               ( STATE: Good )
    use { "nvim-lua/plenary.nvim" }                                     -- Helper functions             ( STATE: Good )
    use { "lewis6991/impatient.nvim" }                                  -- Faster Startup               ( STATE: Good )
    -- === |> - Misc / Helper  --=>><⚡END⚡>]

    -- === |> - Visual / UI  --=>><⚡START⚡>[
    use { "kyazdani42/nvim-web-devicons" }                              -- Icons                        ( STATE: Good )

    use {
        -- NOTE: Very very sadly, treesitter highlighting causes major lag in semi-large files.
        "nvim-treesitter/nvim-treesitter",
        run = function() require("nvim-treesitter.install").update({ with_sync = true }) end,
    }                                                                   -- Treesitter                   ( STATE: Scuffed. Mostly disabled. )

    use { "sheerun/vim-polyglot" }                                      -- Syntax highlighting          ( STATE: Better than treesitter )
    use { "arzg/vim-rust-syntax-ext" }                                  -- Rust Syntax highlighting     ( STATE: Seems really good. Worry that this might not keep up with new rust syntax. )

    use { "m-demare/hlargs.nvim" }                                      -- Highlight arguments          ( STATE: Good )
    use { "onsails/lspkind-nvim" }                                      -- Completion Icons             ( STATE: Good )
    use { "stevearc/dressing.nvim" }                                    -- UI Lib                       ( STATE: Good )
    use { "MunifTanjim/nui.nvim" }                                      -- UI Lib                       ( STATE: Good )
    use { "folke/noice.nvim" }                                          -- UI Thing                     ( STATE: Good, but a bit experimental and unstable. Does not work with Neovide. )
    use { "rcarriga/nvim-notify" }                                      -- Notifications                ( STATE: Okay, not too necessary. )
    -- === |> - Visual / UI  --=>><⚡END⚡>]

    -- === |> - START - LSP / Tooling
    use { "neovim/nvim-lspconfig" }                                     -- LSP                          ( STATE: Good )
    use { "folke/trouble.nvim" }                                        -- DiagViewer                   ( STATE: Good | TODO: Test and config more. )
    use { "simrat39/rust-tools.nvim" }                                  -- Rust-LS ++                   ( STATE: Good )
    use { "ranjithshegde/ccls.nvim" }                                   -- C / C++ LangServer           ( STATE: Okay )
    -- use { "jose-elias-alvarez/nvim-lsp-ts-utils" }                   -- TypeScript-LS ++             ( STATE: Good )
    -- |> Debuggers:
    -- use { "mfussenegger/nvim-dap" }                                  -- Debugger                     ( STATE: Unknown )
    -- use { "rcarriga/nvim-dap-ui" }                                   -- Debug UI                     ( STATE: Unknown )
    -- === |> - END - LSP / Tooling

    -- === |> - START - Navigation
    use { "ggandor/leap.nvim" }                                         -- Fast Jump                    ( STATE: Okay )
    -- === |> - END - Navigation

    -- === |> - START - Autocompletion
    use { "hrsh7th/nvim-cmp" }                                          -- Autocompletion               ( STATE: Good )
    use { "hrsh7th/cmp-nvim-lsp" }                                      -- Nvim-cmp Ext                 ( STATE: Good )
    use { "hrsh7th/cmp-nvim-lua" }                                      -- Nvim-cmp Ext                 ( STATE: Good )
    use { "hrsh7th/cmp-buffer" }                                        -- Nvim-cmp Ext                 ( STATE: Good )
    use { "hrsh7th/cmp-path" }                                          -- Nvim-cmp Ext                 ( STATE: Good )
    use { "hrsh7th/cmp-cmdline" }                                       -- Nvim-cmp Ext                 ( STATE: Good )
    use { "hrsh7th/cmp-nvim-lsp-signature-help" }                       -- Nvim-cmp Ext                 ( STATE: Okay )
    -- |> Snippets
    -- NOTE: Moved to `LuaSnip` because `UltiSnips` causes lag.
    use { "L3MON4D3/LuaSnip", tag = "v1.*" }                            -- Snippets                     ( STATE: Best snippet plugin available, I suppose.  )
    use { "saadparwaiz1/cmp_luasnip" }                                  -- LuaSnip Cmp Source           ( STATE: Good )
    -- use { "windwp/nvim-autopairs" }                                  -- Autopairs                    ( STATE: Issues, moving to custom autopairs implementation. )
    -- === |> - END - Autocompletion

    -- === |> - START - Statusline, Bufferline, Tabline, Winbar
    use { "rebelot/heirline.nvim" }                                     -- UI Bars                      ( STATE: Very good )
    -- === |> - END - Statusline, Bufferline, Tabline, Winbar

    -- === |> - START - File Explorer
    -- use { "kyazdani42/nvim-tree.lua" }                               -- File Explorer                ( STATE: Okay )
    -- Looking to test others like "Carbon.nvim"
    -- Also just getting `zoxide` extension for `Telescope` would cover 90% of this.
    -- === |> - END - File Explorer

    -- |> - START - Terminal
    use { "numToStr/FTerm.nvim" }                                       -- FloatingTerminal             ( STATE: Fine )
    -- |> - END - Terminal

    -- |> - START - Comment Toggling
    use { "numToStr/Comment.nvim" }                                     -- Comment Toggling             ( STATE: Seems good. )
    -- |> - END - Comment Toggling

    -- |> - START - Database stuff
    -- NOTE: Not using any of these at the moment.
    -- use { "tpope/vim-dadbod" }                                       -- Good for activating SQL queries.
    -- use { "kristijanhusak/vim-dadbod-ui" }                           -- This is okay, but not very necessary.
    -- use { "kristijanhusak/vim-dadbod-completion" }                   -- Having mild issues with this.
    -- |> - END - Database stuff

    -- |> - START - Fuzzy Finder (Telescope)
    use { "nvim-telescope/telescope.nvim" }                             -- FuzzyFinder                  ( STATE: Good )
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }    -- Telescope FZF Ext            ( STATE: Good )
    use { "nvim-telescope/telescope-ui-select.nvim" }                   -- Telescope UI Ext             ( STATE: Good )
    -- |> - END - Fuzzy Finder (Telescope)

    -- === |> - START - Interactive Workflow
    use { "luk400/vim-jukit" }                                          -- Jupyter alternative          ( STATE: TODO: Config and Test )
    -- === |> - END - Interactive Workflow

    -- === |> - START - Misc Nice Things - ===
    use { "goolord/alpha-nvim" }                                        -- StartupScreen                ( STATE: Good )
    use { "folke/zen-mode.nvim" }                                       -- Zen-Mode                     ( STATE: Some lag issues, some toggling issues. )
    use { "mhartington/formatter.nvim" }                                -- FormatRunner                 ( STATE: Fine )
    use { "tpope/vim-repeat" }                                          -- Improved Repeat              ( STATE: Good )
    use { "tpope/vim-endwise" }                                         -- Minor Autocompletions        ( STATE: Bit unknown )
    use { "tpope/vim-eunuch" }                                          -- Shell commands from vim.     ( STATE: Bit unknown )
    use { "willothy/moveline.nvim", run = "make" }                      -- Line movement functions.     ( STATE: Quite good, not very necessary. )
    use { "gcmt/wildfire.vim" }                                         -- Expand selection             ( STATE: Better than nothing, but kind of bad. )

    use { "echasnovski/mini.nvim" }                                     -- Cursorword Highlight,        ( STATE: Would be good, if not laggy. )
                                                                        -- & Indent Scope Highlight,    ( STATE: Would be good, if not laggy. )
                                                                        -- & Extra Text Objects,        ( STATE: Good )
                                                                        -- & Surround operations.       ( STATE: Good )
                                                                        -- & other things.              ( STATE: TODO: Test )

    -- Favourites:
    use { "chrisgrieser/nvim-spider" }                                  -- Improved Word Motions.                       ( STATE: Very good, but a bit buggy. )
    use { "mrjones2014/legendary.nvim" }                                -- `Keymap Manager` and `Command Palette`.      ( STATE: Extremely Good )

    -- Folding:
    -- use { "anuvyklack/pretty-fold.nvim" }                            -- Pretty folding               ( STATE: TODO: Re-enable and test. )
    use {                                                               -- Folding                      ( STATE: Okay )
        "kevinhwang91/nvim-ufo",
        requires = "kevinhwang91/promise-async"
    }

    -- Colorization:
    use { "NvChad/nvim-colorizer.lua" }                                 -- Colors in editor             ( STATE: Fine )
    use { "aklt/plantuml-syntax" }                                      -- PlantUML SyntaxHL            ( STATE: Good, but really not used much. )

    -- Misc:
    use { "Saecki/crates.nvim", tag = "v0.3.0" }                        -- Rust Crates Helper           ( STATE: Testing )

    -- Disabled
    -- use { "beauwilliams/focus.nvim" }                                -- SplitResizing                ( STATE: TODO: Re-enable and test. )
    -- use { "abecodes/tabout.nvim" }                                   -- Tabout                       ( STATE: TODO: Re-enable and test. )
    -- use { "lervag/vimtex" }                                          -- LaTeX Support                ( STATE: Unknown )
    -- use { "smjonas/live-command.nvim" }                              -- Live previews                ( STATE: Would love for this to work, but it is jittery and laggy. )

    -- Treesitter Extras:
    -- use { "nvim-treesitter/nvim-treesitter-textobjects" }            -- Textobjects                  ( STATE: Okay, not used much. )
    -- use { "p00f/nvim-ts-rainbow" }                                   -- Multicolor brackets.         ( STATE: Some issues. )
    -- use { "nvim-treesitter/nvim-treesitter-context" }                -- Scope Indicator              ( STATE: Works, but I fear lag. Also bit clunky visually. )
    -- use { "nvim-treesitter/playground" }                             -- Inactive                     ( STATE: Not really used. )

    -- === |> - END - Misc Nice Things - ===
end,

-- Packer commands window opening style. (Floating window with border.)
config = {
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end
    }
}})

--  --=>><⚡END⚡>]

-- |> Impatient Setup -> START  --=>><⚡START⚡>[
require("impatient")
-- |> Impatient Setup -> END  --=>><⚡END⚡>]

-- |> Icon Setup -> START  --=>><⚡START⚡>[
require("nvim-web-devicons").setup({
    default = true
})
-- |> Icon Setup -> END  --=>><⚡END⚡>]

-- |> nvim-notify -> START  --=>><⚡START⚡>[
require("notify").setup({
    background_colour = "#040206",
    fps = 60,
})
-- |> nvim-notify -> END  --=>><⚡END⚡>]

-- Treesitter can't really handle files above 1000 lines long. (Depends somewhat on parsers.)
local function ts_disable(_, bufnr)
    return vim.api.nvim_buf_line_count(bufnr) > 1000
end

-- |> START - Treesitter Setup  --=>><⚡START⚡>[
require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "bash", "fish", "c", "cpp", "cmake", "make", "rust", "go", "python",
        "css", "scss", "html", "javascript", "typescript", "vue", "svelte",
        "lua", "vim", "markdown", "toml", "yaml", "rst", "pug", "json",
        "jsonc", "glsl", "java", "kotlin", "tsx", "regex", "elm", "latex",
        "query", "commonlisp", "v", "markdown_inline", "vimdoc",
    },

    auto_install = false,

    highlight = {
        enable = false,
        disable = function(lang, bufnr)  -- Disable treesitter in help files. (EXTREME speedup => From 0 fps to 165 fps)
            if vim.bo.filetype == "help" or ts_disable(lang, bufnr) then
                return true
            else
                return false
            end
        end,
        additional_vim_regex_highlighting = false,
    },

    indent = {
        enable = false,
    },

    rainbow = {
        enable = false,  -- `true` has some minor issues. Prefer not to have my crap borked.
        extended_mode = false,
        max_file_lines = 3000,
    },

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

    -- NOTE: Disabled atm, but generally okay to use.
    -- playground = {
    --     enable = false,
    --     disable = {},
    --     updatetime = 25, -- Debounced time.
    --     persist_queries = false, -- Whether the query persists across vim sessions
    --     keybindings = {
    --         -- toggle_query_editor = 'o',
    --         toggle_hl_groups = 'i',
    --         -- toggle_injected_languages = 't',
    --         -- toggle_anonymous_nodes = 'a',
    --         toggle_language_display = 'I',
    --         -- focus_language = 'f',
    --         -- unfocus_language = 'F',
    --         update = 'R',
    --         goto_node = '<cr>',
    --         show_help = '?',
    --     },
    -- },
})
-- |> END - Treesitter Setup  --=>><⚡END⚡>]

-- |> START - Leap.nvim Setup  --=>><⚡START⚡>[
-- Bindings are created in `good-binds.lua` file.
-- |> END - Leap.nvim Setup  --=>><⚡END⚡>]

--=============================================--+
-- === START - Nvim-Cmp -> Config  - START === --|  --=>><⚡START⚡>[
--=============================================--+

-- -- |> Dadbod-Completion settings.
-- g.completion_chain_complete_list = {sql = {{ complete_items = {"vim-dadbod-completion"} }} }
-- g.completion_matching_strategy_list = {"exact", "substring"}
-- g.completion_matching_ignore_case = 1

local cmp = require("cmp")
local lspkind = require("lspkind")
local cmpkind = cmp.lsp.CompletionItemKind

local repterm = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

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
require("crates").setup({
    smart_insert = true,
    insert_closing_quote = true,
    avoid_prerelease = true,
    autoload = true,
    autoupdate = true,
    -- autoupdate_throttle = 250,
    loading_indicator = true,
    date_format = "%Y-%m-%d",
    thousands_separator = ".",
    notification_title = "Crates",
    -- curl_args = { "-sL", "--retry", "1" },
    disable_invalid_feature_diagnostic = false,

    text = {
        loading = "   Loading",
        version = "   %s",
        prerelease = "   %s",
        yanked = "   %s",
        nomatch = "   No match",
        upgrade = "   %s",
        error = "   Error fetching crate",
    },

    highlight = {
        loading = "CratesNvimLoading",
        version = "CratesNvimVersion",
        prerelease = "CratesNvimPreRelease",
        yanked = "CratesNvimYanked",
        nomatch = "CratesNvimNoMatch",
        upgrade = "CratesNvimUpgrade",
        error = "CratesNvimError",
    },

    popup = {
        autofocus = false,
        -- hide_on_select = false,
        copy_register = '"',
        style = "minimal",
        border = "none",
        show_version_date = false,
        show_dependency_version = true,
        max_height = 30,
        min_width = 20,
        padding = 1,

        text = {
            title = " %s",
            pill_left = "",
            pill_right = "",
            description = "%s",
            created_label = " created        ",
            created = "%s",
            updated_label = " updated        ",
            updated = "%s",
            downloads_label = " downloads      ",
            downloads = "%s",
            homepage_label = " homepage       ",
            homepage = "%s",
            repository_label = " repository     ",
            repository = "%s",
            documentation_label = " documentation  ",
            documentation = "%s",
            crates_io_label = " crates.io      ",
            crates_io = "%s",
            categories_label = " categories     ",
            keywords_label = " keywords       ",
            version = "  %s",
            prerelease = " %s",
            yanked = " %s",
            version_date = "  %s",
            feature = "  %s",
            enabled = " %s",
            transitive = " %s",
            normal_dependencies_title = " Dependencies",
            build_dependencies_title = " Build dependencies",
            dev_dependencies_title = " Dev dependencies",
            dependency = "  %s",
            optional = " %s",
            dependency_version = "  %s",
            loading = "  ",
        },

        highlight = {
            title = "CratesNvimPopupTitle",
            pill_text = "CratesNvimPopupPillText",
            pill_border = "CratesNvimPopupPillBorder",
            description = "CratesNvimPopupDescription",
            created_label = "CratesNvimPopupLabel",
            created = "CratesNvimPopupValue",
            updated_label = "CratesNvimPopupLabel",
            updated = "CratesNvimPopupValue",
            downloads_label = "CratesNvimPopupLabel",
            downloads = "CratesNvimPopupValue",
            homepage_label = "CratesNvimPopupLabel",
            homepage = "CratesNvimPopupUrl",
            repository_label = "CratesNvimPopupLabel",
            repository = "CratesNvimPopupUrl",
            documentation_label = "CratesNvimPopupLabel",
            documentation = "CratesNvimPopupUrl",
            crates_io_label = "CratesNvimPopupLabel",
            crates_io = "CratesNvimPopupUrl",
            categories_label = "CratesNvimPopupLabel",
            keywords_label = "CratesNvimPopupLabel",
            version = "CratesNvimPopupVersion",
            prerelease = "CratesNvimPopupPreRelease",
            yanked = "CratesNvimPopupYanked",
            version_date = "CratesNvimPopupVersionDate",
            feature = "CratesNvimPopupFeature",
            enabled = "CratesNvimPopupEnabled",
            transitive = "CratesNvimPopupTransitive",
            normal_dependencies_title = "CratesNvimPopupNormalDependenciesTitle",
            build_dependencies_title = "CratesNvimPopupBuildDependenciesTitle",
            dev_dependencies_title = "CratesNvimPopupDevDependenciesTitle",
            dependency = "CratesNvimPopupDependency",
            optional = "CratesNvimPopupOptional",
            dependency_version = "CratesNvimPopupDependencyVersion",
            loading = "CratesNvimPopupLoading",
        },

        -- Hopefully these do not break existing binds. (WIP)
        keys = {
            hide = { "q", "<Esc>" },
            open_url = { "<CR>" },
            select = { "<CR>" },
            select_alt = { "s" },
            toggle_feature = { "<CR>" },
            copy_value = { "yy" },
            goto_item = { "gd", "K", "<C-LeftMouse>" },
            jump_forward = { "<C-i>" },
            jump_back = { "<C-o>", "<C-RightMouse>" },
        },
    },

    src = {
        insert_closing_quote = true,
        text = {
            prerelease = "  pre-release ",
            yanked = "  yanked ",
        },
        coq = {
            enabled = false,
            name = "Crates",
        },
    },

    null_ls = {
        enabled = false,
        name = "Crates",
    },
})
-- === |> - crates.nvim (END)

local luasnip = require("luasnip")

-- |> LuaSnip Config
-- This is unbelievably badly documented. (This might not even be working.)
-- Found example: "https://github.com/L3MON4D3/LuaSnip/blob/master/Examples/snippets.lua"
luasnip.setup({
    -- Even when false, history is being retained. I do not like it.
    history = false,
    enable_autosnippets = true,  -- I suspect I like this. 

    -- A single character wrong in this string makes it fail, like a space after comma.
    update_events = "TextChanged,TextChangedI",  -- Without this, the repeat nodes are really clunky.
    delete_check_events = "TextChanged,InsertLeave",
    -- region_check_events = "CursorMoved,CursorMovedI",  -- Might cause lag.
})

-- |> Loading LuaSnip Snippets - START

-- Snipmate snippets are working. (I will use these snippets for simple snippets.)
require("luasnip.loaders.from_snipmate").load({ paths = { "./snippets" } })

-- Lua snippets are working when created in a file and fetched. (I will use these snippets for more complicated things.)
require("luasnip.loaders.from_lua").load({ paths = { "./snippets" } })

-- LuaSnip `add_snippets` function is not working.
-- require("luasnip/snippets")
-- |> Loading LuaSnip Snippets - END
function AumUberEnter()
    local inside_pairs = false
    local opening_pair = false

    local current_line = vim.api.nvim_get_current_line()

    local cur_row, cur_col = unpack(vim.api.nvim_win_get_cursor(0))

    local char_before_cursor = string.sub(current_line, cur_col, cur_col)
    local char_after_cursor = string.sub(current_line, cur_col + 1, cur_col + 1)

    if (char_before_cursor == "(" and char_after_cursor == ")") then
        inside_pairs = true
    elseif (char_before_cursor == "[" and char_after_cursor == "]") then
        inside_pairs = true
    elseif (char_before_cursor == "{" and char_after_cursor == "}") then
        inside_pairs = true
    end

    if (char_before_cursor == "(") then
        opening_pair = true
    elseif (char_before_cursor == "[") then
        opening_pair = true
    elseif (char_before_cursor == "{") then
        opening_pair = true
    end

    if inside_pairs then
        -- Kind of seems to work, but the buffer kind of flashes. Not visually clean.
        vim.api.nvim_input("<NL><Esc>==<Up><S-a><NL>")
    elseif opening_pair then
        vim.api.nvim_input("<NL>")
    else
        vim.api.nvim_input("<NL>")
    end
end

-- nvim-cmp setup (Core) - START
cmp.setup({
    enabled = function()
        if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
        return true
    end,  -- Disables completion in Telescope.

    -- Large values make this absolutely unuseable. As low as possible is good.
    performance = {  -- STATE: Very good.
        debounce = 12,
        throttle = 12,
    },  -- Supposed to increase overall editor performance, at the cost of completion latency.

    preselect = cmp.PreselectMode.None,  -- Disables automatic preselection. (Enabled because of a bug with preselection: It skipped over snippets.)
    -- Alt: cmp.PreselectMode.Item

    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)    -- For LuaSnip.
        end,
    },  -- Snippet support. (Very good, I think.)

    completion = {
        -- autocomplete = false,  -- This increases performance, but will need to fetch completing manually.
        -- autocomplete = cmp.triggerEvent,  -- Don't know how to use this.
        keyword_length = 3,  -- Only show completion popup after 2 characters have been typed. (Maybe performance increase, compared to lower values.)
        -- NOTE: `buffer` source `keyword_length` is set to 3 below, in source section.
        completeopt = "menu,menuone,preview,noselect,noinsert",  -- I don't feel like noinsert is doing anything, but these work.
        -- NOTE: 'noinsert' probably overwritten by `cmp.ConfirmBehavior.Replace` option in keymaps. (Which is fine.)
    },

    matching = {
        disallow_fuzzy_matching = false,
        disallow_partial_matching = false,
        disallow_prefix_unmatching = false,  -- Not clear what this does. No clear docs. (But set to false because it has worked fine.)
        -- Fuzzy and Partial matching enabled = Good.
    },

    window = {
        completion = {
            border = "rounded",
            winhighlight = "Normal:CmpNormal,FloatBorder:CmpFloatBorder,Pmenu:CmpPmenu,CursorLine:CmpCursorLine,Search:CmpSearch",  -- STATE: Testing
            col_offset = 0,
            side_padding = 0,
            width = 32,
            height = 16,
            max_width = 92,
            max_height = 22,
        },
        documentation = {
            border = "rounded",
            winhighlight = "Normal:CmpDocNormal,FloatBorder:CmpDocFloatBorder,Pmenu:CmpDocPmenu,CursorLine:CmpDocCursorLineSearch,Search:CmpDocSearch,Comment:CmpDocComment",  -- STATE: Testing
            col_offset = 0,
            side_padding = 0,
            max_width = 100,
            max_height = 42,
        }
    },
    
    experimental = {
        -- Testing. ( Probably prefer this off. )
        ghost_text = { hl_group = "AumCmpGhostText" }
    },

    -- Not sure if I need to swap to this new syntax at some point... (Kinda hope not because my stuff is working very well right now.)
    -- mapping = cmp.mapping.preset.insert({})

    mapping = {
        ["<Tab>"] = cmp.mapping({
            c = function()
                if cmp.visible() then
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                else
                    cmp.complete()
                end
            end,
            i = function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end,
            s = function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end,
        }),
        ["<S-Tab>"] = cmp.mapping({
            c = function()
                if cmp.visible() then
                    cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                else
                    cmp.complete()
                end
            end,
            i = function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end,
            s = function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end,
        }),
        ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Replace }), { "i" }),
        ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Replace }), { "i" }),
        ["<C-n>"] = cmp.mapping({
            c = function()
                if cmp.visible() then
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Replace })
                else
                    vim.api.nvim_feedkeys(repterm('<Down>'), 'n', true)
                end
            end,
            i = function(fallback)
                if cmp.visible() then
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Replace })
                else
                    fallback()
                end
            end
        }),
        ["<C-p>"] = cmp.mapping({
            c = function()
                if cmp.visible() then
                    cmp.select_prev_item({ behavior = cmp.SelectBehavior.Replace })
                else
                    vim.api.nvim_feedkeys(repterm('<Up>'), 'n', true)
                end
            end,
            i = function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item({ behavior = cmp.SelectBehavior.Replace })
                else
                    fallback()
                end
            end
        }),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-2), {'i', 'c'}),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(2), {'i', 'c'}),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
        ["<C-e>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            s = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ["<CR>"] = cmp.mapping({
            i = function(fallback)
                if cmp.visible() then
                    cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
                elseif not cmp.confirm({ select = true }) then
                    AumUberEnter()
                else
                    fallback()
                end
            end,
            c = function(fallback)
                if cmp.visible() then
                    cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
                else
                    fallback()
                end
            end
        }),
    },

    -- Completion popup formatting.
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol',
            maxwidth = 32,
            before = function (entry, vim_item)
                return vim_item
            end
        })
    },

    sorting = {
        priority_weight = 3,
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.score,
            cmp.config.compare.kind,
            cmp.config.compare.exact,
            cmp.config.compare.recently_used,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        }
    },

    sources = cmp.config.sources({  -- STATE: Very good.
        { name = "luasnip", priority = 20, keyword_length = 1 },  -- Very high prio because I want snippets to practically always be on top.
        -- Disabled because using Noice.nvim for sig-help.
        -- -- { name = "nvim_lsp_signature_help", priority = 3 },
        { name = "nvim_lua", priority = 2 },
        { name = "nvim_lsp", priority = 2 },
        { name = "path" },
        { name = "crates" },
        { name = "buffer", keyword_length = 500, priority = 1 },  -- This is probably one of the more laggier sources.
        -- Very high `keyword_length` stops this from causing lag, but still allows for buffer completion when manually activating the completion popup.
    }),
})
-- nvim-cmp setup (Core) - END <|--

--=================================================--
-- === START - Nvim-cmp Extra Settings - START === --
--=================================================--

-- START -> Enable cmp signature help in neovide, because Noice might not yet work. (And Noice is disabled in Neovide atm.)
if g.neovide then
    local config = cmp.get_config()

    table.insert(config.sources, {
        name = "nvim_lsp_signature_help",
        option = {
            priority = 3
        },
    })

    cmp.setup(config)
end
-- END -> Enable cmp signature help in neovide, because Noice might not yet work.

--- => NOTE: This caused duplicate parenthesis with some lsp servers. (Rust-Analyzer)
--- => NOTE: Disabled because not required in current setup, but can be useful snippet with other pairs plugins.
--
--- Tags: Autopairs, Smartpairs.
--
-- cmp.event:on("confirm_done", function(event)
--     local item = event.entry:get_completion_item()
--     local parensDisabled = item.data and item.data.funcParensDisabled or false
--     if not parensDisabled and (item.kind == cmpkind.Method or item.kind == cmpkind.Function) then
--         require("pairs.bracket").type_left("(")
--     end
-- end)

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

-- Use buffer source for `/`. (Search)
cmp.setup.cmdline('/', {
    completion = { autocomplete = false },
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
    completion = { autocomplete = false },  -- false => Need to press Tab to activate completion popup.
    sources = cmp.config.sources(
    {
        { name = 'path' }
    },
    {
        { name = 'cmdline' }
    })
})

--=============================================--+
-- === END - Nvim-cmp Extra Settings - END === --|
--=============================================--+
--|----------------------------------------------|
--======================================================--+
-- === END - Autocompletion Setup -> Nvim-Cmp - END === --|  --=>><⚡END⚡>]
--======================================================--+
--|------------------------------------|
--===================================--+
-- === START - LSP Setup - START === --|  --=>><⚡START⚡>[
--===================================--+
--|------------------------------------|
--=========================================--+
-- === START - LSP Keymappings - START === --|  --=>><⚡START⚡>[
--=========================================--+

-- STATE: Good?

-- |> START -> LSP Flags Setup  --=>><⚡START⚡>[
local lsp_flags = {
    allow_incremental_sync = true,  -- This used to be buggy, but maybe it is fine now.
    debounce_text_changes = 200     -- 150 is default, and probably is fine. (This might affect performance and autocompletion latency.)
}
-- |> END -> LSP Flags Setup  --=>><⚡END⚡>]

-- |> START -> LSP Attach  --=>><⚡START⚡>[
local nvim_lsp = require("lspconfig")

-- -> START - LSP-Info Window Border.
require('lspconfig.ui.windows').default_options.border = "rounded"
-- -> END - LSP-Info Window Border.

-- LSP Keybindings. (Mostly here)
local aum_general_on_attach = function(client, bufnr)
    -- Toggle `Semantic Tokens Highlighting`:
    -- client.server_capabilities.semanticTokensProvider = nil      -- Set to `nil` to disable semantic highlights.

    local lsp_opts = { noremap = true, silent = true, buffer = bufnr }
    local keymap = vim.keymap.set

    -- === - LSP Mappings - ===
    keymap('n', '<F2>', vim.lsp.buf.rename, bufopts)                -- STATE: Good (I think `dressing.nvim` is overwriting the UI for this, and its good.)
    keymap('n', 'gh', vim.lsp.buf.hover, bufopts)                   -- STATE: Good, expect that it occasionally lags. (Rust-Analyzer, Pyright)
    keymap('n', 'gd', vim.lsp.buf.definition, bufopts)              -- STATE: Good
    keymap('n', '<space>D', vim.lsp.buf.type_definition, bufopts)   -- STATE: Probably good
    keymap('n', 'gD', vim.lsp.buf.declaration, bufopts)             -- STATE: Probably good
    keymap('n', 'gi', vim.lsp.buf.implementation, bufopts)          -- STATE: Probably good
    keymap('n', 'gr', vim.lsp.buf.references, bufopts)              -- STATE: Bit awkward to use window. Some Aerial-like or Navigator plugin might be better.
    keymap('n', '<space>ca', vim.lsp.buf.code_action, bufopts)      -- STATE: Probably good (Bind could be better.)
    keymap('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)       -- STATE: Good. Displays good info and is responsive. (This seems to be a different one from the Noice provided one.)

    keymap('n', '<space>f', function() vim.lsp.buf.format({ async = true }) end, bufopts)  -- STATE: Seems to be good.

    keymap('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)        -- STATE: Not sure, not really often used or required.
    keymap('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)     -- STATE: Not sure, not really often used or required.
    keymap('n', '<space>wl', function()                                        -- STATE: Not sure, not really often used or required.
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
end

-- -- |> START -> Typescript/Javascript LSP 'on_attach' Keybindings and stuff. (TODO: Probably needs some cleanup or refreshing.)
-- local ts_lsp_on_attach = function(client, bufnr)
    -- local ts_utils = require("nvim-lsp-ts-utils")

    -- ts_utils.setup({
        -- debug = false,
        -- disable_commands = false,
        -- enable_import_on_completion = false,

        -- -- Import all
        -- import_all_timeout = 5000, -- ms

        -- -- Lower numbers = higher priority
        -- import_all_priorities = {
            -- same_file = 1, -- add to existing import statement
            -- local_files = 2, -- git files or files with relative path markers
            -- buffer_content = 3, -- loaded buffer content
            -- buffers = 4, -- loaded buffer names
        -- },

        -- import_all_scan_buffers = 100,
        -- import_all_select_source = false,

        -- -- If false will avoid organizing imports
        -- always_organize_imports = false,

        -- -- Filter Diagnostics
        -- filter_out_diagnostics_by_severity = {},
        -- filter_out_diagnostics_by_code = {},

        -- -- Inlay Hints
        -- auto_inlay_hints = true,
        -- inlay_hints_highlight = "Comment",
        -- inlay_hints_priority = 200, -- priority of the hint extmarks
        -- inlay_hints_throttle = 150, -- throttle the inlay hint request
        -- inlay_hints_format = { -- format options for individual hint kind
            -- Type = {},
            -- Parameter = {},
            -- Enum = {},
        -- },

        -- -- update imports on file move
        -- update_imports_on_move = false,
        -- require_confirmation_on_move = false,
        -- watch_dir = nil,
    -- })

    -- -- required to fix code action ranges and filter diagnostics
    -- ts_utils.setup_client(client)

    -- -- === - LSP Mappings - ===

    -- -- Defining TS-Server LSP bindings.
    -- local ts_lsp_opts = { noremap = true, silent = true, buffer = true }

    -- -- Rename.
    -- -- |> Command from: LSP-Saga:
    -- vim.keymap.set("n", "<F2>", "<Cmd>lua require('lspsaga.rename').rename()<CR>", ts_lsp_opts)

    -- -- Go to definition.
    -- -- |> Default NvimLSP "go-to-definition" Command.
    -- vim.keymap.set("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", ts_lsp_opts)

    -- -- Preview Definition
    -- -- |> LSP-Saga "preview- definition" Command:
    -- vim.keymap.set("n", "<Leader>gd", "<Cmd>lua require('lspsaga.provider').preview_definition()<CR>", ts_lsp_opts)

    -- -- Type definition. (?) (Not sure what this does.)
    -- -- |> Default NvimLSP "type definition" Command.
    -- vim.keymap.set("n", "<Leader>D", "<Cmd>lua vim.lsp.buf.type_definition()<CR>", ts_lsp_opts)

    -- -- Declaration. (?) (Not sure what this does.)
    -- -- |> Default NvimLSP "declaration" Command.
    -- vim.keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", ts_lsp_opts)

    -- -- LSP-Saga Definition Finder Command:
    -- vim.keymap.set("n", "ge", '<Cmd>lua require("lspsaga.provider").lsp_finder()<CR>', ts_lsp_opts)

    -- -- Show info about stuff under cursor. (Potentially also Code Actions)
    -- -- |> Default NvimLSP "hover" Command. (I suspect Rust-Tools is hooking into this, or replacing it.)
    -- vim.keymap.set("n", "gh", "<Cmd>lua vim.lsp.buf.hover()<CR>", ts_lsp_opts)

    -- -- LSP-Saga HoverDocs Command:
    -- vim.keymap.set("n", "gw", '<Cmd>lua require("lspsaga.hover").render_hover_doc()<CR>', ts_lsp_opts)
    -- -- LSP-Saga Doc Scrolling:
    -- -- NOTE: Hopefully they don't conflict with other stuff.
    -- -- vim.keymap.set("n", "<C-f>", '<Cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', ts_lsp_opts)
    -- -- vim.keymap.set("n", "<C-b>", '<Cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', ts_lsp_opts)

    -- -- (Go to) Implementation (Not sure what this does.)
    -- -- |> Default NvimLSP "implementation" Command.
    -- vim.keymap.set("n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", ts_lsp_opts)

    -- -- Signature Help
    -- -- |> Default NvimLSP "signature help" Command.
    -- vim.keymap.set("n", "<Leader>j", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", ts_lsp_opts)
    -- -- |> LSP-Saga "signature help" Command.
    -- vim.keymap.set("n", "<Leader>sh", "<Cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", ts_lsp_opts)

    -- -- Workspace things.
    -- -- vim.keymap.set("n", "<space>wa", "<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", ts_lsp_opts)
    -- -- vim.keymap.set("n", "<space>wr", "<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", ts_lsp_opts)
    -- -- vim.keymap.set("n", "<space>wl", "<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", ts_lsp_opts)

    -- -- Code Actions.
    -- -- |> LSP-Saga Code Action Command:
    -- vim.keymap.set("n", "<Leader>ca", "<Cmd>Lspsaga code_action<CR>", ts_lsp_opts)
    -- -- |> Default NvimLSP "code-action" Command:
    -- -- vim.keymap.set("n", "<space>ca", "<Cmd>lua vim.lsp.buf.code_action()<CR>", ts_lsp_opts)

    -- -- References.
    -- -- NOTE: Keybinding okay. ('gr' -> Get References)
    -- -- |> Default NvimLSP "references" Command. (Seems to work, but weak UI.)
    -- vim.keymap.set("n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", ts_lsp_opts)

    -- -- Show diagnostics in floating window. (Manual keybinding. Automatic diagnostics also exist.)
    -- -- NOTE: Keybinding okay. ('<Space>e' -> Show Errors)
    -- -- |> Default NvimLSP "open_float" Command. (Seems to work)
    -- vim.keymap.set("n", "<Leader>e", "<Cmd>lua vim.diagnostic.open_float()<CR>", ts_lsp_opts)
    -- -- |> LSP-Saga "Show Diagnostics" Command:
    -- vim.keymap.set("n", "<Leader>w", "<Cmd>lua require('lspsaga.diagnostic').show_line_diagnostics()<CR>", ts_lsp_opts)

    -- -- Next and Previous Diagnostic. (NOTE: Testing Saga commands.)
    -- -- |> LSP-Saga Commands:
    -- vim.keymap.set("n", "]d", "<Cmd>Lspsaga diagnostic_jump_next<CR>", ts_lsp_opts)
    -- vim.keymap.set("n", "[d", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", ts_lsp_opts)
    -- -- |> Nvim-LSP Defaults:
    -- -- vim.keymap.set("n", "]d", "<Cmd>lua vim.diagnostic.goto_next()<CR>", ts_lsp_opts)
    -- -- vim.keymap.set("n", "[d", "<Cmd>lua vim.diagnostic.goto_prev()<CR>", ts_lsp_opts)

    -- -- Diagnostics lists.
    -- -- |> Default NvimLSP "Diagnostics LocList". (Seems to be the same as qflist)
    -- vim.keymap.set("n", "<Leader>ll", "<Cmd>lua vim.diagnostic.setloclist()<CR>", ts_lsp_opts)
    -- -- |> Default NvimLSP "Diagnostics QF-list". (Seems to work)
    -- vim.keymap.set("n", "<Leader>qf", "<Cmd>lua vim.diagnostic.setqflist()<CR>", ts_lsp_opts)

    -- -- Formatting.
    -- -- |> Default NvimLSP "format" Command. (Seems to work)
    -- vim.keymap.set("n", "<Leader>fmt", "<Cmd>lua vim.lsp.buf.formatting_sync()<CR>", ts_lsp_opts)

    -- vim.keymap.set("n", "<Leader>org", ":TSLspOrganize<CR>", ts_lsp_opts)
    -- vim.keymap.set("n", "<Leader>rn", ":TSLspRenameFile<CR>", ts_lsp_opts)
    -- vim.keymap.set("n", "<Leader>ia", ":TSLspImportAll<CR>", ts_lsp_opts)
-- end
-- |> END -> Typescript/Javascript LSP 'on_attach' Keybindings and stuff.

-- |> END -> LSP Attach  --=>><⚡END⚡>[

--=====================================--+
-- === END - LSP Keymappings - END === --|  --=>><⚡END⚡>]
--=====================================--+
--|--------------------------------------|
--=======================================================--+
-- === - START - Custom Capabilities For LSP - START === --|  --=>><⚡START⚡>[
--=======================================================--+

-- |> Add this on each server, as "capabilities = aum_capabilities".
-- |> NOTE: Though it somehow seemed to work without it.
local aum_capabilities = require("cmp_nvim_lsp").default_capabilities();

-- Not sure if this works like this. This is for `nvim-ufo`.    ( Folding does seem to be working. )
aum_capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

-- |> START - UltraFold Setup  --=>><⚡START⚡>]
local ufo_handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = ('  %d '):format(endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    
    for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        
        if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
        else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, {chunkText, hlGroup})
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            
            if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            
            break
        end
        
        curWidth = curWidth + chunkWidth
    end
    
    table.insert(newVirtText, {suffix, 'MoreMsg'})
    
    return newVirtText
end

require("ufo").setup({
    provider_selector = function(bufnr, filetype, buftype)
        if filetype == "markdown" then
            return { "treesitter", "indent" }
        end
    end,

    open_fold_hl_timeout = 120,

    fold_virt_text_handler = ufo_handler,
})
-- |> END - UltraFold Setup  --=>><⚡END⚡>]

--=================================================--+
-- === END - Custom Capabilities For LSP - END === --|  --=>><⚡END⚡>]
--=================================================--+
--|--------------------------------------------------|
--===========================================================================--+
-- === START - LSP Handler, UI Customization & Diagnostics Setup - START === --|  --=>><⚡START⚡>[
--===========================================================================--+

-- Border characters (STATE: Good) (Using with `JetBrainsMono Nerd Font` font.)
local my_border = {
    {"╭", "FloatBorder"}, {"─", "FloatBorder"},
    {"╮", "FloatBorder"}, {"│", "FloatBorder"},
    {"╯", "FloatBorder"}, {"─", "FloatBorder"},
    {"╰", "FloatBorder"}, {"│", "FloatBorder"}
}

-- LSP Handler Setup, UI customization. (For overriding per client)
-- NOTE: There is a good chance `Noice.nvim` or `nui.nvim` overwrite these. (TODO: Test without these?)
local aum_handler_config = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = my_border }),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = my_border }),
}

--=======================================================================--+
-- === END - LSP Handler, UI Customization & Diagnostics Setup - END === --|  --=>><⚡END⚡>]
--=======================================================================--+
--|---------------------------------------------|
--============================================--+
-- === START - LSP Debugger Paths - START === --|  --=>><⚡START⚡>[
--============================================--+

-- TODO: Config debuggers.

-- local lldb_path = "/home/aumnescio/git/vscode-lldb/"
-- local lldb_adapter_path = lldb_path .. "adapter/codelldb"
-- local liblldb_path = lldb_path .. "lldb/lib/liblldb.so"

--========================================--+
-- === END - LSP Debugger Paths - END === --|  --=>><⚡END⚡>]
--========================================--+
--|-----------------------------------------|
--==================================================================--+
-- === START - LSP -> ClangD / CCLS / CPP / C++ - Setup - START === --|  --=>><⚡START⚡>[
--==================================================================--+

-- local lsp_util = require("lspconfig.util")

-- => 'ccls.nvim' setup (STATE: Good)
-- require("ccls").setup({
    --lsp = {
        ---- Check `:help vim.lsp.start` for config options.
        --server = {
            --name = "ccls",  -- String name.
--
            --cmd = { "ccls-extra.sh" },  -- Point to your binary, has to be a table.
            --args = {},
--
            ---- autostart = false,  -- Does not seem to work here. (TODO: Solve how to stop servers from autostarting.)
--
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

-- State: Presumably good, but unused, in favor of `ccls.nvim`.
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

--=========================================================--+
-- === END - LSP -> CCLS / CPP / C++ - Setup - END === --|  --=>><⚡END⚡>]
--=========================================================--+
--|-----------------------------------------|
--====================================================--+
-- === START - LSP -> Rust-analyzer Setup - START === --|  --=>><⚡START⚡>[
--====================================================--+

-- |> Rust LSP / rust-analyzer Setup (STATE: Good)
require("rust-tools").setup({
    tools = { -- rust-tools options
        -- How to execute terminal commands.
        -- Options right now: termopen / quickfix
        executor = require("rust-tools/executors").termopen,

        -- Callback to execute once rust-analyzer is done initializing the workspace.
        -- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
        on_initialized = nil,

        -- Automatically call RustReloadWorkspace when writing to a Cargo.toml file.
        reload_workspace_from_cargo_toml = true,

        -- These apply to the default RustSetInlayHints command.
        inlay_hints = {
            -- Automatically set inlay hints. (type hints)
            -- Default: true
            auto = true,

            -- Only show inlay hints for the current line.
            only_current_line = false,

            -- Whether to show parameter hints with the inlay hints or not.
            -- Default: true
            show_parameter_hints = true,

            -- Prefix for parameter hints.
            -- Default: "<-"
            parameter_hints_prefix = "<- ",

            -- Prefix for all the other hints. (type, chaining)
            -- Default: "=>"
            other_hints_prefix = "=> ",

            -- Whether to align to the length of the longest line in the file.
            max_len_align = false,

            -- Padding from the left if `max_len_align` is `true`.
            max_len_align_padding = 1,

            -- Whether to align to the extreme right or not.
            right_align = false,

            -- Padding from the right if `right_align` is `true`.
            right_align_padding = 7,

            -- The color of the hints.
            highlight = "AumRustToolsInlayHint",  -- Configured in my theme: `Aumnechroma`.
        },

        -- Options same as lsp hover / vim.lsp.util.open_floating_preview()
        hover_actions = {
            border = my_border,  -- Should be ok.
            auto_focus = false,
        },

        -- This is just copy paste from rust-tools github and not yet tested. (TODO, low prio)
        crate_graph = {
            -- Backend used for displaying the graph
            -- See: https://graphviz.org/docs/outputs/
            -- default: x11
            backend = "x11",
            -- Where to store the output, nil for no output stored.
            -- (relative path from pwd)
            -- Default: nil
            output = nil,
            -- True for all crates.io and external crates, false only the local
            -- crates.
            -- Default: true
            full = true,

            -- List of backends found on: https://graphviz.org/docs/outputs/
            -- Is used for input validation and autocompletion.
            -- Last updated: 2021-08-26
            enabled_graphviz_backends = {
                "bmp",
                "cgimage",
                "canon",
                "dot",
                "gv",
                "xdot",
                "xdot1.2",
                "xdot1.4",
                "eps",
                "exr",
                "fig",
                "gd",
                "gd2",
                "gif",
                "gtk",
                "ico",
                "cmap",
                "ismap",
                "imap",
                "cmapx",
                "imap_np",
                "cmapx_np",
                "jpg",
                "jpeg",
                "jpe",
                "jp2",
                "json",
                "json0",
                "dot_json",
                "xdot_json",
                "pdf",
                "pic",
                "pct",
                "pict",
                "plain",
                "plain-ext",
                "png",
                "pov",
                "ps",
                "ps2",
                "psd",
                "sgi",
                "svg",
                "svgz",
                "tga",
                "tiff",
                "tif",
                "tk",
                "vml",
                "vmlz",
                "wbmp",
                "webp",
                "xlib",
                "x11",
            },
        },
    },

    -- All the opts to send to nvim-lspconfig.
    -- These override the defaults set by rust-tools.nvim.
    -- See https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
    server = {
        -- |> Disable autostart.
        -- REASON: For light editing, starting up LSP is too heavy. Easy to startup if one wants it active.
        autostart = false,  -- This works.
        -- autostart = true,  -- If want autostart.

        -- |> Fix diagnostics.
        flags = lsp_flags,

        -- |> Attach LSP keybindings & other crap.
        on_attach = aum_general_on_attach,

        -- |> Add nvim-cmp or snippet completion capabilities.
        capabilities = aum_capabilities,

        -- |> Activate custom handlers.
        handlers = aum_handler_config,

        -- |> Set 'Standalone File' support. ( '.rs' Files outside of cargo projects. )
        -- NOTE: Cargo projects are easy enough to create, and `false` may improve startup time.
        standalone = false,

        -- |> |settings| is for Language Server specific settings. (In this case, rust-analyzer.)
        settings = {
            ["rust-analyzer"] = {
                diagnostics = {
                    enable = true,
                    enableExperimental = false
                },
                imports = {
                    granularity = {
                        group = "module",
                    },
                    prefix = "self",
                },
                cargo = {
                    buildScripts = {
                        enable = true,
                    },
                },
                procMacro = {
                    enable = true,
                },
                checkOnSave = {
                    -- command = "check",  -- This causes some lag.
                    command = "clippy",  -- Might cause even more lag.
                    -- Can also set to `"check"`, but `clippy` is a superset.

                    -- Testing these, if they affect performance. (No idea, but it doesn't seem to have broken anything.)
                    extraArgs = {
                        "--target-dir",
                        "/tmp/rust-analyzer-check"
                    }
                },
            }
        },
    },

    -- Debugging stuff. (TODO, low'ish prio)
    dap = {
        adapter = {
            type = "executable",
            command = "/usr/bin/lldb-vscode-14",  -- This might change as things get updated, I suppose.
            name = "rt_lldb",
        },
    },
})

--================================================--+
-- === END - LSP -> Rust-analyzer Setup - END === --|  --=>><⚡END⚡>]
--================================================--+
--|-----------------------------------------------|
--==============================================--+
-- === START - LSP -> Bash LS Setup - START === --|  --=>><⚡START⚡>[
--==============================================--+

-- STATE: Good (I think.)
nvim_lsp.bashls.setup({
    cmd = { "bash-language-server", "start" },
    filetypes = { "sh", "bash" },
    single_file_support = true,
    autostart = false,

    -- |> Fix diagnostics.
    flags = lsp_flags,
    -- |> Attach LSP keybindings & other crap.
    on_attach = aum_general_on_attach,
    -- |> Add completion (nvim-cmp, luasnip) and fold capabilities.
    capabilities = aum_capabilities,
    -- |> Activate custom handlers.
    handlers = aum_handler_config,
})

--==========================================--+
-- === END - LSP -> Bash LS Setup - END === --|  --=>><⚡END⚡>]
--==========================================--+
--|-------------------------------------------|
--==========================================================--+
-- === START - LSP -> Lua Language Server Setup - START === --|  --=>><⚡START⚡>[
--==========================================================--+

nvim_lsp.lua_ls.setup({
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    single_file_support = true,
    autostart = false,

    -- |> Fix diagnostics.
    flags = lsp_flags,

    -- |> Attach LSP keybindings & other crap.
    on_attach = aum_general_on_attach,

    -- |> Add completion (nvim-cmp, luasnip) and fold capabilities.
    capabilities = aum_capabilities,

    -- |> Activate custom handlers.
    handlers = aum_handler_config,

    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
            },
            diagnostics = {
                -- NOTE: Diagnostics from this server cause a lot of message spam and lag. Not too important for Lua, either.
                enable = false,
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
                -- Adjust workspace diagnostics.
                workspaceDelay = 50000,
                workspaceEvent = "OnSave",
                workspaceRate = 50,
            },
            workspace = {
                -- Optionally make the server aware of Neovim runtime files.
                -- NOTE: I suspect this causes lag.
                -- library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
                ignoreDir = {
                    "/plugin/",
                    "/snippets/",
                    "/UltiSnips/",
                },
                maxPreload = 1000,
                preloadFileSize = 500,
            },
            window = {
                progressBar = false,
                statusBar = false,
            },
            telemetry = {
                enable = false,
            },
        },
    }
})

--======================================================--+
-- === END - LSP -> Lua Language Server Setup - END === --|  --=>><⚡END⚡>]
--======================================================--+
--|-------------------------------------------------------|
--===============================================================--+
-- === START - LSP -> JavaScript/TypeScript LS Setup - START === --|  --=>><⚡START⚡>[
--===============================================================--+

-- |> TS-Server (STATE: Okay)
-- nvim_lsp.tsserver.setup({
    -- init_options = require("nvim-lsp-ts-utils").init_options,

    -- -- |> On Attach
    -- on_attach = ts_lsp_on_attach,

    -- -- |> Add nvim-cmp or snippet completion capabilities.
    -- capabilities = aum_capabilities,

    -- -- |> Activate custom handlers.
    -- handlers = aum_handler_config,

    -- -- |> Fix diagnostics.
    -- flags = lsp_flags
-- })

--===========================================================--+
-- === END - LSP -> JavaScript/TypeScript LS Setup - END === --|  --=>><⚡END⚡>]
--===========================================================--+
--|---------------------------------------------------------|
--========================================================--+
-- === START - LSP -> Svelte LangServer Setup - START === --|  --=>><⚡START⚡>[
--========================================================--+

-- nvim_lsp.svelte.setup({
    -- cmd = { "svelteserver", "--stdio" },
    -- filetypes = { "svelte" },
    -- root_dir = nvim_lsp.util.root_pattern("package.json", ".git"),

    -- -- |> Fix diagnostics.
    -- flags = lsp_flags,

    -- -- |> Attach LSP keybindings & other crap.
    -- on_attach = aum_general_on_attach,

    -- -- |> Add nvim-cmp or snippet completion capabilities.
    -- capabilities = aum_capabilities,

    -- -- |> Activate custom handlers.
    -- handlers = aum_handler_config,
-- })

--====================================================--+
-- === END - LSP -> Svelte LangServer Setup - END === --|  --=>><⚡END⚡>]
--====================================================--+
--|--------------------------------------------|
--============================================================--+
-- === START - LSP -> HTML/Emmet LangServer Setup - START === --|  --=>><⚡START⚡>[
--============================================================--+

-- |> START -> Emmet-LS Setup  --=>><⚡START⚡>[

-- STATE: Okay'ish?

-- nvim_lsp.emmet_ls.setup({
    -- cmd = { "emmet-ls", "--stdio" },
    -- filetypes = { "html", "css", "scss" },
    -- root_dir = nvim_lsp.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git") or bufdir,

    -- -- |> Fix diagnostics.
    -- flags = lsp_flags,

    -- -- |> Attach LSP keybindings & other crap.
    -- on_attach = aum_general_on_attach,

    -- -- |> Add nvim-cmp or snippet completion capabilities.
    -- capabilities = aum_capabilities,

    -- -- |> Activate custom handlers.
    -- handlers = aum_handler_config,
-- })
-- |> END -> Emmet-LS Setup  --=>><⚡END⚡>]

-- |> START -> HTML-LS Setup  --=>><⚡START⚡>[

-- STATE: Does almost nothing.

-- nvim_lsp.html.setup({
    -- cmd = { "vscode-html-language-server", "--stdio" },

    -- filetypes = { "html" },

    -- init_options = {
        -- configurationSection = { "html", "css", "javascript" },
        -- embeddedLanguages = {
            -- css = true,
            -- javascript = true
        -- },
        -- provideFormatter = true
    -- },

    -- root_dir = nvim_lsp.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
    -- settings = {},
    -- single_file_support = true,

    -- -- |> Fix diagnostics.
    -- flags = lsp_flags,

    -- -- |> Attach LSP keybindings & other crap.
    -- on_attach = aum_general_on_attach,

    -- -- |> Add nvim-cmp or snippet completion capabilities.
    -- capabilities = aum_capabilities,

    -- -- |> Activate custom handlers.
    -- handlers = aum_handler_config,
-- })
-- |> END -> HTML-LS Setup  --=>><⚡END⚡>]

--=============================================--+
-- === END - LSP -> HTML/Emmet Setup - END === --|  --=>><⚡END⚡>]
--=============================================--+
--|----------------------------------------|
--===================================================================--+
-- === START - LSP -> CSS & TailwindCSS LangServer Setup - START === --|  --=>><⚡START⚡>[
--===================================================================--+

-- |> START -> CSS-LS Setup  --=>><⚡START⚡>[
-- STATE: Weak. Disabled ATM.
-- NOTE: Does not seem to provide Autocompletion of any kind.
-- nvim_lsp.cssls.setup({
--     cmd = { "vscode-css-language-server", "--stdio" },

--     filetypes = { "css", "scss", "less" },

--     root_dir = nvim_lsp.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git") or bufdir,

--     settings = {
--         css = {
--             validate = true,
--             lint = {
--                 idSelector = "warning",
--                 zeroUnits = "warning",
--                 duplicateProperties = "warning"
--             },
--             completion = {
--                 completePropertyWithSemicolon = true,
--                 triggerPropertyValueCompletion = true
--             }
--         },

--         less = {
--             validate = true
--         },

--         scss = {
--             validate = true,
--             lint = {
--                 idSelector = "warning",
--                 zeroUnits = "warning",
--                 duplicateProperties = "warning"
--             },
--             completion = {
--                 completePropertyWithSemicolon = true,
--                 triggerPropertyValueCompletion = true
--             }
--         }
--     },

--     single_file_support = true,

--     |> Fix diagnostics.
--     flags = lsp_flags,

--     |> Attach LSP keybindings & other crap.
--     on_attach = aum_general_on_attach,

--     |> Add nvim-cmp or snippet completion capabilities.
--     capabilities = aum_capabilities,

--     |> Activate custom handlers.
--     handlers = aum_handler_config,
-- })
-- |> END -> CSS-LS Setup  --=>><⚡END⚡>]

-- |> START -> TailwindCSS-LS  --=>><⚡START⚡>[
-- nvim_lsp.tailwindcss.setup({
    -- cmd = { "tailwindcss-language-server", "--stdio" },

    -- filetypes = {
        -- -- "html", "css", "postcss", "sass", "scss",
        -- -- "javascript", "javascriptreact", "typescript", "typescriptreact",
        -- -- "vue", "svelte"
    -- },

    -- init_options = {
        -- userLanguages = {
            -- eelixir = "html-eex",
            -- eruby = "erb"
        -- }
    -- },

    -- on_new_config = function(new_config)
        -- if not new_config.settings then
            -- new_config.settings = {}
        -- end
        -- if not new_config.settings.editor then
            -- new_config.settings.editor = {}
        -- end
        -- if not new_config.settings.editor.tabSize then
            -- -- set tab size for hover
            -- new_config.settings.editor.tabSize = vim.lsp.util.get_effective_tabstop()
        -- end
    -- end,

    -- root_dir = nvim_lsp.util.root_pattern("package.json", ".git", "tailwind.config.js", "tailwind.config.ts", "postcss.config.js", "postcss.config.ts") or bufdir,

    -- settings = {
        -- tailwindCSS = {
            -- classAttributes = { "class", "className", "classList", "ngClass" },
            -- lint = {
                -- cssConflict = "warning",
                -- invalidApply = "error",
                -- invalidConfigPath = "error",
                -- invalidScreen = "error",
                -- invalidTailwindDirective = "error",
                -- invalidVariant = "error",
                -- recommendedVariantOrder = "warning"
            -- },
            -- validate = true
        -- }
    -- },

    -- -- |> Fix diagnostics.
    -- flags = lsp_flags,

    -- -- |> Attach LSP keybindings & other crap.
    -- on_attach = aum_general_on_attach,

    -- -- |> Add nvim-cmp or snippet completion capabilities.
    -- capabilities = aum_capabilities,

    -- -- |> Activate custom handlers.
    -- handlers = aum_handler_config,
-- })
-- |> END -> TailwindCSS-LS  --=>><⚡END⚡>]

--================================================================--+
-- === END - LSP -> CSS & TailwindCSS LangServer  Setup - END === --|  --=>><⚡END⚡>]
--================================================================--+
--|--------------------------------------------------------|
--=======================================================--+
-- === START - LSP -> Python Language Server - START === --|  --=>><⚡START⚡>[
--=======================================================--+

-- NOTE: Pyright is way than Jedi-LSP.
nvim_lsp.pyright.setup({
    -- |> Fix diagnostics.
    flags = lsp_flags,

    -- |> Attach LSP keybindings & other crap.
    on_attach = aum_general_on_attach,

    -- |> Add completion (nvim-cmp, luasnip) and fold capabilities.
    capabilities = aum_capabilities,

    -- |> Activate custom handlers.
    handlers = aum_handler_config,

    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    single_file_support = true,
    autostart = false,

    settings = {
        pyright = {
            disableOrganizeImports = false,
            analysis = {
                useLibraryCodeForTypes = true,
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                autoImportCompletions = true,
            },
        },
    },
})

--===================================================--+
-- === END - LSP -> Python Language Server - END === --|  --=>><⚡END⚡>]
--===================================================--+
--|----------------------------------------------------|
--=======================================================--+
-- === START - LSP -> Markdown Language Server - START === --|  --=>><⚡START⚡>[
--=======================================================--+

nvim_lsp.marksman.setup({
    single_file_support = true,
    autostart = false,

    -- |> Fix diagnostics.
    flags = lsp_flags,

    -- |> Attach LSP keybindings & other crap.
    on_attach = aum_general_on_attach,

    -- |> Add completion (nvim-cmp, luasnip) and fold capabilities.
    capabilities = aum_capabilities,

    -- |> Activate custom handlers.
    handlers = aum_handler_config,
})

--===================================================--+
-- === END - LSP -> Markdown Language Server - END === --|  --=>><⚡END⚡>]
--===================================================--+
--|---------------------------------------------------|
--==================================================--+
-- === START - LSP -> Diagnostics Setup - START === --|  --=>><⚡START⚡>[
--==================================================--+

vim.diagnostic.config({
    virtual_text = false,
    -- virtual_text = {
    --     source = "always",
    --     prefix = "●",
    --     spacing = 2,
    -- },  -- Bit too intrusive. Just using underline, jump to diagnostics and trouble.nvim is better.

    float = {  -- STATE: Good
        source = "always",
        border = "rounded",
    },

    signs = true,
    underline = true,
    update_in_insert = true,  -- Not too sure about this, but without it, the diagnostics are a bit unresponsive.
    severity_sort = true,
})

-- START => trouble.nvim
require("trouble").setup({
    position = "bottom",  -- Position of the list can be: bottom, top, left, righ.
    height = 10,  -- Height of the trouble list when position is top or botto.
    width = 50,  -- Width of the list when position is left or righ.
    icons = true,  -- Use devicons for filename.
    mode = "workspace_diagnostics",  -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
    fold_open = "",  -- Icon used for open fold.
    fold_closed = "",  -- Icon used for closed folds.
    group = true,  -- Group results by file.
    padding = true,  -- Add an extra new line on top of the list.

    action_keys = {  -- Key mappings for actions in the trouble list.
        -- Map to {} to remove a mapping, for example:
        -- Close = {},
        close = "q",  -- Close the list. (TODO: Config better)
        cancel = "<esc>",  -- Cancel the preview and get back to your last window / buffer / cursor.
        refresh = "r",  -- Manually refresh. (TODO: Config better)
        jump = {"<cr>", "<tab>"},  -- Jump to the diagnostic or open / close folds.
        open_split = { "<c-x>" },  -- Open buffer in new split.
        open_vsplit = { "<c-v>" },  -- Open buffer in new vsplit.
        open_tab = { "<c-t>" },  -- Open buffer in new tab.
        jump_close = {"o"},  -- Jump to the diagnostic and close the list. (TODO: Config better)
        toggle_mode = "m",  -- Toggle between "workspace" and "document" diagnostics mode.
        toggle_preview = "P",  -- Toggle auto_preview.
        hover = "K",  -- Opens a small popup with the full multiline message.
        preview = "p",  -- Preview the diagnostic location.
        close_folds = {"zM", "zm"},  -- Close all folds.
        open_folds = {"zR", "zr"},  -- Open all folds.
        toggle_fold = {"zA", "za"},  -- Toggle fold of current file.
        previous = "t",  -- Previous item.  (STATE: Good)
        next = "h"  -- Next item.  (STATE: Good)
    },

    indent_lines = true,  -- Add an indent guide below the fold icons.
    auto_open = false,  -- Automatically open the list when you have diagnostics.
    auto_close = false,  -- Automatically close the list when you have no diagnostics.
    auto_preview = true,  -- Automatically preview the location of the diagnostic. <esc> to close preview and go back to last window.
    auto_fold = false,  -- Automatically fold a file trouble list at creation.
    auto_jump = {"lsp_definitions"},  -- For the given modes, automatically jump if there is only a single result.

    signs = {
        -- Icons / Text used for a diagnostic.
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "﫠"
    },
    use_diagnostic_signs = false  -- Enabling this will use the signs defined in your lsp client.
})
-- END => trouble.nvim

--==============================================--+
-- === END - LSP -> Diagnostics Setup - END === --|  --=>><⚡END⚡>]
--==============================================--+
--===============================--+
-- === END - LSP Setup - END === --|  --=>><⚡END⚡>]
--===============================--+
--|--------------------------------|
--|-------------------------------------------------|
--================================================--+
-- === START - Comment Toggling Setup - START === --|  --=>><⚡START⚡>[
--================================================--+

-- Comment.nvim setup (STATE: Good)
require("Comment").setup({
    padding = true,     -- Add a space between comment and the line.
    sticky = true,      -- Whether the cursor should stay at its position.
    ignore = nil,

    toggler = {
        line = 'gcc',
        block = 'gbc',
    },

    opleader = {
        line = 'gc',
        block = 'gb',
    },

    extra = {
        above = 'gcO',
        below = 'gco',
        eol = 'gcA',
    },

    -- Automatically create keybindings?
    -- NOTE: If given `false` then the plugin won't create any mappings.
    -- TODO: Might want to test this if there are proper functions to call. (And config more manually, but this is fine.)
    mappings = {
        basic = true,
        extra = true,
    },

    -- Function to call before (un)comment.
    pre_hook = nil,

    -- Function to call after (un)comment.
    post_hook = nil,
})

--============================================--+
-- === END - Comment Toggling Setup - END === --|  --=>><⚡END⚡>]
--============================================--+

-- |> START -> Floating Terminal Setup  --=>><⚡START⚡>[
require("FTerm").setup({  -- STATE: Good (Though in Neovide the colors are wrong, but no idea how to fix that.)
    cmd = 'fish',
    border = 'single',
    dimensions  = {
        height = 0.80,
        width = 0.80,
    },
    auto_close = true,
})
-- |> END -> Floating Terminal Setup  --=>><⚡END⚡>]

--=========================================--+
-- === START -> Formatter.nvim - Setup === --| --=>><⚡START⚡>]
--=========================================--+

-- STATE: Good for c++. (Run with ':Format')
-- NOTE: Not sure how required this is, as lsp has format option, too.

-- Utilities for creating configurations
local format_util = require("formatter.util")

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
    logging = true,
    log_level = vim.log.levels.WARN,

    filetype = {
        cpp = {
            function()
                return {
                    exe = "clang-format",
                    args = {
                        '-style="{BasedOnStyle: LLVM, IndentWidth: 4}"',
                        "-assume-filename",
                        format_util.escape_path(format_util.get_current_buffer_file_name()),
                    },
                    stdin = true,
                }
            end
        },

        rust = {
            require("formatter.filetypes.rust").rustfmt
        },

        lua = {
            require("formatter.filetypes.lua").stylua
        },

        -- Use the special "*" filetype for defining formatter configurations on
        -- any filetype
        ["*"] = {
            -- "formatter.filetypes.any" defines default configurations for any
            -- filetype
            require("formatter.filetypes.any").remove_trailing_whitespace
        },
    }
}

--=======================================--+
-- === END -> Formatter.nvim - Setup === --| --=>><⚡END⚡>]
--=======================================--+

-- |> START -> Telescope Setup   --=>><⚡START⚡>[
local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

require("telescope").setup({
    -- For help on these settings use command:
    -- :help telescope.setup()
    defaults = {
        sorting_strategy = "ascending",  -- Default 'descending'
        selection_strategy = "reset",
        scroll_strategy = "cycle",
        layout_strategy = "vertical",
        layout_config = {
            bottom_pane = {
                height = 25,
                preview_cutoff = 120,
                prompt_position = "top"
            },
            center = {
                height = 0.8,
                preview_cutoff = 40,
                prompt_position = "top",
                width = 0.8
            },
            cursor = {
                height = 0.9,
                preview_cutoff = 40,
                width = 0.8
            },
            horizontal = {
                height = 0.84,
                preview_cutoff = 120,
                prompt_position = "top",
                width = 0.84
            },
            vertical = {
                prompt_position = "top",
                height = 0.88,
                preview_cutoff = 8,
                width = 0.82
            }
        },

        path_display = {
            "smart"
        },

        find_command = {"rg", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case"},
        prompt_prefix = "  ",
        selection_caret = "  ",
        entry_prefix = "   ",
        initial_mode = "insert",
        color_devicons = true,
        set_env = {['COLORTERM'] = 'truecolor'},

        mappings = {
            i = {
                ["<C-n>"] = actions.move_selection_next,
                ["<C-p>"] = actions.move_selection_previous,
                -- ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                -- ["<Esc>"] = actions.close,
                ["<CR>"] = actions.select_default + actions.center,
                ["<C-t>"] = trouble.open_with_trouble  -- This overwrites 'open in new tab', which is okay.
            },
            n = {
                ["<C-n>"] = actions.move_selection_next,
                ["<C-p>"] = actions.move_selection_previous,
                ["<C-t>"] = trouble.open_with_trouble  -- This overwrites 'open in new tab', which is okay.
                -- ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
            }
        }
    },

    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case"         -- "smart_case", "ignore_case" or "respect_case"
        },
        ["ui-select"] = {
            require("telescope.themes").get_dropdown({
                prompt_position = "top",
                width = 0.92,
                height = 0.8,
            })
        }
    }
})

-- |> Telescope Extensions Setup
require("telescope").load_extension("fzf")
require("telescope").load_extension("ui-select")

-- |> END -> Telescope Setup   --=>><⚡END⚡>]

-- |> START -> Dressing.nvim Setup  --=>><⚡START⚡>[
require("dressing").setup({
    input = {
        -- Set to false to disable the vim.ui.input implementation
        enabled = true,

        -- Default prompt string
        default_prompt = "Input:",

        -- Can be 'left', 'right', or 'center'
        prompt_align = "left",

        -- When true, <Esc> will close the modal
        insert_only = false,

        -- When true, input will start in insert mode.
        start_in_insert = false,

        -- These are passed to nvim_open_win
        anchor = "SW",
        border = "rounded",
        -- -- 'editor' and 'win' will default to being centered
        relative = "cursor",

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
            -- 'editor' and 'win' will default to being centered.
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
                        width = 0.8,
                        height = 0.76,
                    }
                }
            else
                return {}
            end
        end
        ,
    },
})
-- |> END -> Dressing.nvim Setup   --=>><⚡END⚡>]

-- |> START -> Zen Mode Setup  --=>><⚡START⚡>[
require("zen-mode").setup({
    window = {
        backdrop = 0.92,  -- Shade the backdrop of the Zen window. Set to 1 to keep the same as Normal.
        width = 0.80,  -- Width of the Zen window (Below 1 values are percentages) (0.80'ish, 110'ish.)
        height = 0.96,  -- Height of the Zen window (Below 1 values are percentages) (0.96'ish, 42'ish.)
        options = {
            -- signcolumn = "no",       -- Disable signcolumn
            -- number = false,          -- Disable number column
            -- relativenumber = false,  -- Disable relative numbers
            -- cursorline = false,      -- Disable cursorline
            -- cursorcolumn = false,    -- Disable cursor column
            -- foldcolumn = "0",        -- Disable fold column
            -- list = false,            -- Disable whitespace characters
        },
    },

    plugins = {
        options = {
            enabled = true,
            ruler = false, -- disables the ruler text in the cmd line area
            showcmd = false, -- disables the command in the last line of the screen
        },
        twilight = { enabled = false }, -- enable to start Twilight when zen mode opens
        gitsigns = { enabled = false }, -- disables git signs
        tmux = { enabled = false }, -- disables the tmux statusline
    },
})
-- |> END -> Zen Mode Setup  --=>><⚡END⚡>]


-- |> START -> Alpha-nvim Setup  --=>><⚡START⚡>[
require("alpha/startup_screen")  -- Lua module external file. (StartupScreen configuration)
-- |> END -> Alpha-nvim Setup  --=>><⚡END⚡>]

-- -- |> START -> Focus.nvim Setup  --=>><⚡START⚡>[
-- require("focus").setup({})
-- -- |> END -> Focus.nvim Setup  --=>><⚡END⚡>]

-- -- |> START -> Pretty-Fold Setup  --=>><⚡START⚡>[
-- require("pretty-fold").setup({
    -- fill_char = '•',
    -- sections = {
        -- left = {
            -- 'content',
        -- },
        -- right = {
            -- ' ', 'number_of_folded_lines', ': ', 'percentage', ' ',
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
-- -- |> END -> Pretty-Fold Setup  --=>><⚡END⚡>]

-- -- |> START -> Tabout.nvim Setup
-- require('tabout').setup {
    -- tabkey = "<Tab>",
    -- backwards_tabkey = "<S-tab>",
    -- act_as_tab = true,
    -- act_as_shift_tab = false,
    -- enable_backwards = true,
    -- completion = true,
    -- tabouts = {
        -- { open = "'", close = "'" },
        -- { open = '"', close = '"' },
        -- { open = '`', close = '`' },
        -- { open = '(', close = ')' },
        -- { open = '[', close = ']' },
        -- { open = '{', close = '}' }
    -- },
    -- ignore_beginning = true,
    -- exclude = {}
-- }

-- |> START -> VimTex Setup
-- g.vimtex_mappings_enabled = false

-- === |> - Aumneline. (START)
require("heirline/aumneline")
-- === |> - Aumneline. (END)

-- === |> - Mini addons. (START)
-- NOTE: I don't like `mini.pairs`.

-- |> mini-bufremove            ( Testing. )
require("mini.bufremove").setup()

-- |> AroundIn                  (Haven't used a lot)
require("mini.ai").setup()

-- |> Surround Operations       ( Good. )
require("mini.surround").setup({
    -- Add custom surroundings to be used on top of builtin ones. For more
    -- information with examples, see `:h MiniSurround.config`.
    custom_surroundings = nil,

    -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
    highlight_duration = 360,

    -- Module mappings. Use `''` (empty string) to disable one.
    mappings = {
        add = "gsa",                -- Add surrounding in Normal and Visual mode.
        delete = "gsd",             -- Delete surrounding.
        find = "gsn",               -- Find surrounding (to the right).
        find_left = "gso",          -- Find surrounding (to the left).
        highlight = "gsh",          -- Highlight surrounding.
        replace = "gsr",            -- Replace surrounding.
        update_n_lines = "gsl",     -- Update `n_lines`.

        suffix_next = "b",          -- Suffix to search with `next` method.
        suffix_last = "B",          -- Suffix to search with `prev` method.
    },

    -- Number of lines within which surrounding is searched.
    n_lines = 12,

    -- How to search for surrounding (first inside current line, then inside
    -- neighborhood). One of `cover`, `cover_or_next`, `cover_or_prev`,
    -- `cover_or_nearest`, `next`, `prev`, `nearest`. For more details,
    -- see `:h MiniSurround.config`.
    search_method = "cover_or_next",
})

-- |> CursorWord                ( Perfect, if it didn't lag. )
-- require("mini.cursorword").setup({
--     delay = 375
-- })

-- |> IndentScope               ( Good, except that it might cause lag. )
-- require("mini.indentscope").setup()

-- === |> - Mini addons. (END)

-- START |> Treesitter context
-- require("treesitter-context").setup()  -- Disabled because not critical, and I fear it causes lag.
-- END |> Treesitter context

-- === |> - HL-Args. (START)
require("hlargs").setup({
    color = '#EF9062',
    paint_arg_declarations = true,
    paint_arg_usages = true,

    paint_catch_blocks = {
        declarations = false,
        usages = false
    },

    hl_priority = 10000,

    excluded_argnames = {
        declarations = {},
        usages = {
            python = { 'self', 'cls' },
            lua = { 'self' }
        }
    },
})
-- === |> - HL-Args. (END)

-- === |> - Colorizer. (START)
require("colorizer").setup({
    filetypes = {
        "lua", "css",
    },

    user_default_options = {
        RRGGBB = true, -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        AARRGGBB = false, -- 0xAARRGGBB hex codes
        RGB = false, -- #RGB hex codes
        names = false, -- `Name` codes like Blue or blue
        rgb_fn = false, -- CSS rgb() and rgba() functions
        hsl_fn = false, -- CSS hsl() and hsla() functions
        css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        -- Available modes for `mode`: foreground, background,  virtualtext
        mode = "virtualtext", -- Set the display mode.
        -- Available methods are false / true / "normal" / "lsp" / "both"
        -- True is same as normal
        tailwind = false, -- Enable tailwind colors
        -- parsers can contain values used in |user_default_options|
        sass = { enable = false, parsers = { css }, }, -- Enable sass colors
        virtualtext = "■",
    },

    -- all the sub-options of filetypes apply to buftypes
    buftypes = {},
})
-- === |> - Colorizer. (END)

-- === |> - Noice.nvim (START)
if not g.neovide then
    require("noice").setup({
        cmdline = {
            enabled = true,             -- Enables the Noice cmdline UI.
            view = "cmdline_popup",     -- View for rendering the cmdline. ( "cmdline" | "cmdline_popup" )
            opts = {},                  -- Global options for the cmdline. See section on views.

            --@type table<string, CmdlineFormat>
            format = {
                -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
                -- view: (default is cmdline view)
                -- opts: any options passed to the view
                -- icon_hl_group: optional hl_group for the icon
                -- title: set to anything or empty string to hide
                cmdline = { pattern = "^:", icon = "", lang = "vim" },
                search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
                search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
                filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
                lua = { pattern = "^:%s*lua%s+", icon = "", lang = "lua" },
                help = { pattern = "^:%s*h%s+", icon = "" },
                input = {},  -- Used by input()
                -- To disable a format, set to `false`.
            },
        },

        messages = {
            -- NOTE: If you enable messages, then the cmdline is enabled automatically.
            -- This is a current Neovim limitation.
            enabled = true,             -- Enables the Noice messages UI.
            view = "mini",              -- Default view for messages.
            view_error = "mini",        -- View for errors.
            view_warn = "mini",         -- View for warnings.
            view_history = "messages",  -- View for :messages.
            view_search = false,        -- View for search count messages. Set to `false` to disable.
        },

        popupmenu = {
            enabled = true,  -- Enables the Noice popupmenu UI.
            -- @type "nui" | "cmp"
            backend = "cmp",  -- Backend to use for showing regular cmdline completions. (This does not seem to make a difference.)
            -- @type NoicePopupmenuItemKind | false
            -- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
            kind_icons = {},  -- Set to `false` to disable icons
        },

        -- You can add any custom commands below that will be available with `:Noice command`.
        -- @type table<string, NoiceCommand>
        commands = {
            history = {
                -- Options for the message history that you get with `:Noice`
                view = "split",
                opts = { enter = true, format = "details" },
                filter = {
                    any = {
                        { event = "notify" },
                        { error = true },
                        { warning = true },
                        { event = "msg_show" },
                        { event = "lsp", kind = "message" },
                    },
                },
            },

            -- :Noice last
            last = {
                view = "split",
                opts = { enter = true, format = "details" },
                filter = {
                    any = {
                        { event = "notify" },
                        { error = true },
                        { warning = true },
                        { event = "msg_show" },
                        { event = "lsp", kind = "message" },
                    },
                },
                filter_opts = { count = 1 },
            },

            -- :Noice errors
            errors = {
                view = "split",
                opts = { enter = true, format = "details" },
                filter = { error = true },
                filter_opts = { reverse = true },
            },
        },

        notify = {
            enabled = true,
            view = "notify",
        },

        lsp = {
            progress = {  -- This is nice when it only shows the startup progress. Workspace diagnosis messages can get really spammy.
                enabled = true,
                -- Lsp Progress is formatted using the builtins for lsp_progress. See `config.format.builtin`.
                -- See the section on formatting for more details on how to customize.
                -- @type NoiceFormat|string
                format = "lsp_progress",
                -- @type NoiceFormat|string
                format_done = "lsp_progress_done",
                throttle = 1000 / 30,  -- frequency to update lsp progress message
                -- throttle = 2000 / 30,  -- frequency to update lsp progress message
                view = "mini",
            },

            override = {
                -- Override the Default LSP Markdown Formatter with Noice.
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                -- Override `nvim-cmp` documentation with Noice. (Needs the other options to work.)
                ["cmp.entry.get_documentation"] = true,
            },

            -- What does this do exactly?
            hover = {
                enabled = true,
                view = "hover", -- When nil, use defaults from documentation.
                -- @type NoiceViewOptions
                opts = {}  -- Merged with defaults from documentation.
            },

            signature = {
                enabled = true,         -- If this is enabled, the nvim-cmp sig-help should be disabled.
                auto_open = {           -- NOTE: `Signature Help` seems to go away when starting to type characters.
                    enabled = true,
                    trigger = true,     -- Automatically show signature help when typing a trigger character from the LSP.
                    luasnip = true,     -- Will open signature help when jumping to Luasnip insert nodes.
                    throttle = 50,      -- Debounce lsp signature help request by 50-ms.
                },

                view = nil,             -- When nil, use defaults from documentation.
                
                -- @type NoiceViewOptions
                -- Reference: `https://github.com/folke/noice.nvim/blob/main/lua/noice/config/views.lua`
                opts = {  -- Having some issue with the placement of this window. Config here.
                    view = "popup",
                    relative = "cursor",
                    -- NOTE: Having some issue with anchor or position.
                    anchor = "auto",
                    position = { row = 2, col = 1 },
                    zindex = 45,
                    enter = false,
                    
                    size = {
                        width = "auto",
                        height = "auto",
                        max_height = 16,
                        max_width = 100,
                    },
                    
                    border = {
                        style = "rounded",
                        padding = { 0, 2 },
                    },

                    -- Not sure what linebreak does. I probably want to enable wrap.
                    win_options = {
                        wrap = false,
                        linebreak = true,
                    },
                },  -- Merged with defaults from documentation.
            },

            message = {
                -- Messages shown by LSP servers.
                enabled = true,
                view = "mini",
                filter = {
                    any = {
                        { error = true },
                        { warning = true },
                    },
                }
            },

            -- Defaults for hover and signature help.
            documentation = {
                view = "hover",
                ---@type NoiceViewOptions
                opts = {
                    lang = "markdown",
                    replace = true,
                    render = "plain",
                    format = { "{message}" },
                    win_options = { concealcursor = "n", conceallevel = 3 },
                },
            },
        },

        markdown = {
            hover = {
                ["|(%S-)|"] = vim.cmd.help,  -- Vim help links.
                ["%[.-%]%((%S-)%)"] = require("noice.util").open,  -- Markdown links.
            },

            highlights = {
                ["|%S-|"] = "@text.reference",
                ["@%S+"] = "@parameter",
                ["^%s*(Parameters:)"] = "@text.title",
                ["^%s*(Return:)"] = "@text.title",
                ["^%s*(See also:)"] = "@text.title",
                ["{%S-}"] = "@parameter",
            },
        },

        health = {
            checker = false,  -- Disable if you don't want health checks to run. (Enable if you do.)
        },

        smart_move = {
            -- Noice tries to move out of the way of existing floating windows.
            enabled = true,
            -- Add any filetypes here, that shouldn't trigger smart move.
            excluded_filetypes = { "cmp_menu", "cmp_docs", "notify", "zen-mode", "zen_mode" },
        },

        -- @type NoicePresets
        presets = {
            -- You can enable a preset by setting it to true, or a table that will override the preset config.
            -- You can also add custom presets that you can enable/disable with `enabled=true`.
            bottom_search = false,          -- Use a classic bottom cmdline for search.
            command_palette = true,         -- Position the cmdline and popupmenu together.
            long_message_to_split = true,   -- Long messages will be sent to a split.
            inc_rename = false,             -- Enables an input dialog for `inc-rename.nvim`.
        },

        throttle = 1000 / 30,  -- How frequently does Noice need to check for ui updates? This has no effect when in blocking mode.

        -- @type NoiceConfigViews
        -- @see section on views
        views = {
            mini = {
                align = "message-right",
                position = {
                    row = -2,  -- Lifts the messages away from the status bar, so they don't overlap. If `mini` messages are enabled, -2 should be good.
                    col = "100%",
                },
                win_options = {
                    winblend = 0,
                    winhighlight = {
                        Normal = "AumNoiceMiniNormal",
                        IncSearch = "AumNoiceMiniIncSearch",
                        CurSearch = "AumNoiceMiniCurSearch",
                        Search = "AumNoiceMiniSearch",
                    }
                }
            },

            hover = {
                relative = "cursor",
                anchor = "auto",
                position = { row = 2, col = 1 },
                zindex = 45,
                enter = false,
                
                size = {
                    width = "auto",
                    height = "auto",
                    max_height = 42,
                    max_width = 100,
                },
                
                border = {
                    style = "rounded",
                    padding = { 0, 2 },
                },

                -- Not sure what linebreak does.
                win_options = {
                    wrap = false,
                    linebreak = true,
                },
            },
        },     

        -- @type NoiceRouteConfig[]
        routes = {},    -- @see section on routes
        -- @type table<string, NoiceFilter>
        status = {},    -- @see section on statusline components
        -- @type NoiceFormatOptions
        format = {},    -- @see section on formatting
    })
end
-- === |> - Noice.nvim (END)

-- === |> - Spider.nvim (START)
-- NOTE: Keybinds in "good-binds.lua"
require("spider").setup({
    -- On `false`, the skip-bugs are way worse. It's practically unuseable.
	skipInsignificantPunctuation = true
})
-- === |> - Spider.nvim (END)

-- Jukit:
g.jukit_mappings = false
g.jukit_terminal = "nvimterm"
g.jukit_shell_cmd = "ipython"
g.jukit_auto_output_hist = false
g.jukit_inline_plotting = false

-- Markdown cell coloring:
g.jukit_enable_textcell_bg_hl = true
g.jukit_enable_textcell_syntax = true

--========================================--+
-- === END - 8. Plugin Settings - END === --|  --=>><⚡END⚡>]
--========================================--+
--|-----------------------------------------|
--==============================================================================================--+
-- === START - 9. Mappings/Keymaps/Keymappings/Keybindings/Remaps/Shortcuts/Hotkeys - START === --|  --=>><⚡START⚡>[
--==============================================================================================--+
require("keybindings/good-binds")
--==========================================================================================--+
-- === END - 9. Mappings/Keymaps/Keymappings/Keybindings/Remaps/Shortcuts/Hotkeys - END === --|  --=>><⚡END⚡>]
--==========================================================================================--+
--|----------------------------------------------|
--=============================================--+
-- === START - 10. Custom Commands - START === --|  --=>><⚡START⚡>[
--=============================================--+

-- NOTE: Creating custom commands in `legendary.nvim`.
-- Legendary setup is called when requiring `good-binds`.

-- TODO: Move these to Lua and `legendary.nvim`.

vim.cmd([[command! -nargs=0 AumConfig edit /home/aum/.config/nvim/init.lua]])
vim.cmd([[command! -nargs=0 AumBinds edit /home/aum/.config/nvim/lua/keybindings/good-binds.lua]])
vim.cmd([[command! -nargs=0 AumTheme edit /home/aum/.config/nvim/colors/aumnechroma.lua]])
vim.cmd([[command! -nargs=0 AumLines edit /home/aum/.config/nvim/lua/heirline/aumneline.lua]])
vim.cmd([[command! -nargs=0 FishConfig edit /home/aum/.config/fish/config.fish]])
vim.cmd([[command! -nargs=0 KittyConfig edit /home/aum/.config/kitty/kitty.conf]])
vim.cmd([[command! -nargs=0 AwesomeConfig edit /home/aum/.config/awesome/rc.lua]])
vim.cmd([[command! -nargs=0 LuaSnipsEditAll edit /home/aum/.config/nvim/snippets/all.lua]])
vim.cmd([[command! -nargs=0 LuaSnipsEditRust edit /home/aum/.config/nvim/snippets/rust.snippets]])

-- Autogroups and Autocommands:
-- TODO: Could move Autocommands to a file of their own. ( Only like 100 lines atm though. )

--===============================================--+
-- === START - Markdown Autocommands - START === --|
--===============================================--+

-- |> Enable `Treesitter` for `Markdown` files.         ( If this causes noticeable lag, will disable. )
local ts_markdown_aumgroup = vim.api.nvim_create_augroup("MyMarkdownTreesitter", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown" },
    command = "TSEnable highlight markdown",
    group = ts_markdown_aumgroup
})

-- |> Enable (Or disable) full conceal in Markdown, LaTeX, and Org files.
local writer_aumgroup = vim.api.nvim_create_augroup("MyMarkdownConceal", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "tex", "org" },
    command = "lua vim.opt.conceallevel = 0",  -- Set to 0 to always show conceal characters. ( 3 to always conceal. )
    group = writer_aumgroup
})

-- |> Enable/Disable hard line breaks in Markdown, LaTeX, and Org files.
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "tex", "org" },
    command = "lua vim.opt.textwidth = 80",
    group = writer_aumgroup
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "tex", "org" },
    command = "set indentexpr=",
    group = writer_aumgroup
})

--===========================================--+
-- === END - Markdown Autocommands - END === --|
--===========================================--+
--|--------------------------------------------|
--===========================================--+
-- === START - Misc Autocommands - START === --|
--===========================================--+

-- |> Enable extra opts for some filetypes.
local extra_opts_aumgroup = vim.api.nvim_create_augroup("MyExtraOpts", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "Rust" },
    command = "EnableExtraOpts",
    group = extra_opts_aumgroup
})

-- |> Indent fixing for C and CPP, maybe.
local cindent_aumgroup = vim.api.nvim_create_augroup("MyCindent", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp", "h", "hpp" },
    command = "set cindent",
    group = cindent_aumgroup
})

-- |> Disable `mini.indentscope` in help files. ( NOTE: Not using `mini.indentscope` anymore. )
-- local indentscope_aumgroup = vim.api.nvim_create_augroup("MyIndentScope", { clear = true })
-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = {"help"},
--     command = "lua vim.b.miniindentscope_disable = true",
--     group = indentscope_aumgroup
-- })

-- |> Fix conceal in help files.
local help_conceal_aumgroup = vim.api.nvim_create_augroup("MyHelpConceal", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "help" },
    command = 'lua vim.opt.concealcursor = ""',
    group = help_conceal_aumgroup
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "help" },
    command = 'lua vim.opt.conceallevel = 0',
    group = help_conceal_aumgroup
})

-- |> Highlight yanking. (Would be really nice, but the rendering bugs out and I can't deal with it.)
-- local yank_hl_aumgroup = vim.api.nvim_create_augroup("MyYankHighlight", { clear = true })
-- vim.api.nvim_create_autocmd("TextYankPost", {
--     command = "silent! lua vim.highlight.on_yank({ timeout = 80 })",
--     group = yank_hl_aumgroup
-- })

-- |> Search Highlight AutoCommands (Good, but can potentially cause lag. (The highlight, not so much the autocmd itself.))
-- local search_hl_aumgroup = vim.api.nvim_create_augroup("MySearchHL", { clear = true })
-- vim.api.nvim_create_autocmd("CmdlineEnter", {
--     pattern = {'/', '\\?'},
--     command = "set hlsearch",
--     group = search_hl_aumgroup
-- })
-- vim.api.nvim_create_autocmd("CmdlineLeave", {
--     pattern = {'/', '\\?'},
--     command = "set nohlsearch",
--     group = search_hl_aumgroup
-- })

-- |> Formatoptions. (Just disable automatic comment leader on newlines.)
local formatopt_aumgroup = vim.api.nvim_create_augroup("MyFormatOpts", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"*"},
    command = "set fo-=c fo-=r fo-=o",
    group = formatopt_aumgroup
})

-- |> Assembly Syntax (Asm)
local asmsyntax_aumgroup = vim.api.nvim_create_augroup("MyAsmSyntax", { clear = true })
vim.api.nvim_create_autocmd("BufRead, BufNew", {
    pattern = { '*.asm' },
    command = "set filetype=nasm",
    group = asmsyntax_aumgroup
})

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

-- Autocommands to change "commentstring" for specific filetypes. (TODO: Create lua version.)
-- |> Use "//" instead of "/* */" for 'C' and 'cpp' files.
vim.cmd([[
augroup set-commentstring-ag
autocmd!
    autocmd BufEnter *.c :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
    autocmd BufFilePost *.c :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s")

    autocmd BufEnter *.cpp :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
    autocmd BufFilePost *.cpp :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s")

    autocmd BufEnter *.h :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
    autocmd BufFilePost *.h :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s")

    autocmd BufEnter *.hpp :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
    autocmd BufFilePost *.hpp :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s")

    autocmd BufEnter *.svelte :lua vim.api.nvim_buf_set_option(0, "commentstring", "<!-- %s -->")
    autocmd BufFilePost *.svelte :lua vim.api.nvim_buf_set_option(0, "commentstring", "<!-- %s -->")

    autocmd BufEnter *.fish :lua vim.api.nvim_buf_set_option(0, "commentstring", "# %s")
    autocmd BufFilePost *.fish :lua vim.api.nvim_buf_set_option(0, "commentstring", "# %s")
augroup END
]])

-- |> Set Colorscheme / Theme:
vim.api.nvim_cmd({ cmd = "colorscheme", args = { "aumnechroma-theme" }}, {})

-- |> Set Neovide Font:
vim.o.guifont = "JetBrainsMono Nerd Font:h18:b:#e-antialias"
opt.linespace = 4
vim.g.neovide_scale_factor = 1

--========================================--+
-- === END - 10. Custom Commands - END === --|  --=>><⚡END⚡>]
--========================================--+

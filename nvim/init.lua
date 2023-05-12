--=====================================--+
-- === Aumnescio's Neovim Settings === --|
--=====================================--+
--|--------------------------------------|
--===========================================--+
-- === START - Table of Contents - START === --|
--===========================================--+

-- | 1. Essential Settings
-- | |> - Byte Compilation Cache    ( true )
-- | |> - Hidden                    ( true )
-- | |> - Swapfile                  ( false )
-- | |> - Backup                    ( false )
-- | |> - Autoread                  ( true )
-- | |> - Undofile                  ( true )
-- | |> - Error Bell                ( false )
-- | |> - Matchup (Plugin)          ( Enabled, but kind of lingering in the wrong section. )

-- | 2. System Settings
-- | |> - Mouse                 ( Enabled )
-- | |> - Clipboard             ( Enabled )
-- | |> - grep-prg              ( ripgrep )
-- | |> - grep-format           ( something )
-- | |> - python-path           ( set )
-- | |> - Shell                 ( set => Fish )
-- | |> - tex_flavor            ( LaTeX )
-- | |> - formatprg             ( fmt )
-- | |> - equalprg              ( TODO )

-- | 3. General Settings
-- | |> - Ruler                 ( Disabled )
-- | |> - Spellchecking         ( Disabled by default, toggleable. )
-- | |> - Responsiveness        ( fast / instant )
-- | |> - lazyredraw            ( true = performance )
-- | |> - ListChars             ( configured )
-- | |> - FillChars             ( configured )
-- | |> - list                  ( Enabled by default, very hidden and minimal. )
-- | |> - Command Line Opts     ( configured )

-- | 4. Functionality Settings
-- | |> - Virtual Space         ( true )
-- | |> - Backspace             ( Enabled / fixed )
-- | |> - Completion popup      ( configured )
-- | |> - Indentation           ( configured )
-- | |> - Tabs / Spaces         ( tab/indent = 4 spaces )
-- | |> - Searching             ( incsearch, etc )
-- | |> - Folding               ( Enabled, `Treesitter Expression` atm. )
-- | |> - Scrolling             ( Some scroll-offset, performant `sidescroll`. )
-- | |> - Splits                ( right/bottom )
-- | |> - Wrapping              ( Softwrap disabled by default )

-- | 5. Visual Settings
-- | |> - Line Numbers          ( Disabled | Toggleable )
-- | |> - Sign Column           ( Disabled )
-- | |> - Cursorline            ( on/off )
-- | |> - Showmatch             ( Disabled )

-- | 6. GUI Settings
-- | |> - Colors                ( guitermcolors, 16 million colors. )
-- | |> - Font                  ( Nerd Font )

-- | 7. Neovide Settings
-- | |> - Refresh Rate          ( 165 )
-- | |> - Cursor Effects        ( enabled / fast )

-- | 8. Plugin Settings
-- | |> - Packer                ( Plugin Manager )                                      [ Installed / STATE: Good ]
-- | |> - Treesitter            ( Treesitter )                                          [ Installed / STATE: Okay, sometimes laggy. ]
-- | |> - Polyglot              ( Syntax highlighting )                                 [ Installed / STATE: Good, generally better than treesitter. ]
-- | |> - LSP                   ( Native )                                              [ Installed / STATE: Good ]
-- | |> - LSP-extras            ( trouble, etc )                                        [ Installed / STATE: Good ]
-- | |> - Rust Tools            ( Rust-LSP stuff )                                      [ Installed / STATE: Good ]
-- | |> - Telescope             ( Fuzzy Finder )                                        [ Installed / STATE: Good ]
-- | |> - fzf                   ( Telescope Extension, improved fuzzy-finding )         [ Installed / STATE: Good ]
-- | |> - Nvim-cmp              ( Autocompletion )                                      [ Installed / STATE: Good ]
-- | |> - LuaSnip               ( Snippets )                                            [ Installed / STATE: Good ]
-- | |> - Comment.nvim          ( Commenting keybindings )                              [ Installed / STATE: Good ]
-- | |> - Zen-Mode              ( zen-mode )                                            [ Installed / STATE: Meh ]
-- | |> - focus.nvim            ( Split resizing )                                      [ TODO ]
-- | |> - Windows.nvim          ( Split resizing )                                      [ TODO ]
-- | |> - And lots of other smaller plugins.                                            [ Installed / STATE: Good ]

-- | 9. Keymapping Settings
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

--=======================================--+
-- === END - Table of Contents - END === --|
--=======================================--+
--|----------------------------------------|
--===============================================--+
-- === START - 1. Essential Settings - START === --|
--===============================================--+

-- => STATE: Good

-- Enable Lua Module `Byte Compilation Cache`.  ( Or some such. )
-- - Supposed to speed up startup time, and I think it does.
-- - Not a whole lot of documentation on this.
-- - Recommended in `impatient.nvim` README, as replacement for the plugin.
vim.loader.enable()

-- |> API Aliases
local g     = vim.g
local opt   = vim.opt

-- |> Globals
-- This probably does nothing, because it's default.
-- Right now, don't even know where I got this from.    ( TODO )
g.do_filetype_lua = true

-- - Disabling `matchparen` (built-in plugin) highlighting, because it lags.
--  - Not super often, but even occasional stutter is unacceptable.
g.loaded_matchparen = 1
g.loaded_matchit = 1
-- NOTE:    Using [vim-matchup](https://github.com/andymass/vim-matchup) to highlight matches instead.
--          It is more performant, customizeable and supports other tokens too.

-- Disable `netrw`.
g.loaded_netrwPlugin = 1

-- START => `vim-matchup` config
g.matchup_matchparen_offscreen = {}                     -- Offscreen match-search and highlight disabled.
g.matchup_matchparen_stopline = 60                      -- Search +-60 lines from current line.
g.matchup_matchparen_deferred = 1                       -- Improve performance by delaying match-searching and highlight.
g.matchup_matchparen_deferred_show_delay = 120          -- Delay until match-search / highlight.
g.matchup_matchparen_deferred_hide_delay = 5            -- Delay until hiding stale highlight.
g.matchup_matchparen_deferred_fade_delay = 0            -- Fading disabled.
g.matchup_matchparen_pumvisible = 0                     -- Highlight disabled while popupmenu open.
-- END => `vim-matchup` config

opt.hidden = true           -- Keeps unsaved buffers open in the background. (Seems to be good as 'true' for some reasons.)
opt.swapfile = false        -- Not exactly sure what this is. Default is 'true', but off seems good?
-- NOTE: This combination of backup options should create backups on save but delete them after successful saves.
opt.backup = false          -- `false` is default.
opt.writebackup = true      -- `true` is default. Not having this seemed unsafe.
opt.autoread = true         -- Automatically read changed file.
opt.undofile = true         -- Save undo history for all files.

-- |> Error Bell settings.
opt.visualbell = false      -- Don't flash my screen.
opt.errorbells = false      -- No PING/BANG sounds plz.

--===========================================--+
-- === END - 1. Essential Settings - END === --|
--===========================================--+
--|--------------------------------------------|
--============================================--+
-- === START - 2. System Settings - START === --|
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

opt.grepprg = [[rg --vimgrep --no-heading --smart-case]]        -- Use ripgrep.
opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"                         -- Grep format.
-- g.loaded_python_provider = 1     -- Unsure what this is. Supposed to speed something up.
-- g.python_host_skip_check = 1     -- Unsure what this is. Supposed to speed something up.
-- g.python3_host_skip_check = 1    -- Unsure what this is. Supposed to speed something up.
g.python3_host_prog = "/usr/bin/python3"     -- Path to Python3.
opt.shell = "/usr/bin/fish"         -- Set default shell to fish.   ( Might cause issues with some stuff so be a tad aware. )
g.tex_flavor = "latex"              -- Set LaTeX flavor.            ( Changes syntax highlighting. )
opt.formatprg = "fmt --width 94"
opt.equalprg = ""                   -- NOTE: I want something else here prolly. Dunno where to find formatter that works on all filetypes.

--========================================--+
-- === END - 2. System Settings - END === --|
--========================================--+
--|-----------------------------------------|
--=============================================--+
-- === START - 3. General Settings - START === --|
--=============================================--+

-- => STATE: Good
-- NOTE: `ttyfast` and `ttyscroll` existed in Vim, but have been removed from Neovim, so there is no need to set those values.
opt.ruler = false               -- Toggle visibility for line/column number in status bar. (They still show up in most statuslines.)
opt.spell = false               -- Toggle spellchecking. (Dynamic toggle: `:set spell` | `:set nospell`) (This is a too intrusive by default.)
opt.spelllang = "en"            -- Languages to spellcheck. "en_us"

-- |> Responsiveness settings.
opt.timeout = false             -- Infinite operator pending wait time.
opt.timeoutlen = 0
opt.ttimeout = false            -- Makes leaving Insert mode using <Esc> faster, so keys don't fuckup.
opt.ttimeoutlen = 0

-- |> Having `lazyredraw = true` is a large performance increase when running macros.
opt.lazyredraw = true           -- Stop updating screen when running a macro. (If true) (`Noice.nvim` wants this off.)

-- NOTE: `updatetime` is used for `cursorword-highlight.nvim` cursorword highlighting. ( I wish it wasn't locked to this value. )
opt.updatetime = 42             -- Some update-rate thing to help smoothness.
-- Very low values are more likely to cause lag. Under `10` is almost certainly going to lag.
-- But I want this to be as low as possible. I hate the delay.
-- NOTE:    I have `keyboard repeat-rate` at 72 per second, which means about 14ms of delay between repeats.
--          So I want `updatetime` to be larger than like 20 ms, at least, so when holding down a key, the highlight won't flicker.

-- |> Virtual characters.
-- opt.listchars = "eol:↵,space:·,leadmultispace:.,tab:»›,trail:~,extends:❯,precedes:❮"     -- Everything visible.
opt.listchars = "eol:↵,tab:»›,trail:~,extends:❯,precedes:❮"                                 -- No listchar for spaces.
-- `End of Buffer` and `FoldColumn` display characters:
opt.fillchars = "eob: ,fold:·,foldopen:-,foldclose:+,foldsep:¦"     -- TODO: Seperator prolly looks bad.
opt.list = true         -- To toggle: ":set list" and ":set nolist".    ( Might have minor performance impact when `true`. )

-- |> Command line settings.
opt.showmode = false    -- Normal/Insert/Visual Mode command line visiblity toggle.     ( Custom version enabled in `heirline.nvim`. )
opt.showcmd = false     -- Toggle partial command info in command line.     ( Flickery, potentially impacts performance, and won't even show most pending commands. )
opt.cmdheight = 1       -- Short command line height. ( `1` pref without `Noice.nvim`. With Noice, `0` is useable. )
opt.cmdwinheight = 10   -- Window height of command line history window. (Activated by pressing Ctrl-F in command mode.)

--=========================================--+
-- === END - 3. General Settings - END === --|
--=========================================--+
--|------------------------------------------|
--===================================================--+
-- === START - 4. Functionality Settings - START === --|
--===================================================--+

-- => STATE: Good

-- |> Misc
opt.virtualedit = "all"                         -- Virtual Space => Enabled                 ( Allow moving cursor into cells without characters. )
opt.backspace = { "indent", "eol", "start" }    -- Backspace functionality.
opt.inccommand = "nosplit"                      -- Toggle incremental preview of commands.  ( `"nosplit"` to enable, `""` to disable. )
-- NOTE: `inccommand` flickers when used with `Noice.nvim`.

-- |> Completion popup settings.                    ( <C-x><C-n>, etc. | See `:help ins-completion` )
-- NOTE: `nvim-cmp` is not affected by these.

-- TODO: Create keybinding to utilize `ins-completion`.

-- PMenu
opt.completeopt = "menu,menuone,preview,"   -- Completion menu settings.    ( Probably quite heavily ignored by `nvim-cmp`. )
opt.pumheight   = 15                        -- Completion popup height.     ( Not sure if this affects `nvim-cmp` or not. )
opt.pumwidth    = 36                        -- Completion popup width.      ( `nvim-cmp` seems to ignore this. LSP-Kind might be overwriting it. )
-- Blend: Gives some seperation from rest of buffer, since `pmenu` does not support borders.
opt.pumblend    = 0                        -- Transparency percentage for popup menu.  ( Seems to affect `nvim-cmp` menu too. )

-- Wildmenu
opt.wildmenu    = false                     -- Built-in `Command line completion`.     ( Enabled by default. Disabled because I use `nvim-cmp`. )
opt.wildmode    = "full,longest,list"       -- No idea really. TODO: Experiment.
opt.wildoptions = "fuzzy,pum,tagfile"       -- Probably overwritten by `nvim-cmp` in general use.

-- |> Indentation Settings. ( STATE: Issues. )

-- Disable `vim-polyglot` autoindent and setting overwriting crap.
g.polyglot_disabled = {
    "autoindent",
    "sensible"
}

-- NOTE:    Settings can get overwritten by `polyglot.vim` filetype indentation rules,
--          If polyglot autoindent is enabled.
opt.autoindent = true       -- Automatic indentation.               ( Copy indent from current line )
opt.smartindent = true      -- More automatic/smart indentation.
opt.cindent = false         -- Some c-like indentation rule.        ( AutoCmd enabling this for C / C++ files. )
opt.copyindent = false      -- Copy indentation characters from previous line.      ( Not really much effect. )
opt.preserveindent = false  -- Preserve indent whitespace style.                    ( Not really much effect. )
opt.indentkeys = ""         -- Don't reindent when typing characters.

-- Indent opts were not being set properly.
-- This successfully forces `autoindent` and `smartindent` values, but is not yet fixing my indent issues.
local autoindent_aumgroup = vim.api.nvim_create_augroup("MyAutoIndent", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { '*' },
    callback = function()
        vim.bo.autoindent = true
        vim.bo.smartindent = true
    end,
    group = autoindent_aumgroup
})

-- TODO: LowPrio: go through `cpoptions` and see if there is something improveable there.
-- local cpo = "aABceFs_I"
-- vim.api.nvim_set_option_value('cpoptions', cpo, {})

-- |> Tabbing / Indentation settings.
opt.expandtab   = true  -- Convert Tabs to Spaces automatically.
opt.smarttab    = true  -- Navigation on indentation by tab-size.
opt.tabstop     = 4     -- Tab-size.
opt.shiftwidth  = 4     -- 0 Automatically inherits 'tabstop' value. ( Issue with this getting overwritten, so setting explicitly. )
opt.softtabstop = 4     -- -1 Automatically inherits 'tabstop' value.

-- |> Search settings.
opt.hlsearch = false    -- No permanent highlight after search.
opt.incsearch = true    -- Highlight search results while typing. ( Generally I really like this, but flickers when used with `Noice.nvim`. )
opt.ignorecase = true   -- Disable Case-sensitivity from search,
opt.smartcase = true    -- except for when search contains uppercase characters.
opt.wrapscan = true     -- Toggle searching to wrap from end of buffer to beginning of buffer.

-- |> Folding settings.
-- NOTE: Folding in Neovim is extremely borked, and almost unuseable.
opt.foldenable = true           -- Folding => Enabled
-- Fold Display Format

-- TODO: Work in progress foldtext function.
-- local function CustomFoldText()
    -- local fold_start = vim.v.foldstart
    --
    -- while vim.fn.getline(fold_start)
    --
    -- while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
    -- endwhile
    --
    -- if fs > v:foldend
    --     let line = getline(v:foldstart)
    -- else
    --     let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
    -- endif
    --
    -- let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
    -- let foldSize = 1 + v:foldend - v:foldstart
    -- let foldSizeStr = " " . foldSize . " lines "
    -- let foldLevelStr = repeat("+--", v:foldlevel)
    -- let lineCount = line("$")
    -- let foldPercentage = printf("[%.1f", (foldSize*1.0)/lineCount*100) . "%] "
    -- let expansionString = repeat(".", w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
    -- return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
-- end

vim.o.foldtext = [[
    substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)'
]]
vim.wo.foldmethod = "expr"    -- Fold Method.     ( `manual` / `marker` / `expr` / `indent` )
vim.wo.foldmarker = "{{{,}}}"   -- Fold Markers.    ( NOTE: These are probably just too clunky to use. )
-- vim.wo.foldexpr = "0"           -- Disable Fold expression.
-- NOTE: Treesitter foldexpr is unuseable until these are fixed:
-- `https://github.com/nvim-treesitter/nvim-treesitter/issues/1424`
-- `https://github.com/neovim/neovim/issues/14977`
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldcolumn = "0"            -- Toggle/Disable fold icons in sign-column.   ( `0` best. )
opt.foldlevel = 99              -- Current fold level.
opt.foldlevelstart = 99         -- 99 to start with all folds open. ( To close them when entering a buffer: z<S-m> )
opt.foldnestmax = 6            -- Max nested fold count.
opt.foldminlines = 1            -- Default.
opt.foldclose = ""              -- Set to "all" to close folds when cursor leaves them. ( It's too aggressive and not customizeable. )
opt.foldopen = "search,tag,mark,quickfix,percent,undo,insert,hor"

-- |> Scrolling settings.
opt.scrolloff = 9       -- Vertical scroll offset.      ( 0-20'ish )    ( NOTE: `neovide --multigrid` behaves really badly with scrolloffs. )
opt.sidescrolloff = 14  -- Horizontal scroll offset.    ( 0-20'ish )
opt.sidescroll = 8     -- Number of columns to jump for each `horizontal scroll`.  ( At a low number, this is extremely laggy. )

-- |> Split settings.
opt.splitright = true   -- Split direction right instead of left.
opt.splitbelow = true   -- Split direction below instead of above.

-- |> Wrap settings.
opt.wrap = false            -- Base text wrapping. (Virtual)
opt.linebreak = false       -- Break at specific column instead of last char that fits on screen.
opt.breakindent = true      -- When wrapping, visually indent lines.
opt.breakindentopt = "sbr"  -- `showbreak`
opt.showbreak = "❯ "
-- opt.textwidth = 80          -- Hard break column limit.      ( Enabled for `.md` and `.norg` in autocmd at bottom of file. )

--===============================================--+
-- === END - 4. Functionality Settings - END === --|
--===============================================--+
--|------------------------------------------------|
--============================================--+
-- === START - 5. Visual Settings - START === --|
--============================================--+

-- => STATE: Good

opt.syntax = "ON"               -- Syntax highlighting.             ( Non-treesitter syntax highlighting | Not required to call. )
opt.synmaxcol = 256             -- Max syntax highlight column.     ( Should improve performance. )
opt.cursorline = false          -- Visual Line-highlight Toggle.    ( `true` can negatively impact performance. )
opt.cursorcolumn = false        -- Visual column-highlight toggle   ( `true` can negatively impact performance. )
opt.number = false              -- Line Numbers.
opt.relativenumber = false      -- Relative Line Numbers.           ( `true` can negatively impact performance. )
opt.signcolumn = "no"           -- Signcolumn. (Gutter)
opt.showmatch = false           -- Jump to matching pairs when inserting them. (This is horrible. Do not enable.)
opt.matchpairs = "(:),{:},[:]"  -- Matchpairs to highlight and jump to using `%`.
opt.laststatus = 3              -- 0 = Never, 3 = Global StatusLine, maybe.
opt.conceallevel = 0            -- Never/Always hide conceal. (0/3) (Markdown and norg files set this to 2 or 3 in autocmd.)
opt.concealcursor = ""          -- Options: "nivc"   | Empty: Disable conceal on cursorline.
-- Allowing conceal in `Normal Mode`, because it looks less jittery. Works clean with `Neorg` + `Spider`.

--========================================--+
-- === END - 5. Visual Settings - END === --|
--========================================--+
--|-----------------------------------------|
--=========================================--+
-- === START - 6. GUI Settings - START === --|
--=========================================--+

-- => STATE: In-progress.

opt.termguicolors = true  -- 24-bit colors in terminal ui.
opt.guicursor = "n-v-sm:block,i-c-ci-ve:ver25,r-cr-o:hor20"  -- Cursor Settings

--=====================================--+
-- === END - 6. GUI Settings - END === --|
--=====================================--+
--|--------------------------------------|
--===================================================--+
-- === START - 7. Neovide Settings (GUI) - START === --|
--===================================================--+

-- => STATE: Good

-- |> Fullscreen / AA / Refresh Rate
g.neovide_no_idle = false
g.neovide_fullscreen = false
g.neovide_remember_window_size = false
g.neovide_input_use_logo = false
g.neovide_cursor_antialiasing = false
g.neovide_refresh_rate = 165
g.neovide_refresh_rate_idle = 30
g.neovide_transparency = 1
g.neovide_cursor_unfocused_outline_width = 0.125
g.neovide_confirm_quit = true
g.neovide_hide_mouse_when_typing = true
g.neovide_underline_automatic_scaling = false
g.neovide_profiler = false

-- |> Padding
g.neovide_padding_top       = 0
g.neovide_padding_bottom    = 0
g.neovide_padding_right     = 0
g.neovide_padding_left      = 0

-- |> Cursor Effect
g.neovide_cursor_trail_size = 0.5
g.neovide_cursor_trail_length = 0.06
g.neovide_cursor_vfx_mode = "pixiedust"
-- g.neovide_cursor_vfx_opacity = 150

-- |> Cursor Effect Particles
-- g.neovide_cursor_vfx_particle_lifetime = 0.90
-- g.neovide_cursor_vfx_particle_density = 12.0
-- g.neovide_cursor_vfx_particle_speed = 8.0
-- g.neovide_cursor_vfx_particle_phase = 2.5
-- g.neovide_cursor_vfx_particle_curl = 2.5

-- Temporary `Lots of Particles` Test.
g.neovide_cursor_vfx_opacity = 200
g.neovide_cursor_vfx_particle_lifetime = 1.25
g.neovide_cursor_vfx_particle_density = 64.0
g.neovide_cursor_vfx_particle_speed = 7.5
g.neovide_cursor_vfx_particle_phase = 3.0
g.neovide_cursor_vfx_particle_curl = 2.25

g.neovide_scroll_animation_length = 0.24
g.neovide_cursor_animation_length = 0.020
g.neovide_curser_animate_in_insert_mode = true
g.neovide_curser_animate_command_line = false           -- This doesn't seem to do anything.

--===============================================--+
-- === END - 7. Neovide Settings (GUI) - END === --|
--===============================================--+
--|------------------------------------------------|
--======================================================--+
-- === START - 8. Plugin Settings (Plugins) - START === --|
--======================================================--+

-- === |> Packer Plugin Management (Plugins)
require("packer").startup({function()

    -- === |> - START - Core / Helper / Dependencies
    --  - NOTE: Looking to move to `lazy.nvim`.
    use { "wbthomason/packer.nvim" }                                    -- Plugin Manager               ( STATE: Good )
    use { "nvim-lua/plenary.nvim" }                                     -- Helper functions             ( STATE: Good )
    -- === |> - START - Core / Helper / Dependencies

    -- === |> - START - Visual / UI
    use { "kyazdani42/nvim-web-devicons" }                              -- Icons                        ( STATE: Good )

    use {
        -- NOTE: Very very sadly, treesitter highlighting causes major lag in semi-large files.
        "nvim-treesitter/nvim-treesitter",
        run = function() require("nvim-treesitter.install").update({ with_sync = true }) end,
    }                                                                   -- Treesitter                   ( STATE: Scuffed. Many parts disabled. )

    -- Polyglot: Fallback Highlighting. Treesitter Alternative.
    --  - Faster in many cases.
    --  - Gives a good amount of unique capture groups, which can be used to set custom highlight colors.
    --      - Colors configured in: `Aumnechroma` Neovim Theme.
    use { "sheerun/vim-polyglot" }                                      -- Syntax highlighting          ( STATE: Good )

    -- `rust-syntax-ext`:
    --  - Even more unique highlight groups for `Rust`.
    use { "arzg/vim-rust-syntax-ext" }                                  -- Rust Syntax highlighting     ( STATE: Good )

    use { "m-demare/hlargs.nvim" }                                      -- Highlight arguments          ( STATE: Mostly Good )
    use { "onsails/lspkind-nvim" }                                      -- Completion Icons             ( STATE: Good )
    use { "stevearc/dressing.nvim" }                                    -- UI Lib                       ( STATE: Good )
    use { "MunifTanjim/nui.nvim" }                                      -- UI Lib                       ( STATE: Good )

    -- `noice.nvim` | Notes:
    --  - Best to not use it.
    --  - Unlikely to improve in near-future.
    --  - Negatively impacts performance in search and command modes.   ( Goes down from like 200 fps to 5-15 fps. )
    --  - Messes with `incsearch` and `inccommand` display.             ( Flicker, very annoying. )
    -- use { "folke/noice.nvim" }                                       -- UI Thing                     ( STATE: Bad )

    use { "lukas-reineke/headlines.nvim" }                              -- Highlight headings           ( STATE: Okay | Having some problems with this, but when it works, it is nice. )

    -- Notifications
    use { "rcarriga/nvim-notify" }                                      -- Notifications                ( STATE: Okay | Not too necessary though. )
    use { "j-hui/fidget.nvim" }                                         -- LSP Progress Notification    ( STATE: Good | TODO: Could look at configuring further. )

    -- `hlchunk.nvim`:
    --  - Most of the modules have extreme lag.
    --  - The one that does not lag has occasional rendering issues.
    -- use { "shellRaining/hlchunk.nvim" }                              -- Chunk and Indent Guides      ( STATE: Weak )
    -- === |> - END - Visual / UI

    -- === |> - START - LSP / Tooling
    -- |> LSP and LSP-Extras:
    use { "neovim/nvim-lspconfig" }                                     -- LSP                          ( STATE: Good )
    use { "simrat39/rust-tools.nvim" }                                  -- Rust-LS ++                   ( STATE: Good )
    use { "jose-elias-alvarez/nvim-lsp-ts-utils" }                      -- TypeScript-LS ++             ( STATE: Good | Also used for javascript. )
    use { "ranjithshegde/ccls.nvim" }                                   -- C / C++ LangServer           ( STATE: Okay | Might need some reconfiguration. )
    use { "folke/trouble.nvim" }                                        -- DiagViewer                   ( STATE: Good | TODO: Test and config more. )
    -- |> Debuggers:
    -- use { "mfussenegger/nvim-dap" }                                  -- Debugger                     ( STATE: Unknown | TODO: Install, config, test )
    -- use { "rcarriga/nvim-dap-ui" }                                   -- Debug UI                     ( STATE: Unknown | TODO: Install, config, test )
    -- === |> - END - LSP / Tooling

    -- === |> - START - Navigation
    use { "ggandor/leap.nvim" }                                         -- Fast Jump                    ( STATE: Okay )
    -- === |> - END - Navigation

    -- |> - START - Fuzzy Finder (Telescope)
    use { "nvim-telescope/telescope.nvim" }                             -- FuzzyFinder                  ( STATE: Good )
    use { "nvim-telescope/telescope-ui-select.nvim" }                   -- Telescope UI Extension       ( STATE: Good )
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }    -- Telescope FZF Extension      ( STATE: Good )
    use { "tzachar/fuzzy.nvim", requires = { "nvim-telescope/telescope-fzf-native.nvim" } }
    -- |> - END - Fuzzy Finder (Telescope)

    -- === |> - START - Autocompletion
    -- |> Snippets: LuaSnip
    -- NOTE: Moved to `LuaSnip` because `UltiSnips` causes lag.
    use { "L3MON4D3/LuaSnip", tag = "v1.*" }                            -- Snippets                     ( STATE: Very Good )

    -- |> Autocompletion: nvim-cmp
    use { "hrsh7th/nvim-cmp" }                                          -- Autocompletion               ( STATE: Good )
    use { "hrsh7th/cmp-nvim-lsp" }                                      -- Nvim-cmp Source              ( STATE: Good )
    use { "hrsh7th/cmp-nvim-lsp-signature-help" }                       -- Nvim-cmp Source              ( STATE: Okay )
    use { "hrsh7th/cmp-nvim-lua" }                                      -- Nvim-cmp Source              ( STATE: Okay )
    use { "hrsh7th/cmp-cmdline" }                                       -- Nvim-cmp Source              ( STATE: Fine, could be better. )
    use { "FelipeLema/cmp-async-path" }                                 -- Nvim-cmp Source              ( STATE: Good, probably )
    -- use { "hrsh7th/cmp-path" }                                       -- Nvim-cmp Source              ( STATE: Using async instead. )

    -- Fixed sorting order and improved completion flicker in local version.
    use { "~/Dev/NeovimPlugins/cmp-fuzzy-buffer",
        requires = { "hrsh7th/nvim-cmp", "tzachar/fuzzy.nvim" }
    }                                                                   -- Nvim-cmp Source              ( STATE: Good or Very Good )

    -- Luasnip Sources
    use { "saadparwaiz1/cmp_luasnip" }                                  -- Nvim-cmp Source              ( STATE: Good )
    use { "L3MON4D3/cmp-luasnip-choice" }                               -- Nvim-cmp Source              ( STATE: TODO: Testing )
    -- === |> - END - Autocompletion

    -- === |> - START - Statusline, Bufferline, Tabline, Winbar
    use { "rebelot/heirline.nvim" }                                     -- UI Bars                      ( STATE: Very good )
    -- === |> - END - Statusline, Bufferline, Tabline, Winbar

    -- === |> - START - File Explorer
    -- use { "kyazdani42/nvim-tree.lua" }                               -- File Explorer                ( STATE: Okay )

    -- NOTE: Looking to test others like `carbon.nvim`, `oil.nvim`, and `telescope-filebrowser`.
    -- Also `zoxide` extension for `Telescope`.

    -- === |> - END - File Explorer

    -- |> - START - Neovim Terminal Functionality
    use { "numToStr/FTerm.nvim" }                                       -- FloatingTerminal             ( STATE: Fine )
    -- |> - END - Neovim Terminal Functionality

    -- |> - START - Comment Toggling
    -- NOTE: Does not really need a full section for itself.
    use { "numToStr/Comment.nvim" }                                     -- Comment Toggling             ( STATE: Good )
    -- |> - END - Comment Toggling

    -- |> - START - Database stuff
    -- NOTE: Not using any of these at the moment.
    -- use { "tpope/vim-dadbod" }                                       -- Good for activating SQL queries.
    -- use { "kristijanhusak/vim-dadbod-ui" }                           -- This is okay, but not very necessary.
    -- use { "kristijanhusak/vim-dadbod-completion" }                   -- Having mild issues with this.
    -- |> - END - Database stuff

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

    use { "echasnovski/mini.nvim" }                                     -- & Extra Text Objects,        ( STATE: Good )
                                                                        -- & Surround operations.       ( STATE: Good )
                                                                        -- & other things.              ( STATE: TODO: Test )

    -- Favourites:
    use { "chrisgrieser/nvim-spider" }                                  -- Improved Word Motions.                       ( STATE: Very Good )
    use { "mrjones2014/legendary.nvim" }                                -- `Keymap Manager` and `Command Palette`.      ( STATE: Extremely Good )

    -- Colorization:
    use { "NvChad/nvim-colorizer.lua" }                                 -- Colors in editor             ( STATE: Fine )
    use { "aklt/plantuml-syntax" }                                      -- PlantUML SyntaxHL            ( STATE: Good, but really not used much. )

    -- Misc:
    use { "Saecki/crates.nvim", tag = "v0.3.0" }                        -- Rust Crates Helper           ( STATE: Testing )

    use { "andymass/vim-matchup" }                                      -- Better matchit / matchparen  ( STATE: Good, not perfect. )
                                                                        -- & Word and pair highlighting

    -- use { "tzachar/local-highlight.nvim" }                           -- Performant Cursorword-hl                     ( STATE: Okay )
    use { "~/Dev/NeovimPlugins/cursorword-highlight.nvim" }             -- Local version of `local-highlight.nvim`.     ( STATE: Good )

    -- Knowledge Management:
    use { "nvim-neorg/neorg" }                                          -- Note taking                  ( STATE: Testing )

    -- Disabled
    -- use { "beauwilliams/focus.nvim" }                                -- SplitResizing                ( STATE: TODO: Re-enable and test. )
    -- use { "abecodes/tabout.nvim" }                                   -- Tabout                       ( STATE: TODO: Re-enable and test. )
    -- use { "lervag/vimtex" }                                          -- LaTeX Support                ( STATE: Unknown )
    -- use { "smjonas/live-command.nvim" }                              -- Live previews                ( STATE: Laggy )

    -- Treesitter Extras:
    -- use { "nvim-treesitter/nvim-treesitter-textobjects" }            -- Textobjects                  ( STATE: Okay, not used much. )
    -- use { "p00f/nvim-ts-rainbow" }                                   -- Multicolor brackets.         ( STATE: Some issues. )
    -- use { "nvim-treesitter/nvim-treesitter-context" }                -- Scope Indicator              ( STATE: Some issues. )
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

-- |> Icon Setup -> START
require("nvim-web-devicons").setup({
    default = true
})
-- |> Icon Setup -> END

-- |> nvim-notify -> START
-- NOTE: Could almost remove this.
-- Almost nothing is creating notifications, and I don't particularly like them.
require("notify").setup({
    background_colour = "#040206",
    fps = 60,
})
-- |> nvim-notify -> END

-- Function for situationally disabling `Treesitter Highlighting`.
-- STATE: Seems to work.
local function ts_disable(lang, bufnr)
    -- Filetypes which have been caused very noticeable slowdowns for me:
    --  - `lua`         ( 4000 lines long file, really slow. )
    --  - `rust`        ( Not yet tested, but probably. )           ( TODO )

    -- Languages to disable `treesitter` for.
    local languages = {
        "lua",
        "rust",
        "html",             -- Not sure about this.
        "css",              -- Not sure about this.
        -- Treesitter is really beneficial in Svelte, as it contains like 5+ languages.
        -- -- "svelte",
    }

    for _key, language in pairs(languages) do
        if lang == language then
            return true
        end
    end

    -- Disable if file has over 1000 lines.
    if vim.api.nvim_buf_line_count(bufnr) > 1000 then
        return true
    end
end

-- |> START - Treesitter Setup
require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "bash", "fish", "c", "cpp", "cmake", "make", "rust", "go", "python",
        "css", "scss", "html", "javascript", "typescript", "vue", "svelte",
        "lua", "vim", "markdown", "toml", "yaml", "rst", "pug", "json",
        "jsonc", "glsl", "java", "kotlin", "tsx", "regex", "elm", "latex",
        "query", "commonlisp", "v", "markdown_inline", "vimdoc",
    },  -- NOTE: `norg` and `norg_meta` installed through `:Neorg sync-parsers` command.

    auto_install = false,

    highlight = {
        enable = true,

        -- Parser speeds apparently vary quite a lot.
        -- Disable `Treesitter` for any filetype where it causes noticeable lag.
        disable = function(lang, bufnr)
            if ts_disable(lang, bufnr) then
                return true
            else
                return false
            end
        end,

        additional_vim_regex_highlighting = false,
    },

    indent = {
        -- Probably prefer `false` right now.
        -- Testing `true` occasionally.
        --  - NOTE: Seems to do okay in Svelte files.
        enable = true,
    },

    rainbow = {
        enable = false,             -- `true` has some minor issues. Prefer not to have my crap borked.
        extended_mode = false,
        max_file_lines = 3000,
    },

    matchup = {
        enable = true,
        -- disable = { "c" },           -- Optional list of languages for which the plugin would be disabled.
        disable_virtual_text = false,
    }

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
-- |> END - Treesitter Setup

-- |> START - Leap.nvim Setup
-- Bindings are created in `good-binds.lua` file.
-- |> END - Leap.nvim Setup

--=============================================--+
-- === START - Nvim-Cmp -> Config  - START === --|
--=============================================--+

-- -- |> Dadbod-Completion settings.
-- g.completion_chain_complete_list = {sql = {{ complete_items = {"vim-dadbod-completion"} }} }
-- g.completion_matching_strategy_list = {"exact", "substring"}
-- g.completion_matching_ignore_case = 1

local cmp = require("cmp")
local cmp_compare = require("cmp.config.compare")
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
    history = true,
    enable_autosnippets = true,  -- I suspect I like this.

    -- A single character wrong in this string makes it fail, like a space after comma.
    update_events = "TextChanged,TextChangedI",  -- Without this, the repeat nodes are really clunky.
    delete_check_events = "TextChanged,InsertLeave",
    -- region_check_events = "CursorMoved,CursorMovedI",  -- Might cause lag.
})

require("cmp_luasnip_choice").setup({
    -- Automatically open `nvim-cmp` `Autocompletion Popup` on `Choice Node`.
    -- Default: `true`
    auto_open = true,
})

-- |> Loading LuaSnip Snippets - START

-- Snipmate snippets are working. (I will use these snippets for simple snippets.)
require("luasnip.loaders.from_snipmate").load({ paths = { "./snippets" } })

-- Lua snippets are working when created in a file and fetched. (I will use these snippets for more complicated things.)
require("luasnip.loaders.from_lua").load({ paths = { "./snippets" } })

-- LuaSnip `add_snippets` function is not working.
-- NOTE: It's deprecated I suppose, maybe something to explore, but not too relevant right now.
-- require("luasnip/snippets")
-- |> Loading LuaSnip Snippets - END

-- TODO/WIP
-- <CR> (Enter) binding/mapping functionality.
function AumUberEnter()
    local inside_pairs = false
    local opening_pair_before_cursor = false

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
        opening_pair_before_cursor = true
    elseif (char_before_cursor == "[") then
        opening_pair_before_cursor = true
    elseif (char_before_cursor == "{") then
        opening_pair_before_cursor = true
    end

    if inside_pairs then
        -- Not clean, works only in some filetypes. Does not work in Lua.
        vim.api.nvim_input("<NL><Esc>==<Up><S-a><NL>")
    elseif opening_pair_before_cursor then
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

    -- `performance`: Low values might reduce performance (?) at the cost of completion latency.   ( Or just affect completion delays. )
    --  - Large values make this absolutely unuseable. Low is good.
    performance = {  -- STATE: Very good.
        -- `debounce`: Delays updating the `nvim-cmp` `Completion Popup Menu` by `debounce` milliseconds.
        --  - The fetching/filling/adding of most sources' contents to the `Completion Popup Menu` is also delayed by `debounce` milliseconds.
        --  - Very low values cause very noticeably flickering.   (0-20)
        --  - Larger values will noticeably delay getting completions from most sources.
        --      - The `Completion Popup Menu` ...what.. TODO
        debounce = 26,               -- Low Value (20-50) = Probably Good   ( `26` seems to work best for me. )

        -- `throttle`:
        --  - Delays the closing of the `nvim-cmp` `Completion Popup Menu` by `throttle` milliseconds.
        --  - Increases duration of updating completion results when deleting characters. ( backspacing )
        --  - Does not seem to affect initial activation duration.
        --  - Does not seem to affect forwards completion updates.  ( At least not much. )
        --  - Increased a bit to fight flickering.
        throttle = 48,               -- Low Value (6-64) = Probably Good    ( `48` seems to work best for me. )

        -- `fetching_timeout`: Not sure what this is supposed to.
        --  - I'd think it might discard slow results, but it doesn't seem to be doing that.
        fetching_timeout = 20,
    },

    -- Disabled because of a bug with preselection: It skipped over snippets.
    preselect = cmp.PreselectMode.None,  -- Disables automatic preselection of the first item in the menu.
    -- NOTE: `<CR>` still forces `select = true`, so it can be used to complete the first entry even without preselect.

    -- Snippet support. (Very good, I think.)
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)    -- For LuaSnip.
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
        -- `Partial Matching`: Enabled
        disallow_partial_matching       = false,    -- `false`: Allow matching `trosihi` | `sihi` to `TroubleSignHint`. Very useful.
        disallow_prefix_unmatching      = false,    -- `false`: Allow matching `cmd` to `nvim_cmd`. Very useful.

        -- `Fuzzy Matching`: Can be useful, but actually not that relevant if the above settings are set to false.
        disallow_fuzzy_matching         = false,    -- `false`: Allow matching `comion` to `completion`.

        -- These two probably require `disallow_fuzzy_matching = false` to do anything.
        --  - Disallowing these reduces a good chunk of crap completions.
        disallow_fullfuzzy_matching     = true,     -- Not sure what this is supposed to do. Not seeing any difference.
        disallow_partial_fuzzy_matching = true,    -- `false`: Allow matching `sugcryl` to `sugar_crystal`. ( `l` not connected to `y` => partial )
    },

    window = {
        completion = {
            border = "rounded",
            winhighlight = "Normal:CmpNormal,FloatBorder:CmpFloatBorder,Pmenu:CmpPmenu,CursorLine:CmpCursorLine,Search:CmpSearch",  -- STATE: Good
            col_offset = 0,
            side_padding = 0,
            width = 32,
            height = 16,
            max_width = 92,
            max_height = 22,
        },
        documentation = {
            border = "rounded",
            winhighlight = "Normal:CmpDocNormal,FloatBorder:CmpDocFloatBorder,Pmenu:CmpDocPmenu,CursorLine:CmpDocCursorLineSearch,Search:CmpDocSearch,Comment:CmpDocComment",
            col_offset = 0,
            side_padding = 0,
            max_width = 96,
            max_height = 42,
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
                if cmp.visible() then
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                    -- cmp.select_next_item()  -- TODO: Remove this old value if the other one works.
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
                if cmp.visible() then
                    cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                    -- cmp.select_prev_item()  -- TODO: Remove this old value if the other one works.
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
        ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Replace }), { "i" }),
        -- Alternative `Select Previous Item`
        ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Replace }), { "i" }),
        -- Alternative `Select Next Item`
        ["<C-n>"] = cmp.mapping({
            c = function()
                if cmp.visible() then
                    -- TODO: Testing `Insert` instead of `Replace`.
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                else
                    vim.api.nvim_feedkeys(repterm('<Down>'), 'n', true)
                end
            end,
            i = function(fallback)
                if cmp.visible() then
                    -- TODO: Testing `Insert` instead of `Replace`.
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Replace })
                else
                    fallback()
                end
            end
        }),
        -- Alternative `Select Previous Item`
        ["<C-p>"] = cmp.mapping({
            c = function()
                if cmp.visible() then
                    -- TODO: Testing `Insert` instead of `Replace`.
                    cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                else
                    vim.api.nvim_feedkeys(repterm('<Up>'), 'n', true)
                end
            end,
            i = function(fallback)
                if cmp.visible() then
                    -- TODO: Testing `Insert` instead of `Replace`.
                    cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                else
                    fallback()
                end
            end
        }),
        -- Scrolling documentation. (Maybe WIP)
        ["<C-x>"] = cmp.mapping(cmp.mapping.scroll_docs(-2), {'i', 'c'}),
        ["<C-m>"] = cmp.mapping(cmp.mapping.scroll_docs(2), {'i', 'c'}),
        -- Force `Tabstop Jump Forward` (Maybe WIP)
        ["<C-b>"] = cmp.mapping({
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
        -- Force `Tabstop Jump Backward` (Maybe WIP)
        ["<C-S-b>"] = cmp.mapping({
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
        -- Force Open Autocompletion Popup Menu
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
        ["<C-h>"] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
        -- Force Close Autocompletion Popup Menu
        ["<C-e>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            s = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        -- Accept completion (also expand snippets), and do smart indenting when using <CR> (Enter).
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
            -- Ex: "<> Snippet"
            mode = 'symbol_text',

            -- Add completion source information.
            -- Ex: "<> Snippet `[Luasnip]`"
            menu = ({
                luasnip                     = "[LuaSnip]",
                nvim_lsp                    = "[LSP]",
                nvim_lua                    = "[NvimLua]",
                nvim_lsp_signature_help     = "[SigHelp]",
                async_path                  = "[Path]",
                crates                      = "[Crates]",
                fuzzy_buffer                = "[FuzzyBuffer]",
                luasnip_choice              = "[SnipChoice]",
            }),

            -- Maximum Width of `nvim-cmp` Autocompletion Popup.
            maxwidth = 48,
            -- When popup menu exceeds `maxwidth`, the truncated part will show `ellipsis_char` instead. ( `maxwidth` must be defined first. )
            ellipsis_char = '...',

            symbol_map = {
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
                TypeParameter = "",
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
        priority_weight = 2,
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

            -- Prioritise based on `Completion Type`.
            --  - Maybe `LSP` vs `Snippet` vs `Buffer`, etc, but really no idea.
            --  - I probably want this to have some effect.
            cmp_compare.kind,

            -- `Exact Text Match` (?)
            --  - Should probably have some effect, but can cause cases where irrelevant completions get 100% priority.
            --      - Like completing `thing` to `thing`.
            --  - Example: When completing `var` => Prioritise `var` over `variable`.
            cmp_compare.exact,

            -- Value of: `short-length` completion items.
            --  - Generally shorter completions are more common, so maybe this is fine around the middle.
            cmp_compare.length,

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
            --  - NOTE: Testing what happens if I just comment this out.
            -- cmp_compare.recently_used,
        }
    },

    -- `nvim-cmp`: Completion Sources   ( STATE: Very Good )
    --  - NOTE: Larger priority value is placed higher in sorting.
    sources = cmp.config.sources({
        -- LuaSnip: High priority because I want to use snippets often. ( Generally over LSP completion. )
        --  - Well behaving source.
        { name = "luasnip", priority = 50, keyword_length = 1, max_item_count = 32, option = { use_show_condition = true, show_autosnippets = false } },

        -- Signature Help: Very high priority because it is a special case completion.
        --  - NOTE: Comment out `nvim_lsp_signature_help` if using `Noice.nvim` for signature-help.
        { name = "nvim_lsp_signature_help", priority = 56, keyword_length = 2, max_item_count = 32 },

        -- LSP Completion: Very good and useful. High'ish priority.
        { name = "nvim_lsp", priority = 45, keyword_length = 2, max_item_count = 92 },

        -- Neovim Lua Completion: High'ish priority, as it is special-case. Not used a whole lot though.
        { name = "nvim_lua", priority = 45, keyword_length = 3, max_item_count = 64 },

        -- File System / Path Completion: Seems to work well. Special Case, so high'ish priority, but might not really need it.
        { name = "async_path", priority = 52, max_item_count = 64, option = { trailing_slash = true, label_trailing_slash = true } },

        -- Way better than using 'buffer' source. Fuzzy, more responsive, and less laggy.
        --  - This source does flicker relatively often/easily.     ( Somewhat configurable with the `nvim-cmp` `performance` options. )
        { name = "fuzzy_buffer", priority = 42, keyword_length = 3, max_item_count = 12, option = { max_matches = 12, max_match_length = 36, max_buffer_lines = 10000, fuzzy_extra_arg = 0 } },

        -- TODO: Test
        { name = "luasnip_choice", priority = 60 },

        -- Rust Crates Completion: Haven't tested much yet.
        { name = "crates", priority = 42, max_item_count = 32 },
    }),
})
-- nvim-cmp setup (Core) - END <|--

--=================================================--
-- === START - Nvim-cmp Extra Settings - START === --
--=================================================--

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
--|------------------------------------|
--=========================================--+
-- === START - LSP Keymappings - START === --|
--=========================================--+

-- STATE: Good?

-- |> START -> LSP Flags Setup
local lsp_flags = {
    allow_incremental_sync = true,  -- This used to be buggy, but maybe it is fine now.
    debounce_text_changes = 120     -- 150 is default, and probably is fine.
}
-- |> END -> LSP Flags Setup

-- |> START -> LSP Attach
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

    keymap('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)       -- STATE: Good. Displays good info and is responsive.

    keymap('n', '<space>f', function() vim.lsp.buf.format({ async = true }) end, bufopts)  -- STATE: Seems to be good.

    keymap('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)        -- STATE: Not sure, not really often used or required.
    keymap('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)     -- STATE: Not sure, not really often used or required.
    keymap('n', '<space>wl', function()                                        -- STATE: Not sure, not really often used or required.
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
end

-- |> START -> Typescript/Javascript LSP 'on_attach' Keybindings and stuff.
-- TODO/WIP: Needs testing, maybe cleanup, maybe further configuration.
local ts_lsp_on_attach = function(client, bufnr)
    local ts_utils = require("nvim-lsp-ts-utils")

    ts_utils.setup({
        debug = false,
        disable_commands = false,
        enable_import_on_completion = false,

        -- Import all.
        import_all_timeout = 5000,  -- ms

        -- Lower numbers = higher priority
        import_all_priorities = {
            same_file = 1,          -- Add to existing import statement.
            local_files = 2,        -- Git files or files with relative path markers.
            buffer_content = 3,     -- Loaded buffer content.
            buffers = 4,            -- Loaded buffer names.
        },

        import_all_scan_buffers = 100,
        import_all_select_source = false,

        -- If `false` will avoid organizing imports.
        always_organize_imports = false,

        -- Filter Diagnostics.
        filter_out_diagnostics_by_severity = {},
        filter_out_diagnostics_by_code = {},

        -- Inlay Hints.
        auto_inlay_hints = true,
        inlay_hints_highlight = "AumInlayHint",
        inlay_hints_priority = 200,     -- Priority of the hint extmarks.
        inlay_hints_throttle = 150,     -- Throttle the inlay hint request.
        inlay_hints_format = {          -- Format options for individual hint kind.
            Type = {},
            Parameter = {},
            Enum = {},
        },

        -- Update imports on file move.
        update_imports_on_move = false,
        require_confirmation_on_move = false,
        watch_dir = nil,
    })

    -- Required to fix Code Action ranges and Filter Diagnostics.
    ts_utils.setup_client(client)

    -- === - TS-LSP Mappings - ===

    -- Defining TS-Server LSP bindings.
    local ts_lsp_opts = { noremap = true, silent = true, buffer = true }
    local keymap = vim.keymap.set

    keymap('n', '<F2>',         vim.lsp.buf.rename,             ts_lsp_opts)    -- STATE: Good  ( I think `dressing.nvim` is overwriting the UI for this, and its good. )
    keymap('n', 'gh',           vim.lsp.buf.hover,              ts_lsp_opts)    -- STATE: Good, expect that it occasionally lags.   ( Rust-Analyzer, Pyright )
    keymap('n', 'gd',           vim.lsp.buf.definition,         ts_lsp_opts)    -- STATE: Good  ( Note potential conflicts when using multiple language servers for the same buffer. )
    keymap('n', '<space>D',     vim.lsp.buf.type_definition,    ts_lsp_opts)    -- STATE: Probably good
    keymap('n', 'gD',           vim.lsp.buf.declaration,        ts_lsp_opts)    -- STATE: Probably good

    keymap('n', 'gi',           vim.lsp.buf.implementation,     ts_lsp_opts)    -- STATE: Probably good ( TODO: Note potential conflicts when using multiple language servers for the same buffer. )
                                                                                -- - I might want to disable this for tsserver and use the one from `css-modules`?

    keymap('n', 'gr',           vim.lsp.buf.references,         ts_lsp_opts)    -- STATE: Bit awkward to use window. Some Aerial-like or Navigator plugin might be better.
    keymap('n', '<space>ca',    vim.lsp.buf.code_action,        ts_lsp_opts)    -- STATE: Probably good (Bind could be better.)

    keymap('n', '<C-k>',        vim.lsp.buf.signature_help,     ts_lsp_opts)    -- STATE: Good. Displays good info and is responsive.

    keymap('n', '<space>f',     function() vim.lsp.buf.format({ async = true }) end, ts_lsp_opts)  -- STATE: Seems to be good.

    keymap('n', '<space>wa',    vim.lsp.buf.add_workspace_folder,       ts_lsp_opts)    -- STATE: Not sure, not really often used or required.
    keymap('n', '<space>wr',    vim.lsp.buf.remove_workspace_folder,    ts_lsp_opts)    -- STATE: Not sure, not really often used or required.
    keymap('n', '<space>wl',    function()                                              -- STATE: Not sure, not really often used or required.
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, ts_lsp_opts)

    -- Show diagnostics in floating window.
    -- |> Default NvimLSP "open_float" Command.
    keymap("n", "<Leader>e",    vim.diagnostic.open_float(),    ts_lsp_opts)

    -- Next and Previous Diagnostic.
    -- |> Nvim-LSP Defaults:
    keymap("n", "]e",           vim.diagnostic.goto_next(),     ts_lsp_opts)
    keymap("n", "[e",           vim.diagnostic.goto_prev(),     ts_lsp_opts)

    -- Diagnostics lists.
    -- |> Default NvimLSP "Diagnostics LocList". (Seems to be the same as qflist)
    keymap("n", "<Leader>ll",   vim.diagnostic.setloclist(),    ts_lsp_opts)
    -- |> Default NvimLSP "Diagnostics QF-list". (Seems to work)
    keymap("n", "<Leader>qf",   vim.diagnostic.setqflist(),     ts_lsp_opts)

    keymap("n", "<Leader>org",  "<Cmd>TSLspOrganize<CR>",       ts_lsp_opts)
    keymap("n", "<Leader>rn",   "<Cmd>TSLspRenameFile<CR>",     ts_lsp_opts)
    keymap("n", "<Leader>ia",   "<Cmd>TSLspImportAll<CR>",      ts_lsp_opts)
end
-- |> END -> Typescript/Javascript LSP 'on_attach' Keybindings and stuff.

-- |> END -> LSP Attach

--=====================================--+
-- === END - LSP Keymappings - END === --|
--=====================================--+
--|--------------------------------------|
--=======================================================--+
-- === - START - Custom Capabilities For LSP - START === --|
--=======================================================--+

-- |> Add this on each server, as "capabilities = aum_capabilities".
-- |> NOTE: Though it might just work without it, too. (Maybe)
local aum_capabilities = require("cmp_nvim_lsp").default_capabilities();
aum_capabilities.textDocument.completion.completionItem.snippetSupport = true

-- |> START - UltraFold Setup

-- For `nvim-ufo`.  ( Which is disabled atm. )
-- aum_capabilities.textDocument.foldingRange = {
--     dynamicRegistration = false,
--     lineFoldingOnly = true
-- }

-- local ufo_handler = function(virtText, lnum, endLnum, width, truncate)
--     local newVirtText = {}
--     local suffix = (' ⋯ ⮟ %d '):format(endLnum - lnum)
--     local sufWidth = vim.fn.strdisplaywidth(suffix)
--     local targetWidth = width - sufWidth
--     local curWidth = 0
--
--     for _, chunk in ipairs(virtText) do
--         local chunkText = chunk[1]
--         local chunkWidth = vim.fn.strdisplaywidth(chunkText)
--
--         if targetWidth > curWidth + chunkWidth then
--             table.insert(newVirtText, chunk)
--         else
--             chunkText = truncate(chunkText, targetWidth - curWidth)
--             local hlGroup = chunk[2]
--             table.insert(newVirtText, {chunkText, hlGroup})
--             chunkWidth = vim.fn.strdisplaywidth(chunkText)
--
--             if curWidth + chunkWidth < targetWidth then
--                 suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
--             end
--
--             break
--         end
--
--         curWidth = curWidth + chunkWidth
--     end
--
--     table.insert(newVirtText, {suffix, 'MoreMsg'})
--
--     return newVirtText
-- end

-- local ufo_filetype_map = {
--     markdown = { "treesitter", "indent" },
--     vim = "indent",
--     python = { "indent" },
--     git = "",
-- }

-- local function customizeSelector(bufnr)
--     local function handleFallbackException(err, providerName)
--         if type(err) == 'string' and err:match('UfoFallbackException') then
--             return require('ufo').getFolds(bufnr, providerName)
--         else
--             return require('promise').reject(err)
--         end
--     end
--
--     return require('ufo').getFolds(bufnr, 'lsp'):catch(function(err)
--         return handleFallbackException(err, 'treesitter')
--     end):catch(function(err)
--         return handleFallbackException(err, 'indent')
--     end)
-- end

-- require("ufo").setup({
--     open_fold_hl_timeout = 120,
--     close_fold_kinds = { "imports", "comment" },
--
--     provider_selector = function(bufnr, filetype, buftype)
--         return { "treesitter", "indent" }
--         -- return ufo_filetype_map[filetype] or customizeSelector
--     end,
--
--     fold_virt_text_handler = ufo_handler,
-- })
-- |> END - UltraFold Setup

--=================================================--+
-- === END - Custom Capabilities For LSP - END === --|
--=================================================--+
--|--------------------------------------------------|
--===========================================================================--+
-- === START - LSP Handler, UI Customization & Diagnostics Setup - START === --|
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
-- === END - LSP Handler, UI Customization & Diagnostics Setup - END === --|
--=======================================================================--+
--|---------------------------------------------|
--============================================--+
-- === START - LSP Debugger Paths - START === --|
--============================================--+

-- TODO: Config debuggers.

-- local lldb_path = "/home/aumnescio/git/vscode-lldb/"
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
--|-----------------------------------------------------|
--====================================================--+
-- === START - LSP -> Rust-analyzer Setup - START === --|
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
            highlight = "AumInlayHint",  -- Configured in my theme: `Aumnechroma`.
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
            -- Relative path from current directory.
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
-- === END - LSP -> Rust-analyzer Setup - END === --|
--================================================--+
--|-----------------------------------------------|
--==============================================--+
-- === START - LSP -> Bash LS Setup - START === --|
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
-- === END - LSP -> Bash LS Setup - END === --|
--==========================================--+
--|-------------------------------------------|
--==========================================================--+
-- === START - LSP -> Lua Language Server Setup - START === --|
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
-- === END - LSP -> Lua Language Server Setup - END === --|
--======================================================--+
--|-------------------------------------------------------|
--===============================================================--+
-- === START - LSP -> JavaScript/TypeScript LS Setup - START === --|
--===============================================================--+

-- |> TS-Server (Javascript too)
-- STATE: Works, but meh.
-- nvim_lsp.tsserver.setup({
--     init_options = require("nvim-lsp-ts-utils").init_options,
--
--     -- Not 100% sure these work here. TODO: Test.
--     autostart = false,
--     single_file_support = false,
--
--     on_attach = ts_lsp_on_attach,       -- NOTE: Uses a different one from the default custom one.
--     capabilities = aum_capabilities,
--     handlers = aum_handler_config,
--     flags = lsp_flags
-- })

--===========================================================--+
-- === END - LSP -> JavaScript/TypeScript LS Setup - END === --|
--===========================================================--+
--|---------------------------------------------------------|
--========================================================--+
-- === START - LSP -> Svelte LangServer Setup - START === --|
--========================================================--+

-- STATE: The only functional `Web Development LSP`.
-- - Quite good even.
nvim_lsp.svelte.setup({
    cmd = { "svelteserver", "--stdio" },
    filetypes = { "svelte" },
    root_dir = nvim_lsp.util.root_pattern("package.json", ".git"),

    autostart = true,
    single_file_support = false,

    flags = lsp_flags,
    on_attach = aum_general_on_attach,
    capabilities = aum_capabilities,
    handlers = aum_handler_config,
})

--====================================================--+
-- === END - LSP -> Svelte LangServer Setup - END === --|
--====================================================--+
--|-----------------------------------------------------|
--============================================================--+
-- === START - LSP -> HTML/Emmet LangServer Setup - START === --|
--============================================================--+

-- |> START -> Emmet-LS Setup
-- STATE: Does something. Semi-buggy.
-- nvim_lsp.emmet_ls.setup({
--     autostart = false,
--     single_file_support = true,
--
--     cmd = { "emmet-ls", "--stdio" },
--     filetypes = { "html", "css" },
--     root_dir = nvim_lsp.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git", "pnpm-lock.yaml", "yarn.lock") or bufdir,
--
--     flags = lsp_flags,
--     on_attach = aum_general_on_attach,
--     capabilities = aum_capabilities,
--     handlers = aum_handler_config,
--
--     -- |> NOTE: See [this](https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267) for info no how to set these options.
--     -- init_options = {
--     --     html = {
--     --         options = {
--     --             ["something"] = true,
--     --         }
--     --     }
--     -- }
-- })
-- |> END -> Emmet-LS Setup

-- |> START -> HTML-LS Setup
-- STATE: This really does not offer much, but can still occasionally give beneficial autocomplete.
-- nvim_lsp.html.setup({
--     cmd = { "vscode-html-language-server", "--stdio" },
--
--     filetypes = { "html" },
--
--     init_options = {
--         configurationSection = { "html", "css", "javascript" },
--         embeddedLanguages = {
--             css = true,
--             javascript = true
--         },
--         provideFormatter = true
--     },
--
--     root_dir = nvim_lsp.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git", "pnpm-lock.yaml", "yarn.lock") or bufdir,
--     autostart = true,
--     single_file_support = true,
--
--     flags = lsp_flags,
--     on_attach = aum_general_on_attach,
--     capabilities = aum_capabilities,
--     handlers = aum_handler_config,
--
--     settings = {},
-- })
-- |> END -> HTML-LS Setup

--=============================================--+
-- === END - LSP -> HTML/Emmet Setup - END === --|
--=============================================--+
--|----------------------------------------------|
--============================================================================--+
-- === START - LSP -> CSS & TailwindCSS & UnoCSS LangServer Setup - START === --|
--============================================================================--+

-- |> START -> CSS-LS Setup
-- STATE: Functional, not epic.
-- nvim_lsp.cssls.setup({
--     cmd = { "vscode-css-language-server", "--stdio" },
--     filetypes = { "css", "scss", "less" },
--     root_dir = nvim_lsp.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git", "pnpm-lock.yaml", "yarn.lock") or bufdir,
--
--     autostart = true,
--     single_file_support = true,
--
--     flags = lsp_flags,
--     on_attach = aum_general_on_attach,
--     capabilities = aum_capabilities,
--     handlers = aum_handler_config,
--
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
--
--         less = {
--             validate = true
--         },
--
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
-- })
-- |> END -> CSS-LS Setup

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

-- |> START -> Uno-CSS-LS Setup
-- STATE: Basically unuseable. Works, but sucks.    ( Haven't played around with this a lot yet. )
-- nvim_lsp.unocss.setup({
--     cmd = { "unocss-language-server", "--stdio" },
--     filetypes = { "html", "javascript", "javascriptreact", "rescript", "typescript", "typescriptreact", "vue", "svelte" },
--     root_dir = nvim_lsp.util.root_pattern("uno.config.js", "uno.config.ts"),
--
--     autostart = true,
--     single_file_support = false,
--
--     flags = lsp_flags,
--     on_attach = aum_general_on_attach,
--     capabilities = aum_capabilities,
--     handlers = aum_handler_config,
-- })
-- |> END -> Uno-CSS-LS Setup

--================================================================--+
-- === END - LSP -> CSS Language Servers  Setup - END === --|
--================================================================--+
--|--------------------------------------------------------|
--=======================================================--+
-- === START - LSP -> Python Language Server - START === --|
--=======================================================--+

-- NOTE: Pyright is way better than Jedi-LSP.
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
-- === END - LSP -> Python Language Server - END === --|
--===================================================--+
--|---------------------------------------------------|
--==================================================--+
-- === START - LSP -> Diagnostics Setup - START === --|
--==================================================--+

vim.diagnostic.config({
    virtual_text = false,
    -- virtual_text = {
    --     source = "always",
    --     prefix = "●",
    --     spacing = 2,
    -- },  -- Bit too intrusive. Just using underline, jump to diagnostics and `trouble.nvim` is better.

    float = {  -- STATE: Good
        source = "always",
        border = "rounded",
    },

    signs = false,
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
-- === END - LSP -> Diagnostics Setup - END === --|
--==============================================--+
--|--------------------------------|
--===============================--+
-- === END - LSP Setup - END === --|
--===============================--+
--|--------------------------------|
--================================================--+
-- === START - Comment Toggling Setup - START === --|
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
-- === END - Comment Toggling Setup - END === --|
--============================================--+

-- |> START -> Floating Terminal Setup
require("FTerm").setup({  -- STATE: Good (Though in Neovide the colors are wrong, but no idea how to fix that.)
    cmd = 'fish',
    border = 'single',
    dimensions  = {
        height = 0.80,
        width = 0.80,
    },
    auto_close = true,
})
-- |> END -> Floating Terminal Setup

--=========================================--+
-- === START -> Formatter.nvim - Setup === --|
--=========================================--+

-- STATE: Good for c++. (Run with ':Format')
-- NOTE: Not sure how required this is, as `lsp` has a format option, too.

-- Utilities for creating configurations.
local format_util = require("formatter.util")

-- Provides the `Format`, `FormatWrite`, `FormatLock`, and `FormatWriteLock` commands.
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

        -- TODO: Haven't really tested this yet.        ( LSP might do a better job. )
        rust = {
            require("formatter.filetypes.rust").rustfmt
        },

        -- TODO: Haven't really tested this yet.
        lua = {
            require("formatter.filetypes.lua").stylua
        },

        -- TODO: Haven't really tested this yet.
        javascript = {
            require("formatter.filetypes.javascript").prettier
        },

        -- Use the special "*" filetype for defining formatter configurations on any filetype.
        ["*"] = {
            -- `formatter.filetypes.any` defines default configurations for any filetype.
            require("formatter.filetypes.any").remove_trailing_whitespace
        },
    }
}

--=======================================--+
-- === END -> Formatter.nvim - Setup === --|
--=======================================--+

-- |> START -> Telescope Setup
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
            case_mode = "smart_case"         -- `smart_case`, `ignore_case` or `respect_case`
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

-- |> END -> Telescope Setup

-- |> START -> Dressing.nvim Setup
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
                        case_mode = "smart_case"
                    }
                }
            else
                return {}
            end
        end
        ,
    },
})
-- |> END -> Dressing.nvim Setup

-- |> START -> Zen Mode Setup
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
-- |> END -> Zen Mode Setup


-- |> START -> Alpha-nvim Setup
require("alpha/startup_screen")  -- Lua module external file. (StartupScreen configuration)
-- |> END -> Alpha-nvim Setup

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

-- === |> - Aumneline. (START)
require("heirline/aumneline")
-- === |> - Aumneline. (END)

-- === |> - Mini addons. (START)
-- NOTE: I don't like `mini.pairs`.

-- |> mini-bufremove
require("mini.bufremove").setup()

-- |> AroundIn  ( TODO: Use and learn more. )
require("mini.ai").setup()

-- |> Surround Operations       ( Good )
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

-- === |> - Neorg (START)
require("neorg").setup({
    load = {
        [ "core.defaults" ] = {},       -- Loads default behaviour.
        [ "core.concealer" ] = {        -- Adds pretty icons to your documents.
            config = {
                -- NOTE: `diamond` best out of these, but need to disable preset to use custom icons.
                -- icon_preset = "diamond",     -- `basic` | `diamond` | `varied`
                icons = {
                    definition = {          -- TODO: Make sure the icons work as they should. Customize better ones.
                        enabled = true,
                        multi_prefix = {
                            enabled = true,
                            icon = "⋙ ",
                            query = "(multi_definition_prefix) @icon",
                        },
                        multi_suffix = {
                            enabled = true,
                            icon = "⋘ ",
                            query = "(multi_definition_suffix) @icon",
                        },
                        single = {
                            enabled = true,
                            icon = "≡",
                            query = "[ (single_definition_prefix) (link_target_definition) @no-conceal ] @icon",
                        },
                    },

                    delimiter = {           -- TODO: Make sure the icons work as they should. Customize better ones.
                        enabled = true,
                        horizontal_line = {
                            enabled = true,
                            highlight = "@neorg.delimiters.horizontal_line",
                            icon = "─",
                            query = "(horizontal_line) @icon",
                        },
                        strong = {
                            enabled = true,
                            highlight = "@neorg.delimiters.strong",
                            icon = "⟪",
                            query = "(strong_paragraph_delimiter) @icon",
                        },
                        weak = {
                            enabled = true,
                            highlight = "@neorg.delimiters.weak",
                            icon = "⟨",
                            query = "(weak_paragraph_delimiter) @icon",
                        },
                    },

                    footnote = {            -- TODO: Make sure the icons work as they should. Customize better ones.
                        enabled = true,
                        multi_prefix = {
                            enabled = true,
                            icon = "⁑",
                            query = "(multi_footnote_prefix) @icon",
                        },
                        multi_suffix = {
                            enabled = true,
                            icon = "⁑",
                            query = "(multi_footnote_suffix) @icon",
                        },
                        single = {
                            enabled = true,
                            icon = "⁎",
                            query = "[ (single_footnote_prefix) (link_target_footnote) @no-conceal ] @icon",
                        },
                    },

                    heading = {             -- STATE: Okay.
                        enabled = true,
                        level_1 = {
                            enabled = true,
                            highlight = "@neorg.headings.1.prefix",
                            icon = " ",        -- Options: `⟐ `, ` `, `󰺕 `, `󱥸 `, `◈`, `⟁ `, `⯈`
                            query = "[ (heading1_prefix) (link_target_heading1) @no-conceal ] @icon",
                        },
                        level_2 = {
                            enabled = true,
                            highlight = "@neorg.headings.2.prefix",
                            icon = " 󰺕 ",
                            query = "[ (heading2_prefix) (link_target_heading2) @no-conceal ] @icon",
                        },
                        level_3 = {
                            enabled = true,
                            highlight = "@neorg.headings.3.prefix",
                            icon = "  󱥸 ",
                            query = "[ (heading3_prefix) (link_target_heading3) @no-conceal ] @icon",
                        },
                        level_4 = {
                            enabled = true,
                            highlight = "@neorg.headings.4.prefix",
                            icon = "   ◈",
                            query = "[ (heading4_prefix) (link_target_heading4) @no-conceal ] @icon",
                        },
                        level_5 = {
                            enabled = true,
                            highlight = "@neorg.headings.5.prefix",
                            icon = "    ⟐ ",
                            query = "[ (heading5_prefix) (link_target_heading5) @no-conceal ] @icon",
                        },
                        level_6 = {
                            enabled = true,
                            highlight = "@neorg.headings.6.prefix",
                            icon = "     ⯈",
                            query = "[ (heading6_prefix) (link_target_heading6) @no-conceal ] @icon",
                        },
                    },

                    list = {        -- STATE: Okay.     ( Could be more unique and custom. )
                        enabled = true,
                        level_1 = {
                            enabled = true,
                            icon = "•",
                            query = "(unordered_list1_prefix) @icon",
                        },
                        level_2 = {
                            enabled = true,
                            icon = " •",
                            query = "(unordered_list2_prefix) @icon",
                        },
                        level_3 = {
                            enabled = true,
                            icon = "  •",
                            query = "(unordered_list3_prefix) @icon",
                        },
                        level_4 = {
                            enabled = true,
                            icon = "   •",
                            query = "(unordered_list4_prefix) @icon",
                        },
                        level_5 = {
                            enabled = true,
                            icon = "    •",
                            query = "(unordered_list5_prefix) @icon",
                        },
                        level_6 = {
                            enabled = true,
                            icon = "     •",
                            query = "(unordered_list6_prefix) @icon",
                        },
                    },

                    markup = {
                        enabled = true,
                        spoiler = {
                            enabled = true,
                            highlight = "@neorg.markup.spoiler",
                            icon = "•",
                            query = '(spoiler ("_open") _ @icon ("_close"))',
                        },
                    },

                    quote = {
                        enabled = true,
                        level_1 = {
                            enabled = true,
                            highlight = "@neorg.quotes.1.prefix",
                            icon = "│",
                            query = "(quote1_prefix) @icon",
                        },
                        level_2 = {
                            enabled = true,
                            highlight = "@neorg.quotes.2.prefix",
                            icon = "│",
                            query = "(quote2_prefix) @icon",
                        },
                        level_3 = {
                            enabled = true,
                            highlight = "@neorg.quotes.3.prefix",
                            icon = "│",
                            query = "(quote3_prefix) @icon",
                        },
                        level_4 = {
                            enabled = true,
                            highlight = "@neorg.quotes.4.prefix",
                            icon = "│",
                            query = "(quote4_prefix) @icon",
                        },
                        level_5 = {
                            enabled = true,
                            highlight = "@neorg.quotes.5.prefix",
                            icon = "│",
                            query = "(quote5_prefix) @icon",
                        },
                        level_6 = {
                            enabled = true,
                            highlight = "@neorg.quotes.6.prefix",
                            icon = "│",
                            query = "(quote6_prefix) @icon",
                        },
                    },

                    todo = {                -- STATE: Most of them are good, some could be better.
                        enabled = true,
                        undone = {
                            enabled = true,
                            icon = "−",         -- Options: `֎ `, `¤`, `⊟`, ``, `−`.
                            query = "(todo_item_undone) @icon",
                        },
                        urgent = {
                            enabled = true,
                            icon = "",         -- Options: ` `, ` `, `⚠`, ``.
                            query = "(todo_item_urgent) @icon",
                        },
                        done = {
                            enabled = true,
                            icon = "✓",         -- Options: `✓`.
                            query = "(todo_item_done) @icon",
                        },
                        uncertain = {
                            enabled = true,
                            icon = "",         -- Options: `⯑ `, ` `, ``.
                            query = "(todo_item_uncertain) @icon",
                        },
                        pending = {
                            enabled = true,
                            icon = "",        -- Options: ``, ``.
                            query = "(todo_item_pending) @icon",
                        },
                        on_hold = {
                            enabled = true,
                            icon = "",
                            query = "(todo_item_on_hold) @icon",
                        },
                        cancelled = {
                            enabled = true,
                            icon = "",         -- Options: ``, ``, `󰩺`, ``.
                            query = "(todo_item_cancelled) @icon",
                        },
                        recurring = {
                            enabled = true,
                            icon = "↺",
                            query = "(todo_item_recurring) @icon",
                        },
                    },
                },

                -- TODO: Report this problem as issue.
                -- The todo marker's ("(x)", etc) conceal character is offset in the foldtext.
                -- -- "(X) Heading Name" becomes:
                -- -- "( ) HeaXding Name" when folded.
                folds = false,              -- Disabling this solves some visual issues related to folds.
                dim_code_blocks = {
                    enabled = true,
                    content_only = true,
                    conceal = true,
                    adaptive = false,
                    padding = {
                        left = 2,
                        right = 4,
                    },
                    width = "fullwidth",    -- `fullwidth` | `content`
                }
            }
        },

        [ "core.dirman" ] = {      -- Manages Neorg workspaces.
            config = {
                workspaces = {
                    vault = "~/Secondbrain/Vault",
                },
                default_workspace = "vault"
            },
        },
    },
})

-- |> Separate `ordered list icons` config for Neorg.
local neorg = require("neorg")

-- Fetch the concealer config table for modification.
local neorg_ordered_config = neorg.modules.get_module_config("core.concealer").icons.ordered
local ordered_concealer_module = neorg.modules.get_module("core.concealer").concealing.ordered

-- Set `ordered.level_<n>.icon` functions.
neorg_ordered_config.level_1.icon = ordered_concealer_module.punctuation.unicode_dot(ordered_concealer_module.enumerator.numeric)
neorg_ordered_config.level_2.icon = ordered_concealer_module.enumerator.latin_lowercase
neorg_ordered_config.level_3.icon = ordered_concealer_module.punctuation.unicode_dot(ordered_concealer_module.enumerator.numeric)
neorg_ordered_config.level_4.icon = ordered_concealer_module.enumerator.latin_lowercase
neorg_ordered_config.level_5.icon = ordered_concealer_module.punctuation.unicode_dot(ordered_concealer_module.enumerator.numeric)
neorg_ordered_config.level_6.icon = ordered_concealer_module.enumerator.latin_lowercase

-- === |> - Neorg (END)

-- === |> - Spider.nvim (START)
-- NOTE: Keybinds in "good-binds.lua"
require("spider").setup({
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

-- === |> - cursorword-highlight.nvim (START)
require("cursorword-highlight").setup({
    file_types = {
        "markdown", "text", "latex", "tex", "norg", "html", "css", "sass", "scss",
        "lua", "rust", "python", "fish", "bash", "sh", "shell", "go", "json",
        "javascript", "javascriptreact", "typescript", "typescriptreact",
    },
    cw_hlgroup = "AumCursorwordCurrent",
    hlgroup = "AumCursorwordMatches"
})
-- === |> - cursorword-highlight.nvim (END)

-- === |> - fidget.nvim (START)
-- Related documentation: "https://github.com/j-hui/fidget.nvim/blob/main/doc/fidget.md"
require("fidget").setup({
    text = {
        spinner = "pipe",           -- Animation shown when tasks are ongoing.
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
-- === |> - fidget.nvim (END)

-- === |> - hlchunk.nvim (START)
-- NOTE: Disabled for now. But it seems mostly fine for `Indent Guides`.
-- require("hlchunk").setup({
--     chunk = { enable = false },         -- Extremely laggy. Effectively unuseable.
--     blank = { enable = false },         -- Don't care for it.
--     line_num = { enable = false },      -- Don't care for it.
--
--     -- Indent Guides seems to perform mostly acceptably.
--     --  - NOTE: Occasional rendering glitches.
--     indent = {
--         enable = true,
--         use_treesitter = false,
--         chars = { "│" },
--         style = { "#201830" },
--         exclude_filetype = {
--             dashboard = true,
--             help = true,
--             lspinfo = true,
--             packer = true,
--             checkhealth = true,
--             man = true,
--             mason = true,
--             NvimTree = true,
--             plugin = true,
--         },
--     },
-- })
-- === |> - hlchunk.nvim (END)

--========================================--+
-- === END - 8. Plugin Settings - END === --|
--========================================--+
--|-----------------------------------------|
--==============================================================================================--+
-- === START - 9. Mappings/Keymaps/Keymappings/Keybindings/Remaps/Shortcuts/Hotkeys - START === --|
--==============================================================================================--+
require("keybindings/good-binds")
--==========================================================================================--+
-- === END - 9. Mappings/Keymaps/Keymappings/Keybindings/Remaps/Shortcuts/Hotkeys - END === --|
--==========================================================================================--+
--|----------------------------------------------|
--=============================================--+
-- === START - 10. Custom Commands - START === --|
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

-- Autogroups and Autocommands:
-- TODO: Could move Autocommands to a file of their own. ( Only like 100 lines atm though. )

--=======================================================--+
-- === START - Markdown / Neorg Autocommands - START === --|
--=======================================================--+

-- |> Force `norg` filetype. ( Filetype detection seems broken right now or something. )
--  - NOTE: This looks like it solves the problem, but I am curious as to why there was a problem in the first place.
local norg_filetype_aumgroup = vim.api.nvim_create_augroup("MyNorgFiletype", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.norg" },
    command = "set filetype=norg",
    group = norg_filetype_aumgroup
})

-- |> Enable `Treesitter` for `markdown` files.         ( If this causes noticeable lag, can disable. )
-- - NOTE: Testing using just the Treesitter `enable` option. If it works, this is not needed. If it doesn't: re-enable this.
-- local ts_markdown_aumgroup = vim.api.nvim_create_augroup("MyMarkdownTreesitter", { clear = true })
-- vim.api.nvim_create_autocmd("BufEnter", {
--     pattern = { "*.md" },
--     command = "TSEnable highlight markdown",
--     group = ts_markdown_aumgroup
-- })

-- |> Enable `Treesitter` for `norg` files.             ( If this causes noticeable lag, can disable. )
-- - NOTE: Testing using just the Treesitter `enable` option. If it works, this is not needed. If it doesn't: re-enable this.
-- local ts_neorg_aumgroup = vim.api.nvim_create_augroup("MyNeorgTreesitter", { clear = true })
-- vim.api.nvim_create_autocmd("BufEnter", {
--     pattern = { "*.norg" },
--     command = "TSEnable highlight norg",
--     group = ts_neorg_aumgroup
-- })

-- |> Enable (Or disable) full conceal in Markdown, LaTeX, and Org files.
local writer_aumgroup = vim.api.nvim_create_augroup("MyMarkdownConceal", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.md", "*.tex", "*.org", "*.norg" },
    command = "lua vim.wo.conceallevel = 2",  -- Set to 0 to always show conceal characters. ( 2 or 3 to always conceal. )
    group = writer_aumgroup
})

-- |> Enable hard line breaks in Markdown, LaTeX, and Org files.
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.md", "*.tex", "*.org", "*.norg" },
    command = "lua vim.bo.textwidth = 96",
    group = writer_aumgroup
})

-- |> Some indent fixing thing, maybe.
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.md", "*.tex" },
    command = 'lua vim.opt.indentexpr = ""',
    group = writer_aumgroup
})

--===========================================--+
-- === END - Markdown Autocommands - END === --|
--===========================================--+
--|--------------------------------------------|
--===========================================--+
-- === START - Misc Autocommands - START === --|
--===========================================--+

-- |> Enable extra opts for some filetypes.         ( Relative line numbers, cursorline )
local extra_opts_aumgroup = vim.api.nvim_create_augroup("MyExtraOpts", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.rs" },
    command = "EnableExtraOpts",
    group = extra_opts_aumgroup
})

-- |> Indent fixing for C and CPP, maybe.
local cindent_aumgroup = vim.api.nvim_create_augroup("MyCindent", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.c", "*.cpp", "*.h", "*.hpp" },
    command = "lua vim.bo.cindent = true",
    group = cindent_aumgroup
})

-- |> Disable `mini.indentscope` in help files.     ( NOTE: Not using `mini.indentscope` anymore. )
-- local indentscope_aumgroup = vim.api.nvim_create_augroup("MyIndentScope", { clear = true })
-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = { "help" },
--     command = "lua vim.b.miniindentscope_disable = true",
--     group = indentscope_aumgroup
-- })

-- |> Fix conceal in help files.
local help_conceal_aumgroup = vim.api.nvim_create_augroup("MyHelpConceal", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "help" },
    command = 'lua vim.wo.concealcursor = ""',
    group = help_conceal_aumgroup
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "help" },
    command = 'lua vim.wo.conceallevel = 0',
    group = help_conceal_aumgroup
})

-- |> Highlight yanking.            ( NOTE: I suspect this works better when it's not in a `autogroup`. )
vim.api.nvim_create_autocmd("TextYankPost", {
    command = [[
        silent! lua vim.highlight.on_yank({
            higroup = 'AumYankHighlight',
            timeout = 192,
            on_visual = false,
        })
    ]]
})

-- |> Search Highlight AutoCommands         ( Good, but can potentially cause lag. ( The highlight, not so much the autocmd itself. ) )
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

-- |> Formatoptions. (This method of setting it seems to work...)
local formatopt_aumgroup = vim.api.nvim_create_augroup("MyFormatOpts", { clear = true })
vim.api.nvim_create_autocmd("BufEnter",{
    pattern = { "*" },
    command = "set fo-=r fo-=o",
    group = formatopt_aumgroup
})

-- |> Assembly Syntax (Asm)
local asmsyntax_aumgroup = vim.api.nvim_create_augroup("MyAsmSyntax", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { '*.asm' },
    command = "lua vim.bo.filetype = 'nasm'",
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
vim.api.nvim_cmd({ cmd = "colorscheme", args = { "aumnechroma-theme" } }, {})

-- |> Set Neovide Font:
vim.o.guifont = "JetBrainsMono Nerd Font:h19:b:#e-antialias:h-normal"
opt.linespace = 0  -- This seems to add space to the bottom of lines, making the line spacing uneven.
vim.g.neovide_scale_factor = 1.0

-- |> Format options    ( NOTE: Setting this like this does not work. Set above in an autocmd. )
-- opt.formatoptions = "tqj"

-- Testing syntax matchgroup and extmark things.
--  - `:match`
--  - `:syntax match`
--  - `nvim_buf_set_extmark()`

-- START => Whitespace Highlight and Trimming

-- Function for all my custom matches:
function aum_highlight_custom_matches()
    vim.api.nvim_cmd({ cmd = "match", args = { "AumTrailingWhitespace", [[/\s\+$/]] }}, {})
end

function aum_disable_trailing_whitespace_highlight()
    vim.api.nvim_cmd({ cmd = "match" }, {})
    -- vim.api.nvim_cmd({ cmd = "call", args = { "clearmatches()" }}, {})
end

function aum_trim_trailing_whitespace()
    vim.api.nvim_cmd({ cmd = "match" }, {})
end

-- Autocommands to toggle my syntax match groups.
local all_filetype_syntax_matching_aumgroup = vim.api.nvim_create_augroup("MySyntaxHighlightMatches", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "text",
        "markdown",
        "norg",
        "lua",
        "rust",
        "python",
    },
    command = "lua aum_highlight_custom_matches()",
    group = all_filetype_syntax_matching_aumgroup
})
vim.api.nvim_create_autocmd("InsertEnter", {
    command = "lua aum_disable_trailing_whitespace_highlight()",
    group = all_filetype_syntax_matching_aumgroup
})
vim.api.nvim_create_autocmd("InsertLeave", {
    command = "lua aum_highlight_custom_matches()",
    group = all_filetype_syntax_matching_aumgroup
})

-- Testing some crap.
vim.cmd([[autocmd FileType css,scss setlocal iskeyword+=-,?,!,#,.]])

-- Clear nearby Trailing Whitespace on `InsertLeave`.
-- Seems to work, but probably slower than it should be.                            ( Feels instant enough. )
-- This makes it almost impossible to accidentally insert trailing whitespace.      ( Which is good, generally. )
function aum_trim_nearby_whitespace()
    local cur_row, cur_col  = unpack(vim.api.nvim_win_get_cursor(0))
    local line_count = vim.api.nvim_buf_line_count(0)
    local range_start = 0
    local range_end = 0

    -- NOTE: Need to check and cap bounds for increment and decrement.
    if cur_row - 4 <= 0 then
        range_start = 0
    else
        range_start = cur_row - 4
    end

    if cur_row + 4 >= line_count then
        range_end = line_count
    else
        range_end = cur_row + 4
    end

    local command_string = "silent! " .. range_start .. "," .. range_end .. [[s/\s\+$//e]]

    vim.cmd(command_string)
    vim.api.nvim_win_set_cursor(0, {cur_row, cur_col})
end

local trim_whitespace_aumgroup = vim.api.nvim_create_augroup("MyTrimWhitespace", { clear = true })
vim.api.nvim_create_autocmd("InsertLeave", {
    command = "lua aum_trim_nearby_whitespace()",
    group = trim_whitespace_aumgroup
})

-- END => Whitespace Highlight and Trimming

-- === |> - Headlines.nvim (START)
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
    }
)
-- === |> - Headlines.nvim (END)

--=========================================--+
-- === END - 10. Custom Commands - END === --|
--=========================================--+

-- End of File

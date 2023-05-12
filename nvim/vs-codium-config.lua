--=====================================--+
-- === Aumnescio's Neovim Settings === --|
--=====================================--+

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

-- Disable `netrw`.
g.loaded_netrwPlugin = 1

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
opt.list = false         -- To toggle: ":set list" and ":set nolist".    ( Might have minor performance impact when `true`. )

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
opt.backspace = { "indent", "eol", "start" }    -- Backspace functionality.
opt.inccommand = ""                             -- Toggle incremental preview of commands.  ( `"nosplit"` to enable, `""` to disable. )

-- PMenu
opt.completeopt = ""   -- Completion menu settings.    ( Probably quite heavily ignored by `nvim-cmp`. )

-- |> Tabbing / Indentation settings.
-- opt.expandtab   = true  -- Convert Tabs to Spaces automatically.
-- opt.smarttab    = true  -- Navigation on indentation by tab-size.
-- opt.tabstop     = 4     -- Tab-size.
-- opt.shiftwidth  = 4     -- 0 Automatically inherits 'tabstop' value. ( Issue with this getting overwritten, so setting explicitly. )
-- opt.softtabstop = 4     -- -1 Automatically inherits 'tabstop' value.

-- |> Search settings.
-- opt.hlsearch = false    -- No permanent highlight after search.
-- opt.incsearch = true    -- Highlight search results while typing. ( Generally I really like this, but flickers when used with `Noice.nvim`. )
-- opt.ignorecase = true   -- Disable Case-sensitivity from search,
-- opt.smartcase = true    -- except for when search contains uppercase characters.
-- opt.wrapscan = true     -- Toggle searching to wrap from end of buffer to beginning of buffer.

--===============================================--+
-- === END - 4. Functionality Settings - END === --|
--===============================================--+
--|------------------------------------------------|
--============================================--+
-- === START - 5. Visual Settings - START === --|
--============================================--+

-- => STATE: Good

-- opt.syntax = "ON"               -- Syntax highlighting.             ( Non-treesitter syntax highlighting | Not required to call. )
-- opt.synmaxcol = 256             -- Max syntax highlight column.     ( Should improve performance. )
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

opt.termguicolors = true  -- 24-bit colors in terminal ui.
opt.guicursor = "n-v-sm:block,i-c-ci-ve:ver25,r-cr-o:hor20"  -- Cursor Settings

-- === |> Packer Plugin Management (Plugins)
require("packer").startup({function()
    use { "wbthomason/packer.nvim" }                                    -- Plugin Manager               ( STATE: Good )
    use { "nvim-lua/plenary.nvim" }                                     -- Helper functions             ( STATE: Good )
    use { "ggandor/leap.nvim" }                                         -- Fast Jump                    ( STATE: Okay )
    use { "numToStr/Comment.nvim" }                                     -- Comment Toggling             ( STATE: Good )
    use { "tpope/vim-repeat" }                                          -- Improved Repeat              ( STATE: Good )
    use { "tpope/vim-endwise" }                                         -- Minor Autocompletions        ( STATE: Bit unknown )
    use { "tpope/vim-eunuch" }                                          -- Shell commands from vim.     ( STATE: Bit unknown )
    use { "gcmt/wildfire.vim" }                                         -- Expand selection             ( STATE: Better than nothing, but kind of bad. )
    use { "echasnovski/mini.nvim" }                                     -- & Extra Text Objects,        ( STATE: Good )
                                                                        -- & Surround operations.       ( STATE: Good )
                                                                        -- & other things.              ( STATE: TODO: Test )
    -- Favouritesgn
    use { "chrisgrieser/nvim-spider" }                                  -- Improved Word Motions.                       ( STATE: Very Good )
    use { "mrjones2014/legendary.nvim" }                                -- `Keymap Manager` and `Command Palette`.      ( STATE: Extremely Good )
    -- === |> - END - Misc Nice Things - ===
end})

--===================================--+
-- === START - LSP Setup - START === --|
--===================================--+
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

require("spider").setup({
    skipInsignificantPunctuation = true
})

require("keybindings/vs-codium-binds")

-- End of File

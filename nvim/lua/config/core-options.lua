--=====================================--+
-- === Aumnescio's Neovim Settings === --|
--=====================================--+

-- |> Enable Lua Module `Byte Compilation Cache`.  ( Or some such. )
--  - Supposed to speed up startup time.
--  - Not a whole lot of documentation on this.
--  - Recommended in `impatient.nvim` README, as replacement for the plugin.
--  - NOTE: `lazy.nvim` probably would enable this already..
-- vim.loader.enable()

-- NOTE TO SELF: I disabled the `html.vim` file in Exectubles/Neovim `runtime` directory. (`disabled-html.vim`)
--  - If issue related to this, revert the name of this file.

--============================================--+
-- === - START - 1. Essential Settings  - === --|
--============================================--+

-- => STATE: Good

-- |> API Aliases
local g         = vim.g
local opt       = vim.opt

-- Testing:
opt.debug       = ""        -- 'msg' => Will cause error spam when typing regex searches.
opt.selection   = "old"     -- Not feeling any difference with this on `old` vs `inclusive`. The `exclusive` option is bad.

-- Leader key
vim.g.mapleader = [[\]]

-- |> Globals
-- This probably does nothing, as it is already default.
g.do_filetype_lua = true

-- - Disabling `matchparen` (built-in plugin) highlighting, because it lags.
--  - Not super often, but even occasional stutter is unacceptable.
g.loaded_matchparen     = 1
g.loaded_matchit        = 1

-- Disable `netrw`.
g.loaded_netrwPlugin    = 1

-- `editor-config` file support. (I don't use these so `false` for now.)
g.editorconfig = false

-- -- |> START => `vim-matchup` config
-- g.matchup_enabled                           = 1         -- `0` to disable the plugin.
-- g.matchup_motion_enabled                    = 1         -- `0` to disable the module.
-- g.matchup_transmute_enabled                 = 0         -- `0` to disable the experimental module.
-- g.matchup_surround_enabled                  = 1         -- `0` to disable the feature.
-- g.matchup_text_obj_enabled                  = 1         -- `0` to disable the module.
-- g.matchup_delim_stopline                    = 420       -- Number of lines to search in either direction when using motions and text-objects.
-- g.matchup_delim_noskips                     = 2         -- `2` to disable matching symbols inside comments.
-- g.matchup_matchparen_enabled                = 1         -- `0` to disable the module.
-- g.matchup_matchparen_fallback               = 0         -- `0`: Never fallback to the default `matchparen` plugin.
-- g.matchup_matchparen_offscreen              = {}        -- Offscreen match-search and highlight disabled.
-- g.matchup_matchparen_stopline               = 42        -- Search +-42 lines from current line. (For highlighting pairs)
-- g.matchup_matchparen_timeout                = 60        -- Not sure, some timeout.
-- g.matchup_matchparen_insert_timeout         = 20        -- Not sure, some timeout.
--
-- -- Improve performance by delaying match-searching and highlight.
-- --  - This is broken though, the highlights will constantly toggle themselves off,
-- --  and the hide delays don't work.
-- g.matchup_matchparen_deferred               = 0
--
-- g.matchup_matchparen_deferred_show_delay    = 128       -- Delay until match-search / highlight.
-- g.matchup_matchparen_deferred_hide_delay    = 64        -- Delay until hiding stale highlight.
-- g.matchup_matchparen_deferred_fade_delay    = 32        -- `0` to disable fading.               ( Not quite sure what this does. )
-- g.matchup_matchparen_hi_surround_always     = 1         -- Highlight surrounding pairs always.  ( This is ok. )
-- g.matchup_matchparen_pumvisible             = 0         -- Highlight disabled while popupmenu open.
-- -- |> END => `vim-matchup` config

opt.hidden          = true      -- Keeps unsaved buffers open in the background. (Seems to be good as 'true' for some reasons.)
opt.swapfile        = false     -- Not exactly sure what this is. Default is 'true', but off seems good?
-- NOTE: This combination of backup options should create backups on save but delete them after successful saves.
opt.backup          = false     -- `false` is default.
opt.writebackup     = true      -- `true` is default. Not having this seemed unsafe.
opt.autoread        = true      -- Automatically read changed file.

-- This should be fine. (Also should be same as default.)
-- NOTE: The environment variables need to be manually expanded using some function, a plain string causes problems.
opt.undodir         = vim.fs.normalize("$XDG_STATE_HOME/nvim/undo/")
opt.undofile        = true      -- Save undo history for all files.
opt.undolevels      = 2000      -- Number of undo-steps to save. (Affects the `undofiles`.)

-- |> Error Bell settings.
opt.visualbell      = false     -- Don't flash my screen.
opt.errorbells      = false     -- No PING/BANG sounds plz.

--===========================================--+
-- === END - 1. Essential Settings - END === --|
--===========================================--+
--|--------------------------------------------|
--============================================--+
-- === START - 2. System Settings - START === --|
--============================================--+

-- => STATE: Good

opt.mouse       = "a"           -- Enable mouse-support in all modes: "a".
opt.mousehide   = true          -- Hide mouse cursor/pointer when typing.

-- `shortmess`: Affects some messages seen in the command line. (`:help shortmess`)
opt.shortmess:append("qfFsScCWI")       -- NOTE: 'F' might hide some things that would occasionally be useful? But it also doesn't hide enough.

-- Clipboard related things were causing major issues, like Neovim not starting up properly or long startup time.
g.clipboard = {                         -- This seems to solve all clipboard issues I was having.
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
opt.clipboard:append("unnamedplus")     -- Enable System-clipboard functionality. ( Working well. )

opt.grepprg         = [[rg --vimgrep --no-heading --smart-case]]    -- Use ripgrep.
opt.grepformat      = "%f:%l:%c:%m,%f:%l:%m"                        -- Grep format.
g.python3_host_prog = "/usr/bin/python3"    -- Path to Python3.

-- NOTE: The `nvim_rocks` plugin had an interaction with these, and did not work with fish shell by default. But I made it work with Fish for now.
opt.shell           = "/usr/bin/fish"       -- Set default shell to fish.   ( Might cause issues with some stuff so be a tad aware. )
-- opt.shell           = "/bin/sh"             -- Set default shell to sh.   ( Does this work fine when I'm using `fish`? )

g.tex_flavor        = "latex"               -- Set LaTeX flavor.            ( Changes syntax highlighting. )
opt.formatprg       = "fmt --width 84"
opt.equalprg        = ""                    -- NOTE: I want something else here prolly. Dunno where to find formatter that works on all filetypes.

-- g.loaded_python_provider = 1     -- Unsure what this is. Supposed to maybe speed something up.
-- g.python_host_skip_check = 1     -- Unsure what this is. Supposed to maybe speed something up.
-- g.python3_host_skip_check = 1    -- Unsure what this is. Supposed to maybe speed something up.

--========================================--+
-- === END - 2. System Settings - END === --|
--========================================--+
--|-----------------------------------------|
--=============================================--+
-- === START - 3. General Settings - START === --|
--=============================================--+

-- => STATE: Good
-- NOTE: `ttyfast` and `ttyscroll` existed in Vim, but have been removed from Neovim, so there is no need to set those values.
opt.ruler           = false     -- Toggle visibility for line/column number in status bar. ( They still show up in most statuslines. )
opt.spell           = false     -- Toggle spellchecking. (Dynamic toggle: `:set spell` | `:set nospell`) ( This is a too intrusive by default. )
opt.spelllang       = "en"      -- Languages to spellcheck. "en_us"

-- |> Responsiveness settings.
-- opt.timeout         = false      -- Infinite operator pending wait time.
-- opt.timeoutlen      = 0
-- opt.ttimeout        = false      -- Makes leaving Insert mode using <Esc> faster, so keys don't fuckup.
-- opt.ttimeoutlen     = 0

-- |> `wf.nvim` seemingly requires `timeout` enabled and `timeoutlen` above zero to work properly.
opt.timeout         = false          -- I really strongly prefer this at `false`.

-- `timeoutlen`: Requires `timeout=true` to do anything.
--  - This is what controls the `wf.nvim` wait duration.
--  - Very low `timeoutlen` makes most of my keys just fail, it is unuseable.
--  - Large timeouts can feel like shit. Pressing `<Leader><Leader>` causes 2 `wf.nvim` windows to popup.
--  - Canceling a <Leader> chord also activates `wf.nvim`, which is awkward.
opt.timeoutlen      = 420

opt.ttimeout        = false          -- I suppose this is fine at false, though not quite sure if needed. (Testing...)
opt.ttimeoutlen     = 5000


-- |> Having `lazyredraw = true` is a large performance increase when running macros.
opt.lazyredraw      = true      -- Stop updating screen when running a macro. (If true) (`Noice.nvim` wants this off.)

-- NOTE: `updatetime` is used for `cursorword-highlight.nvim` cursorword highlighting. ( I wish it wasn't locked to this value. )
opt.updatetime      = 28        -- Some update-rate thing to help smoothness.
-- Very low values are more likely to cause lag. Under `10` is almost certainly going to lag.
-- But I want this to be as low as possible.
-- The cursorword-highlighting is insanely horrible looking, if the delay is noticeable.
-- NOTE:    I have `keyboard repeat-rate` at 80 per second, which means about 12.5ms of delay between repeats.
--          So I want `updatetime` to be larger than ~20ms, at least, so when holding down a key, the highlight won't flicker.

-- |> Virtual characters.
opt.listchars       = "eol:↵,tab:»›,trail:~,extends:❯,precedes:❮,leadmultispace:▎   "   -- No listchar for spaces.
-- `End of Buffer` and `FoldColumn` display characters:
opt.fillchars       = "eob:⏐,fold:·,foldopen:󰍴,foldclose:,foldsep:|"       -- `eob` could be better.
opt.list            = true      -- To toggle: ":set list" and ":set nolist".    ( Might have minor performance impact when `true`. )

-- |> Command line settings.
opt.showmode        = false     -- Normal/Insert/Visual Mode command line visiblity toggle.     ( Custom version enabled in `heirline.nvim`. )

-- NOTE:    If the `silent` option is configured properly in bindings, this isn't completely horrible.
--          - Super flickery. Potentially hurts performance.
opt.showcmd         = false     -- Toggle pending command info in command line.

opt.cmdheight       = 1         -- Short command line height.                       ( `1` pref without `Noice.nvim`. With Noice, `0` is useable. )
opt.cmdwinheight    = 10        -- Window height of command line history window.    ( Activated by pressing `<C-f>` in command mode. )

--=========================================--+
-- === END - 3. General Settings - END === --|
--=========================================--+
--|------------------------------------------|
--===================================================--+
-- === START - 4. Functionality Settings - START === --|
--===================================================--+

-- => STATE: Good

-- |> Misc
opt.virtualedit     = "all"                             -- Virtual Space => Enabled                 ( Allow moving cursor into cells without characters. )
opt.backspace       = { "indent", "eol", "start" }      -- Backspace functionality.
opt.inccommand      = "nosplit"                         -- Toggle incremental preview of commands.  ( `"nosplit"` to enable, `""` to disable. )
-- NOTE: `inccommand` flickers when used with `Noice.nvim`.
--  - I'm not using `Noice.nvim`.

-- |> Completion popup settings.                    ( <C-x><C-n>, etc. | See `:help ins-completion` )
-- PMenu
opt.completeopt     = "menu,menuone,preview"    -- Completion menu settings.    ( Probably quite heavily ignored by `nvim-cmp`. )
opt.pumheight       = 8                         -- Completion popup height.     ( Affects `nvim-cmp`, unless maybe manually hard-overwritten somewhere. )
opt.pumwidth        = 46                        -- Completion popup width.      ( `nvim-cmp` seems to ignore this. LSP-Kind might be overwriting it. )
-- `pumblend` affects nvim-cmp too, and seems to change the foreground color too.
--  - NOTE: Having a bit of pumblend allows the user to see text behind the completion popup, which can occasionally be useful.
opt.pumblend        = 16                        -- Transparency percentage for completion popup menu.

-- Wildmenu
opt.wildmenu        = false                     -- Built-in `Command line completion`.     ( Enabled by default. Disabled because I use `nvim-cmp`. )
opt.wildmode        = "full,longest,list"       -- Affects the native auto-completion popup display, but doesn't really do anything if using `nvim-cmp`.
opt.wildoptions     = "fuzzy,pum,tagfile"       -- Probably overwritten by `nvim-cmp` in general use.

-- |> Indentation Settings.     ( STATE: Issues. )

-- Disable `vim-polyglot` autoindent, setting overwriting bullshit and `ftdetect`.
--  - the `vim-sleuth` autoindent detection (coming from Polyglot) can add more than 10 seconds of startup time.
--      - in 'large' files (500k lines)
--  - TODO: Create my own syntax highlighting from scratch.
--      - Might be too big of a job to do... Maybe for some filetypes, like HTML or CSS. Even that would be a big job.
g.polyglot_disabled = {
    "autoindent",
    "sensible",
    "ftdetect",
}

-- NOTE:    Settings can get overwritten by `polyglot.vim` filetype indentation rules, (or by something else)
--          Pretty sure autoindent and smartindent don't do anything in most cases,
--          as either Treesitter or some other plugin will be handling the indentation.
opt.autoindent      = true     -- Automatic indentation.               ( Copy indent from current line )
opt.smartindent     = true     -- More automatic/smart indentation.
opt.cindent         = true      -- Some C-like indentation rule.        ( Probably needs to be disabled for some filetypes. )
opt.copyindent      = true      -- Copy indentation characters from previous line.      ( Not really much effect. )
opt.preserveindent  = true      -- Preserve indent whitespace style.                    ( Not really much effect. )
opt.indentexpr      = ""        -- TODO: Figure out something good for this.
-- opt.indentexpr      = "nvim_treesitter#indent()"     -- Treesitter Indenting.
opt.indentkeys      = "o:"      -- Characters that cause reindeting.    ( Some filetype plugins will modify this. )
opt.cinkeys         = "o:"      -- Characters that cause reindeting when `cindent` is on.
opt.cinwords        = [[if,then,while,do]]      -- Keywords that cause indentation.
opt.cinoptions      = ""        -- Some situational indent size multiplier.

-- HTML Indentation Configuration
--  - See `:help html-indent`
g.html_indent_script1   = "inc"
g.html_indent_style1    = "inc"
g.html_indent_attribute = 1

-- Tags that increase indent-level.
--  - This works well.
--  - Some tags are going to be wrong, but wrong indentation will be easy to spot and easy to fix by removing the tag from this list.
g.html_indent_inctags = [[
    head,body,tbody,base,style,title,header,footer,main,nav,
    section,h1,h2,h3,h4,h5,h6,dd,dt,dl,div,figure,figcaption,
    ol,ul,menu,p,a,abbr,code,data,span,audio,video,map,track,
    embed,iframe,object,picture,portal,source,svg,math,canvas,
    noscript,script,table,thead,tbody,tfeet,tr,button,datalist,
    fieldlist, form,option,output,progress,select,textarea,
    details,dialog,summary,slot,template
]]  --  - Removed: `html`

-- Tags that don't increase indent-level. (?)
g.html_indent_autotags = "html"

-- TODO: LowPrio: go through `cpoptions` and see if there is something improveable there.
-- local cpo = "aABceFs_I"
-- vim.api.nvim_set_option_value('cpoptions', cpo, {})

-- |> Tabbing / Indentation settings.
opt.expandtab       = true      -- Convert Tabs to Spaces automatically.
opt.smarttab        = true      -- Navigation on indentation by tab-size.
opt.tabstop         = 4         -- Tab-size.
opt.shiftwidth      = 4         -- 0 Automatically inherits 'tabstop' value. ( Issue with this getting overwritten, so setting explicitly. )
opt.softtabstop     = 4         -- -1 Automatically inherits 'tabstop' value.

-- |> Search settings.
opt.hlsearch        = false     -- No permanent highlight after search.
opt.incsearch       = true      -- Highlight search results while typing. ( Flickers if used with `Noice.nvim`. )
opt.ignorecase      = true      -- Disable Case-sensitivity from search,
opt.smartcase       = true      -- except for when search contains uppercase characters.
opt.wrapscan        = true      -- Toggle searching to wrap from end of buffer to beginning of buffer.

-- |> Folding settings.
-- NOTE: Folding in Neovim is extremely borked, and almost unuseable.
opt.foldenable      = true      -- Folding => Enabled

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

-- This gets overwritten by `nvim-ufo`.
vim.o.foldtext = [[
    substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)'
]]

-- `expr` can cause lots of lag.
-- `syntax` lags when used with Treesitter, and requires file-type support or manual implementation.
--          - But, `syntax` would be the best way to fold, if not using treesitter. Folds are accurate and not buggy.
-- `marker` clutters files with text.
-- `manual` maybe when using nvim-ufo is best so far? But still having folding issues.
vim.wo.foldmethod = "manual"    -- Fold Method.     ( `manual` / `marker` / `expr` / `indent` / `syntax` )

-- `foldmarker`: Bit clunky to use, but the most dynamic (in the sense of what can be folded), accurate, and reliable way to fold.
--  - Lags 200000 times less than treesitter foldexpr.
vim.wo.foldmarker = "{{{,}}}"   -- Fold Markers.
-- vim.wo.foldexpr = "0"        -- Disable Fold expression.     ( Does this conflict with nvim-ufo? I'd imagine ufo should be able to overwrite this. )

-- Treesitter FoldExpr: Increases startup time by an absolutely monstrous duration.
--  - And not necessarily easy to track down to this. The cause does not show up in lazy's profiling, or when using `--startuptime`.
--  - To avoid most of these issues, this can maybe be set in an autocmd for files under 3k lines.
--  - NOTE: Treesitter foldexpr is unuseable until these are fixed:
--      - `https://github.com/nvim-treesitter/nvim-treesitter/issues/1424`
--      - `https://github.com/neovim/neovim/issues/14977`
--  - And there are probably more issues, like performance.
-- vim.wo.foldexpr = "nvim_treesitter#foldexpr()"      -- Fold based on Treesitter. ( Enabled in `./lua/config/autocommands` for `.norg` files. )

opt.foldcolumn      = "0"       -- Toggle/Disable fold icons in sign-column.   ( `0` best. )
opt.foldlevel       = 99        -- Current fold level.
opt.foldlevelstart  = 99        -- 99 to start with all folds open. ( To close them when entering a buffer: z<S-m> )
opt.foldnestmax     = 6         -- Max nested fold count.
opt.foldminlines    = 1         -- Default.
opt.foldclose       = ""        -- Set to "all" to close folds when cursor leaves them. ( It's too aggressive and not customizeable. )
opt.foldopen        = "block,hor,search,tag,mark,percent,quickfix,undo"
-- opt.foldopen        = "block,hor,search,tag,mark,percent,quickfix,undo,insert"

-- |> Scrolling settings.
-- NOTE: `scroll` has to be set in an autocmd to work properly: `./lua/config/autocommands.lua`
opt.scroll          = 3      -- Number of lines to scroll when using `<C-u>` and `<C-d>`.
-- NOTE: Having a `scrolloff` larger than `nvim-cmp` max-height ensures that the completion menu only opens downwards.
--  - Which I like,
--  - but `scrolloff` also causes flicker, which I despise.     ( Some plugins might be causing worse flicker. )
--  - NOTE: I can't really get nvim to flicker when run with `nvim --clean`.
--  - NOTE: But still, as of `Oct 9 2023`, flicker is unbearable.
opt.scrolloff       = 8         -- Vertical scroll offset.      ( 0-20'ish )
opt.sidescrolloff   = 12        -- Horizontal scroll offset.    ( 0-20'ish )
opt.sidescroll      = 32        -- Number of columns to jump for each `horizontal scroll`.  ( Low values can cause extreme lag. )

-- |> Split settings.
opt.splitright      = true      -- Split direction right instead of left.
opt.splitbelow      = true      -- Split direction below instead of above.

-- |> Wrap settings.
opt.wrap            = false     -- Virtual Text-wrapping.   ( I dislike the look, words aren't being wrapped at good spots/borders/breakpoints. )
opt.linebreak       = true      -- Stops words from being split in two. (And can do something else too.)
opt.breakindent     = true      -- When wrapping, visually indent lines.
opt.breakindentopt  = "sbr"     -- Options: "sbr" | ""
opt.showbreak       = "󰘍"       -- Can make it more obvious when a line has been wrapped. (But looks annoying.)
-- opt.showbreak       = ""        -- Does not cause the awkward offset that is caused by the above setting.
-- opt.textwidth = 80           -- Hard break column limit.      ( Enabled for `.md` and `.norg` in ./plugins/autocommands.lua. )

--===============================================--+
-- === END - 4. Functionality Settings - END === --|
--===============================================--+
--|------------------------------------------------|
--============================================--+
-- === START - 5. Visual Settings - START === --|
--============================================--+

-- => STATE: Good

opt.syntax              = "on"          -- Syntax highlighting.             ( Non-treesitter syntax highlighting | Not required to set this opt. )
opt.synmaxcol           = 256           -- Max syntax highlight column.     ( Improves performance. )
opt.cursorline          = true          -- Visual Line-highlight Toggle.    ( `true` can negatively impact performance. )
opt.cursorcolumn        = false         -- Visual column-highlight toggle   ( `true` can negatively impact performance. )
-- opt.number              = false         -- Line Numbers.                    ( `true` can negatively impact performance. )
opt.relativenumber      = false         -- Relative Line Numbers.           ( `true` can negatively impact performance. )
opt.signcolumn          = "no"          -- Signcolumn. (Gutter)             ( Will probably have `git-signs.nvim` enable this on load. )
opt.showmatch           = false         -- Jump to matching pairs when inserting them. (This is horrible. Do not enable.)
opt.matchpairs          = "(:),{:},[:]" -- Matchpairs to highlight and jump to using `%`.
opt.laststatus          = 3             -- 0 = Never, 3 = Global StatusLine, maybe.
opt.conceallevel        = 2             -- Never/Always hide conceal. (0/3) (Markdown and norg files set this to 2 or 3 in autocmd.)
opt.concealcursor       = ""            -- Options: "nivc"   | Empty: Disable conceal on cursorline.
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
opt.guicursor = "n-v-ve-sm:block,i-c-ci:ver25,r-cr-o:hor20"  -- Cursor Settings

--=====================================--+
-- === END - 6. GUI Settings - END === --|
--=====================================--+
--|--------------------------------------|
--===================================================--+
-- === START - 7. Neovide Settings (GUI) - START === --|
--===================================================--+

-- => STATE: Good

-- |> Set Neovide Font:
-- vim.o.guifont = "JetBrainsMono Nerd Font:h18:b"
-- vim.o.guifont = "JetBrainsMono Nerd Font:h18:b:#e-antialias:h-normal"
opt.linespace = 0  -- This (above 0) seems to add space to the bottom of lines, making the line spacing uneven.

-- |> Settings: Fullscreen / AA / Refresh Rate, etc.
g.neovide_no_idle                           = false
g.neovide_fullscreen                        = false
g.neovide_remember_window_size              = false
g.neovide_input_use_logo                    = false
g.neovide_cursor_antialiasing               = true

-- |> Font/Text
g.neovide_text_gamma = 0.0
g.neovide_text_contrast = 0.5

-- Seems to cause major lag at values larger than `165`.    ( Tested `330` )
--  - But `165` is really smooth.
g.neovide_refresh_rate                      = 165

g.neovide_refresh_rate_idle                 = 30
g.neovide_transparency                      = 1.0          -- Could be overwritten by Picom. (Compositor)
g.neovide_scale_factor                      = 1.0
g.neovide_cursor_unfocused_outline_width    = 0.125
g.neovide_confirm_quit                      = true
g.neovide_hide_mouse_when_typing            = true
g.neovide_underline_automatic_scaling       = false
g.neovide_profiler                          = false

-- |> Padding
g.neovide_padding_top                       = 0
g.neovide_padding_bottom                    = 0
g.neovide_padding_right                     = 48
g.neovide_padding_left                      = 48

-- |> Cursor Effects
g.neovide_cursor_animation_length           = 0.00825
g.neovide_cursor_trail_size                 = 0.895
g.neovide_cursor_trail_length               = 0.375
g.neovide_cursor_vfx_mode                   = "pixiedust"
g.neovide_cursor_vfx_opacity                = 125
g.neovide_cursor_vfx_particle_lifetime      = 0.3825
g.neovide_cursor_vfx_particle_density       = 192.0
g.neovide_cursor_vfx_particle_speed         = 16.0
g.neovide_cursor_vfx_particle_phase         = 8.0
g.neovide_cursor_vfx_particle_curl          = 2.5
g.neovide_curser_animate_in_insert_mode     = true
g.neovide_curser_animate_in_command_line    = true
g.neovide_curser_animate_command_line       = true

-- |> Scroll
g.neovide_scroll_animation_length           = 0.25

-- NOTE: `neovide --multigrid` sucks as of 01.06.2023.
--  - The smooth scroll flickers.
--  - Seems quite unlikely for it to get better any time soon.

--===============================================--+
-- === END - 7. Neovide Settings (GUI) - END === --|
--===============================================--+

-- PHP indentation settings (TODO: Move somewhere else.)
vim.g.PHP_default_indenting = 1
vim.g.PHP_BracesAtCodeLevel = 0

-- Disabling SQL omnicompletion.
--  - It was bugging me in files where it really should not be active.
vim.g.omni_sql_no_default_maps = 1
vim.cmd([[let $omnifunc = '']])
vim.g.loaded_sql_completion = 1

-- `fzf.vim` settings
vim.g.fzf_layout = {
    window = {
        width = 0.98,
        height = 0.9,
    },
}

vim.g.fzf_colors = {
    fg = { "fg", "Normal" },
    bg = { "bg", "Normal" },
    hl = { "fg", "Comment" },
    ["fg+"] = { "fg", "CursorLine", "CursorColumn", "Normal" },
    ["bg+"] = { "bg", "CursorLine", "CursorColumn" },
    ["hl+"] = { "fg", "Statement" },
    info = { "fg", "PreProc" },
    border = { "fg", "Ignore" },
    prompt = { "fg", "Conditional" },
    pointer = { "fg", "Exception" },
    marker = { "fg", "Keyword" },
    spinner = { "fg", "Label" },
    header = { "fg", "Comment" },
}

-- TEMP FOLDING STUFF:
-- - Don't even remember what this is about.
-- vim.g.rust_fold = 1

-- End of File

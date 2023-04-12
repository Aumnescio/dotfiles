--=================================================================================================--
-- === START - Mappings/Keymaps/Keymappings/Keybindings/Remaps/Shortcuts/Hotkeys/Binds - START === --
--=================================================================================================--

-- Aliases.
local bindkey = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Key:         \ ( Backslash )
-- Action:      Leader Key.
vim.g.mapleader = "\\"

--========================================--
-- === START - Marks and tags - START === --
--========================================--

-- => STATE: No idea.

-- Key:         Shift-m
-- Action:      Create a mark?
bindkey("n",    "<S-m>", "m",        opts)
bindkey("o",    "<S-m>", "m",        opts)

-- Key:         `        ( backtick )
-- Action:      No idea.
bindkey("n",    "`",     "`",        opts)
bindkey("o",    "`",     "`",        opts)

-- Key:         `"       ( backtick, double quote )
-- Action:      No idea.
bindkey("n",    '`"',    '`"',       opts)

-- Key:         `[       ( backtick, opening square bracket )
-- Action:      No idea.
bindkey("n",    "`[",    "`[",       opts)

-- Key:         `]       ( backtick, closing square bracket )
-- Action:      No idea.
bindkey("n",    "`]",    "`]",       opts)

-- Key:         `<       ( backtick, opening angle bracket )
-- Action:      No idea.
bindkey("n",    "`<",    "`<",       opts)

-- Key:         `>       ( backtick, closing angle bracket )
-- Action:      No idea.
bindkey("n",    "`>",    "`>",       opts)

-- Key:         `.       ( backtick, period )
-- Action:      No idea.
bindkey("n",    "`.",    "`.",       opts)

-- Key:         :marks
bindkey("n",    "<Leader><Leader><Leader>`marks", ":marks<CR>",   opts)

-- Key:         :jumps
bindkey("n",    "<Leader><Leader><Leader>`jumps", ":jumps<CR>",   opts)

-- Key:         Ctrl-]
-- Action:      Jump to tag?
bindkey("n",    "<C-]>",     "<C-]>",        opts)

-- Key:         Ctrl-Shift-T
-- Action:      Free?
bindkey("n",    "<C-S-t>",   "<C-S-t>",      opts)

--====================================--
-- === END - Marks and tags - END === --
--====================================--
--|------------------------------------|
--======================================================--
-- === START - Insert Mode / Inserting Text - START === --
--======================================================--

-- => STATE: Good

-- Key:         Esc
bindkey("i",    "<Esc>",    "<Esc>",    opts)

-- Key:         Ctrl-k
bindkey("i",    "<C-k>",    "<C-o>",    opts)

-- Key:         w
bindkey("n",    "w",        "i",        opts)
bindkey("o",    "w",        "i",        opts)

-- Key:         a
bindkey("n",    "a",        "a",        opts)
bindkey("o",    "a",        "a",        opts)

-- Key:         Shift-w
bindkey("n",    "<S-w>",    "<S-i>",    opts)
bindkey("v",    "<S-w>",    ":normal W",  { silent = false })

-- Key:         Shift-a
bindkey("n",    "<S-a>",    "<S-a>",    opts)
bindkey("v",    "<S-a>",    ":normal A",  { silent = false })

-- Key:         ie
-- Action:      Enter insert mode at end of current word.
bindkey("n",    "ie",       "ea",       opts)

-- Key:         ih
-- Action:      Enter insert mode on line below.
bindkey({ "n", "o" },    "ih",       "o",        opts)

-- Key:         it
-- Action:      Enter insert mode on line above.
bindkey({ "n", "o" },    "it",       "<S-o>",    opts)

--=================================--
-- === END - Insert Mode - END === --
--=================================--
--|---------------------------------|
--==================================--
-- === START - Deleting - START === --
--==================================--

-- => STATE: Good
-- |> NOTE: "noremap = false" in Blackhole mappings leads to instant Crash/Freeze when pressing 'x' or 'd'.

-- Key:         s
bindkey("n",    "s",        '"_d',          opts)
bindkey("v",    "s",        '"_d',          opts)
bindkey("o",    "s",        '"_d',          opts)

-- Key:         ss / sl
bindkey("n",    "ss",       '"_dd0',        opts)
bindkey("n",    "sl",       '"_dd0',        opts)

-- Key:         Shift-s
bindkey("n",    "<S-s>",    '"_<S-d>',      opts)

-- Key:         fj
bindkey("n",    "fj",       '"_x',          opts)
bindkey("o",    "fj",       '"_x',          opts)

-- Key:         Ctrl-h         ( NOTE: This is same as Ctrl - <BS> )
-- bindkey("i",    "<C-h>",    "<C-w>",            opts,    "Deleting",    "del_prew_word_insert_one",   "Delete word before the cursor. (Insert)")

-- Key:         <BS>  ( Backspace )
bindkey("n",    "<BS>",     "i<C-h><Esc><Right>",  opts)
bindkey("i",    "<BS>",     "<C-h>",               opts)
bindkey("v",    "<BS>",     '"_d',                 opts)

-- Key:         Ctrl - <BS>  ( Backspace )
bindkey("i",    "<C-BS>",   "<C-w>",               opts)
-- bindkey("n", "<C-BS>", '"_dd0')  -- This does not work, because of it being linked to Ctrl-h. (TODO: Make it work, because can do so in Kitty now.)
-- bindkey("v", "<C-BS>", '"_d')    -- This does not work, because of it being linked to Ctrl-h. (TODO: Make it work, because can do so in Kitty now.)

-- Key:         Shift-i
-- Action:      Join lines with spaces.
bindkey({ "n", "o", "v" },    "<S-i>",    "<S-j>",      opts)

-- Key:         g, Shift-i
-- Action:      Join lines without spaces.
bindkey({ "n", "o", "v" },    "g<S-i>",   "g<S-j>",     opts)

--==============================--
-- === END - Deleting - END === --
--==============================--
--|------------------------------|
--======================================================================--
-- === START - Changing and Replacing text ( Change/Replace ) - START === --
--======================================================================--

-- => STATE: Good

-- Key:         k
bindkey({ "n", "v" , "o" },     "k",        '"_c',      opts)

-- -- Key:         kn
-- bindkey({ "n", "o" },           "kn",       '"_cw',     opts)
--
-- -- Key:         ko
-- bindkey({ "n", "o" },           "ko",       '"_cb',     opts)

-- Key:         kk
bindkey("n",    "kk",       '"_cc',     opts)

-- Key:         kin
bindkey("n",    "kin",      '"_ciw',     opts)

-- Key:         kan
bindkey("n",    "kan",      '"_caw',     opts)

-- Key:         kio
bindkey("n",    "kio",      '"_cib',     opts)

-- Key:         kao
bindkey("n",    "kao",      '"_cab',     opts)

-- Key:         c
bindkey("n",    "c",        "r",        opts)
bindkey("o",    "c",        "r",        opts)
bindkey("v",    "c",        "~",        opts)

-- Key:         Shift-c
bindkey("n",    "<S-c>",    "<S-r>",    opts)
bindkey("o",    "<S-c>",    "<S-r>",    opts)

-- Key:         u
bindkey("v",    "u",        "u",        opts)

-- Key:         Shift-u
bindkey("v",    "<S-u>",    "<S-u>",    opts)

-- Key:         gq
bindkey({"n", "v", "o"},    "gq",       "gq",       opts)

-- Key:         Shift-d                 ( NOTE: I really like this. )
-- Action:      Replace word under cursor and prep dot repeat replacement.
bindkey("n",    "<S-d>",    '*<S-n><Cmd>set hlsearch<CR>"_cgn',     opts)

-- Key:         gb
-- Action:      Replace word under cursor and prep dot repeat replacement. (But this don't work.)
-- NOTE:        On its own this does not really do anything.
bindkey({"n", "v", "o"},    "gb",       "gn",     opts)

-- Key:         kgb
-- Action:      Replace word under cursor and prep dot repeat replacement.
-- NOTE:        Move this elsewhere.
bindkey({"n", "o"},    "kgb",       '*<S-n><Cmd>set hlsearch<CR>"_cgn',     opts)

-- Key:         gx
-- Action:      Open URL under cursor. ( Might also work for opening files like images. )   ( This is quite scuffed. )
bindkey({"n", "o"},    "gx",        "gx",     { noremap = true, silent = false })

-- Key:         is
-- Action:      Insert a <Space>.
bindkey("n",    "is",               "i<Space><Esc>",   opts)

--=================================================--
-- === END - Changing and Replacing text - END === --
--=================================================--
--|------------------------------------------|
--==========================================--
-- === START - Chord Starters - START - === --
--==========================================--

-- STATE: Good'ish (I think.)

-- Key:         g
-- Action:      Do nothing, wait for next key in chord.
bindkey({"n", "v", "o"},    "g",    "g",   opts)

-- Key:         i
-- Action:      Do nothing, wait for next key in chord. (  Can enter insert too, if not pressing a chord key.)
bindkey({"n", "o", "v"},    "i",    "i",   opts)

-- Key:         z
-- Action:      Do nothing, wait for next key in chord. ( Can jump to a character, if not pressing chord key. )
bindkey({"n", "o", "v"},    "z",    "t",   opts)

-- Key:         zt
-- Action:      Jump to `Character`. ( 1 Character before )
bindkey({"n", "o", "v"},    "zt",    "t",   opts)

-- Key:         zf
-- Action:      Jump to `Character`. ( On top of. )       ( Same as "j" )
bindkey({"n", "o", "v"},    "zf",    "f",   opts)

-- Key:         z=
-- Action:      Fix spelling.               
-- NOTE:        TODO: Move somewhere else.
bindkey({"n", "o"},    "z=",    "z=",   opts)

-- Key:         <Leader>sp
-- Action:      Automatically fix next spelling mistake.
-- NOTE:        TODO: Move somewhere else.
bindkey({"n", "o"},    "<Leader>sp",    "]s1z=",   opts)

--======================================--
-- === END - Chord Starters - END - === --
--======================================--
--|--------------------------------------|
--==========================================--
-- === START - Split Bindings - START - === --
--==========================================--

-- => STATE: Not ready. (TODO) (But these do work.)

-- Key:         Ctrl-w + t
bindkey("n",    "<C-w>t",    "<C-w>k",    opts)

-- Key:         Ctrl-w + h
bindkey("n",    "<C-w>h",    "<C-w>j",    opts)

-- Key:         Ctrl-w + q
bindkey("n",    "<C-w>q",    "<C-w>h",    opts)

-- Key:         Ctrl-w + e
bindkey("n",    "<C-w>e",    "<C-w>l",    opts)

-- NOTE: These probably need to be re-mapped. ( Prolly bindings for focus.nvim )

-- Key:         Space-sp
-- bindkey("n",    "<Space>sp",    ":FocusSplitNicely<CR>",    opts)

-- Key:         Ctrl-Shift-Alt-w
-- bindkey("n", "<C-S-A-w>", ":FocusSplitUp<CR>",       opts, "Navigation", "focus_split_up",      "Move focus to above split. (Normal)")

-- Key:         Ctrl-Shift-Alt-s
-- bindkey("n", "<C-S-A-s>", ":FocusSplitDown<CR>",     opts, "Navigation", "focus_split_below",   "Move focus to below split. (Normal)")

-- Key:         Ctrl-Shift-Alt-a
-- bindkey("n", "<C-S-A-a>", ":FocusSplitLeft<CR>",     opts, "Navigation", "focus_split_left",    "Move focus to left split. (Normal)")

-- Key:         Ctrl-Shift-Alt-g
-- bindkey("n", "<C-S-A-g>", ":FocusSplitRight<CR>",    opts, "Navigation", "focus_split_right",   "Move focus to right split. (Normal)")

-- TODO: Make the resize commands useable.

-- Key:         Ctrl-Shift-<Left>        ( NOTE: Does not work in all/most terminals without special config. )
-- Action:      Resize split.
bindkey("n",   "<C-S-<Left>>",   "5<C-w>>",   opts)

-- Key:         Ctrl-Shift-<Right>       ( NOTE: Does not work in all/most terminals without special config. )
-- Action:      Resize split.
bindkey("n",   "<C-S-<Right>>",  "5<C-w><",   opts)

--====================================--
-- === END - Split Bindings - END === --
--====================================--
--|------------------------------------|
--========================================--
-- === START - Cut operations - START === --
--========================================--

-- Key:         f
bindkey("n",    "f",     "d",           opts)
bindkey("v",    "f",     "d",           opts)
bindkey("o",    "f",     "d",           opts)

-- Key:         ff / fl
bindkey("n",    "ff",    '0vg_d"_dd',   opts)
bindkey("n",    "fl",    '0vg_d"_dd',   opts)

-- Key:         fp
bindkey("n",    "fp",    "dap",         opts)

-- Key:         Shift-f
bindkey("n",    "<S-f>", "dg_",         opts)
bindkey("o",    "<S-f>", "dg_",         opts)

--==============================--
-- === END - Cut operations === --
--==============================--
--|------------------------------|
--==================================--
-- === START - Visual Selection === --
--==================================--

-- Key:         Ctrl-w
bindkey("i",    "<C-w>",        "<Esc><Plug>(wildfire-fuel)",        opts)

-- Key:         v
bindkey({"n", "v", "o"},    "v",        "v",        opts)

-- Key:         Shift-v
bindkey({"n", "o"},     "<S-v>",    "<S-v>",    opts)
bindkey("v",            "<S-v>",    "j",        opts)

-- Key:         Ctrl-v
bindkey({"n", "v", "o"},    "<C-v>",    "<C-v>",    opts)

-- Key:         (v)an
bindkey("v",    "an",        "aw",        opts)

-- Key:         Ctrl-Shift-v
-- Action:      free key
bindkey("n",                "<C-S-v>",  "_vg_",     opts)

-- Key:         gv
bindkey({"n", "o"},         "gv",       "gv",       opts)

-- Key:         w
-- Action:      Swap cursor position from end of selection to beginning of selection and vice versa.
bindkey("v",                "w",        "o",        opts)

--================================--
-- === END - Visual Selection === --
--================================--
--|----------------------|
--======================--
-- === START - Misc === --
--======================--

-- Key:         Ctrl-Shift-d
-- Action:      Free key right now. Probably.
-- bindkey("n",    "<C-S-d>", ":UltiSnipsEdit<CR>",  opts)

-- Key:         Ctrl-a
-- Action:      Select all text in buffer.
bindkey("n",    "<C-a>",  "<S-g><S-v>gg0",   opts)

-- Key:         Ctrl-Shift-e
-- bindkey_virtual("n", "<C-S-e>", "", opts, "Unbound", "free_key_002", "This key is not bound to anything, maybe.")

-- Key:         Ctrl-Shift-w
-- bindkey_virtual("n", "<C-S-w>", "", opts, "Unbound", "free_key_003", "This key is not bound to anything, maybe.")

-- Key:         s
-- Action:      Substitute matches of word in yank register inside the selection. (Disabled atm, command below is better.)
-- Modes:       Visual
-- bindkey("v", "s", ":s/\\%V<C-r>0\\%V//g<Left><Left>", { noremap = true, silent = false })

-- Key:         Enter           (Normal)
bindkey("n",    "<CR>",    "i<CR><Esc>",   opts)

-- Key:         Shift-Enter           (NOTE: Does not work in all/most terminals.)
-- Action:      Free Key.
-- Modes:       Normal
-- bindkey("n", "<S-CR>", ":free", { noremap = true, silent = false })

-- Key:         xip
bindkey("n",    "xip",    "vip",    opts)

-- Key:         Ctrl-i
-- Action:      Unmappable. Hard bound to Tab. (Neovim Bug)
-- Modes:       All (?)
-- bindkey('n', '<C-i>', 'a', opts)

-- Key:         m               (Normal)
-- Action:      Start recording macro.
bindkey("n",    "m",        "q",                            { noremap = true, silent = false })

-- Key:         Shift-q         (Normal, Visual)
-- Action:      Play / repeat macro on 'q'.
bindkey("n",    "<S-q>",    "@q",                           { noremap = true, silent = false })
bindkey("v",    "<S-q>",    ":normal @q<CR>",                 { noremap = true, silent = false })

-- Key:         Ctrl-(Shift)-u
-- bindkey("n",    "<C-u>", "", opts, "Unknown", "unknown_001", "Some issue with binding this key. Not sure what it does. (Normal)")
-- bindkey_virtual("n", "<C-S-u>", "", opts, "Unknown", "unknown_001", "Some issue with binding this key. Not sure what it does. (Normal)")

-- NOTE: The two below need good keys and maybe some work on the actual action. Test later. (Quote Jumping ones.)

-- Key:         TBD
-- Action:      Jump into insert mode after next Double-Quote.
-- bindkey("n", "<C-o>", '/"<CR>a', opts)
-- bindkey("i", "<C-o>", '<Esc>/"<CR>na', opts)

-- Key:         TBD
-- Action:      Jump into insert mode inside previous Double-Quote.
-- bindkey("n", "<C-S-j>", '?"<CR>i', opts)
-- bindkey("i", "<C-S-j>", '<Esc>t"?"<CR>ni', opts)

-- Key:         Esc
bindkey("n",   "<Esc>",  "<Esc><Cmd>set nohlsearch<CR>", opts)

-- Key:         Esc
bindkey("t",   "<Esc>",  "<C-\\><C-n>",         opts)

-- Key:         Alt-x
-- Action:      Set a Markdown `todo list item` as `Done`.
-- NOTE:        TODO: Set better keybind for this. Make it call a function which can toggle the todo state.
bindkey("n",   "<A-x>",  ":s/- \\[ \\]/- \\[x\\]/<CR>A [DONE]<ESC>_",   opts)

--====================--
-- === END - Misc === --
--====================--
--|--------------------|
--=================================================================--
-- === START - Plugin Specific Keybindings/Keymappings - START === --
--=================================================================--

-- |> Nvim-Tree                ( NOTE: Nvim-tree control bindings are in its setup function. )
-- Key:         <Leader>fe
-- bindkey("n",    "<Leader>fe",  ":NvimTreeToggle<CR>",        opts)

-- |> Terminal
-- Key:         <Leader>tf
bindkey("n",    "<Leader>tf", function() require('FTerm').toggle() end, opts)
bindkey("t",    "<Leader>tf", function() vim.api.nvim_input("<C-\\><C-n>") require('FTerm').toggle() end, opts)

-- |> Cargo
-- Key:         Leader-r-p
bindkey("n", "<Leader>rp", function() require('FTerm').run({'cargo', 'run'}) end, opts)


-- |> Databases & SQL (Dadbod) [START]

-- Key:         Leader-r-q (+ <f, l, p>)
-- Action:      Run SQL file/query. (Selection in Visual Mode.)
-- bindkey("n", "<Leader>rqf", ":%DB<CR>", opts)       -- Whole File
-- bindkey("n", "<Leader>rql", "<S-v>:DB<CR>", opts)   -- Line under Cursor
bindkey("n", "<Leader>rqp", "vip:DB<CR>", opts)
-- bindkey("v", "<Leader>rq", ":DB<CR>", opts)         -- Visual Selection

-- Key:         Leader-Shift-s
-- Action:      Execute SQL Query. (These seem to work now.)
-- Modes:       Normal / Visual
-- bindkey("n", "<Leader><S-s>", "<Plug>(DBUI_ExecuteQuery)", { silent = false })
-- bindkey("v", "<Leader><S-s>", "<Plug>(DBUI_ExecuteQuery)", { silent = false })

-- Key:         Leader-Ctrl-
-- Action:      Save SQL Query.
-- Modes:       Normal / Visual
-- bindkey("n", "<Leader><C-s>", "<Plug>(DBUI_ExecuteQuery)", { silent = false })

-- Key:         Leader-Shift-r
-- Action:      Toggle DBUI Result Layout.
-- Modes:       Normal
-- bindkey("n", "<Leader><S-r>", "<Plug>(DBUI_ToggleResultLayout)", { silent = false })

-- |> Databases & SQL (Dadbod) [END]

-- |> LSP bindings:
-- STATE: Maybe these work. ( Recommended in the github wiki. )
bindkey("n", "]e", vim.diagnostic.goto_next, opts)
bindkey("n", "[e", vim.diagnostic.goto_prev, opts)
bindkey("n", "<space>e", vim.diagnostic.open_float, opts)
bindkey("n", "<space>q", vim.diagnostic.setloclist, opts)

-- |> `trouble.nvim` bindings:
bindkey("n", "<leader>er", "<cmd>TroubleToggle document_diagnostics<cr>")
bindkey("n", "<leader>el", "<cmd>TroubleToggle loclist<cr>")
bindkey("n", "<leader>eq", "<cmd>TroubleToggle quickfix<cr>")
bindkey("n", "<leader>rl", "<cmd>TroubleToggle lsp_references<cr>")
bindkey("n", "<leader>ds", "<cmd>TroubleToggle lsp_definitions<cr>")

-- |> Some weird fixing... Related to default <C-n> and <C-p>.
-- Note: experimental testing thing.

-- Key:     Ctrl-p      (Insert)
bindkey("i", "<C-p>", "")


-- === START - Aum Autopairs Functions - START === --

-- Trying to create my own autopairs system:
-- map ( AumParentheses         => If nothing at `CursorLocation + 1`, insert `)`, else, normal functionality.
-- map [ AumSquareBrackets      => If nothing at `CursorLocation + 1`, insert `]`, else, normal functionality.
-- map { AumSquigglyBrackets    => If nothing at `CursorLocation + 1`, insert `}`, else, normal functionality.
-- 
-- map <CR> AumUberEnter
-- Check character at `CursorLocation -1`, if it is not `(` or `{` or `[`:
-- Do normal <CR> things

local function AumAutoPairs(pair_start, pair_end)
    -- Get current line of text.
    local current_line = vim.api.nvim_get_current_line()

    -- Get current `row` and `column` of `Cursor Position`.
    -- Parameter: `0` for current window.
    local cur_row, cur_col = unpack(vim.api.nvim_win_get_cursor(0))

    -- Get character after cursor, as substring of the `current_line`, indexed by `cursor position`.
    -- Columns need a `+1` because `get_cursor` is 0-indexed and this is end-exclusive.
    local char_after_cursor = string.sub(current_line, cur_col + 1, cur_col + 1)

    -- Insert `pair_start` normally.
    -- `0` for current buffer, `row, col, row, col` for cursor position.
    -- NOTE: Need to counter 1-indexed `cur_row` with `-1`.
    local fixed_row = cur_row - 1
    vim.api.nvim_buf_set_text(0, fixed_row, cur_col, fixed_row, cur_col, { pair_start })

    -- Advance cursor by length of `pair_start`. ( `0` for current window, again. )
    local shifted_column = cur_col + string.len(pair_start)
    vim.api.nvim_win_set_cursor(0, { cur_row, shifted_column })

    if char_after_cursor == " " or char_after_cursor == "" then
        -- If the cell to the right of cursor position (`cur_col`) is whitespace:
        -- Insert `pair_end` at that cell.
        vim.api.nvim_buf_set_text(0, fixed_row, shifted_column, fixed_row, shifted_column, { pair_end })
    end
end

vim.api.nvim_create_user_command(
    "AumSmartParens",
    function()
        AumAutoPairs('(', ')')
    end,
    { desc = "Insert parentheses. Can auto-complete the pair." }
)

vim.api.nvim_create_user_command(
    "AumSmartBrackets",
    function()
        AumAutoPairs('[', ']')
    end,
    { desc = "Insert square brackets. Can auto-complete the pair." }
)

vim.api.nvim_create_user_command(
    "AumSmartBraces",
    function()
        AumAutoPairs('{', '}')
    end,
    { desc = "Insert squiggly braces. Can auto-complete the pair." }
)

vim.api.nvim_create_user_command(
    "AumSmartQuotes",
    function()
        AumAutoPairs("'", "'")
    end,
    { desc = "Insert quotes. Can auto-complete the pair." }
)

vim.api.nvim_create_user_command(
    "AumSmartDoubleQuotes",
    function()
        AumAutoPairs('"', '"')
    end,
    { desc = "Insert double quotes. Can auto-complete the pair." }
)

vim.api.nvim_create_user_command(
    "AumSmartTicks",
    function()
        AumAutoPairs('`', '`')
    end,
    { desc = "Insert backticks. Can auto-complete the pair." }
)

-- === END - Aum Autopairs Functions - END === --

-- === START - Legendary Setup - START === --

require("legendary").setup({
    include_builtin = false,                -- My bindings are so customized, a lot of these are wrong.
    include_legendary_cmds = true,
    select_prompt = nil,                    -- Default fine.
    formatter = nil,
    col_separator_char = '│',
    most_recent_item_at_top = true,

    keymaps = {
        -- Legendary                    ( STATE: TODO )
        -- Key:         Ctrl-p          (Normal)
        { "<C-p>",      "<Cmd> lua require('legendary').find({ kind = 'keymaps' })<CR>",    description = "Search keymaps/bindings using Legendary and Telescope.",     mode = "n",   opts = opts },

        -- Command mode                 ( STATE: Does not work from Legendary. )
        -- Key:         l               (Normal, Visual, Operator)
        { "l",          ":",            description = "Enter command mode.",                    mode = { "n", "v", "o" },   opts = { noremap = true, silent = false, nowait = true }},

        -- Up / Down                    ( STATE: Good )
        -- Key:         t               (Normal, Visual, Operator)
        { "t",          "k",            description = "Move cursor one line upwards.",          mode = { "n", "v", "o" },   opts = opts },
        -- Key:         h               (Normal, Visual, Operator)
        { "h",          "j",            description = "Move cursor one line downwards.",        mode = { "n", "v", "o" },   opts = opts },
        -- Key:         Shift-t         (Normal, Visual, Operator)
        { "<S-t>",      "6k",           description = "Move cursor 6 lines upwards.",           mode = { "n", "v", "o" },   opts = opts },
        -- Key:         Shift-h         (Normal, Visual, Operator)
        { "<S-h>",      "6j",           description = "Move cursor 6 lines downwards.",         mode = { "n", "v", "o" },   opts = opts },
        -- Key:         Ctrl-t
        { "<C-t>",      "{",            description = "Move cursor upwards to next paragraph.",         mode = { "n", "v", "o" },   opts = opts },
        { "<C-t>",      "<C-o>o",       description = "Create new line below current and move there.",  mode = { "i" },             opts = opts },
        -- Key:         Ctrl-h
        { "<C-h>",      "}",            description = "Move cursor downwards to next paragraph.",       mode = { "n", "v", "o" },   opts = opts },
        -- Key:         {
        { "{",          "}",            description = "Move cursor downwards to next paragraph.",       mode = { "n", "v", "o" },   opts = opts },
        -- Key:         }
        { "}",          "{",            description = "Move cursor upwards to next paragraph.",         mode = { "n", "v", "o" },   opts = opts },
        -- Key:         gg              (Normal, Visual, Operator)
        { "gg",         "0gg",          description = "Move to the first line in the file.",    mode = { "n", "v", "o" },   opts = opts },
        -- Key:         Shift-g         (Normal, Visual, Operator)
        { "<S-g>",      "0<S-g>",       description = "Move to the last line in the file.",     mode = { "n", "v", "o" },   opts = opts },

        -- Left / Right                 ( STATE: Good )
        -- Key:         <Left>          (Normal, Visual, Operator)
        { "<Left>",     "h",            description = "Move cursor one column left.",           mode = { "n", "v", "o" },   opts = opts },
        -- Key:         <Right>         (Normal, Visual, Operator)
        { "<Right>",    "l",            description = "Move cursor one column right.",          mode = { "n", "v", "o" },   opts = opts },
        -- Key:         q               (Normal, Visual, Operator)
        { "q",          "h",            description = "Move cursor one column left.",           mode = { "n", "v", "o" },   opts = opts },
        -- Key:         e               (Normal, Visual, Operator)
        { "e",          "l",            description = "Move cursor one column right.",          mode = { "n", "v", "o" },   opts = opts },
        -- Key:         Ctrl-q          (Insert)
        { "<C-q>",      "<Left>",       description = "Move cursor to the left by one column in insert mode.",      mode = { "i" },     opts = opts },
        -- Key:         Ctrl-e          (Normal, Insert)
        { "<C-e>",      "<Right>",      description = "Move cursor to the right by one column in insert mode.",     mode = { "i" },     opts = opts },
        { "<C-e>",      "<Cmd>Inspect<CR>",     description = "Show treesitter capture groups for textobject under cursor. (Also Semantic Tokens and Extmarks.)",   mode = { "n" },     opts = { noremap = true, silent = false }},
        -- Key:         go
        { "go",         "0",            description = "Move cursor to start of line.",          mode = { "n", "v", "o" },   opts = opts },
        -- Key:         gn
        { "gn",         "$",            description = "Move cursor to end of line.",            mode = { "n", "v", "o" },   opts = opts },
        -- Key:         Ctrl-a
        { "<C-a>",      "<Esc>I",       description = "Move cursor to start of line. (Insert Mode)",    mode = { "i" },     opts = opts },
        -- Key:         Ctrl-s
        { "<C-s>",      "<Esc>A",       description = "Move cursor to end of line. (Insert Mode)",      mode = { "i" },     opts = opts },
        -- Key:         j
        { "j",          "f",            description = "Move forwards to next matching character.",      mode = { "n", "v", "o" },     opts = opts },
        -- Key:         Shift-j
        { "<S-j>",      "<S-f>",        description = "Move backwards to next matching character.",     mode = { "n", "v", "o" },     opts = opts },
        -- Key:         Shift-5  (%)
        { "%",          "%",            description = "Move to matching brackets.",             mode = { "n", "v", "o" },   opts = opts },
        -- Key:         g<S-n>
        { "g<S-n>",     "<S-e>",        description = "Move forwards to end of word.",          mode = { "n", "v", "o" },   opts = opts },
        -- Key:         g<S-o>
        { "g<S-o>",     "g<S-e>",       description = "Move backwards to end of word.",         mode = { "n", "v", "o" },   opts = opts },

        -- Word / Back                  ( STATE: Okay )
        -- Key:         n               ( Normal, Visual, Operator )
        { "n",          "<Cmd>lua require('spider').motion('w')<CR>",       description = "Move cursor one word forward. (Spider Motion)",                  mode = { "n", "x" },            opts = opts },
        { "n",          "w",                                                description = "Move cursor one word forward. (Operator)",                       mode = { "o" },                 opts = opts },
        { "n",          "<Cmd>lua require('spider').motion('e')<CR>",       description = "Move cursor to end of word. (Visual Mode)",                      mode = { "v" },                 opts = opts },
        -- Key:         o               ( Normal, Visual, Operator )
        { "o",          "<Cmd>lua require('spider').motion('b')<CR>",       description = "Move cursor one word backward. (Spider motion)",                 mode = { "n", "x" },            opts = opts },
        { "o",          "b",                                                description = "Move cursor one word backward. (Operator)",                      mode = { "o" },                 opts = opts },
        { "o",          "<Cmd>lua require('spider').motion('ge')<CR>",      description = "Move cursor to end of previous word. (Visual Mode)",             mode = { "v" },                 opts = opts },
        -- Key:         in              ( Normal, Visual, Operator )
        { "in",         "<S-w>",        description = "Move cursor one super-word forward.",            mode = { "n", "o" },        opts = opts },
        { "in",         "e",            description = "Move cursor to word end. (Visual Mode)",         mode = { "v" },             opts = opts },
        -- Key:         io              ( Normal, Visual, Operator )
        { "io",         "<S-b>",        description = "Move cursor one super-word backward.",           mode = { "n", "v", "o" },   opts = opts },
        -- Key:         Ctrl-n          ( Insert )
        { "<C-n>",      "<C-o>w",       description = "Move cursor one word forward. (Insert Mode)",    mode = { "i" },             opts = opts },
        -- Key:         Ctrl-o          ( Insert )      ( NOTE: Don't want to overwrite `<C-o>`. )
        { "<C-o>",      "<C-o>",        description = "Execute next command as a normal mode command. (Insert Mode)",       mode = { "i" },     opts = opts },

        -- Indenting                    ( STATE: Good )
        -- Key:         Tab
        { "<Tab>",      ">>",           description = "Indent current line.",                                   mode = { "n" },     opts = opts },
        { "<Tab>",      ">",            description = "Indent current selection / block. (Visual Mode)",        mode = { "v" },     opts = opts },
        -- Key:         Shift-Tab
        { "<S-Tab>",    "<<",           description = "Unindent current line.",                                 mode = { "n" },     opts = opts },
        { "<S-Tab>",    "<",            description = "Unindent current selection / block. (Visual Mode)",      mode = { "v" },     opts = opts },

        -- Smart Enter                  ( STATE: Good )
        -- Key:         <CR> ( Enter )  ( Insert )                  ( NOTE: TODO: This should be a anonymous binding, probably. )
        -- -- { "<CR>",       "<CR>",                             description = "Smart `<CR>` (Enter) for inserting a new line and accepting autocompletion results.",     mode = { "i" },     opts = opts },
        { "<C-CR>",     "o<Esc>k",                          description = "Create new empty line below cursor.",                    mode = { "n" },     opts = opts },
        { "<S-CR>",     "O<Esc>j",                          description = "Create new empty line above cursor.",                    mode = { "n" },     opts = opts },

        -- Parens / Brackets / Braces                       ( Aum Autopairs )
        { "(",          "<Cmd>AumSmartParens<CR>",          description = "Insert parentheses. Can auto-complete the pair.",        mode = { "i" },     opts = opts },
        { "[",          "<Cmd>AumSmartBrackets<CR>",        description = "Insert square brackets. Can auto-complete the pair.",    mode = { "i" },     opts = opts },
        { "{",          "<Cmd>AumSmartBraces<CR>",          description = "Insert squiggly braces. Can auto-complete the pair.",    mode = { "i" },     opts = opts },
        { "'",          "<Cmd>AumSmartQuotes<CR>",          description = "Insert quotes. Can auto-complete the pair.",             mode = { "i" },     opts = opts },
        { '"',          "<Cmd>AumSmartDoubleQuotes<CR>",    description = 'Insert double quotes. Can auto-complete the pair.',      mode = { "i" },     opts = opts },
        { "`",          "<Cmd>AumSmartTicks<CR>",           description = "Insert backticks. Can auto-complete the pair.",          mode = { "i" },     opts = opts },

        -- Moving / Copying Lines       ( STATE: Okay )
        -- Key:         Alt-h
        { "<A-h>",      "<Cmd>lua require('moveline').down()<CR>",      description = "Move current line down by one.",             mode = { "n" },     opts = opts },
        { "<A-h>",      "<C-o><Cmd>m+1<CR>",                            description = "Move current line down by one. (Insert)",    mode = { "i" },     opts = opts },
        -- Key:         Alt-t
        { "<A-t>",      "<Cmd>lua require('moveline').up()<CR>",        description = "Move current line up by one.",               mode = { "n" },     opts = opts },
        { "<A-t>",      "<C-o><Cmd>m-2<CR>",                            description = "Move current line up by one. (Insert)",      mode = { "i" },     opts = opts },
        -- Key:         Alt-Shift-h
        { "<A-S-h>",    "<Cmd>copy.<CR>",                               description = "Copy current line one line below.",          mode = { "n" },     opts = opts },
        { "<A-S-h>",    "<ESC><Cmd>copy.<CR>i",                         description = "Copy current line one line below. (Insert)", mode = { "i" },     opts = opts },
        -- Key:         Alt-Shift-t
        { "<A-S-t>",    "<Cmd>copy.-1<CR>",                             description = "Copy current line one line above.",          mode = { "n" },     opts = opts },
        { "<A-S-t>",    "<ESC><Cmd>copy.-1<CR>i",                       description = "Copy current line one line above. (Insert)", mode = { "i" },     opts = opts },
        -- Key:         Alt-h
        { "<A-h>",      "<Cmd>lua require('moveline').block_down()<CR>",    description = "Move selected block down by one line. (Visual)",     mode = { "v" },     opts = opts },
        -- Key:         Alt-t
        { "<A-t>",      "<Cmd>lua require('moveline').block_up()<CR>",      description = "Move selected block up by one line. (Visual)",       mode = { "v" },     opts = opts },

        -- Buffer Navigation            ( STATE: Okay )
        -- Key:         zn
        { "zn",         "<Cmd>bn<CR>",          description = "Focus next buffer.",         mode = { "n" },     opts = opts },
        -- Key:         zo
        { "zo",         "<Cmd>bp<CR>",          description = "Focus previous buffer.",     mode = { "n" },     opts = opts },
        -- Key:         <Leader> Shift-s
        { "<Leader><S-s>",      "<Cmd>lua MiniBufremove.delete()<CR>",      description = "Delete current buffer.",     mode = { "n" },     opts = { silent = false } },

        -- Splits                       ( STATE: TODO )
        -- Key:         Ctrl-l          ( Normal )
        { "<C-l>",                      "<C-w><C-w>",   description = "Cycle through splits/windows.",                  mode = "n",         opts = opts },
        -- Key:         <Leader> Shift-o                ( Normal )
        { "<Leader><S-o>",      "<Cmd>close<CR>",       description = "Close split window without deleting buffer.",    mode = { "n" },     opts = opts },

        -- Jumplist                     ( STATE: Okay )
        -- Key:         Shift-o         (Normal)
        { "<S-o>",      "<C-S-o>",      description = "Move to previous location in jumplist.",     mode = { "n" },     opts = opts },
        -- Key:         Shift-n         (Normal)
        { "<S-n>",      "<C-S-i>",      description = "Move to next location in jumplist.",         mode = { "n" },     opts = opts },

        -- View Focus                   ( STATE: Okay )
        -- Key:         zz              (Normal)
        { "zz",         "zz",           description = "Focus view on current line.",                mode = { "n" },     opts = opts },

        -- Delete                       ( STATE: TODO )

        -- Change                       ( STATE: TODO )

        -- Replace                      ( STATE: TODO )

        -- Visual                       ( STATE: TODO )

        -- Search                       ( STATE: Okay )
        -- Key:         r               ( Normal, Visual, Operator )
        { "r",          "/",            description = "Initiate search forwards.",              mode = { "n", "v", "o" },   opts = { noremap = true, silent = false, nowait = true } },
        -- Key:         Shift-r         ( Visual )
        { "<S-r>",      'y/<C-r>"<CR><Cmd>set hlsearch<CR>',    description = "Search for matches of selected pattern.",    mode = { "v" },   opts = opts },
        -- Key:         ?               ( Normal, Visual, Operator )
        { "?",          "?",            description = "Initiate search backwards.",             mode = { "n", "v", "o" },   opts = { noremap = true, silent = false, nowait = true } },
        -- Key:         Shift-8 (* [star])                  ( Normal, Operator )
        { "*",          "*<S-n><Cmd>set hlsearch<CR>",      description = "Search forwards for word under cursor.",         mode = { "n", "o" },   opts = opts },
        -- Key:         Shift-3 (# [hashtag])               ( Normal, Operator )
        { "#",          "#<S-n><Cmd>set hlsearch<CR>",      description = "Search backwards for word under cursor.",        mode = { "n", "o" },   opts = opts },

        -- Search: Next / Previous      ( STATE: Okay )
        -- Key:         b               ( Normal, Visual, Operator )
        { "b",          "n",            description = "Jump to next search match.",             mode = { "n", "v", "o" },   opts = opts },
        -- Key:         Shift-b         ( Normal, Visual, Operator )
        { "<S-b>",      "<S-n>",        description = "Jump to previous search match.",         mode = { "n", "v", "o" },   opts = opts },

        -- Copy / Yank                  ( STATE: Okay )
        -- Key:         y               ( Normal, Visual, Operator )
        { "y",          "y",            description = "Initiate Yank / Copy.",                  mode = { "n", "o" },        opts = { noremap = true, silent = false, nowait = true } },
        { "y",          "y",            description = "Initiate Yank / Copy in Visual Mode.",   mode = { "v" },             opts = { noremap = true, silent = false, nowait = true } },
        -- Key:         Shift-y         ( Normal, Operator )
        { "<S-y>",      "yg_",          description = "Yank / Copy to end of line. (1)",        mode = { "n", "o" },        opts = { noremap = true, silent = false, nowait = true } },
        -- Key:         ygn             ( Normal, Operator )
        { "ygn",        "yg_",          description = "Yank / Copy to end of line. (2)",        mode = { "n", "o" },        opts = { noremap = true, silent = false, nowait = true } },
        -- Key:         ygo             ( Normal, Operator )
        { "ygo",        "y0",           description = "Yank / Copy to start of line.",          mode = { "n", "o" },        opts = { noremap = true, silent = false, nowait = true } },
        -- Key:         yy              ( Normal, Operator )
        { "yy",         "0yg_",         description = "Yank / Copy current line. (1)",          mode = { "n", "o" },        opts = { noremap = true, silent = false, nowait = true } },
        -- Key:         yl              ( Normal, Operator )
        { "yl",         "0yg_",         description = "Yank / Copy current line. (2)",          mode = { "n", "o" },        opts = { noremap = true, silent = false, nowait = true } },
        -- Key:         ye              ( Normal, Operator )
        { "ye",         "ye",           description = "Yank / Copy to end of word.",            mode = { "n", "o" },        opts = { noremap = true, silent = false, nowait = true } },

        -- Paste                        ( STATE: Okay )
        -- Key:         p               ( Normal, Visual, Operator )
        { "p",          "<S-p>",        description = "Paste from clipboard or registers.",         mode = { "n", "v", "o" },       opts = opts },
        -- Key:         Shift-p         ( Normal )
        { "<S-p>",      "o<C-o><S-p><Esc>",     description = "Paste below, from clipboard or registers.",     mode = { "n"  },     opts = opts },
        -- Key:         Ctrl-v          ( Insert )
        { "<C-v>",      " <BS><C-o><S-p>",  description = "Paste from clipboard in insert mode.",   mode = { "i" },   opts = opts },

        -- Undo / Redo                  ( STATE: WIP )
        -- Key:         u               ( Normal )
        { "u",          "u",            description = "Undo operation.",                        mode = { "n" },             opts = opts },
        -- Key:         Ctrl-Z          ( Normal, Insert, Visual )
        { "<C-z>",      "u",            description = "Undo operation. (Normal Mode Alt)",      mode = { "n" },             opts = opts },
        { "<C-z>",      "<Esc>",        description = "Exit Visual Mode.",                      mode = { "v" },             opts = opts },
        { "<C-z>",      "<Esc>u",       description = "Undo operation. (Insert Mode)",          mode = { "i" },             opts = opts },
        -- Key:         Ctrl-r          ( Normal, Insert, Operator )
        { "<C-r>",      "<C-r>",        description = "Redo. (Opposite of undo)",               mode = { "n", "i", "o" },   opts = opts },
        -- NOTE: This key is not bound: `<C-r>` ( Visual Mode )

        -- Folding
        -- Key:         zf (Create fold)                        ( Normal, Visual, Operator )
        { "zf",         "zf",                                   description = "Create new fold. (Mostly for marker mode)",              mode = {"n", "v", "o"},     opts = opts },
        -- Key:         zh (Open fold)                          ( Normal, Operator )
        { "zh",         "zo",                                   description = "Open fold.",                 mode = {"n", "o"},          opts = opts },
        -- Key:         zr (Open fold)                          ( Normal, Operator )
        { "zr",         require("ufo").openFoldsExceptKinds,    description = "Reduce (Open) fold.",        mode = {"n", "o"},          opts = opts },
        -- Key:         zR (Open all)                           ( Normal, Operator )
        { "z<S-r>",     require("ufo").openAllFolds,            description = "Reduce (Open) all folds.",   mode = {"n", "o"},          opts = opts },
        -- Key:         zc (Close fold)                         ( Normal, Operator )
        { "zc",         "zc",                                   description = "Close fold.",                mode = {"n", "o"},          opts = opts },
        -- Key:         zm (Close fold)                         ( Normal, Operator )
        { "zm",         require("ufo").closeFoldsWith,          description = "Close fold (More).",         mode = {"n", "o"},          opts = opts },
        -- Key:         zM (Close all)                          ( Normal, Operator )
        { "z<S-m>",     require("ufo").closeAllFolds,           description = "Close all folds.",           mode = {"n", "o"},          opts = opts },
        -- Key:         zt (Toggle fold)                        ( Normal, Operator )
        { "zt",         "za",                                   description = "Toggle folding.",            mode = {"n", "o"},          opts = opts },
        
        -- Key:         gf                        ( Normal, Operator )
        { "zt",         "za",                                   description = "Toggle folding.",            mode = {"n", "o"},          opts = opts },
        -- Key:         ge                        ( Normal, Operator )

        -- Telescope                    ( STATE: Okay )
        -- Key:         Ctrl-s          ( Normal )
        { "<C-s>",                      "<Cmd>Telescope current_buffer_fuzzy_find<CR>",     description = "Telescope: Fuzzy search (find) current buffer.",         mode = "n",     opts = opts },
        -- Key:         Ctrl-Shift-p    ( Normal )                                                                           
        { "<C-S-p>",                    "<Cmd>Telescope find_files<CR>",                    description = "Telescope: Fuzzy search (find) files.",                  mode = "n",     opts = opts },
        -- Key:         Ctrl-Shift-s    ( Normal )                                                                     
        { "<C-S-s>",                    "<Cmd>Telescope buffers<CR>",                       description = "Telescope: Fuzzy search (find) open buffers.",           mode = "n",     opts = opts },
        -- Key:         Ctrl-Shift-f    ( Normal )
        { "<C-S-f>",                    "<Cmd>Telescope live_grep<CR>",                     description = "Telescope: Live grep.",                                  mode = "n",     opts = opts },
        -- Key:         Leader-Tele*    ( Normal )
        { "<Leader><S-t>ele<S-h>i",     "<Cmd>Telescope highlights<CR>",                    description = "Telescope: List and search highlight groups.",           mode = "n",     opts = opts },
        { "<Leader><S-t>ele<S-o>",      "<Cmd>Telescope oldfiles<CR>",                      description = "Telescope: List and search previosly visited files.",    mode = "n",     opts = opts },
        { "<Leader><S-t>ele<S-g>",      "<Cmd>Telescope live_grep<CR>",                     description = "Telescope: Live (rip)grep current folder.",              mode = "n",     opts = opts },
        { "<Leader><S-t>ele<S-h>e",     "<Cmd>Telescope help_tags<CR>",                     description = "Telescope: List and search help tags.",                  mode = "n",     opts = opts },
        { "<Leader><S-t>eletreesitter", "<Cmd>Telescope treesitter<CR>",                    description = "Telescope: List and search treesitter symbols.",         mode = "n",     opts = opts },
        -- Key:         Shift-k         ( Normal )
        { "<S-k>",                      "<Cmd>Telescope lsp_document_symbols<CR>",          description = "Telescope: List and search lsp document symbols.",       mode = "n",     opts = opts },

        -- File Explorer                ( STATE: TODO )

        -- Wildfire                     ( STATE: Okay )
        -- NOTE:                        While these work semi okay, I am kind of looking for better ones.
        -- Key:         Shift-l         ( Normal, Visual, Operator )
        { "<S-l>",                      "<Plug>(wildfire-fuel)",                description = "Wildfire: Expand selection.",        mode = { "n", "v", "o" },       opts = opts },
        -- Key:         Ctrl-l          ( Visual )
        { "<C-l>",                      "<Plug>(wildfire-water)",               description = "Wildfire: Shrink selection.",        mode = "v",                     opts = opts },

        -- Misc Commands                ( STATE: TODO )
        -- Key:         Leader-l-s-p
        { "<Leader>lsp",                "<Cmd>LspStart<CR>",                    description = "Start LSP Server.",                  mode = {"n"},                   opts = opts },

        -- Custom: Search and Replace   ( STATE: Okay )     ( NOTE: These are very nice. )
        -- Key:         Shift-k         ( Visual )
        { '<S-k>',      '"xy:%s/<C-r>x/<C-r>0/g<CR>',       description = 'Globally replace all matches of `Visually Selected Text` with the text currently in `Primary Clipboard Register`.',  mode = { 'v' },   opts = { noremap = true, silent = false } },
        -- Key:         Ctrl-Shift-k    ( Visual )
        { "<C-S-k>",    "y:%s/<C-r>0//g<Left><Left>",       description = "Globally replace matches of visually selected text in the current file.",                                            mode = { 'v' },   opts = { noremap = true, silent = false } },
        -- Key:         Shift-d         ( Visual )
        { "<S-d>",      ":s/\\%V<C-r>0//g<Left><Left>",     description = "Replace text that matches the contents of the yank register, within the current visual selection.",                  mode = { 'v' },   opts = { noremap = true, silent = false } },

        -- Font Size                    ( STATE: Okay )
        -- Key:         Leader-Leader-f-s
        { "<Leader><Leader>fs",         ":set guifont=JetBrainsMono\\ Nerd\\ Font:h:b<Left><Left>",      description = "Set Font Size to desired value.",   mode = { 'n' },   opts = { noremap = true, silent = false } },

        -- Snippets                     ( STATE: TODO )
        -- Key:         Leader-s-n-i-p-a-l-l
        { "<Leader>snipall",            "<Cmd>LuaSnipsEditAll<CR>",     description = "Edit Global Snippets. (LuaSnip)",    mode = {"n"},   opts = opts },
        -- Key:         Leader-s-n-i-p-r-u-s-t
        { "<Leader>sniprust",           "<Cmd>LuaSnipsEditRust<CR>",    description = "Edit Rust Snippets. (LuaSnip)",      mode = {"n"},   opts = opts },

        -- Zen-Mode                     ( STATE: Fine ) ( NOTE: `true-zen.nvim` is worse than `zen-mode.nvim`. )
        -- Key:         <Leader>z
        { "<Leader>z",                  "<Cmd>ZenMode<CR>",     description = "Toggle Zen-Mode.",       mode = {"n"},       opts = opts },

        -- Treesitter                   ( STATE: TODO: Test )
        { "<Leader>tson",               "<Cmd>TSEnable highlight<CR>",      description = "Enable Treesitter highlighting.",    mode = {"n"},   opts = opts },
        { "<Leader>tsoff",              "<Cmd>TSDisable highlight<CR>",     description = "Disable Treesitter highlighting.",   mode = {"n"},   opts = opts },

        -- Jukit                        ( STATE: TODO ) ( Interactive Python Development Workflow )
        { "<Leader>ipystart",           "<Cmd>call jukit#splits#output_and_history()<CR>",          description = "Open IPython Output and History in split windows.",              mode = {"n"},   opts = opts },
        { "<Leader>ipyclose",           "<Cmd>call jukit#splits#close_output_and_history(1)<CR>",   description = "Close IPython Output and History windows.",                      mode = {"n"},   opts = opts },
        { "<Leader>ipyout",             "<Cmd>call jukit#splits#output()<CR>",                      description = "Open IPython Output in split window.",                           mode = {"n"},   opts = opts },
        { "<Leader>ipyendout",          "<Cmd>call jukit#splits#close_output_split()<CR>",          description = "Close IPython Output split window.",                             mode = {"n"},   opts = opts },
        { "<Leader>ipyhist",            "<Cmd>call jukit#splits#history()<CR>",                     description = "Open IPython History in split window.",                          mode = {"n"},   opts = opts },
        { "<Leader>ipyendhist",         "<Cmd>call jukit#splits#close_history()<CR>",               description = "Close IPython History split window.",                            mode = {"n"},   opts = opts },
        { "<Leader>ipyhistscrolldown",  "<Cmd>call jukit#splits#out_hist_scroll(1)<CR>",            description = "Scroll IPython `Output History` down .",                         mode = {"n"},   opts = opts },
        { "<Leader>ipyshowcelloutput",  "<Cmd>call jukit#splits#show_last_cell_output(1)<CR>",      description = "Show IPython cell output in `Output History` window.",           mode = {"n"},   opts = opts },
        { "<Leader>ipyexecuteall",      "<Cmd>call jukit#send#all()<CR>",                           description = "Execute all IPython cells and show output in IPython window.",   mode = {"n"},   opts = opts },

        -- Misc
        { "g0",         "g0",          description = "Help file overview.",         mode = "n",     opts = opts },
        
        -- Leap.nvim
        -- Key:         d
        { "d",         "<Plug>(leap-forward-to)",       description = "Leap.nvim: Jump forward.",       mode = "n",     opts = opts },
    },

    commands = {
        {
            "EnableExtraOpts",
            function()
                vim.api.nvim_cmd({ cmd = "set", args = { "nu" }}, {})
                vim.api.nvim_cmd({ cmd = "set", args = { "rnu" }}, {})
                vim.api.nvim_cmd({ cmd = "set", args = { "cursorline" }}, {})
                vim.api.nvim_cmd({ cmd = "set", args = { "list" }}, {})
            end,
            description = "Enables line numbers, cursorline and listchars."
        },
    },

    funcs = {},
    autocmds = {},

    which_key = {
        auto_register = false,
        mappings = {},
        opts = {},
        do_binding = true,  -- `true` => handled by legendary. `false` => handled by which_key. (I think.)
    },

    -- Settings for the `:LegendaryScratch` command.
    scratchpad = {
        view = "float",
        results_view = "float",
        -- keep_contents = false,
        cache_path = string.format("%s/%s", vim.fn.stdpath("cache"), "legendary_scratch.lua"),
    },
})
-- === END - Legendary Setup - END === --

-- Temporary test.
-- -> Binding Ctrl-Key and Ctrl-Shift-Key works properly now, because I configured Kitty. 
-- bindkey("n", "<C-e>",    "n")           
-- bindkey("n", "<C-S-e>",  "N")
-- bindkey("n", "<C-i>",    "j")  -- Differentiated from <Tab>, because Kitty supports this.

--=================================================--
-- === END - Plugin Specific Keybindings - END === --
--=================================================--
--================================================================================================--
-- === END - 9. Mappings/Keymaps/Keymappings/Keybindings/Remaps/Shortcuts/Hotkeys/Binds - END === --
--================================================================================================--

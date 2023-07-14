--=================================================================================================--
-- === START - Mappings/Keymaps/Keymappings/Keybindings/Remaps/Shortcuts/Hotkeys/Binds - START === --
--=================================================================================================--

-- Help Notes:
--  - Mapping Modes:
--      - Normal                => `n`
--      - Insert                => `i`
--      - Visual                => `x`
--      - Select                => `s`
--      - Visual AND Select     => `v`              ( Not a good default for Visual mode. Use `x` (Visual Mode Only) instead. )
--      - Operator-pending      => `o`
--      - Command-line          => `c`
--      - Terminal              => `t`
--  - For builtin Vim help:     `:help map-modes`

-- Aliases.
local bindkey       = vim.keymap.set                        -- Newer and better version of `vim.api.nvim_set_keymap()`.
local opts          = { noremap = true, silent = false }    -- For non-silent binds.
local opts_silent   = { noremap = true, silent = true }     -- For silent binds.
-- NOTE: Setting `noremap = false` here would cause some keybindings to freeze/crash Neovim.

-- Key:         \ ( Backslash )
-- Action:      Leader Key.
vim.g.mapleader = [[\]]


--===================================================--
-- === START - Temporary binding testing - START === --
--===================================================--

-- TODO: Move all to `legendary.nvim`.

-- I think the default `gh` and `gH` bindings are useless,
-- and they cause an issue when quickly pressing keys.
--  - For example `ghhhhhhhhhh` would enter insert mode and begin inserting `h` characters.
bindkey("n", "gh", "j", opts)
bindkey("n", "g<S-h>", "3<C-d>zz", opts)

-- Alt buffer jump
bindkey("n", "<S-e>", "<Cmd>b#<CR>", opts_silent)

-- UrlView
bindkey("n", "<Leader>links", "<Cmd>UrlView buffer bufnr=0<CR>", opts_silent)

-- Additional `Leader Key`: `<Space>`
bindkey("n", "<Space>", "<NOP>", opts_silent)


--========================================--
-- === START - Marks and tags - START === --
--========================================--

-- => STATE: No idea. WIP.

-- TODO: Learn how to actually use marks properly.

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
-- Action:      Jump to tag.
-- NOTE:        This probably works and is okay.
-- TODO:        Move to Legendary.
bindkey("n",    "<C-]>",     "<C-]>",        opts)

-- Key:         Ctrl-Shift-T
-- Action:      Free?
bindkey("n",    "<C-S-t>",   "<C-S-t>",      opts)

--====================================--
-- === END - Marks and tags - END === --
--====================================--
--|----------------------------------|
--==================================--
-- === START - Deleting - START === --
--==================================--

-- => STATE: Good
-- |> NOTE: "noremap = false" in Blackhole mappings leads to instant Crash/Freeze when pressing 'x' or 'd'.

-- Key:         s
-- Action:      Delete operator.        ( Into `Blackhole Register`. )
-- TODO:        Move to Legendary.
bindkey({"n", "o", "x"},    "s",    '"_d',      opts)

-- |> Deleting word/back properly:
-- TODO: Move to Legendary section.
bindkey({"n", "o"},     "sn",       '"_dw',     opts)
bindkey({"n", "o"},     "so",       '"_db',     opts)

-- |> Delete around word
-- TODO: Move to Legendary section.
bindkey({"n", "o"},     "san",      '"_daw',    opts)

-- |> Delete inside word
-- TODO: Move to Legendary section.
bindkey({"n", "o"},     "sin",      '"_diw',    opts)

-- |> Deleting inside pairs:
-- TODO: Move to Legendary section.
bindkey({ "n", "o" },    'si"',        [["_di"]],       opts,   { desc = "Delete inside double quotes." })
bindkey({ "n", "o" },    "si'",        [["_di']],       opts,   { desc = "Delete inside single quotes." })
bindkey({ "n", "o" },    "si(",        [["_di(]],       opts,   { desc = "Delete inside parentheses." })
bindkey({ "n", "o" },    "si[",        [["_di[]],       opts,   { desc = "Delete inside square brackets." })
bindkey({ "n", "o" },    "si{",        [["_di{]],       opts,   { desc = "Delete inside braces / squiggly brackets." })
bindkey({ "n", "o" },    "si<",        [["_di<]],       opts,   { desc = "Delete inside angle brackets." })
bindkey({ "n", "o" },    "si<",        [["_di<]],       opts,   { desc = "Delete inside angle brackets." })
bindkey({ "n", "o" },    "si`",        [["_di`]],       opts,   { desc = "Delete inside backticks." })

-- |> Replacing inside pairs:
-- TODO: Move to Legendary section.
bindkey({ "n", "o" },    'ki"',        [["_ci"]],       opts,   { desc = "Replace inside double quotes." })
bindkey({ "n", "o" },    "ki'",        [["_ci']],       opts,   { desc = "Replace inside single quotes." })
bindkey({ "n", "o" },    "ki(",        [["_ci(]],       opts,   { desc = "Replace inside parentheses." })
bindkey({ "n", "o" },    "ki[",        [["_ci[]],       opts,   { desc = "Replace inside square brackets." })
bindkey({ "n", "o" },    "ki{",        [["_ci{]],       opts,   { desc = "Replace inside braces / squiggly brackets." })
bindkey({ "n", "o" },    "ki<",        [["_ci<]],       opts,   { desc = "Replace inside angle brackets." })
bindkey({ "n", "o" },    "ki<",        [["_ci<]],       opts,   { desc = "Replace inside angle brackets." })
bindkey({ "n", "o" },    "ki`",        [["_ci`]],       opts,   { desc = "Replace inside backticks." })

-- Key:         ss / sl
-- Action:      Delete current line.    ( Into `Blackhole Register`. )
-- TODO:        Move to Legendary.
bindkey("n",    "ss",       '"_dd0',        opts)
bindkey("n",    "sl",       '"_dd0',        opts)

-- Key:         Shift-s
-- Action:      Delete to `End of Line`.
-- TODO:        Move to Legendary.
bindkey("n",    "<S-s>",    '"_<S-d>',      opts)

-- Key:         fj
-- Action:      Delete character under cursor.
-- TODO:        Move to Legendary.
bindkey("n",    "fj",       '"_x',          opts)
bindkey("o",    "fj",       '"_x',          opts)

-- Key:         Ctrl-h      ( Insert Mode )
-- Action:      Free key, probably.

-- Key:         <BS>  ( Backspace )
-- Action:      Delete character behind cursor. | Delete selection.
-- TODO:        Move to Legendary.
bindkey("n",    "<BS>",     "i<C-h><Esc><Right>",   opts)
bindkey("i",    "<BS>",     "<C-h>",                opts)
bindkey("x",    "<BS>",     '"_d',                  opts)

-- Key:         Ctrl - <BS>  ( Backspace )
-- Action:      Delete word behind cursor. | Delete line under cursor. | Delete selection.
-- TODO:        Move to Legendary.
bindkey("i",    "<C-BS>",   "<C-w>",                opts)
bindkey("n",    "<C-BS>",   '"_dd0',                opts)
bindkey("x",    "<C-BS>",   '"_d',                  opts)

--==============================--
-- === END - Deleting - END === --
--==============================--
--|------------------------------|
--========================================================================--
-- === START - Changing and Replacing text ( Change/Replace ) - START === --
--========================================================================--

-- => STATE: Good

-- Key:         k
-- Action:      Begin replace operation. ( Delete old word into blackhole register. )
bindkey({ "n", "o" },   "k",        '"_c',      opts)

-- Key:         Shift-k
-- Action:      Replace to End of Line.     ( Delete content into blackhole register. )
bindkey({ "n", "o" },   "<S-k>",    '"_<S-c>',  opts)

-- TODO: Fill the "search register" properly with the selected word when replacing selection.
bindkey("x",   "k",        '"_c',      opts)

-- Key:         Shift-d                 ( NOTE: This is ok. )
-- Action:      Replace word under cursor and prep dot repeat replacement.
-- NOTE:        Move to legendary.
bindkey("n",    "<S-d>",    '*<S-n><Cmd>set hlsearch<CR>"_cgn',     opts)

-- Key:         kn
bindkey({ "n", "o" },       "kn",       '"_cw',     opts)

-- Key:         ko
bindkey({ "n", "o" },       "ko",       '"_cb',     opts)

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
bindkey("x",    "c",        "~",        opts)

-- Key:         Shift-c
bindkey("n",    "<S-c>",    "<S-r>",    opts)
bindkey("o",    "<S-c>",    "<S-r>",    opts)

-- Key:         u
-- Action:      Make selection lowercase.
bindkey("x",    "u",        "u",        opts)

-- Key:         Shift-u
-- Action:      Make selection UPPERCASE.
bindkey("x",    "<S-u>",    "<S-u>",    opts)

-- Key:         gq
bindkey({"n", "x", "o"},    "gq",       "gq",       opts)

-- Key:         gb
-- Action:      Replace word under cursor and prep dot repeat replacement. (But this don't work.)
-- NOTE:        On its own this does not really do anything.
bindkey({"n", "x", "o"},    "gb",       "gn",     opts)

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
-- TODO:        Since this is bound to <NOP>, I need to rebind all the possible missing `g` bindings.
bindkey({"n", "x", "o"},    "g",    "<NOP>",   opts_silent)

-- Key:         i
-- Action:      Do nothing, wait for next key in chord.
bindkey({"n", "o", "x"},    "i",    "<NOP>",   opts_silent)

-- Key:         z
-- Action:      Do nothing, wait for next key in chord.
bindkey({"n", "o", "x"},    "z",    "<NOP>",   opts_silent)

-- Key:         zs
-- Action:      Jump to `Character`. ( On top of. )
bindkey({"n", "o", "x"},    "zs",    "f",   opts)

-- Key:         zS
-- Action:      Jump to `Character`. ( 1 Character before )
bindkey({"n", "o", "x"},    "zS",    "t",   opts)

-- Key:         z=
-- Action:      Fix spelling.
-- NOTE:        TODO: Move to Legendary.
bindkey({"n", "o"},    "z=",    "z=",   opts)

-- Key:         <Leader>sp
-- Action:      Automatically fix next spelling mistake.
-- NOTE:        TODO: Move to Legendary.
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
bindkey({"n", "x", "o"},    "f",     "d",           opts)

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

-- Key:         v
bindkey({"n", "x", "o"},    "v",        "v",        opts)

-- Key:         Shift-v
bindkey({"n", "o"},     "<S-v>",    "<S-v>",    opts)
bindkey("x",            "<S-v>",    "j",        opts)

-- Key:         Ctrl-v
bindkey({"n", "o"},     "<C-v>",    "<C-v>",    opts)

-- Key:         (v)an
bindkey("x",    "an",        "aw",        opts)

-- Key:         Ctrl-Shift-v
-- Action:      free key
bindkey("n",                "<C-S-v>",  "_vg_",     opts)

-- Key:         gv
bindkey({"n", "o"},         "gv",       "gv",       opts)

-- Key:         w
-- Action:      Swap cursor position from end of selection to beginning of selection and vice versa.
bindkey("x",                "w",        "o",        opts)

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

-- Key:         Ctrl-Shift-a
-- Action:      Yank all text in buffer.
-- TODO:        Move to Legendary.
bindkey("n",    "<C-S-a>",  "ma<S-g><S-v>gg0y`a",     opts)

-- Key:         Ctrl-a
-- Action:      Select all text in buffer.
-- TODO:        Move to Legendary.
bindkey("n",    "<C-a>",  "<S-g><S-v>gg0",        opts)

-- Key:         Ctrl-Shift-e
-- bindkey_virtual("n", "<C-S-e>", "", opts, "Unbound", "free_key_002", "This key is not bound to anything, maybe.")

-- Key:         Ctrl-Shift-w
-- bindkey_virtual("n", "<C-S-w>", "", opts, "Unbound", "free_key_003", "This key is not bound to anything, maybe.")

-- Key:         s
-- Action:      Substitute matches of word in yank register inside the selection. (Disabled atm, command below is better.)
-- Modes:       Visual
-- bindkey("x", "s", ":s/\\%V<C-r>0\\%V//g<Left><Left>", { noremap = true, silent = false })

-- Key:         xip
-- Action:      Free key.
-- bindkey("n",    "xip",    "vip",    opts)

-- Key:         Ctrl-i
-- Action:      Free key.
bindkey('n', '<C-i>', 'i', opts)

-- Key:         Ctrl-Shift-i
-- Action:      Free key.
bindkey('n', '<C-S-i>', 'a', opts)

-- Key:         ir          ( Normal Mode )
-- Action:      Macro Operator.     ( Requires register to record into. Ex: 'q' )
bindkey("n",    "ir",       "q",                    { noremap = true, silent = false })

-- Key:         Shift-q         ( Normal, Visual )
-- Action:      Play / repeat macro on 'q'. (In Visual Mode, on each selected line.)
bindkey("n",    "<S-q>",    "@q",                   { noremap = true, silent = false })
bindkey("x",    "<S-q>",    ":normal @q<CR>",       { noremap = true, silent = false })

-- Key:         Ctrl-(Shift)-u
-- bindkey("n",    "<C-u>", "", opts, "Unknown", "unknown_001", "Some issue with binding this key. Not sure what it does. (Normal)")
-- bindkey_virtual("n", "<C-S-u>", "", opts, "Unknown", "unknown_001", "Some issue with binding this key. Not sure what it does. (Normal)")

-- Key:         Esc
bindkey("n",   "<Esc>",  "<Esc><Cmd>set nohlsearch<CR>", opts)

-- Key:         Esc
bindkey("t",   "<Esc>",  "<C-\\><C-n>",         opts)

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
-- bindkey("x", "<Leader>rq", ":DB<CR>", opts)         -- Visual Selection

-- Key:         Leader-Shift-s
-- Action:      Execute SQL Query. (These seem to work now.)
-- Modes:       Normal / Visual
-- bindkey("n", "<Leader><S-s>", "<Plug>(DBUI_ExecuteQuery)", { silent = false })
-- bindkey("x", "<Leader><S-s>", "<Plug>(DBUI_ExecuteQuery)", { silent = false })

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
bindkey("n", "<leader>er", "<Cmd>TroubleToggle document_diagnostics<cr>")
bindkey("n", "<leader>el", "<Cmd>TroubleToggle loclist<cr>")
bindkey("n", "<leader>eq", "<Cmd>TroubleToggle quickfix<cr>")
bindkey("n", "<leader>rl", "<Cmd>TroubleToggle lsp_references<cr>")
bindkey("n", "<leader>ds", "<Cmd>TroubleToggle lsp_definitions<cr>")

-- |> Some weird fixing... Related to default <C-n> and <C-p>.
-- Note: experimental testing thing.

-- Key:     Ctrl-p      (Insert)
bindkey("i", "<C-p>", "")


-- === START - Aum Autopairs Functions - START === --

-- Trying to create my own autopairs system.

local function AumAutoPairs(pair_start, pair_end)
    -- True if `pair_start` is a parenthesis type.
    local pair_is_paren_type = pair_start == "(" or pair_start == "[" or pair_start == "{"

    -- Get current line of text.
    local current_line = vim.api.nvim_get_current_line()

    -- Get current `row` and `column` of `Cursor Position`.
    -- Parameter: `0` for current window.
    local cur_row, cur_col = unpack(vim.api.nvim_win_get_cursor(0))

    -- Get character after cursor, as substring of the `current_line`, indexed by `cursor position`.
    -- Columns need a `+1` because `get_cursor` is 0-indexed and this is end-exclusive.
    -- Inclusive `Start-index` and exclusive `End-index`, so they are the same when looking for a single index.
    local char_before_cursor = string.sub(current_line, cur_col, cur_col)
    local char_after_cursor = string.sub(current_line, cur_col + 1, cur_col + 1)

    -- Insert `pair_start` normally.
    -- `0` for current buffer, `row, col, row, col` for cursor position.
    -- NOTE: Need to counter 1-indexed `cur_row` with `-1`.
    local fixed_row = cur_row - 1
    vim.api.nvim_buf_set_text(0, fixed_row, cur_col, fixed_row, cur_col, { pair_start })

    -- Advance cursor by length of `pair_start`. ( `0` for current window, again. )
    local shifted_column = cur_col + string.len(pair_start)
    vim.api.nvim_win_set_cursor(0, { cur_row, shifted_column })

    -- Named boolean states for things.
    local space_before_cursor           = char_before_cursor == " "
    local space_after_cursor            = char_after_cursor  == " "

    local nothing_before_cursor         = char_before_cursor == ""
    local nothing_after_cursor          = char_after_cursor  == ""

    local paren_before_cursor           = char_before_cursor == "("  or char_before_cursor == "["  or char_before_cursor == "{"
    local paren_after_cursor            = char_after_cursor  == ")"  or char_after_cursor  == "]"  or char_after_cursor  == "}"

    local quote_before_cursor           = char_before_cursor == "'"  or char_before_cursor == '"'
    local quote_after_cursor            = char_after_cursor  == "'"  or char_after_cursor  == '"'

    local whitespace_before_cursor      = space_before_cursor        or      nothing_before_cursor
    local whitespace_after_cursor       = space_after_cursor         or      nothing_after_cursor
    local surrounded_by_whitespace      = whitespace_before_cursor   and     whitespace_after_cursor
    local surrounded_by_paren_types     = paren_before_cursor        and     paren_after_cursor

    -- Ex: ` | ` or `(|)        ( NOTE: Looks like this is working. )
    if surrounded_by_whitespace or surrounded_by_paren_types then
        -- Insert any type of pair.
        vim.api.nvim_buf_set_text(0, fixed_row, shifted_column, fixed_row, shifted_column, { pair_end })
    -- Ex: `(|_`
    elseif pair_is_paren_type and whitespace_after_cursor then
        -- Insert parentheses type pair-endings.
        vim.api.nvim_buf_set_text(0, fixed_row, shifted_column, fixed_row, shifted_column, { pair_end })
    -- Ex: `_|)` but not `_|"`
    elseif not pair_is_paren_type and whitespace_before_cursor and not quote_after_cursor then
        -- Insert quote type pair-endings.
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
    include_builtin = false,                    -- My bindings are so customized, a lot of these are wrong.
    include_legendary_cmds = true,
    select_prompt = "𝌥 Command Palette  ",     -- Default broken atm.
    col_separator_char = '│',
    most_recent_item_at_top = true,
    icons = {
        keymap = nil,
        command = ' ',
        fn = '󰡱 ',
        itemgroup = ' ',
    },

    keymaps = {
        --=========================================================
        -- |> START - Legendary         ( STATE: Good )         ===
        --=========================================================
        -- Key:         Ctrl-p          ( Normal )
        -- NOTE:        Bound in `~/.config/nvim/lua/plugins/telescope.lua`.
        --              - To lazy-load Telescope properly.
        -- { "<C-p>",      "<Cmd>Legendary<CR>",   description = "Search keymaps/bindings/commands/autocmds using Legendary and Telescope.",   mode = { "n", "x" },     opts = opts },

        --=========================================================
        -- |> START - `lazy.nvim`       ( STATE: Good )         ===
        --=========================================================
        -- Key:         Leader+Shift-l  ( Normal )
        { "<Space><S-l>",   "<Cmd>Lazy<CR>",    description = "[Lazy] Open `lazy.nvim` UI. (:Lazy)",   mode = { "n" },     opts = opts },

        --=========================================================
        -- |> START - Command mode      ( STATE: Good )         ===
        --=========================================================
        -- Key:         l               ( Normal, Visual, Operator )
        { "l",          ":",            description = "[Aum/CommandMode] Enter command mode.",              mode = { "n", "o" },                opts = { noremap = true, silent = false, nowait = true }},
        { "l",          ":Normal ",     description = "[Aum/CommandMode/Visual] Run normal mode command for each visually selected line.",      mode = { "x" },     opts = opts },
        -- Key:         :               ( Visual )
        { ":",          ":",            description = "[Aum/CommandMode/Visual] Enter command mode in Visual Mode.",                            mode = { "x" },     opts = opts },

        --=====================================================================
        -- |> START - Movement/Navigation Up / Down     ( STATE: Good )     ===
        --=====================================================================
        -- Key:         t               ( Normal, Visual, Operator )
        { "t",          "gk",           description = "[Aum/Motion] Move cursor one line upwards.",         mode = { "n", "x", "o" },   opts = opts_silent },
        -- Key:         h               ( Normal, Visual, Operator )
        { "h",          "gj",           description = "[Aum/Motion] Move cursor one line downwards.",       mode = { "n", "x", "o" },   opts = opts_silent },
        -- Key:         Shift-t         ( Normal, Visual, Operator )
        { "<S-t>",      "3<C-u>zz",     description = "[Aum/Motion] Move cursor 'scroll' lines upwards and center the screen.",     mode = { "n", "x", "o" },   opts = opts_silent },
        -- { "<S-t>",   "5gk",          description = "[Motion] Move cursor 5 lines upwards.",                   mode = { "n", "x", "o" },   opts = opts_silent },
        -- Key:         Shift-h         ( Normal, Visual, Operator )
        { "<S-h>",      "3<C-d>zz",     description = "[Aum/Motion] Move cursor 'scroll' lines downwards and center the screen.",   mode = { "n", "x", "o" },   opts = opts_silent },
        -- { "<S-h>",   "5gj",       description = "[Motion] Move cursor 5 lines downwards.",                 mode = { "n", "x", "o" },   opts = opts_silent },
        -- Key:         Ctrl-t          ( Normal, Visual, Operator )
        { "<C-t>",      "{zz",          description = "[Aum/Motion] Move cursor upwards to the next paragraph.",        mode = { "n", "x", "o" },   opts = opts },
        -- Key:         Ctrl-h
        { "<C-h>",      "}zz",          description = "[Aum/Motion] Move cursor downwards to the next paragraph.",      mode = { "n", "x", "o" },   opts = opts },
        -- Key:         {
        { "{",          "}",            description = "[Aum/Motion] Move cursor downwards to the next paragraph.",      mode = { "n", "x", "o" },   opts = opts },
        -- Key:         }
        { "}",          "{",            description = "[Aum/Motion] Move cursor upwards to the next paragraph.",        mode = { "n", "x", "o" },   opts = opts },
        -- Key:         gs              ( Normal, Visual, Operator )
        -- { "gs",         "0gg",          description = "[Aum/Motion] Move cursor to the first line in the current file/buffer.",     mode = { "n", "x", "o" },   opts = opts },
        -- Key:         ge              ( Normal, Visual, Operator )
        -- { "ge",         "0<S-g>zz",     description = "[Aum/Motion] Move cursor to the last line in the current file/buffer.",      mode = { "n", "x", "o" },   opts = opts },

        --=========================================================
        -- |> START - Left / Right      ( STATE: Good )         ===
        --=========================================================
        -- Key:         <Left>          ( Normal, Visual, Operator )
        { "<Left>",     "h",            description = "[Motion] Move cursor one column left.",          mode = { "n", "x", "o" },   opts = opts_silent },
        -- Key:         <Right>         ( Normal, Visual, Operator )
        { "<Right>",    "l",            description = "[Motion] Move cursor one column right.",         mode = { "n", "x", "o" },   opts = opts_silent },
        -- Key:         q               ( Normal, Visual, Operator )
        { "q",          "h",            description = "[Aum/Motion] Move cursor one column left.",      mode = { "n", "x", "o" },   opts = opts_silent },
        -- Key:         e               ( Normal, Visual, Operator )
        { "e",          "l",            description = "[Aum/Motion] Move cursor one column right.",     mode = { "n", "x", "o" },   opts = opts_silent },
        -- Key:         Ctrl-q          ( Insert )
        { "<C-q>",      "<Left>",       description = "[Aum/Motion] Move cursor to the left by one column in insert mode.",     mode = { "i" },     opts = opts_silent },
        -- Key:         Ctrl-e          ( Normal, Insert )
        { "<C-e>",      "<Right>",      description = "[Aum/Motion] Move cursor to the right by one column in insert mode.",    mode = { "i" },     opts = opts_silent },
        { "<C-e>",      "<Cmd>Inspect<CR>",     description = "[Aum/Special] Show Syntax Highlighting match-groups for textobject under cursor. (Syntax, Treesitter, Semantic Tokens, Extmarks.)",    mode = { "n" },     opts = opts },
        -- Key:         go
        { "go",         "0",            description = "[Aum/Motion] Move cursor to start of line.",     mode = { "n", "x", "o" },   opts = opts_silent },
        -- Key:         gn
        { "gn",         "$",            description = "[Aum/Motion] Move cursor to end of line.",       mode = { "n", "x", "o" },   opts = opts_silent },
        -- Key:         Ctrl-a
        { "<C-a>",      "<Esc>I",       description = "[Aum/Motion] Move cursor to start of line. (Insert Mode)",   mode = { "i" },     opts = opts_silent },
        -- Key:         Ctrl-s
        { "<C-s>",      "<Esc>A",       description = "[Aum/Motion] Move cursor to end of line. (Insert Mode)",     mode = { "i" },     opts = opts_silent },
        -- Key:         j
        { "j",          description = "[Aum/Motion] Move forwards to next matching character.",         mode = { "n", "x", "o" },   opts = opts },
        -- Key:         Shift-j
        { "<S-j>",      description = "[Aum/Motion] Move backwards to next matching character.",        mode = { "n", "x", "o" },   opts = opts },
        -- Key:         Shift-5  (%)
        { "%",          "%",            description = "[Vim/Motion] Move to matching brackets.",        mode = { "n", "x", "o" },   opts = opts },
        -- Key:         g<S-n>
        { "g<S-n>",     "<S-e>",        description = "[Aum/Motion] Move forwards to end of word.",     mode = { "n", "x", "o" },   opts = opts },
        -- Key:         g<S-o>
        { "g<S-o>",     "g<S-e>",       description = "[Aum/Motion] Move backwards to end of word.",    mode = { "n", "x", "o" },   opts = opts },

        --=====================================================================
        -- |> START - WordForwards / WordBackwards      ( STATE: Okay )     ===
        --=====================================================================
        -- Key:         n               ( Normal, Visual, Operator )
        { "n",          "<Cmd>lua require('spider').motion('w')<CR>",       description = "[Aum/Motion] Move cursor one word forward. (Spider Motion)",         mode = { "n" },         opts = opts },
        { "n",          "e",                                                description = "[Aum/Motion] Move cursor one word forward. (Operator)",              mode = { "o" },         opts = opts },
        { "n",          "<Cmd>lua require('spider').motion('e')<CR>",       description = "[Aum/Motion] Move cursor to end of word. (Visual Mode)",             mode = { "x" },         opts = opts },
        -- Key:         o               ( Normal, Visual, Operator )
        { "o",          "<Cmd>lua require('spider').motion('b')<CR>",       description = "[Aum/Motion] Move cursor one word backward. (Spider motion)",        mode = { "n" },         opts = opts },
        { "o",          "b",                                                description = "[Aum/Motion] Move cursor one word backward. (Operator)",             mode = { "o" },         opts = opts },
        { "o",          "b",                                                description = "[Aum/Motion] Move cursor to start of previous word. (Visual Mode)",  mode = { "x" },         opts = opts },
        -- { "o",          "<Cmd>lua require('spider').motion('ge')<CR>",      description = "Move cursor to end of previous word. (Visual Mode)",             mode = { "x" },         opts = opts },
        -- Key:         in              ( Normal, Visual, Operator )
        { "in",         "<S-w>",        description = "[Aum/Motion] Move cursor one super-word forward.",                        mode = { "n", "o" },    opts = opts },
        { "in",         "e",            description = "[Aum/Motion] Move cursor to word end. (Visual-Mode, non-spider)",         mode = { "x" },         opts = opts },
        -- Key:         ie              ( Normal, Visual, Operator )
        { "ie",         "ea",           description = "[Aum/Motion] Append at end of word. (Enter Insert-Mode)",                 mode = { "n" },         opts = opts },
        { "ie",         "<S-e>",        description = "[Aum/Motion] Move cursor to super-word end. (Non-Spider)",                mode = { "o" },         opts = opts },
        { "ie",         "<S-e>",        description = "[Aum/Motion] Move cursor to super-word end. (Visual-Mode, Non-Spider)",   mode = { "x" },         opts = opts },
        -- Key:         io              ( Normal, Visual, Operator )
        { "io",         "<S-b>",        description = "[Aum/Motion] Move cursor one super-word backward.",           mode = { "n", "x", "o" },   opts = opts },
        -- Key:         Ctrl-n          ( Insert )
        { "<C-n>",      "<C-Right>",    description = "[Aum/Motion] Move cursor one word forward. (Insert Mode)",    mode = { "i" },             opts = opts },
        -- Key:         Ctrl-o          ( Insert )
        { "<C-o>",      "<C-Left>",     description = "[Aum/Motion] Move cursor one word backward. (Insert Mode)",   mode = { "i" },             opts = opts },

        --=============================================================
        -- |> START - Inserting / Appending     ( STATE: Good )     ===
        --=============================================================
        -- Key:         w               ( Normal, Operator )
        { "w",          "i",            description = "[Aum/Insert] Enter `Insert Mode` behind the cursor.",                    mode = { "n", "o" },    opts = opts },
        -- Key:         a               ( Normal, Operator )
        { "a",          "a",            description = "[Aum/Insert] Enter `Insert Mode` after the cursor. (Append)",            mode = { "n", "o" },    opts = opts },
        -- Key:         ih              ( Normal, Operator )
        { "ih",         "o",            description = "[Aum/Insert] Enter insert mode on the line below cursor.",               mode = { "n", "o" },    opts = opts },
        -- Key:         it              ( Normal, Operator )
        { "it",         "<S-o>",        description = "[Aum/Insert] Enter insert mode on the line above cursor.",               mode = { "n", "o" },    opts = opts },
        -- Key:         Ctrl-t          ( Insert )
        { "<C-t>",      "<C-o>o",       description = "[Aum/Insert] Create new line below the current line and move there.",    mode = { "i" },         opts = opts },
        -- Key:         Shift-w         ( Normal, Visual )
        { "<S-w>",      "<S-i>",        description = "[Aum/Insert] Enter `Insert Mode` at the `Beginning of Line`.",           mode = { "n" },         opts = opts },
        { "<S-w>",      ":Normal W",    description = "[Aum/Insert] Insert at start of line using `normal` command.",           mode = { "x" },         opts = opts },
        -- Key:         Shift-a         ( Normal, Visual )
        { "<S-a>",      "<S-a>",        description = "[Aum/Insert] Enter `Insert Mode` at the `End of Line`.",                 mode = { "n" },         opts = opts },
        { "<S-a>",      ":Normal A",    description = "[Aum/Insert] Insert at start of line using `normal` command.",           mode = { "x" },         opts = opts },
        -- Key:         Ctrl-k          ( Insert )
        { "<C-k>",      "<C-o>",        description = "[Aum/Insert] Execute a `Normal Mode` command from `Insert Mode`.",       mode = { "i" },         opts = opts },

        --=================================================================
        -- |> START - Text Editing (Insert Mode)    ( STATE: TODO )     ===
        --=================================================================
        -- Key:         Ctrl-w          ( Insert )
        { "<C-w>",      "<C-w>",        description = "[Vim/Editing] Delete word before cursor.",       mode = { "i" },             opts = opts },
        -- Key:         Shift-i
        { "<S-i>",      "<S-j>",        description = "[Aum/Editing] Join lines with spaces.",          mode = { "n", "o", "x" },   opts = opts },
        -- Key:         g, Shift-i
        { "g<S-i>",     "g<S-j>",       description = "[Aum/Editing] Join lines without spaces.",       mode = { "n", "o", "x" },   opts = opts },

        --=====================================================
        -- |> START - Indenting         ( STATE: Good )     ===
        --=====================================================
        -- Key:         Tab
        { "<Tab>",      ">>",           description = "[Aum/Editing] Indent current line.",                                   mode = { "n" },     opts = opts },
        { "<Tab>",      ">gv",          description = "[Aum/Editing] Indent current selection / block. (Visual Mode)",        mode = { "x" },     opts = opts },
        -- Key:         Shift-Tab
        { "<S-Tab>",    "<<",           description = "[Aum/Editing] Unindent current line.",                                 mode = { "n" },     opts = opts },
        { "<S-Tab>",    "<gv",          description = "[Aum/Editing] Unindent current selection / block. (Visual Mode)",      mode = { "x" },     opts = opts },
        { "<S-Tab>",    "<BS>",         description = "[Aum/Editing] Unindent from Insert Mode.",                             mode = { "i" },     opts = opts },

        --=====================================================
        -- |> START - Smart Enter       ( STATE: Good )     ===
        --=====================================================
        -- Key:         <CR> ( Enter )  ( Normal, Insert )
        { "<CR>",       "i<CR><Right><Esc>",                description = "Insert new line / line break.",      mode = { "n" },     opts = opts },
        { "<CR>",       description = "Smart `<CR>` for inserting a new line with correct indentation. Will also accept autocompletion results.",   mode = { "i" },     opts = opts },

        -- Key:         Ctrl-<CR> ( Enter )  ( Normal )
        { "<C-CR>",     "mao<Esc>k`a",                      description = "Create new empty line below cursor.",                    mode = { "n" },     opts = opts },

        -- Key:         Shift-<CR> ( Enter )  ( Normal )
        { "<S-CR>",     "maO<Esc>j`a",                      description = "Create new empty line above cursor.",                    mode = { "n" },     opts = opts },

        --=====================================================================================
        -- |> START - Parens / Brackets / Braces   ( STATE: WIP )      ( Aum Autopairs )    ===
        --=====================================================================================
        { "(",          "<Cmd>AumSmartParens<CR>",          description = "Insert parentheses. Can auto-complete the pair.",        mode = { "i" },     opts = opts },
        { "[",          "<Cmd>AumSmartBrackets<CR>",        description = "Insert square brackets. Can auto-complete the pair.",    mode = { "i" },     opts = opts },
        { "{",          "<Cmd>AumSmartBraces<CR>",          description = "Insert squiggly braces. Can auto-complete the pair.",    mode = { "i" },     opts = opts },
        { "'",          "<Cmd>AumSmartQuotes<CR>",          description = "Insert quotes. Can auto-complete the pair.",             mode = { "i" },     opts = opts },
        { '"',          "<Cmd>AumSmartDoubleQuotes<CR>",    description = "Insert double quotes. Can auto-complete the pair.",      mode = { "i" },     opts = opts },
        { "`",          "<Cmd>AumSmartTicks<CR>",           description = "Insert backticks. Can auto-complete the pair.",          mode = { "i" },     opts = opts },

        --=============================================================
        -- |> START - Moving / Copying Lines    ( STATE: Okay )     ===
        --=============================================================
        -- Key:         Alt-h               ( Configured in `lazy.nvim` plugin spec config. )
        -- { "<A-h>",      "<Cmd>lua require('moveline').down()<CR>",          description = "Move current line down by one.",                         mode = { "n" },     opts = opts },
        { "<A-h>",      "<C-o><Cmd>m+1<CR>",                                description = "Move current line down by one. (Insert)",                mode = { "i" },     opts = opts },
        -- Key:         Alt-t               ( Configured in `lazy.nvim` plugin spec config. )
        -- { "<A-t>",      "<Cmd>lua require('moveline').up()<CR>",            description = "Move current line up by one.",                           mode = { "n" },     opts = opts },
        { "<A-t>",      "<C-o><Cmd>m-2<CR>",                                description = "Move current line up by one. (Insert)",                  mode = { "i" },     opts = opts },

        -- Key:         Alt-Shift-h
        { "<A-S-h>",    "<Cmd>copy.<CR>",                                   description = "Copy/Duplicate current line to the line below.",             mode = { "n" },     opts = opts },
        { "<C-A-h>",    "<Cmd>copy.<CR><S-v><Cmd>s/\\%V\\d\\+\\%V/\\=submatch(0)+1/g<CR><Esc>",  description = "Copy/Duplicate current line to the line below, and increment all numbers on the line.",     mode = { "n" },     opts = { silent = false } },
        { "<A-S-h>",    "<ESC><Cmd>copy.<CR>i<Right>",                      description = "Copy/Duplicate current line to the line below. (Insert)",    mode = { "i" },     opts = opts },
        -- Key:         Alt-Shift-t
        { "<A-S-t>",    "<Cmd>copy.-1<CR>",                                 description = "Copy/Duplicate current line to the line above.",             mode = { "n" },     opts = opts },
        { "<C-A-t>",    "<Cmd>copy.-1<CR><S-v><Cmd>s/\\%V\\d\\+\\%V/\\=submatch(0)-1/g<CR><Esc>",  description = "Copy/Duplicate current line to the line above, and decrement all numbers on the line.",     mode = { "n" },     opts = { silent = false } },
        { "<A-S-t>",    "<ESC><Cmd>copy.-1<CR>i<Right>",                    description = "Copy/Duplicate current line to the line above. (Insert)",    mode = { "i" },     opts = opts },
        -- Key:         Alt-h               ( Configured in `lazy.nvim` plugin spec config. )
        -- { "<A-h>",      "<Cmd>lua require('moveline').block_down()<CR>",    description = "Move selected block down by one line. (Visual)",             mode = { "x" },     opts = opts },
        -- Key:         Alt-t               ( Configured in `lazy.nvim` plugin spec config. )
        -- { "<A-t>",      "<Cmd>lua require('moveline').block_up()<CR>",      description = "Move selected block up by one line. (Visual)",               mode = { "x" },     opts = opts },

        --=================================================================================
        -- |> START - Moving / Copying characters       ( STATE: Seems Good / WIP )     ===
        --=================================================================================
        -- Key:         Alt-Left
        { "<A-Left>",   "vd<Left><S-p>",     description = "Move character under cursor one column to the left.",    mode = { "n" },     opts = opts },
        -- Key:         Alt-Right
        { "<A-Right>",  "vd<Right><S-p>",    description = "Move character under cursor one column to the right.",   mode = { "n" },     opts = opts },

        --=================================================================
        -- |> START - Buffer Navigation     ( STATE: Okay )             ===
        --=================================================================
        -- Key:         zn                  ( Normal )
        { "zn",         "<Cmd>bn<CR>",      description = "Focus next buffer.",         mode = { "n" },     opts = opts },
        -- Key:         zo                  ( Normal )
        { "zo",         "<Cmd>bp<CR>",      description = "Focus previous buffer.",     mode = { "n" },     opts = opts },
        -- Key:         <Leader> Shift-s    ( Normal )
        { "<Leader><S-s>",      "<Cmd>lua MiniBufremove.delete()<CR>",      description = "Delete current buffer.",     mode = { "n" },     opts = { silent = false } },

        --=================================================================
        -- |> START - Splits            ( STATE: TODO )                 ===
        --=================================================================
        -- Key:         Ctrl-l          ( Normal )
        { "<C-l>",      "<C-w><C-w>",   description = "[Aum/Splits] Cycle through splits/windows.",      mode = { "n" },     opts = opts },
        -- Key:         <Leader> Shift-o                ( Normal )
        { "<Leader><S-o>",  "<Cmd>close<CR>",   description = "[Aum/Splits] Close split window without deleting buffer.",    mode = { "n" },     opts = opts },

        --=================================================================
        -- |> START - Jumplist          ( STATE: Very Good )            ===
        --=================================================================
        -- Key:         Shift-o         ( Normal )
        { "<S-o>",      "<C-S-o>zz",    description = "[Aum/Jumplist] Move to previous location in jumplist.",     mode = { "n" },     opts = opts },
        -- Key:         Shift-n         ( Normal )
        { "<S-n>",      "<C-S-i>zz",    description = "[Aum/Jumplist] Move to next location in jumplist.",         mode = { "n" },     opts = opts },

        --=================================================================
        -- |> START - View Focus        ( STATE: Okay )                 ===
        --=================================================================
        -- Key:         zz              ( Normal )
        { "zz",         "zz",           description = "[Vim/View] Focus view on current line.",     mode = { "n", "x", "o" },   opts = opts_silent },

        --=================================================================
        -- |> START - Deleting          ( STATE: TODO )                 ===
        --=================================================================

        -- Empty for now. Need to move the normal binds here.

        --=================================================================
        -- |> START - Changing          ( STATE: TODO )                 ===
        --=================================================================

        -- Empty for now. Need to move the normal binds here.

        --=================================================================
        -- |> START - Replacing         ( STATE: TODO )                 ===
        --=================================================================

        -- Empty for now. Need to move the normal binds here.

        --=====================================================================
        -- |> START - Visual Selection / Selecting      ( STATE: TODO )     ===
        --=====================================================================

        -- TODO: Need to move the normal binds here.

        -- Key:         vip         ( Normal, Operator )
        { "vip",        "vip",      description = "[Vim/Visual] Select paragraph.",     mode = { 'n', 'o'},     opts = opts },
        -- Key:         vif         ( Normal, Operator )
        { "vif",        "$V%",      description = "[Aum/Visual] Select inside pairs.",  mode = { 'n', 'o'},     opts = opts },
        -- Key:         vib         ( Normal, Operator )
        { "vib",        "%v%<Right>w<Left>w",   description = "[Aum/Visual] Select inside brackets. (Parentheses)",     mode = { 'n', 'o'},     opts = opts },

        -- |> Selecting inside pairs.
        -- TODO: Add `join lines` binding <S-i> to `legendary`.
        -- TODO: Check Q (<S-q>) status and add the key to Leg.
        -- Key:         vi"         ( Normal, Operator )
        { 'vi"',        [[vi"]],    description = "[Vim/Visual] Select inside double quotes.",                   mode = { "n", "o" },    opts = opts },
        -- Key:         vi'         ( Normal, Operator )
        { "vi'",        [[vi']],    description = "[Vim/Visual] Select inside single quotes.",                   mode = { "n", "o" },    opts = opts },
        -- Key:         vi(         ( Normal, Operator )
        { "vi(",        [[vi(]],    description = "[Vim/Visual] Select inside parentheses.",                     mode = { "n", "o" },    opts = opts },
        -- Key:         vi[         ( Normal, Operator )
        { "vi[",        [[vi[]],    description = "[Vim/Visual] Select inside square brackets.",                 mode = { "n", "o" },    opts = opts },
        -- Key:         vi{         ( Normal, Operator )
        { "vi{",        [[vi{]],    description = "[Vim/Visual] Select inside braces / squiggly brackets.",      mode = { "n", "o" },    opts = opts },
        -- Key:         vi`         ( Normal, Operator )
        { "vi`",        [[vi`]],    description = "[Vim/Visual] Select inside backticks.",                       mode = { "n", "o" },    opts = opts },

        --=================================================================
        -- |> START - Search            ( STATE: Okay )                 ===
        --=================================================================
        -- Key:         r               ( Normal, Visual, Operator )
        { "r",          [[/]],          description = "[Aum/Search] Initiate search forwards.",              mode = { "n", "x", "o" },   opts = { noremap = true, silent = false, nowait = true } },
        -- { "r",          [[/\v]],        description = "Initiate search forwards. (Very Magic Mode)",                        mode = { "n", "x", "o" },   opts = { noremap = true, silent = false, nowait = true } },
        -- Key:         Shift-r         ( Visual )
        { "<S-r>",      'y/<C-r>"<CR><Cmd>set hlsearch<CR>',    description = "[Aum/Search] Search for matches of selected pattern.",    mode = { "x" },   opts = opts },
        -- Key:         ?               ( Normal, Visual, Operator )
        { "?",          "?",            description = "[Vim/Search] Initiate search backwards.",             mode = { "n", "x", "o" },   opts = { noremap = true, silent = false, nowait = true } },
        -- Key:         Shift-8 (* [star])                  ( Normal, Operator )
        { "*",          "*<S-n><Cmd>set hlsearch<CR>",      description = "[Aum/Search] Search forwards for word under cursor.",         mode = { "n", "o" },    opts = opts },
        { "*",          "*",                                description = "[Vim/Search] Search forwards for selection. (Visual)",        mode = { "x" },         opts = opts },
        -- Key:         Shift-3 (# [hashtag])               ( Normal, Operator )
        { "#",          "#<S-n><Cmd>set hlsearch<CR>",      description = "[Aum/Search] Search backwards for word under cursor.",        mode = { "n", "o" },    opts = opts },
        -- Key:         Shift-r                             ( Normal )
        { "<S-r>",      '/"[^\"]*"<CR><Right>',             description = "[Aum/Search] Search forwards for next pair of quotes and jump to matches.",       mode = { "n" },     opts = opts_silent },

        --=================================================================
        -- |> START - Search: Next / Previous       ( STATE: Good )     ===
        --=================================================================
        -- Key:         b               ( Normal, Visual, Operator )
        { "b",          "nzvzz",        description = "[Aum/Search] Jump to next search match.",         mode = { "n", "x", "o" },       opts = opts },
        -- Key:         gb              ( Normal, Visual, Operator )
        { "gb",         "gn",           description = "[Aum/Search] Visually select search match.",      mode = { "n", "x", "o" },       opts = opts },
        -- Key:         Shift-b         ( Normal, Visual, Operator )
        { "<S-b>",      "<S-n>zvzz",      description = "[Aum/Search] Jump to previous search match.",     mode = { "n", "x", "o" },       opts = opts },
        -- Key:         g-Shift-b       ( Normal, Visual, Operator )
        { "g<S-b>",     "g<S-n>",       description = "[Aum/Search] Jump to previous search match.",     mode = { "n", "x", "o" },       opts = opts },

        --=========================================================================================================================
        -- |> START - Custom: Search and Replace    ( STATE: Okay )     ( NOTE: These are interesting. Somewhat TODO/WIP. )     ===
        --=========================================================================================================================
        -- Key:         Shift-d         ( Visual )          ( STATE: Good )
        { "<S-d>",      ":s/\\%V<C-r>0//g<Left><Left>",     description = "Replace text that matches the contents of the yank register, within the current visual selection.",                  mode = { 'x' },   opts = { noremap = true, silent = false } },
        -- Key:         Shift-k         ( Visual )          ( STATE: Good )
        { "<S-k>",      "y:%s/<C-r>0//g<Left><Left>",       description = "Globally replace matches of visually selected text in the current file.",                                            mode = { 'x' },   opts = { noremap = true, silent = false } },
        -- Key:         Ctrl-Shift-k    ( Visual )          ( STATE: Good )
        { "<C-S-k>",    '"xy:%s/<C-r>x/<C-r>0/g<CR>',       description = 'Globally replace all matches of `Visually Selected Text` with the text currently in `Primary Clipboard Register`.',  mode = { 'x' },   opts = { noremap = true, silent = false } },
        -- Key:         ;;              ( Normal, Visual )  ( STATE: Good )
        { "<Leader>;;", [[:%s:\v::g<Left><Left><Left>]],    description = 'Global RegEx substitute.',               mode = { 'n' },   opts = { noremap = true, silent = false } },
        { ";;",         [[:s:\v::g<Left><Left><Left>]],     description = 'RegEx substitute within selection.',     mode = { 'x' },   opts = { noremap = true, silent = false } },

        --=========================================================================
        -- |> START - Matchpair jumping ( STATE: Good )                         ===
        --=========================================================================
        -- Key:         m               ( Normal, Visual, Operator )
        { "m",          "%",            description = "Jump to matching pairs of bracket-types.",   mode = { "n", "x", "o" },   opts = opts },

        --=========================================================================
        -- |> START - Copy / Yank       ( STATE: Okay )                         ===
        --=========================================================================
        -- Key:         y               ( Normal, Visual, Operator )
        { "y",          "may`a",        description = "[Yank] Initiate Yank / Copy.",                   mode = { "n", "o" },         opts = { noremap = true, silent = false, nowait = true } },
        { "y",          "may`a",        description = "[Yank] Initiate Yank / Copy in Visual Mode.",    mode = { "x" },              opts = { noremap = true, silent = false, nowait = true } },
        -- Key:         yi              ( Normal, Visual, Operator )
        { "yi",                         description = "[Vim/Yank] `Yank Inside` operator.",             mode = { "n", "o" },        opts = { noremap = true, silent = false, nowait = true } },
        -- Key:         ya              ( Normal, Visual, Operator )
        { "ya",                         description = "[Vim/Yank] `Yank Around` operator.",             mode = { "n", "o" },        opts = { noremap = true, silent = false, nowait = true } },
        -- Key:         Shift-y         ( Normal, Operator )
        { "<S-y>",      "yg_",          description = "[Yank] Yank / Copy to end of line. (1)",         mode = { "n", "o" },         opts = { noremap = true, silent = false, nowait = true } },
        -- Key:         ygn             ( Normal, Operator )
        { "ygn",        "yg_",          description = "[Yank] Yank / Copy to end of line. (2)",         mode = { "n", "o" },        opts = { noremap = true, silent = false, nowait = true } },
        -- Key:         ygo             ( Normal, Operator )
        { "ygo",        "may0`a",       description = "[Yank] Yank / Copy to start of line.",           mode = { "n", "o" },        opts = { noremap = true, silent = false, nowait = true } },
        -- Key:         yy              ( Normal, Operator )
        { "yy",         "ma0yg_`a",     description = "[Yank] Yank / Copy current line. (1)",           mode = { "n", "o" },        opts = { noremap = true, silent = false, nowait = true } },
        -- { "yy",         "<S-v>may`a",   description = "Yank / Copy current line. (1)",          mode = { "n", "o" },        opts = { noremap = true, silent = false, nowait = true } },
        -- Key:         yl              ( Normal, Operator )
        { "yl",         "ma0yg_`a",     description = "[Yank] Yank / Copy current line. (2)",           mode = { "n", "o" },        opts = { noremap = true, silent = false, nowait = true } },
        -- { "yl",         "<S-v>may`a",   description = "Yank / Copy current line. (2)",          mode = { "n", "o" },        opts = { noremap = true, silent = false, nowait = true } },
        -- Key:         ye              ( Normal, Operator )
        { "ye",         "ye",           description = "[Yank] Yank / Copy to end of word.",             mode = { "n", "o" },        opts = { noremap = true, silent = false, nowait = true } },
        -- Key:         yap             ( Normal, Operator )
        { "yap",        "mayap`a",      description = "[Yank] Yank / Copy around paragraph.",           mode = { "n", "o" },        opts = { noremap = true, silent = false, nowait = true } },
        -- Key:         yip             ( Normal, Operator )
        { "yip",        "mayip`a",      description = "[Yank] Yank / Copy inside paragraph.",           mode = { "n", "o" },        opts = { noremap = true, silent = false, nowait = true } },
        -- Key:         yif             ( Normal, Operator )
        { "yif",        "ma$V%y`a",     description = "[Yank] Yank / Copy function.",                   mode = { "n", "o" },        opts = { noremap = true, silent = false, nowait = true } },
        -- Key:         yp              ( Normal, Operator )
        { "yp",         "mayip`a",      description = "[Yank] Yank / Copy inside paragraph. (shortcut)",    mode = { "n", "o" },    opts = { noremap = true, silent = false, nowait = true } },
        -- Key:         yis             ( Normal, Operator )
        { "yis",        "mayis`a",      description = "[Yank] Yank / Copy inside sentence.",            mode = { "n" },             opts = { noremap = true, silent = false, nowait = true } },
        -- Key:         yas             ( Normal, Operator )
        { "yas",        "mayas`a",      description = "[Yank] Yank / Copy around sentence.",            mode = { "n" },             opts = { noremap = true, silent = false, nowait = true } },
        -- Key:         ya(             ( Normal, Visual, Operator )
        { "ya(",        "maya(`a",      description = "[Yank] Yank / Copy around `(`.",                 mode = { "n" },             opts = { noremap = true, silent = false, nowait = true } },
        -- Key:         ya{             ( Normal, Visual, Operator )
        { "ya{",        "maya{`a",      description = "[Yank] Yank / Copy around `{`.",                 mode = { "n" },             opts = { noremap = true, silent = false, nowait = true } },
        -- Key:         ya[             ( Normal, Visual, Operator )
        { "ya[",        "maya[`a",      description = "[Yank] Yank / Copy around `[`.",                 mode = { "n" },             opts = { noremap = true, silent = false, nowait = true } },

        --=========================================================================
        -- |> START - Paste             ( STATE: Quite Good )                   ===
        --=========================================================================
        -- Key:         p               ( Normal, Visual, Operator )
        -- NOTE:        This feels really good for almost all cases. Except for block pasting, in which case better to use `k<C-v>`.
        --              Also: If pasting in a way that triggers scrolloff to move the screen, causes some annoying flicker.
        { "p",          'ip<Esc>mp"_x<S-p>`p',      description = "Paste from clipboard.",      mode = { "n", "o" },    opts = opts },
        -- { "p",          'ip<Esc>mp"_x<S-p>`p',       description = "Paste from clipboard.",      mode = { "n", "o" },    opts = opts },
        { "p",          "<S-p>",                    description = "Paste from clipboard or registers. (Visual Mode)",   mode = { "x" },     opts = opts },  -- Simple option, with minor issues.
        -- { "p",          '"_c<C-r>+<Esc>', description = "Paste from clipboard or registers. (Visual Mode)",   mode = { "x" },         opts = opts },  -- Issues with staggered multi-line paste.

        -- Key:         zp              ( Normal, Operator )
        --  - Serves a purpose, but would be nice if `<S-p>` could work like this without issues for multi line yanks.
        { "zp",         "gpk",          description = "Paste below from clipboard or registers. (For multi line yanks, without inserting new line.)",    mode = { "n", "o" },   opts = opts },

        -- Key:         Shift-p         ( Normal )
        --  - Commonly used. Generally good. But adds an extra new line when pasting a multi line yanks. (Which I dislike greatly)
        { "<S-p>",      'o<C-o><S-p><Esc>',     description = "Paste below, from clipboard or registers.",      mode = { "n"  },    opts = opts },

        -- Key:         Ctrl-v          ( Insert, Visual, Select, Command )
        { "<C-v>",      "<C-o><S-p>",   description = "Paste from clipboard in Insert Mode.",       mode = { "i" },        opts = opts },   -- Probably fine.
        { "<C-v>",      "<S-p>",        description = "Paste from clipboard in Visual Mode.",       mode = { "x" },        opts = opts },   -- Think this works.
        { "<C-v>",      "<C-o><S-p>a",  description = "Paste from clipboard in Select Mode.",       mode = { "s" },        opts = opts },   -- Think this works.
        { "<C-v>",      "<C-r>+",       description = "Paste clipboard contents in Command Mode.",  mode = { "c" },        opts = { noremap = true, silent = false } },   -- This works.

        -- Key:         Ctrl-r          ( Insert )
        { "<C-r>",      "<C-r>",        description = "Paste from register in Insert Mode. (Probably?)",     mode = { "i" },    opts = opts },

        --=========================================================================
        -- |> START - Undo / Redo       ( STATE: Okay )                         ===
        --=========================================================================
        -- Key:         u               ( Normal )
        { "u",          "u",            description = "[Vim/EditHistory] Undo operation.",      mode = { "n" },             opts = opts },
        -- Key:         Shift-u         ( Normal )
        { "<S-u>",      "<C-r>",        description = "[EditHistory] Redo operation.",          mode = { "n" },             opts = opts },

        -- Key:         Ctrl-Z          ( Normal, Insert, Visual )
        --  - NOTE:     I do prefer `u`, so this key could be used for something else.
        { "<C-z>",      "u",            description = "Undo operation. (Normal Mode Alt)",      mode = { "n" },             opts = opts },
        { "<C-z>",      "<Esc>",        description = "Exit Visual Mode.",                      mode = { "x" },             opts = opts },
        { "<C-z>",      "<Esc>u",       description = "Undo operation. (Insert Mode)",          mode = { "i" },             opts = opts },

        -- Key:         Ctrl-r          ( Normal, Operator )
        { "<C-r>",      "<C-r>",        description = "Redo. (Undo a undo)",               mode = { "n", "o" },    opts = opts },
        -- NOTE: This key is not bound: `<C-r>` ( Visual Mode )

        --=========================================================================
        -- |> START - Folding               ( STATE: TODO/WIP )                 ===
        --=========================================================================
        -- Key:         zf (Create fold)    ( Normal, Visual, Operator )
        { "zf",         "zf",               description = "Create new fold. (Mostly for marker mode)",              mode = {"n", "x", "o"},     opts = opts },
        -- Key:         zh (Open fold)      ( Normal, Operator )
        { "zh",         "zo",               description = "Open fold.",                 mode = {"n", "o"},          opts = opts },
        -- Key:         zr (Open fold)      ( Normal, Operator )
        { "zr",         "zr",               description = "Reduce (Open) fold.",        mode = {"n", "o"},          opts = opts },
        -- Key:         zR (Open all)       ( Normal, Operator )
        { "z<S-r>",     "z<S-r>",           description = "Reduce (Open) all folds.",   mode = {"n", "o"},          opts = opts },
        -- Key:         zc (Close fold)     ( Normal, Operator )
        { "zc",         "zc",               description = "Close fold.",                mode = {"n", "o"},          opts = opts },
        -- Key:         zm (Close fold)     ( Normal, Operator )
        { "zm",         "zm",               description = "Close fold (More).",         mode = {"n", "o"},          opts = opts },
        -- Key:         zM (Close all)      ( Normal, Operator )
        { "z<S-m>",     "z<S-m>",           description = "Close all folds.",           mode = {"n", "o"},          opts = opts },
        -- Key:         zt (Toggle fold)    ( Normal, Operator )
        { "zt",         "za",               description = "Toggle folding.",            mode = {"n", "o"},          opts = opts },

        --=========================================================================
        -- |> START - Telescope         ( STATE: Okay )                         ===
        --=========================================================================
        -- Key:         Ctrl-s          ( Normal )
        -- NOTE:        Bound in `~/.config/nvim/lua/plugins/telescope.lua`.
        --              - To lazy-load Telescope properly.
        -- { "<C-s>",                      "<Cmd>Telescope current_buffer_fuzzy_find<CR>",     description = "Telescope: Fuzzy search (find) current buffer.",         mode = "n",     opts = opts },

        -- Key:         Ctrl-Shift-p    ( Normal )
        -- NOTE:        Bound in `~/.config/nvim/lua/plugins/telescope.lua`.
        --              - To lazy-load Telescope properly.
        -- { "<C-S-p>",                    "<Cmd>Telescope find_files<CR>",                    description = "Telescope: Fuzzy search (find) files.",                  mode = "n",     opts = opts },

        -- TODO: Move the rest of these into lazy's `telescope.lua` spec.

        -- Key:         Ctrl-Shift-s    ( Normal )
        { "<C-S-s>",                    "<Cmd>Telescope buffers<CR>",                       description = "Telescope: Fuzzy search (find) open buffers.",           mode = "n",     opts = opts },
        -- Key:         Ctrl-Shift-f    ( Normal )
        { "<C-S-f>",                    "<Cmd>Telescope live_grep<CR>",                     description = "Telescope: Live grep.",                                  mode = "n",     opts = opts },
        -- Key:         Leader-Tele*    ( Normal )
        { "<Leader><S-t>ele<S-h>i",     "<Cmd>Telescope highlights<CR>",                    description = "Telescope: List and search highlight groups.",           mode = "n",     opts = opts },
        { "<Leader><S-t>ele<S-o>",      "<Cmd>TelescopeAumOldFiles<CR>",                    description = "Telescope: List and search previously visited files. (recent)",      mode = "n",     opts = opts },
        { "<Leader><S-t>ele<S-g>",      "<Cmd>Telescope live_grep<CR>",                     description = "Telescope: Live (rip)grep current folder.",              mode = "n",     opts = opts },
        { "<Leader><S-t>ele<S-h>e",     "<Cmd>Telescope help_tags<CR>",                     description = "Telescope: List and search help tags.",                  mode = "n",     opts = opts },
        { "<Leader><S-t>eletreesitter", "<Cmd>Telescope treesitter<CR>",                    description = "Telescope: List and search treesitter symbols.",         mode = "n",     opts = opts },
        -- Key:         Shift-k         ( Normal )
        -- { "<S-k>",                      "<Cmd>Telescope lsp_document_symbols<CR>",          description = "Telescope: List and search lsp document symbols.",       mode = "n",     opts = opts },

        --=========================================================================
        -- |> START - File Explorer     ( STATE: TODO )                         ===
        --=========================================================================

        -- Empty for now. Looking at `oil.nvim`, Telescope file explorer, dirvish, and friends. (Also Telescope Zoxide)

        --=========================================================================
        -- |> START - Expand-Region Selections (Wildfire)     ( STATE: Okay )   ===
        --=========================================================================
        -- Key:         Shift-l         ( Normal, Visual, Operator )
        -- { "<S-l>",                      "<Plug>(wildfire-fuel)",                description = "Wildfire: Expand selection.",        mode = { "n", "x", "o" },       opts = opts },
        -- Key:         Ctrl-l          ( Visual )
        -- { "<C-l>",                      "<Plug>(wildfire-water)",               description = "Wildfire: Shrink selection.",        mode = { "x" },                 opts = opts },

        --=========================================================================
        -- |> START - Misc Commands     ( STATE: TODO )                         ===
        --=========================================================================
        -- Key:         Leader-l-s-p
        { "<Leader>lsp",                "<Cmd>AumLspStart<CR>",                    description = "Start Language Server.",                  mode = { "n" },                 opts = opts },

        -- Font Size                    ( STATE: Okay )
        -- Key:         Leader-Leader-f-s
        { "<Leader><Leader>fs",         ":set guifont=JetBrainsMono\\ Nerd\\ Font:h:b<Left><Left>",      description = "Set Font Size to desired value.",   mode = { 'n' },   opts = { noremap = true, silent = false } },

        -- Zen-Mode                     ( STATE: Fine ) ( NOTE: `true-zen.nvim` is worse than `zen-mode.nvim`. )
        -- Key:         <Leader>z
        { "<Leader>z",                  "<Cmd>ZenMode<CR>",     description = "Toggle Zen-Mode.",       mode = { "n" },       opts = opts },

        -- Treesitter                   ( STATE: Fine )
        --  - TODO: Could create a function which actually disables the treesitter highlighting for the current filetype / buffer.
        --          Or find one.
        { "<Leader>tson",               ":TSEnable highlight ",         description = "Enable Treesitter highlighting.",    mode = { "n" },   opts = { silent = false } },
        { "<Leader>tsoff",              ":TSDisable highlight ",        description = "Disable Treesitter highlighting.",   mode = { "n" },   opts = { silent = false } },

        -- Syntax Highlighting          ( STATE: Fine )
        { "<Leader>synon",              "<Cmd>set syntax=on<CR>",       description = "Enable (RegEx) Syntax Highlighting.",    mode = { "n" },     opts = opts_silent },
        { "<Leader>synoff",             "<Cmd>set syntax=off<CR>",      description = "Disable (RegEx) Syntax Highlighting.",   mode = { "n" },     opts = opts_silent },

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
        { "g0",         "g0",           description = "Help file overview.",    mode = "n",     opts = opts },
        { "g<C-g>",     "g<C-g>",       description = "Echo word count and other info.",    mode = { "n", "x" },   opts = opts },

        -- `leap.nvim`
        -- Key:         d
        -- NOTE:        Configured in the `lazy.nvim` plugin spec: `plugins/navigation.lua`.
        -- { "d",          "<Plug>(leap-forward-to)",      description = "Leap.nvim: Jump forward.",   mode = { "n", "x", "o" },   opts = opts },


        --=============================================================================================
        -- |> START - Anonymous bindings documenting basic Vim Keybindings      ( STATE: TODO )     ===
        --=============================================================================================

        -- Key:         Esc
        { "<Esc>",      "<Esc>",        description = "[Vim/Abort] Cancel, Abort, Escape | Return to `Normal Mode`.",   mode = { "i" },     opts },

        -- Key:         ;
        { ";",          ";",            description = "[Vim/Repeat] Repeat last f/t search.",                           mode = { "n" },     opts },

        -- Key:         Ctrl-e          ( Normal, Visual, Operator )
        { "<C-e>",      description = "[Vim/Inactive] Default binding to scroll the screen `down` by `count` lines.",   mode = { "n", "x", "o" },   opts = opts },
        -- Key:         Ctrl-y          ( Normal, Visual, Operator )
        { "<C-y>",      description = "[Vim/Inactive] Default binding to scroll the screen `up` by `count` lines.",     mode = { "n", "x", "o" },   opts = opts },

        -- Key:         Ctrl-d          ( Normal, Visual, Operator )
        { "<C-d>",      description = "[Vim/Inactive] Default binding to scroll the screen `down` by `scroll` number of lines.",    mode = { "n", "x", "o" },   opts = opts },
        -- Key:         Ctrl-u          ( Normal, Visual, Operator )
        { "<C-u>",      description = "[Vim/Inactive] Default binding to scroll the screen `up` by `scroll` number of lines.",      mode = { "n", "x", "o" },   opts = opts },

        -- Key:         gg              ( Normal, Visual, Operator )
        { "gg",         "gg0",           description = "[Vim/Motion] Move cursor to the first line in the current file/buffer.",    mode = { "n", "x", "o" },   opts = opts },
        -- Key:         Shift-g         ( Normal, Visual, Operator )
        { "<S-g>",      "<S-g>0zz",      description = "[Vim/Motion] Move cursor to the last line in the current file/buffer.",     mode = { "n", "x", "o" },   opts = opts },

        -- Key:         g<C-a>          ( Normal )
        { "+",          "<C-a>",        description = "[Vim/Increment] Increment operator.",                    mode = { "n", "o" },    opts },
        { "-",          "<C-x>",        description = "[Vim/Decrement] Decrement operator.",                    mode = { "n", "o" },    opts },

        -- Key:         g<C-a>          ( Visual )
        { "g<C-a>",     "g<C-a>",       description = "[Vim/Increment] Increment visually selected numbers.",   mode = { "x" },     opts },
        -- Key:         g<C-x>          ( Visual )
        { "g<C-x>",     "g<C-x>",       description = "[Vim/Decrement] Decrement visually selected numbers.",   mode = { "x" },     opts },

        --=================================
        -- |> END - Legendary Bindings  ===
        --=================================
    },

    commands = {
        -- Snippets             ( STATE: Okay, but missing filetypes. )
        --  - TODO: Instead of having 50 different commands for these, should
        --          create a function which takes in the filetype as a parameter.
        {
            "EditSnippetsAll",
            function()
                vim.api.nvim_cmd({ cmd = "edit", args = { "/home/aum/.config/nvim/snippets/all.lua" } }, {})
            end,
            description = "Edit/Open Global Snippets(file)."
        },
        {
            "EditSnippetsSnippets",
            function()
                vim.api.nvim_cmd({ cmd = "edit", args = { "/home/aum/.config/nvim/snippets/snippets.snippets" } }, {})
            end,
            description = "Edit/Open `Snippets` Snippets(file)."
        },
        {
            "EditSnippetsRust",
            function()
                vim.api.nvim_cmd({ cmd = "edit", args = { "/home/aum/.config/nvim/snippets/rust.snippets" } }, {})
            end,
            description = "Edit/Open `Rust` Snippets(file)."
        },
        {
            "EditSnippetsLua",
            function()
                vim.api.nvim_cmd({ cmd = "edit", args = { "/home/aum/.config/nvim/snippets/lua.snippets" } }, {})
            end,
            description = "Edit/Open `Lua` Snippets(file)."
        },
        {
            "EditSnippetsNorg",
            function()
                vim.api.nvim_cmd({ cmd = "edit", args = { "/home/aum/.config/nvim/snippets/norg.snippets" } }, {})
            end,
            description = "Edit/Open `Norg` Snippets(file)."
        },
        {
            "EditLuaSnippetsNorg",
            function()
                vim.api.nvim_cmd({ cmd = "edit", args = { "/home/aum/.config/nvim/snippets/norg.lua" } }, {})
            end,
            description = "Edit/Open `Norg` LuaSnippets(file)."
        },
        {
            "EditSnippetsMarkdown",
            function()
                vim.api.nvim_cmd({ cmd = "edit", args = { "/home/aum/.config/nvim/snippets/markdown.snippets" } }, {})
            end,
            description = "Edit/Open `Markdown` Snippets(file)."
        },
        {
            "EditLuaSnippetsMarkdown",
            function()
                vim.api.nvim_cmd({ cmd = "edit", args = { "/home/aum/.config/nvim/snippets/markdown.lua" } }, {})
            end,
            description = "Edit/Open `Markdown` LuaSnippets(file)."
        },
        {
            "EditSnippetsHtml",
            function()
                vim.api.nvim_cmd({ cmd = "edit", args = { "/home/aum/.config/nvim/snippets/html.snippets" } }, {})
            end,
            description = "Edit/Open `HTML` Snippets(file)."
        },
        {
            "EditLuaSnippetsHtml",
            function()
                vim.api.nvim_cmd({ cmd = "edit", args = { "/home/aum/.config/nvim/snippets/html.lua" } }, {})
            end,
            description = "Edit/Open `HTML` LuaSnippets file."
        },
        {
            "EditLuaSnippetsSvelte",
            function()
                vim.api.nvim_cmd({ cmd = "edit", args = { "/home/aum/.config/nvim/snippets/svelte.lua" } }, {})
            end,
            description = "Edit/Open `Svelte` LuaSnippets file."
        },
        {
            "EditLuaSnippetsPhp",
            function()
                vim.api.nvim_cmd({ cmd = "edit", args = { "/home/aum/.config/nvim/snippets/php.lua" } }, {})
            end,
            description = "Edit/Open `PHP` LuaSnippets file."
        },
        {
            "EditTextMateSnippetsCss",
            function()
                vim.api.nvim_cmd({ cmd = "edit", args = { "/home/aum/.config/nvim/snippets/css.snippets" } }, {})
            end,
            description = "Edit/Open `CSS` Snippets file."
        },
        {
            "EditLuaSnippetsCss",
            function()
                vim.api.nvim_cmd({ cmd = "edit", args = { "/home/aum/.config/nvim/snippets/css.lua" } }, {})
            end,
            description = "Edit/Open `CSS` LuaSnippets file."
        },
        {
            "EditSnippetsTypescript",
            function()
                vim.api.nvim_cmd({ cmd = "edit", args = { "/home/aum/.config/nvim/snippets/typescript.snippets" } }, {})
            end,
            description = "Edit/Open `Typescript` Snippets(file)."
        },
        {
            "EditLuaSnippetsTypescript",
            function()
                vim.api.nvim_cmd({ cmd = "edit", args = { "/home/aum/.config/nvim/snippets/typescript.lua" } }, {})
            end,
            description = "Edit/Open `Typescript` LuaSnippets(file)."
        },
        {
            "EditSnippetsJavascript",
            function()
                vim.api.nvim_cmd({ cmd = "edit", args = { "/home/aum/.config/nvim/snippets/javascript.snippets" } }, {})
            end,
            description = "Edit/Open `Javascript` Snippets(file)."
        },
        {
            "EditLuaSnippetsJavascript",
            function()
                vim.api.nvim_cmd({ cmd = "edit", args = { "/home/aum/.config/nvim/snippets/javascript.lua" } }, {})
            end,
            description = "Edit/Open `Javascript` LuaSnippets(file)."
        },
        {
            "EditSnippetsSvelte",
            function()
                vim.api.nvim_cmd({ cmd = "edit", args = { "/home/aum/.config/nvim/snippets/svelte.snippets" } }, {})
            end,
            description = "Edit/Open `Svelte` Snippets(file)."
        },
        {
            "EditSnippetsTypst",
            function()
                vim.api.nvim_cmd({ cmd = "edit", args = { "/home/aum/.config/nvim/snippets/typst.snippets" } }, {})
            end,
            description = "Edit/Open `Typst` Snippets(file)."
        },
        {
            "EditLuaSnippetsTypst",
            function()
                vim.api.nvim_cmd({ cmd = "edit", args = { "/home/aum/.config/nvim/snippets/typst.lua" } }, {})
            end,
            description = "Edit/Open `Typst` LuaSnippets(file)."
        },
        -- LSP
        -- {
        --     "AumLspSetupRust",
        --     function()
        --         vim.api.nvim_cmd({ cmd = "LspSetupRust" },  {})
        --     end,
        --     description = "Setup Rust Language Server. (Rust-Analyzer)"
        -- },
        -- {
        --     "AumLspSetupTypescript",
        --     function()
        --         vim.api.nvim_cmd({ cmd = "LspSetupTypescript" },  {})
        --     end,
        --     description = "Setup Typescript Language Server. (TS-Server)"
        -- },
        -- {
        --     "AumLspSetupSvelte",
        --     function()
        --         vim.api.nvim_cmd({ cmd = "LspSetupSvelte" },  {})
        --     end,
        --     description = "Setup Svelte Language Server."
        -- },
        {
            "AumLspStart",
            function()
                if vim.bo.filetype == "rust" then
                    vim.api.nvim_cmd({ cmd = "LspSetupRust" },  {})
                elseif vim.bo.filetype == "typescript" or vim.bo.filetype == "javascript" then
                    vim.api.nvim_cmd({ cmd = "LspSetupTypescript" },  {})
                elseif vim.bo.filetype == "svelte" then
                    vim.api.nvim_cmd({ cmd = "LspSetupSvelte" },  {})
                    -- vim.api.nvim_cmd({ cmd = "LspSetupUnoCSS" },  {})    -- Fuck this
                    -- TODO: Add TailwindCSS LS here.
                end
                vim.api.nvim_cmd({ cmd = "LspStart" },  {})
            end,
            description = "Start Language Servers based on Current Filetype."
        },
        {
            "AumLspStop",
            function()
                vim.api.nvim_cmd({ cmd = "LspStop" },   {})
            end,
            description = "Stop Language Server."
        },
        {
            "AumLspInfo",
            function()
                vim.api.nvim_cmd({ cmd = "LspInfo" },   {})
            end,
            description = "Show Language Server Info."
        },
        {
            "EnableExtraOpts",
            function()
                vim.api.nvim_cmd({ cmd = "set", args = { "nu" } },              {})
                vim.api.nvim_cmd({ cmd = "set", args = { "rnu" } },             {})
                vim.api.nvim_cmd({ cmd = "set", args = { "cursorline" } },      {})
                vim.api.nvim_cmd({ cmd = "set", args = { "list" } },            {})
                vim.api.nvim_cmd({ cmd = "CursorwordHighlightOn" },             {})
            end,
            description = "Enables (relative) line numbers, cursorline, listchars and cursorword-highlighting."
        },
        {
            "DisableExtraOpts",
            function()
                vim.api.nvim_cmd({ cmd = "set", args = { "nonu" } },            {})
                vim.api.nvim_cmd({ cmd = "set", args = { "nornu" } },           {})
                vim.api.nvim_cmd({ cmd = "set", args = { "nocursorline" } },    {})
                vim.api.nvim_cmd({ cmd = "set", args = { "nolist" } },          {})
            end,
            description = "Disables (relative) line numbers, cursorline and listchars."
        },
        {
            "TelescopeAumOldFiles",
            function()
                require("telescope.builtin").oldfiles({
                    file_ignore_patterns = {
                        "passwords.txt",
                        "pass.txt",
                    }
                })
            end,
            description = "`Telescope oldfiles` with ignore patterns."
        },
        -- `comment.nvim`
        { "CommentCurrentLine",     ":lua require('Comment.api').toggle.linewise.current()<CR>",                description = "Toggle comment status of current line: `gcc`" },
        { "CommentSelection",       ":lua require('Comment.api).toggle.linewise.(vim.fn.visualmode())<CR>",     description = "Toggle comment status of selected lines: `gc` (Visual)" },
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

--=================================================--
-- === END - Plugin Specific Keybindings - END === --
--=================================================--
--================================================================================================--
-- === END - 9. Mappings/Keymaps/Keymappings/Keybindings/Remaps/Shortcuts/Hotkeys/Binds - END === --
--================================================================================================--

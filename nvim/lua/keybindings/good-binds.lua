--=================================================================================================--
-- === START - Mappings/Keymaps/Keymappings/Keybindings/Remaps/Shortcuts/Hotkeys/Binds - START === --
--=================================================================================================--

-- Aliases.
local bindkey = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Key:         \ (Backslash)       
-- Action:      Leader Key.
vim.g.mapleader = "\\"

--=====================================================--
-- === => START -> Up-down motions and scrolling - === --
--=====================================================--

-- => STATE: Good (Probably basically finished.)

--===================================================--
-- === => END -> Up-down motions and scrolling - === --
--===================================================--
--|---------------------------------------------------|
--===================================================================--
-- === => START ->  Left-right motions and Text Object motions - === --
--===================================================================--

-- => STATE: Good - Commented ones added to Legendary binds.

-- Key:         <Left> / q          (Normal, Visual, Operator)
-- Action:      Move cursor left by one column.
-- bindkey({"n", "v", "o"},    "<Left>",    "h",           opts)
-- bindkey({"n", "v", "o"},    "q",         "h",           opts)

-- Key:         <Right> / e         (Normal, Visual, Operator)
-- Action:      Move cursor right by one column.
-- bindkey({"n", "v", "o"},    "<Right>",   "l",           opts)
-- bindkey({"n", "v", "o"},    "e",         "l",           opts)

-- Key:         n
-- bindkey({"n", "o"},     "n",        "w",        opts)
-- bindkey("v",            "n",        "e",        opts)

-- Key:         o
-- bindkey("n",    "o",         "b",          opts)
-- bindkey("v",    "o",         "b",          opts)
-- bindkey("o",    "o",         "b",          opts)

-- Key:         in
-- bindkey("n",    "in",        "<S-w>",      opts)
-- bindkey("v",    "in",        "<S-e>",      opts)
-- bindkey("o",    "in",        "<S-w>",      opts)

-- Key:         io
-- bindkey("n",    "io",        "<S-b>",      opts)
-- bindkey("v",    "io",        "<S-b>",      opts)
-- bindkey("o",    "io",        "<S-b>",      opts)

-- Key:         Ctrl-n      (Insert)
-- Action:      Move cursor one word forwards.
-- bindkey("i",    "<C-n>",     "<C-o>w",      opts)

-- Key:         Ctrl-o      (Insert)
-- Action:      Move cursor one word backwards.
-- bindkey("i",    "<C-o>",     "<C-o>b",      opts)

-- Key:         <S-n>
-- Key:         g<S-n>

-- Key:         g<S-o>
-- bindkey("n",    "g<S-o>",     "g<S-e>",      opts)
-- bindkey("v",    "g<S-o>",     "g<S-e>",      opts)
-- bindkey("o",    "g<S-o>",     "g<S-e>",      opts)

-- Key:         go
-- bindkey("n",    "go",         "^",           opts)
-- bindkey("v",    "go",         "^",           opts)
-- bindkey("o",    "go",         "^",           opts)

-- Key:         gn
-- bindkey("n",    "gn",         "$",          opts)
-- bindkey("v",    "gn",         "$",          opts)
-- bindkey("o",    "gn",         "$",          opts)

-- Key:         Ctrl-a
-- bindkey("i",    "<C-a>",      "<Esc>I",      opts)

-- Key:         Ctrl-s
-- bindkey("i",    "<C-s>",      "<Esc>A",      opts)

-- Key:         j
-- Action:      Jump forwards to Character.
-- bindkey({"n", "o", "v"},    "j",         "f",           opts)

-- Key:         Shift-j
-- Action:      Jump backwards to Character.
-- bindkey({"n", "o", "v"},    "<S-j>",     "<S-f>",       opts)

-- Key:         Shift-o
-- Action:      Move to previous location in jumplist.
-- bindkey("n",    "<S-o>",     "<C-S-o>",     opts)

-- Key:         Shift-n
-- Action:      Move to next location in jumplist.
-- bindkey("n",    "<S-n>",     "<C-S-i>",     opts)

-- Key:         Shift-5  (%)
-- bindkey("n",    "%",          "%",          opts)

--===============================================================--
-- === END - Motions: Left-right + Text object motions - END === --
--===============================================================--
--|-----------------------------------------|
--===========================================--
-- === START - Pattern searching - START === --
--===========================================--

-- => STATE: Good (But moving to legendary)

-- Key:         Shift-r
bindkey("v",    "<S-r>",    'y/<C-r>"<CR><Cmd>set hlsearch<CR>',    { silent = true })

-- Key:         b
-- Action:      Jump to next search.
bindkey({"n", "v", "o"},    "b",        "n",        { silent = true })

-- Key:         Shift-b
-- Action:      Jump to previous search.
bindkey({"n", "v", "o"},    "<S-b>",    "<S-n>",    { silent = true })

-- Key:         Ctrl-s
-- bindkey("i",    "<C-s>",    "<C-o>/",            { silent = false })

-- Key:         Shift-8 (* [star])
bindkey("n",    "*",        "*<S-n><Cmd>set hlsearch<CR>",     opts)

-- Key:         Shift-3 (# [hashtag])
bindkey("n",    "#",        "#<S-n><Cmd>set hlsearch<CR>",     opts)

--=======================================--
-- === END - Pattern searching - END === --
--=======================================--
--|---------------------------------------|
--=========================================================--
-- === START - Jump navigation (Leap / Pounce) - START === --
--=========================================================--

-- Key:         d
-- Action:      Leap jump forward.
bindkey("n",    "d",    "<Plug>(leap-forward-to)",      opts)

--=====================================================--
-- === END - Jump navigation (Leap / Pounce) - END === --
--=====================================================--
--|----------------------------------------|
--========================================--
-- === START - Marks and tags - START === --
--========================================--

-- => STATE: Good

-- Key:         Shift-m
bindkey("n",    "<S-m>", "m",        opts)
bindkey("o",    "<S-m>", "m",        opts)

-- Key:         `        (backtick)
bindkey("n",    "`",     "`",        opts)
bindkey("o",    "`",     "`",        opts)

-- Key:         `"       (backtick, double quote)
bindkey("n",    '`"',    '`"',       opts)

-- Key:         `[       (backtick, opening square bracket)
bindkey("n",    "`[",    "`[",       opts)

-- Key:         `]       (backtick, closing square bracket)
bindkey("n",    "`]",    "`]",       opts)

-- Key:         `<       (backtick, opening angle bracket)
bindkey("n",    "`<",    "`<",       opts)

-- Key:         `>       (backtick, closing angle bracket)
bindkey("n",    "`>",    "`>",       opts)

-- Key:         `.       (backtick, period)
bindkey("n",    "`.",    "`.",       opts)

-- Key:         :marks
bindkey("n",    "<Leader><Leader><Leader>`marks", ":marks<CR>",   opts)

-- Key:         :jumps
bindkey("n",    "<Leader><Leader><Leader>`jumps", ":jumps<CR>",   opts)

-- Key:         Ctrl-]
bindkey("n",    "<C-]>",     "<C-]>",        opts)

-- Key:         Ctrl-Shift-T
-- NOTE:        This might have an issue. (Because of Ctrl-Shift combo)
-- NOTE:        This might have another issue. (Because of Ctrl-Shift-t being New Tab in Windows Terminal.)
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
bindkey("v",    "<S-w>",    ":Norm W",  { silent = false })

-- Key:         Shift-a
bindkey("n",    "<S-a>",    "<S-a>",    opts)
bindkey("v",    "<S-a>",    ":Norm A",  { silent = false })

-- Key:         ie
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

-- Key:         Ctrl-Shift-k     ( NOTE: Does not work in most terminals. Needs config in terminal. )
-- bindkey("n",         "<C-S-k>",  '"_dd0',            opts,    "Deleting",    "delete_line_three",          "Delete current line. (Normal)")

-- Key:         Ctrl-l
-- In use by Coq-Nvim Autocompletion snippet jump.

-- Key:         Ctrl-h         ( NOTE: This is same as Ctrl - <BS> )
-- bindkey("i",    "<C-h>",    "<C-w>",            opts,    "Deleting",    "del_prew_word_insert_one",   "Delete word before the cursor. (Insert)")

-- Key:         <BS>  (Backspace)
bindkey("n",    "<BS>",     "i<C-h><Esc><Right>",  opts)
bindkey("i",    "<BS>",     "<C-h>",               opts)
bindkey("v",    "<BS>",     '"_d',                 opts)

-- Key:         Ctrl - <BS>  (Backspace)
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
-- === START - Changing and Replacing text (Change/Replace) - START === --
--======================================================================--

-- => STATE: Good

-- Key:         k
bindkey({ "n", "v" , "o" },     "k",        '"_c',      opts)

-- Key:         kn
bindkey({ "n", "o" },           "kn",       '"_cw',     opts)

-- Key:         ko
bindkey({ "n", "o" },           "ko",       '"_cb',     opts)

-- Key:         Shift-k     ( 'Shift-s + Shift-a' does the same thing, so not using this frees up the key for better uses.)
-- bindkey("n",    "<S-k>",    '"_<S-c>',      opts)
-- bindkey("v",    "<S-k>",    '"_<S-c>',      opts)
-- bindkey("o",    "<S-k>",    '"_<S-c>',      opts)

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

-- Key:         Shift-d                 (NOTE: I really like this.)
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
-- Action:      Open URL under cursor. (Might also work for opening files like images.)
bindkey({"n", "o"},    "gx",        "gx",     opts)

-- Key:         Shift-k                 (NOTE: I really like this.)
-- Action:      Globally replace matches of visually selected text in the current file.
bindkey("v",    "<S-k>",            "y:%s/<C-r>0//g<Left><Left>",       { noremap = true, silent = false })

-- Key:         Shift-d                 (NOTE: I really like this.)
-- Action:      Replace text that matches the contents of the yank register, within the current visual selection.
bindkey("v",    "<S-d>",            ":s/\\%V<C-r>0//g<Left><Left>",    { noremap = true, silent = false })

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
-- Action:      Do nothing, wait for next key in chord. (Can enter insert too, if not pressing a chord key.)
bindkey({"n", "o", "v"},    "i",    "i",   opts)

-- Key:         z
-- Action:      Do nothing, wait for next key in chord. (Can jump to a character, if not pressing chord key.)
bindkey({"n", "o", "v"},    "z",    "t",   opts)

-- Key:         zt
-- Action:      Jump to `Character`. (1 Character before)
bindkey({"n", "o", "v"},    "zt",    "t",   opts)

-- Key:         zf
-- Action:      Jump to `Character`. (On top)       (Same as "j")
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

-- NOTE: These probably need to be re-mapped. (Prolly bindings for focus.nvim)

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

-- Key:         Ctrl-Shift-Alt- <Left>        (NOTE: Does not work in all/most terminals without special config.)
-- Action:      Resize split.
bindkey("n",   "<C-S-A-<Left>>",   "5<C-w>>",   opts)

-- Key:         Ctrl-Shift-Alt- <Right>       (NOTE: Does not work in all/most terminals without special config.)
-- Action:      Resize split.
bindkey("n",   "<C-S-A-<Right>>",  "5<C-w><",   opts)

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
bindkey({"n", "v", "o"},    "<S-v>",    "<S-v>",    opts)

-- Key:         Ctrl-v
bindkey({"n", "v", "o"},    "<C-v>",    "<C-v>",    opts)

-- Key:         (v)in
bindkey("v",    "in",        "iw",        opts)

-- Key:         (v)an
bindkey("v",    "an",        "aw",        opts)

-- Key:         Ctrl-Shift-v
-- NOTE:        Not working in Kitty. Would need some fixing, not important key or action though.
bindkey("n",                "<C-S-v>",  "_vg_",     opts)

-- Key:         gv
bindkey({"n", "o"},         "gv",       "gv",       opts)

-- Key:         w
-- Action:      Swap cursor position from end of selection to beginning of selection and vice versa.
bindkey("v",                "w",        "o",        opts)

--================================--
-- === END - Visual Selection === --
--================================--
--|-----------------------------|
--============================================--
-- === START - Moving / Duplicating Lines === --
--============================================--

-- STATE: Good

-- Key:         Alt-h
-- Action:      Move current line down by one.
bindkey("n",    "<A-h>",      "<Cmd>m+1<CR>",               opts)
bindkey("i",    "<A-h>",      "<C-o><Cmd>m+1<CR>",          opts)

-- Key:         Alt-t
-- Action:      Move current line up by one.
bindkey("n",    "<A-t>",      "<Cmd>m-2<CR>",               opts)
bindkey("i",    "<A-t>",      "<C-o><Cmd>m-2<CR>",          opts)

-- Key:         Alt-Shift-h
-- Action:      Copy current line on line below.
bindkey("n",    "<A-S-h>",    "<Cmd>copy.<CR>",             opts)
bindkey("i",    "<A-S-h>",    "<ESC><Cmd>copy.<CR>i",       opts)

-- Key:         Alt-Shift-t
-- Action:      Copy current line on line above.
bindkey("n",    "<A-S-t>",    "<Cmd>copy.-1<CR>",           opts)
bindkey("i",    "<A-S-t>",    "<ESC><Cmd>copy.-1<CR>i",     opts)

-- Key:         Alt-h
-- Action:      Move selected lines down by one.
bindkey("v",    "<A-h>",      ":m '>+1<CR>gv",              opts)

-- Key:         Alt-t
-- Action:      Move selected lines up by one.
bindkey("v",    "<A-t>",      ":m '<-2<CR>gv",              opts)

--============================================--
-- === END - Moving / Duplicating Lines === --
--============================================--
--|----------------------|
--======================--
-- === START - Misc === --
--======================--

-- Key:         TBD
-- Action:      Increment all matches globally on file. (All matches need to be of form '<YankedText>1')
-- bindkey("n", "<C-q>", ':let idx = 0 | g/<C-r>"1/let idx += 1 | s//\\= "<C-r>"" . idx', { noremap = true, silent = false })

-- Key:         l
-- Action:      Enter command mode. (Moved to Legendary, but don't remove yet.)
-- bindkey({"n", "v", "o"},    "l",    ":",   { noremap = true, silent = false, nowait = true })

-- Key:         zt
-- Action:      Toggle fold. (TODO: Find new fold binding and bind all the stuff and make it work with ufo.)
-- bindkey("n",    "zt",   "za",       opts)

-- Key:         Leader-Leader-f-s
bindkey("n",    "<Leader><Leader>fs",  ":set guifont=JetBrainsMono\\ Nerd\\ Font:h:b<Left><Left>", { noremap = true, silent = false })

-- Key:         Ctrl-Shift-d
bindkey("n",    "<C-S-d>", ":UltiSnipsEdit<CR>",  opts)

-- Key:         Ctrl-a
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

-- Key:         Enter           (Insert)
-- Action:      Insert new line, autocomplete, do autopairs things.
-- Note:        Handled by nvim-cmp and nvim-autopairs.

-- Key:         Ctrl-Enter            (NOTE: Does not work in all/most terminals. Works in Kitty though.)
bindkey("n",    "<C-CR>",  "o<Esc>S<Esc>k",      opts)

-- Key:         Shift-Enter           (NOTE: Does not work in all/most terminals.)
-- Action:      Free Key.
-- Modes:       Normal
-- bindkey("n", "<S-CR>", ":free", { noremap = true, silent = false })

-- Key:         xip
bindkey("n",    "xip",    "vip",    opts)

-- Key:         Ctrl-Shift-p        (NOTE: Used by Windows Terminal.)
-- Action:      Free key.
-- Modes:       Normal

-- Key:         Ctrl-i
-- Action:      Unmappable. Hard bound to Tab. (Neovim Bug)
-- Modes:       All (?)
-- bindkey('n', '<C-i>', 'a', opts)

-- Key:         Tab
bindkey("n",    "<Tab>",   ">>",     opts)
bindkey("v",    "<Tab>",   ">gv",    opts)

-- Key:         Shift-Tab
bindkey("n",    "<S-Tab>", "<<",     opts)
bindkey("v",    "<S-Tab>", "<gv",    opts)

-- Key:         m               (Normal)
-- Action:      Start recording macro.
bindkey("n",    "m",        "q",                            { noremap = true, silent = false })

-- Key:         Shift-q         (Normal, Visual)
-- Action:      Play / repeat macro on 'q'.
bindkey("n",    "<S-q>",    "@q",                           { noremap = true, silent = false })
bindkey("v",    "<S-q>",    ":norm @q<CR>",                 { noremap = true, silent = false })

-- Key:         Ctrl-(Shift)-u
-- bindkey("n",    "<C-u>", "", opts, "Unknown", "unknown_001", "Some issue with binding this key. Not sure what it does. (Normal)")
-- bindkey_virtual("n", "<C-S-u>", "", opts, "Unknown", "unknown_001", "Some issue with binding this key. Not sure what it does. (Normal)")

-- Key:         zn
bindkey("n",    "zn",       ":bn<CR>",  opts)

-- Key:         zo
bindkey("n",    "zo",       ":bp<CR>",  opts)

-- Key:         <Leader>bd
bindkey("n",   "<Leader>bd",   ":Sayonara!<CR>",        opts)

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
bindkey("n",   "<A-x>",  ":s/- \\[ \\]/- \\[x\\]/<CR>A [DONE]<ESC>_",  opts)

--====================--
-- === END - Misc === --
--====================--
--|--------------------|
--=================================================================--
-- === START - Plugin Specific Keybindings/Keymappings - START === --
--=================================================================--

-- |> Nvim-Tree                ( NOTE: Nvim-tree control bindings are in its setup function. )
-- Key:         <Leader>fe
bindkey("n",    "<Leader>fe",  ":NvimTreeToggle<CR>",        opts)

-- |> Terminal
-- Key:         <Leader>tf
bindkey("n",    "<Leader>tf", function() require('FTerm').toggle() end, opts)
-- bindkey_virtual("n",   "<Leader>tf", "", {},  "FTerm",    "toggle_fterm_normal",        "Open FTerm. (Normal)")
bindkey("t",    "<Leader>tf", function() vim.api.nvim_input("<C-\\><C-n>") require('FTerm').toggle() end, opts)
-- bindkey_virtual("t",   "<Leader>tf", "", {},  "FTerm",    "toggle_fterm_terminal",      "Close / hide FTerm. (Terminal)")

-- |> Cargo
-- Key:         Leader-r-p
bindkey("n", "<Leader>rp", function() require('FTerm').run({'cargo', 'run'}) end, opts)
-- bindkey_virtual("n", "<Leader>rp", "", {}, "Cargo", "cargo_run", "Run cargo project in FTerm. (Normal)")


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

-- |> Coq-Nvim bindings. (Disabled)

-- bindkey("n", "<Esc>", "pumvisible() ? '<C-e><Esc>' : '<Esc>'", { noremap = true, expr = true, silent = true })
-- bindkey("i", "<Esc>", "pumvisible() ? '<C-e><Esc>' : '<Esc>'", { noremap = true, expr = true, silent = true })
-- bindkey("o", "<Esc>", "pumvisible() ? '<C-e><Esc>' : '<Esc>'", { noremap = true, expr = true, silent = true })

-- bindkey("n", "<BS>", "pumvisible() ? '<C-e><C-h>' : 'i<C-h><Esc><Right>'", { noremap = true, expr = true, silent = true })
-- bindkey("i", "<BS>", "pumvisible() ? '<C-e><C-h>' : '<C-h>'", { noremap = true, expr = true, silent = true })
-- bindkey("o", "<BS>", "pumvisible() ? '<C-e><C-h>' : '<C-h>'", { noremap = true, expr = true, silent = true })

-- bindkey("n", "<CR>", "pumvisible() ? (complete_info().selected == -1 ? '<C-e><CR>' : '<C-y>') : 'k<S-a><CR><Esc>j'", { noremap = true, expr = true, silent = true })
-- bindkey("i", "<CR>", "pumvisible() ? (complete_info().selected == -1 ? '<C-e><CR>' : '<C-y>') : '<CR>'", { noremap = true, expr = true, silent = true })
-- bindkey("o", "<CR>", "pumvisible() ? (complete_info().selected == -1 ? '<C-e><CR>' : '<C-y>') : '<CR>'", { noremap = true, expr = true, silent = true })

-- bindkey("n", "<C-c>", "pumvisible() ? '<C-e><C-c>' : '<C-c>'", { noremap = true, expr = true, silent = true })
-- bindkey("i", "<C-c>", "pumvisible() ? '<C-e><C-c>' : '<C-c>'", { noremap = true, expr = true, silent = true })
-- bindkey("o", "<C-c>", "pumvisible() ? '<C-e><C-c>' : '<C-c>'", { noremap = true, expr = true, silent = true })

-- bindkey("n", "<Tab>", "pumvisible() ? '<C-n>' : '>>'", { noremap = true, expr = true, silent = true })
-- bindkey("i", "<Tab>", "pumvisible() ? '<C-n>' : '<Tab>'", { noremap = true, expr = true, silent = true })
-- bindkey("o", "<Tab>", "pumvisible() ? '<C-n>' : '<Tab>'", { noremap = true, expr = true, silent = true })

-- bindkey("n", "<S-Tab>", "pumvisible() ? '<C-p>' : '<<'", { noremap = true, expr = true, silent = true })
-- bindkey("i", "<S-Tab>", "pumvisible() ? '<C-p>' : '<S-Tab>'", { noremap = true, expr = true, silent = true })
-- bindkey("o", "<S-Tab>", "pumvisible() ? '<C-p>' : '<S-Tab>'", { noremap = true, expr = true, silent = true })

-- |> Autopairs for coq-nvim. (START)

-- local nvim_autopairs = require('nvim-autopairs')
-- nvim_autopairs.setup({ map_bs = false, map_cr = false })

-- _G.MUtils= {}

-- MUtils.CR = function()
--     if vim.fn.pumvisible() ~= 0 then
--         if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
--             return nvim_autopairs.esc('<c-y>')
--         else
--             return nvim_autopairs.esc('<c-e>') .. nvim_autopairs.autopairs_cr()
--         end
--     else
--         return nvim_autopairs.autopairs_cr()
--     end
-- end
-- bindkey('i', '<cr>', 'v:lua.MUtils.CR()', { expr = true, noremap = true })

-- MUtils.BS = function()
--     if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
--         return nvim_autopairs.esc('<c-e>') .. nvim_autopairs.autopairs_bs()
--     else
--         return nvim_autopairs.autopairs_bs()
--     end
-- end
-- bindkey('i', '<bs>', 'v:lua.MUtils.BS()', { expr = true, noremap = true })

-- |> Autopairs for coq-nvim. (END)

-- |> LSP bindings:
-- STATE: Unknown (But recommended in the github wiki.)
bindkey("n", "]e", vim.diagnostic.goto_next, opts)
bindkey("n", "[e", vim.diagnostic.goto_prev, opts)
bindkey("n", "<space>e", vim.diagnostic.open_float, opts)
bindkey("n", "<space>q", vim.diagnostic.setloclist, opts)

-- HERENOW
-- NOTE: Problem: change surrouding is not working.
-- TODO: Uninstall nvim-surround and configure better alternative.

-- |> trouble.nvim bindings:
bindkey("n", "<leader>er", "<cmd>TroubleToggle document_diagnostics<cr>")
bindkey("n", "<leader>el", "<cmd>TroubleToggle loclist<cr>")
bindkey("n", "<leader>eq", "<cmd>TroubleToggle quickfix<cr>")
bindkey("n", "<leader>rl", "<cmd>TroubleToggle lsp_references<cr>")
bindkey("n", "<leader>ds", "<cmd>TroubleToggle lsp_definitions<cr>")

-- |> Some weird fixing... Related to default <C-n> and <C-p>.
-- Note: experimental testing thing.

-- Key:     Ctrl-p      (Insert)
bindkey("i", "<C-p>", "")

-- === START - Legendary Setup - START === --

-- NOTE: This seems extremely promising. Just a big job to move all bindings.

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
        { "go",         "^",            description = "Move cursor to start of line.",          mode = { "n", "v", "o" },   opts = opts },
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

        -- Word / Back                  ( STATE: TODO )
        -- Key:         n               (Normal, Visual, Operator)
        { "n",          "w",            description = "Move cursor one word forward.",                  mode = { "n", "o" },        opts = opts },
        { "n",          "e",            description = "Move cursor one word forward. (Visual Mode)",    mode = { "v" },             opts = opts },
        -- Key:         o               (Normal, Visual, Operator)
        { "o",          "b",            description = "Move cursor one word backward.",                 mode = { "n", "o" },        opts = opts },
        { "o",          "b",            description = "Move cursor one word backward. (Visual Mode)",   mode = { "v" },             opts = opts },
        -- Key:         in              (Normal, Visual, Operator)
        { "in",         "<S-w>",        description = "Move cursor one super-word forward.",                    mode = { "n", "o" },    opts = opts },
        { "in",         "<S-e>",        description = "Move cursor one super-word forward. (Visual Mode)",      mode = { "v" },         opts = opts },
        -- Key:         io              (Normal, Visual, Operator)
        { "io",         "<S-b>",        description = "Move cursor one super-word backward.",           mode = { "n", "v", "o" },   opts = opts },
        -- Key:         Ctrl-n          (Insert)
        { "<C-n>",      "<C-o>w",       description = "Move cursor one word forward. (Insert Mode)",    mode = { "i" },             opts = opts },
        -- Key:         Ctrl-o          (Insert)
        { "<C-o>",      "<C-o>b",       description = "Move cursor one word backward. (Insert Mode)",   mode = { "i" },             opts = opts },

        -- Jumplist                     ( STATE: Okay )
        -- Key:         Shift-o         (Normal)
        { "<S-o>",      "<C-S-o>",      description = "Move to previous location in jumplist.",         mode = { "n" },             opts = opts },
        -- Key:         Shift-n         (Normal)
        { "<S-n>",      "<C-S-i>",      description = "Move to next location in jumplist.",             mode = { "n" },             opts = opts },

        -- View Focus                   ( STATE: Okay )
        -- Key:         zz              (Normal)
        { "zz",         "zz",           description = "Focus view on current line.",                    mode = { "n" },             opts = opts },

        -- Delete                       ( STATE: TODO )

        -- Change                       ( STATE: TODO )

        -- Replace                      ( STATE: TODO )

        -- Visual                       ( STATE: TODO )

        -- Search                       ( STATE: Okay )
        -- Key:         r               (Normal, Visual, Operator)
        { "r",          "/",            description = "Initiate search forwards.",              mode = { "n", "v", "o" },   opts = { noremap = true, silent = false, nowait = true } },
        -- Key:         ?               (Normal, Visual, Operator)
        { "?",          "?",            description = "Initiate search backwards.",             mode = { "n", "v", "o" },   opts = { noremap = true, silent = false, nowait = true } },

        -- Next / Back                  ( STATE: Okay )
        -- Key:         b               (Normal, Visual, Operator)
        { "b",          "n",            description = "Jump to next search match.",             mode = { "n", "v", "o" },   opts = opts },
        -- Key:         Shift-b         (Normal, Visual, Operator)
        { "<S-b>",      "<S-n>",        description = "Jump to previous search match.",         mode = { "n", "v", "o" },   opts = opts },

        -- Copy / Yank                  ( STATE: Okay )
        -- Key:         y               (Normal, Visual, Operator)
        { "y",          "y",            description = "Initiate Yank / Copy.",                  mode = { "n", "o" },        opts = { noremap = true, silent = false, nowait = true } },
        { "y",          "y",            description = "Initiate Yank / Copy in Visual Mode.",   mode = { "v" },             opts = { noremap = true, silent = false, nowait = true } },
        -- Key:         Shift-y         (Normal, Operator)
        { "<S-y>",      "yg_",          description = "Yank / Copy to end of line.",            mode = { "n", "o" },        opts = { noremap = true, silent = false, nowait = true } },
        -- Key:         ygn             (Normal, Operator)
        { "ygn",        "y$",           description = "Yank / Copy to end of line.",            mode = { "n", "o" },        opts = { noremap = true, silent = false, nowait = true } },
        -- Key:         ygo             (Normal, Operator)
        { "ygo",        "y^",           description = "Yank / Copy to start of line.",          mode = { "n", "o" },        opts = { noremap = true, silent = false, nowait = true } },
        -- Key:         yy              (Normal)
        { "yy",         "0vg_y",        description = "Yank / Copy current line. (1)",          mode = { "n", "o" },        opts = { noremap = true, silent = false, nowait = true } },
        -- Key:         yl              (Normal)
        { "yl",         "0vg_y",        description = "Yank / Copy current line. (2)",          mode = { "n", "o" },        opts = { noremap = true, silent = false, nowait = true } },
        -- Key:         ye              (Normal)
        { "ye",         "ye",           description = "Yank / Copy to end of word.",            mode = { "n", "o" },        opts = { noremap = true, silent = false, nowait = true } },

        -- Paste                        ( STATE: Okay )
        -- Key:         p               (Normal, Visual, Operator)
        { "p",          "<S-p>",        description = "Paste from clipboard or registers.",     mode = { "n", "v", "o" },   opts = opts },
        -- Key:         Shift-p         (Normal)
        { "<S-p>",      "o<C-o><S-p><Esc>",     description = "Paste below, from clipboard or registers.",     mode = { "n"  },   opts = opts },
        -- Key:         Ctrl-v          (Insert)
        { "<C-v>",      " <BS><C-o><S-p>",  description = "Paste from clipboard in insert mode.",   mode = { "i" },   opts = opts },

        -- Undo / Redo                  ( STATE: WIP )
        -- Key:         u               (Normal)
        { "u",          "u",            description = "Undo operation.",                        mode = { "n" },             opts = opts },

        -- Key:         Ctrl-Z          (Normal, Insert, Visual)
        { "<C-z>",      "u",            description = "Undo operation. (Normal Mode Alt)",      mode = { "n" },             opts = opts },
        { "<C-z>",      "<Esc>",        description = "Exit Visual Mode.",                      mode = { "v" },             opts = opts },
        { "<C-z>",      "<Esc>u",       description = "Undo operation. (Insert Mode)",          mode = { "i" },             opts = opts },

        -- Key:         Ctrl-r          (Normal, Insert, Operator)
        { "<C-r>",      "<C-r>",        description = "Redo. (Opposite of undo)",               mode = { "n", "i", "o" },   opts = opts },
        -- NOTE: "This key is not bound: <C-r>. (Visual)")

        -- Folding
        -- Key:         zf (Create fold)                        (Normal, Visual, Operator)
        { "zf",         "zf",                                   description = "Create new fold. (Mostly for marker mode)",              mode = {"n", "v", "o"},     opts = opts },
        -- Key:         zh (Open fold)                          (Normal, Operator)
        { "zh",         "zo",                                   description = "Open fold.",                 mode = {"n", "o"},          opts = opts },
        -- Key:         zr (Open fold)                          (Normal, Operator)
        { "zr",         require("ufo").openFoldsExceptKinds,    description = "Reduce (Open) fold.",        mode = {"n", "o"},          opts = opts },
        -- Key:         zR (Open all)                           (Normal, Operator)
        { "z<S-r>",     require("ufo").openAllFolds,            description = "Reduce (Open) all folds.",   mode = {"n", "o"},          opts = opts },
        -- Key:         zc (Close fold)                         (Normal, Operator)
        { "zc",         "zc",                                   description = "Close fold.",                mode = {"n", "o"},          opts = opts },
        -- Key:         zm (Close fold)                         (Normal, Operator)
        { "zm",         require("ufo").closeFoldsWith,          description = "Close fold (More).",         mode = {"n", "o"},          opts = opts },
        -- Key:         zM (Close all)                          (Normal, Operator)
        { "z<S-m>",     require("ufo").closeAllFolds,           description = "Close all folds.",           mode = {"n", "o"},          opts = opts },
        -- Key:         zt (Toggle fold)                        (Normal, Operator)
        { "zt",         "za",                                   description = "Toggle folding.",            mode = {"n", "o"},          opts = opts },

        -- Telescope                    ( STATE: Okay )
        -- Key:         Ctrl-s          (Normal)
        { "<C-s>",                      "<Cmd>Telescope current_buffer_fuzzy_find<CR>",     description = "Telescope: Fuzzy search (find) current buffer.",     mode = "n",     opts = opts },
        -- Key:         Ctrl-Shift-p    (Normal)                                                                           
        { "<C-S-p>",                    "<Cmd>Telescope find_files<CR>",                    description = "Telescope: Fuzzy search (find) files.",              mode = "n",     opts = opts },
        -- Key:         Ctrl-Shift-f    (Normal)
        { "<C-S-f>",                    "<Cmd>Telescope live_grep<CR>",                     description = "Telescope: Live grep.",                              mode = "n",     opts = opts },
        -- Key:         Leader-f-b      (Normal)                                                                     
        { "<Leader>fb",                 "<Cmd>Telescope buffers<CR>",                       description = "Telescope: Fuzzy search (find) open buffers.",       mode = "n",     opts = opts },
        -- Key:         Leader-Tele*    (Normal)
        { "<Leader><S-t>ele<S-h>i",     "<Cmd>Telescope highlights<CR>",                    description = "Telescope: List and search highlight groups.",           mode = "n",     opts = opts },
        { "<Leader><S-t>ele<S-o>",      "<Cmd>Telescope oldfiles<CR>",                      description = "Telescope: List and search previosly visited files.",    mode = "n",     opts = opts },
        { "<Leader><S-t>ele<S-g>",      "<Cmd>Telescope live_grep<CR>",                     description = "Telescope: Live (rip)grep current folder.",              mode = "n",     opts = opts },
        { "<Leader><S-t>ele<S-h>e",     "<Cmd>Telescope help_tags<CR>",                     description = "Telescope: List and search help tags.",                  mode = "n",     opts = opts },
        { "<Leader><S-t>eletreesitter", "<Cmd>Telescope treesitter<CR>",                    description = "Telescope: List and search treesitter symbols.",         mode = "n",     opts = opts },
        -- Key:         Shift-k         (Normal)
        { "<S-k>",                      "<Cmd>Telescope lsp_document_symbols<CR>",          description = "Telescope: List and search lsp document symbols.",       mode = "n",     opts = opts },

        -- File Explorer                ( STATE: TODO )

        -- Wildfire                     ( STATE: Okay )
        -- Key:         Shift-l         (Normal, Visual, Operator)
        { "<S-l>",                      "<Plug>(wildfire-fuel)",                description = "Wildfire: Expand selection.",        mode = { "n", "v", "o" },       opts = opts },
        -- Key:         Ctrl-l          (Visual)
        { "<C-l>",                      "<Plug>(wildfire-water)",               description = "Wildfire: Shrink selection.",        mode = "v",                     opts = opts },
        -- NOTE: While these work semi okay, I am kind of looking for better ones.

        -- Misc Commands                ( STATE: TODO )
        -- Key:         Leader-l-s-p
        { "<Leader>lsp",                "<Cmd>LspStart<CR>",                    description = "Start LSP Server.",                  mode = {"n"},                   opts = opts },

        -- Font Size                    ( STATE: Okay )
        -- Key:         Leader-Leader-f-s
        { "<Leader><Leader>fs",         ":set guifont=JetBrainsMono\\ Nerd\\ Font:h:b<Left><Left>",      description = "Set Font Size to desired value.",                  mode = {"n"},                   opts = { noremap = true, silent = false } },

        -- Buffer Swapping              ( STATE: TODO )
        -- Snippets                     ( STATE: TODO )
        -- Key:         Leader-s-n-i-p-a-l-l
        { "<Leader>snipall",            "<Cmd>LuaSnipsEditAll<CR>",             description = "Edit Global Snippets. (LuaSnip)",    mode = {"n"},                   opts = opts },
        -- Key:         Leader-s-n-i-p-r-u-s-t
        { "<Leader>sniprust",           "<Cmd>LuaSnipsEditRust<CR>",            description = "Edit Rust Snippets. (LuaSnip)",      mode = {"n"},                   opts = opts },

        -- Zen-Mode                     ( STATE: Meh ) (NOTE: `true-zen.nvim` is even worse than `zen-mode.nvim`.)
        -- Key:         <Leader>z
        { "<Leader>z",                  "<Cmd>ZenMode<CR>",                     description = "Toggle Zen-Mode.",                   mode = {"n"},                   opts = opts },

        -- Jukit                        ( STATE: WIP ) (Interactive Python Development Workflow)
        { "<Leader>ipystart",           "<Cmd>call jukit#splits#output_and_history()<CR>",          description = "Open IPython Output and History in split windows.",              mode = {"n"},   opts = opts },
        { "<Leader>ipyclose",           "<Cmd>call jukit#splits#close_output_and_history(1)<CR>",   description = "Close IPython Output and History windows.",                      mode = {"n"},   opts = opts },
        { "<Leader>ipyout",             "<Cmd>call jukit#splits#output()<CR>",                      description = "Open IPython Output in split window.",                           mode = {"n"},   opts = opts },
        { "<Leader>ipyendout",          "<Cmd>call jukit#splits#close_output_split()<CR>",          description = "Close IPython Output split window.",                             mode = {"n"},   opts = opts },
        { "<Leader>ipyhist",            "<Cmd>call jukit#splits#history()<CR>",                     description = "Open IPython History in split window.",                          mode = {"n"},   opts = opts },
        { "<Leader>ipyendhist",         "<Cmd>call jukit#splits#close_history()<CR>",               description = "Close IPython History split window.",                            mode = {"n"},   opts = opts },
        { "<Leader>ipyhistscrolldown",  "<Cmd>call jukit#splits#out_hist_scroll(1)<CR>",            description = "Scroll IPython `Output History` down .",                         mode = {"n"},   opts = opts },
        { "<Leader>ipyshowcelloutput",  "<Cmd>call jukit#splits#show_last_cell_output(1)<CR>",      description = "Show IPython cell output in `Output History` window.",           mode = {"n"},   opts = opts },
        { "<Leader>ipyexecuteall",      "<Cmd>call jukit#send#all()<CR>",                           description = "Execute all IPython cells and show output in IPython window.",   mode = {"n"},   opts = opts },
    },

    commands = {},
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

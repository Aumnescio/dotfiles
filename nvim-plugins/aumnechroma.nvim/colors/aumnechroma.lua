-- === - AumneChroma.nvim Theme - ===

-- === - START - Description - ===
--
-- Author: Aumnescio
--
-- Dark and relatively high contrast truecolor theme.
-- Not just 8 or 16 colors. (Current color count: 68) (And I feel like I need more.)
-- All colors handpicked. No color processing. No generated colors.
-- Written in Lua, as fast as possible. (Source is of "compiled" form.)
-- Easy to configure, or fork. (2 simple raw files.)
--
-- === - END - Description - ===


-- === - START - Related Help Pages - ===
--
-- -> ':help group-name'            ( Base vim highlight groups names. )
-- -> ':help nvim_set_hl'           ( Function for changing highlights. )
-- -> ':help highlight-groups'      ( Builtin highlight groups. )
--
-- Other highlight group tools:
-- -> 'Telescope highlights'                ( Requires Telescope.nvim )     ( Can fuzzy search highlight group names, also shows the color. )
-- -> ':so $VIMRUNTIME/syntax/hitest.vim'   ( Built in, but takes a while. Very large list of highlight groups. )
--
-- === - END - Related Help Pages - ===


-- === - START - Semantics of Colors - ===
--
--  NOTE: The higher a token-type is in a color category, the purer it is.
--
--  - Blacks:
--      - Background        (Tinted towards Blues)
--
--  - Whites:
--      - Normal Text
--      - Titles
--      - Keywords
--      - Variables
--      - Constants
--      - Enums / Enumerations
--
--  - Blues:
--      - Methods
--      - Fields
--      - Properties
--      - Attributes
--      - Repeat:
--          - `for`
--          - `in`
--      - HTML-Links
--      - References
--
--  - Cyans:
--      - Delimiters
--
--  - Purples:
--      - Types
--      - Modules
--      - Namespaces
--      - Includes
--      - Structures / Structs
--      - Classes
--      - Comments
--
--  - Reds:
--      - Errors
--      - Operators:
--          - `+`, `-`, `*`, `**`, `/`, `//`, `=`, `==`, `===`, `+=`, `-+`, `*=`, `/=`, `%`, `&`, etc...
--      - Control Flow:
--          - `if`
--          - `elseif`
--          - `else`
--          - `match`
--      - Keywords:
--          - `return`
--          - `break`
--          - `continue`
--          - `as`
--
--  - Oranges:
--      - Specials
--      - Functions
--      - Parameters
--      - Warnings
--      - Numbers
--      - Floats
--      - Booleans
--
--  - Yellows:
--      - Characters
--      - Keywords:
--          - `fn`
--          - `let`
--
-- - Greens:
--     - Strings
--     - Checked Todo
--
-- === - END - Semantics of Colors - ===


-- === - START - Configured Plugins - ===
--
-- => lazy.nvim
-- => Packer.nvim
-- => nvim-treesitter
-- => nvim-ts-rainbow
-- => Telescope.nvim
-- => Nvim-cmp
-- => Lspkind.nvim
-- => Heirline.nvim
-- => Noice.nvim
-- => Leap.nvim
-- => Trouble.nvim
-- => hlargs.nvim
-- => nvim-ufo
-- => nvim-notify
-- => Rust-Tools.nvim   (Rustacean.nvim)
-- => polyglot.vim      (or just plain filetypes)
--  - Rust
--  - Lua
--  - Fish
--  - Markdown
-- => vim-rust-syntax-ext
-- => git-signs.nvim
-- => git-blame.nvim
-- => hlchunk.nvim
-- => fidget.nvim
-- => scrollbar.nvim
-- => scrollview.nvim
-- => sentiment.nvim    (MatchParen)
-- => wf.nvim
-- => rainbow_csv.vim
--
-- TODO: Plugins to config...
-- => FTerm.nvim
-- => Legendary.nvim
--
-- === - END - Configured Plugins - ===


-- === |> - Helper vars - <| ===
local set_hl = vim.api.nvim_set_hl  -- Like vimscript 'highlight / hi'.
local ns_id = 0                     -- Global highlight. (Namespace)

-- === |> - Core Colors (Theme) - <| ===
local colors = require("aumnechroma.colors")

-- === |> - Core Groups (Link Groups) - <| ===

-- `Normal` needs to be defined first.  (Important) [Otherwise background color will break.]
-- => `"NONE"` matches terminal background color. It could be set to something else too, but `"NONE"` works really consistently.
set_hl(ns_id, "Normal",                 { fg = colors.fg_white_00_icy_landscape,        bg = "NONE" })


-- #######################################
-- ##           - Aum Groups -          ##
-- #######################################

-- Background
set_hl(ns_id, "AumBackgroundPri",       { bg = colors.bg_01_darkcrust })
set_hl(ns_id, "AumBackgroundSec",       { bg = colors.bg_02_remnant })
set_hl(ns_id, "AumBackgroundTer",       { bg = colors.bg_03_night })
set_hl(ns_id, "AumBackgroundQua",       { bg = colors.bg_04_monolith })
set_hl(ns_id, "AumBackgroundQui",       { bg = colors.bg_05_tristesse })
set_hl(ns_id, "AumBackgroundSen",       { bg = colors.bg_06_dusk })
set_hl(ns_id, "AumBackgroundSept",      { bg = colors.bg_07_dark_knight })
set_hl(ns_id, "AumBackgroundHL",        { fg = colors.fg_purple_04_baby_purple,         bg = colors.bg_05_tristesse,    bold = true })

-- None / Whitespace
set_hl(ns_id, "AumWhitespace",          { fg = colors.bg_08_ghost,                      bg = "NONE" })
set_hl(ns_id, "AumTrailingWhitespace",  { fg = colors.fg_red_11_cichlid,                bg = "NONE",    bold = true })
set_hl(ns_id, "AumNone",                { fg = colors.fg_white_00_icy_landscape,        bg = "NONE" })
set_hl(ns_id, "AumIgnore",              { fg = "NONE",                                  bg = "NONE" })

-- Normal'ish text
set_hl(ns_id, "AumNormalPri",           { fg = colors.fg_white_00_icy_landscape,        bg = "NONE" })
set_hl(ns_id, "AumNormalSec",           { fg = colors.fg_white_01_seashell,             bg = "NONE" })
set_hl(ns_id, "AumNormalTer",           { fg = colors.fg_white_02_island_hopping,       bg = "NONE" })
set_hl(ns_id, "AumNormalQua",           { fg = colors.fg_white_03_warm_winter,          bg = "NONE",    bold = true })
set_hl(ns_id, "AumNormalQui",           { fg = colors.fg_white_04_azure,                bg = "NONE",    bold = true })
set_hl(ns_id, "AumNormalSen",           { fg = colors.fg_white_05_bubbles,              bg = "NONE",    bold = true })
set_hl(ns_id, "AumTitlePri",            { fg = colors.fg_white_06_calm_iridescence,     bg = "NONE",    bold = true })
set_hl(ns_id, "AumTitleSec",            { fg = colors.fg_white_07_hint_of_blue,         bg = "NONE",    bold = true })
set_hl(ns_id, "AumTitleTer",            { fg = colors.fg_white_08_sugar_crystal,        bg = "NONE",    bold = true })
set_hl(ns_id, "AumTitleQua",            { fg = colors.fg_white_09_romantic_cruiser,     bg = "NONE",    bold = true })
set_hl(ns_id, "AumTitleQui",            { fg = colors.fg_white_10_fairy_wings,          bg = "NONE",    bold = true })
set_hl(ns_id, "AumTitleSen",            { fg = colors.fg_white_11_icy_plains,           bg = "NONE",    bold = true })
set_hl(ns_id, "AumHeading1",            { fg = colors.special_04_beekeeper,             bg = "NONE",    bold = true })
set_hl(ns_id, "AumHeading2",            { fg = colors.special_05_photon_barrier,        bg = "NONE",    bold = true })
set_hl(ns_id, "AumHeading3",            { fg = colors.special_06_illicit_purple,        bg = "NONE",    bold = true })
set_hl(ns_id, "AumHeading4",            { fg = colors.special_07_tanzine,               bg = "NONE",    bold = true })
set_hl(ns_id, "AumHeading5",            { fg = colors.special_08_dollar_bill,           bg = "NONE",    bold = true })
set_hl(ns_id, "AumHeading6",            { fg = colors.special_09_orange_essential,      bg = "NONE",    bold = true })
set_hl(ns_id, "AumNormalDimmed1",       { fg = colors.fg_white_13_icy_landscape_dim_1,  bg = "NONE" })
set_hl(ns_id, "AumNormalDimmed2",       { fg = colors.fg_white_14_icy_landscape_dim_2,  bg = "NONE" })
set_hl(ns_id, "AumNormalDimmed3",       { fg = colors.fg_white_15_icy_landscape_dim_3,  bg = "NONE" })
set_hl(ns_id, "AumNormalDimmed4",       { fg = colors.fg_white_16_icy_landscape_dim_4,  bg = "NONE" })
set_hl(ns_id, "AumNormalDimmed5",       { fg = colors.fg_white_17_icy_landscape_dim_5,  bg = "NONE" })

-- TODO / DONE / NOTE / FIXME           ( TODO / WIP )
set_hl(ns_id, "AumNote",                { fg = colors.fg_yellow_08_silk_sails,          bg = "NONE",    italic = true,  bold = true })
set_hl(ns_id, "AumTodo",                { fg = colors.fg_orange_05_coral_sand,          bg = "NONE",    italic = true,  bold = true })
set_hl(ns_id, "AumFixMe",               { fg = colors.fg_yellow_02_egg_yolk,            bg = "NONE",    italic = true,  bold = true })
set_hl(ns_id, "AumDone",                { fg = colors.fg_green_09_synthetic_mint,       bg = "NONE",    italic = true,  bold = true })

-- Cursor
set_hl(ns_id, "AumCursor",              { fg = colors.bg_03_night,                      bg = colors.fg_yellow_01_apricot_fool })
-- set_hl(ns_id, "AumCursorLine",          { bg = "#000000" })
set_hl(ns_id, "AumCursorLine",          { bg = "#0A090F" })
set_hl(ns_id, "AumCursorColumn",        { link = "AumCursorLine" })

-- Comments and Special things:
set_hl(ns_id, "AumComment",             { fg = colors.special_01_dahlia_purple,         bg = "NONE",    italic = true })
set_hl(ns_id, "AumCommentSpecial",      { fg = colors.special_02_coronation_blue,       bg = "NONE",    italic = true,  bold = true })
set_hl(ns_id, "AumConceal",             { fg = colors.special_03_secretive,             bg = "NONE" })
set_hl(ns_id, "AumLineNumberActive",    { fg = colors.special_02_coronation_blue,       bg = "NONE",    italic = true  })
set_hl(ns_id, "AumLineNumberInactive",  { fg = colors.special_03_secretive,             bg = "NONE" })
set_hl(ns_id, "AumSpecial",             { fg = colors.fg_orange_07_optimist_gold,       bg = "NONE",    italic = true  })
set_hl(ns_id, "AumSelf",                { fg = colors.fg_orange_15_melon_red,           bg = "NONE" })
set_hl(ns_id, "AumGitBlame",            { fg = colors.bg_08_ghost,                      bg = "NONE",    italic = true })
set_hl(ns_id, "AumDirectory",           { fg = colors.fg_blue_20_hera_blue,             bg = "NONE", })

-- Selection / Visual
set_hl(ns_id, "AumVisual",              { fg = colors.fg_red_11_cichlid,                bg = colors.bg_03_night,    bold = true,    italic = true,      underline = true })
set_hl(ns_id, "AumYankHighlight",       { fg = colors.fg_orange_18_lightning_yellow,    bg = colors.bg_03_night,    bold = true,    underline = true })
set_hl(ns_id, "AumCursorwordCurrent",   { fg = colors.fg_white_13_icy_landscape_dim_1,  bg = colors.bg_08_ghost })
set_hl(ns_id, "AumCursorwordMatches",   { fg = colors.fg_white_13_icy_landscape_dim_1,  bg = colors.bg_08_ghost })

-- Search
set_hl(ns_id, "AumSearch",              { fg = colors.bg_03_night,                      bg = colors.fg_orange_11_amber,         bold = true })
set_hl(ns_id, "AumCurSearch",           { fg = colors.bg_02_remnant,                    bg = colors.fg_red_15_pure_hedonist,    bold = true,    italic = true })
set_hl(ns_id, "AumIncSearch",           { fg = colors.bg_01_darkcrust,                  bg = colors.fg_orange_01_heatstroke,    bold = true,    italic = true })
set_hl(ns_id, "AumMatch",               { fg = colors.fg_orange_11_amber,  bg = "NONE", sp = colors.bg_08_ghost,                bold = true,    underline = true })

-- User Interface
set_hl(ns_id, "AumPmenu",               { link = "AumNormalTer" })
set_hl(ns_id, "AumBorder",              { fg = colors.fg_purple_12_dream_vapor,         bg = "NONE" })
set_hl(ns_id, "AumBorderFocused",       { fg = colors.fg_purple_17_venetian_night,      bg = "NONE" })

-- Diagnostics
set_hl(ns_id, "AumError",               { fg = colors.fg_red_00_cardinal,               bg = "NONE" })
set_hl(ns_id, "AumWarning",             { fg = colors.fg_orange_00_ryza_dust,           bg = "NONE" })
set_hl(ns_id, "AumInfo",                { link = "AumNormalSec" })
set_hl(ns_id, "AumHint",                { fg = colors.fg_white_04_azure })
set_hl(ns_id, "AumOk",                  { link = "AumNormalPri" })

-- Primitive related:
set_hl(ns_id, "AumBoolean",             { fg = colors.fg_orange_06_caramel_ice,         bg = "NONE",        bold = true })
set_hl(ns_id, "AumNumber",              { fg = colors.fg_orange_17_just_peachy,         bg = "NONE" })
set_hl(ns_id, "AumFloat",               { fg = colors.fg_orange_16_kumquat,             bg = "NONE" })
set_hl(ns_id, "AumString",              { fg = colors.fg_green_07_iguana_green,         bg = "NONE" })      -- STATE: Good
set_hl(ns_id, "AumStringAlt",           { fg = colors.fg_green_09_synthetic_mint,       bg = "NONE" })
set_hl(ns_id, "AumCharacter",           { fg = colors.fg_yellow_09_elfin,               bg = "NONE" })
set_hl(ns_id, "AumCharacterSpecial",    { fg = colors.fg_yellow_10_viameter,            bg = "NONE" })
-- Identifier / Variable related:
set_hl(ns_id, "AumIdentifier",          { fg = colors.fg_white_11_icy_plains,           bg = "NONE" })
set_hl(ns_id, "AumIdentifierDef",       { fg = colors.fg_white_12_cold_illusion,        bg = "NONE" })
set_hl(ns_id, "AumUserIdent",           { fg = colors.fg_blue_18_dried_lilac,           bg = "NONE" })
set_hl(ns_id, "AumUnusedUserIdent",     { fg = colors.fg_blue_19_carriage_ride,         bg = "NONE" })
set_hl(ns_id, "AumVariable",            { link = "AumNormalPri" })
set_hl(ns_id, "AumVariableBuiltin",     { link = "AumNormalTer" })
set_hl(ns_id, "AumVariableGlobal",      { link = "AumNormalQua" })
set_hl(ns_id, "AumConstant",            { link = "AumTitlePri" })
set_hl(ns_id, "AumConstantBuiltin",     { link = "AumTitleQui" })
set_hl(ns_id, "AumConstantMacro",       { link = "AumTitleSen" })
set_hl(ns_id, "AumField",               { fg = colors.fg_blue_00_aero,                  bg = "NONE" })
set_hl(ns_id, "AumProperty",            { fg = colors.fg_blue_01_blue_genie,            bg = "NONE" })
set_hl(ns_id, "AumAttribute",           { fg = colors.fg_blue_02_picnic_sky,            bg = "NONE" })
-- Statements:
set_hl(ns_id, "AumStatement",           { fg = colors.fg_blue_03_pool_tiles,            bg = "NONE",    bold = true })      -- STATE: Okay
-- Repeat:
set_hl(ns_id, "AumRepeat",              { fg = colors.fg_blue_04_moonstone,             bg = "NONE",    italic = true, bold = true })
set_hl(ns_id, "AumFor",                 { link = "AumRepeat" })
set_hl(ns_id, "AumIn",                  { fg = colors.fg_blue_04_moonstone,             bg = "NONE",    italic = true, bold = false })
-- Methods:
set_hl(ns_id, "AumMethod",              { fg = colors.fg_blue_06_kindred,               bg = "NONE",    bold = true  })
set_hl(ns_id, "AumMethodDef",           { fg = colors.fg_blue_07_rockman,               bg = "NONE",    bold = true  })
set_hl(ns_id, "AumMethodCall",          { fg = colors.fg_blue_08_widowmaker,            bg = "NONE",    italic = true, bold = true })
set_hl(ns_id, "AumUserMethod",          { fg = colors.fg_blue_09_periwinkle,            bg = "NONE",    italic = true, bold = true })   -- STATE: Good
set_hl(ns_id, "AumLibraryMethod",       { fg = colors.fg_blue_10_blue_sand,             bg = "NONE",    italic = true, bold = true })
-- Reference / Link / Underlined
set_hl(ns_id, "AumReference",           { fg = colors.fg_blue_11_celeste,               bg = "NONE" })
set_hl(ns_id, "AumUnderlined",          { fg = colors.fg_blue_12_fennel_flower,         bg = "NONE",    bold = true,    italic = true,  underline = true })
-- Functions:
set_hl(ns_id, "AumFunction",            { fg = colors.fg_orange_02_candyman,            bg = "NONE",    bold = true })
set_hl(ns_id, "AumFunctionCall",        { fg = colors.fg_orange_04_peach_cobbler,       bg = "NONE",    bold = true,    italic = true })    -- STATE: Good
set_hl(ns_id, "AumFunctionDef",         { fg = colors.fg_orange_09_celebration,         bg = "NONE",    bold = true })
set_hl(ns_id, "AumFunctionMacro",       { fg = colors.fg_orange_10_golden_apricot,      bg = "NONE" })
set_hl(ns_id, "AumFunctionBuiltin",     { fg = colors.fg_orange_13_apocalyptic_orange,  bg = "NONE" })
set_hl(ns_id, "AumLibraryFunction",     { fg = colors.fg_orange_14_papaya_punch,        bg = "NONE",    bold = true })          -- STATE: Good
-- Parameters:
set_hl(ns_id, "AumParameter",           { fg = colors.fg_orange_08_xanthous,            bg = "NONE" })
-- Operators:
set_hl(ns_id, "AumOperator",            { fg = colors.fg_red_01_infrared,               bg = "NONE" })                          -- STATE: Good
-- Control flow:
set_hl(ns_id, "AumConditional",         { fg = colors.fg_purple_22_lical_geode,         bg = "NONE",    italic = true, bold = true })
set_hl(ns_id, "AumIf",                  { fg = colors.fg_purple_22_lical_geode,         bg = "NONE",    italic = true, bold = true })
set_hl(ns_id, "AumElseIf",              { fg = colors.fg_purple_22_lical_geode,         bg = "NONE",    italic = true, bold = true })
set_hl(ns_id, "AumElse",                { fg = colors.fg_purple_22_lical_geode,         bg = "NONE",    italic = true, bold = true })
set_hl(ns_id, "AumLabel",               { fg = colors.special_07_tanzine,               bg = "NONE",    bold = true })
-- Keywords:
set_hl(ns_id, "AumKeyword",             { fg = colors.fg_orange_19_feather_plume,       bg = "NONE",    italic = true,  bold = true })
set_hl(ns_id, "AumKeywordLet",          { fg = colors.fg_orange_20_peach_orange,        bg = "NONE",    italic = true,  bold = true })
set_hl(ns_id, "AumKeywordConst",        { fg = colors.fg_white_01_seashell,             bg = "NONE",    italic = true,  bold = true })
set_hl(ns_id, "AumKeywordStorage",      { fg = colors.fg_white_01_seashell,             bg = "NONE",    italic = true,  bold = true })
set_hl(ns_id, "AumKeywordMut",          { fg = colors.fg_yellow_12_rite_of_spring,      bg = "NONE",    italic = true,  bold = true })
set_hl(ns_id, "AumKeywordOperator",     { fg = colors.fg_red_02_festive_fennec,         bg = "NONE",    italic = true,  bold = true })
set_hl(ns_id, "AumKeywordBreak",        { fg = colors.fg_red_08_cyclamen,               bg = "NONE",    italic = true,  bold = true })
set_hl(ns_id, "AumKeywordContinue",     { fg = colors.fg_red_08_cyclamen,               bg = "NONE",    italic = true,  bold = true })
set_hl(ns_id, "AumKeywordReturn",       { fg = colors.fg_red_08_cyclamen,               bg = "NONE",    italic = true,  bold = true })
set_hl(ns_id, "AumKeywordConditional",  { fg = colors.fg_purple_22_lical_geode,         bg = "NONE",    italic = true,  bold = true })
set_hl(ns_id, "AumKeywordAs",           { fg = colors.fg_red_09_fuchsia_blush,          bg = "NONE",    italic = true,  bold = false })
set_hl(ns_id, "AumKeywordSelf",         { fg = colors.fg_purple_21_forgotten_purple,    bg = "NONE",    italic = true,  bold = true })
set_hl(ns_id, "AumKeywordFunction",     { fg = colors.fg_purple_23_whisper_lilac,       bg = "NONE",    italic = true,  bold = true })
set_hl(ns_id, "AumKeywordUnsafe",       { fg = colors.fg_red_13_detailed_devil,         bg = "NONE",    italic = false, bold = true })
set_hl(ns_id, "AumKeywordAsync",        { fg = colors.fg_orange_12_chocobo_feather,     bg = "NONE",    italic = true,  bold = true })
set_hl(ns_id, "AumKeywordCoroutine",    { fg = colors.fg_orange_12_chocobo_feather,     bg = "NONE",    italic = true,  bold = true })
set_hl(ns_id, "AumKeywordType",         { fg = colors.fg_purple_15_lenurple,            bg = "NONE",    italic = true,  bold = true })
set_hl(ns_id, "AumKeywordModifier",     { fg = colors.fg_yellow_01_apricot_fool,        bg = "NONE",    italic = false, bold = true })
-- Exceptions:
set_hl(ns_id, "AumException",           { fg = colors.fg_red_10_candy_bar,              bg = "NONE" })
-- Namespaces / PreProcs / PreCondits / Includes / Defines / Macros:
set_hl(ns_id, "AumPreproc",             { fg = colors.fg_purple_01_myrtle_flower,       bg = "NONE" })                          -- STATE: Quite good
set_hl(ns_id, "AumPreCondit",           { fg = colors.fg_purple_02_purple_sand,         bg = "NONE" })
set_hl(ns_id, "AumNamespace",           { fg = colors.fg_purple_03_lavender_cream,      bg = "NONE" })
set_hl(ns_id, "AumModule",              { fg = colors.fg_purple_04_baby_purple,         bg = "NONE" })
set_hl(ns_id, "AumInclude",             { fg = colors.fg_purple_05_lavender_dreamer,    bg = "NONE" })
set_hl(ns_id, "AumDefine",              { fg = colors.fg_purple_06_iridescent_purple,   bg = "NONE" })
set_hl(ns_id, "AumMacro",               { fg = colors.fg_purple_25_lighter_purple,      bg = "NONE",    bold = true })
set_hl(ns_id, "AumUserMacro",           { link = "AumMacro" })
set_hl(ns_id, "AumLibraryMacro",        { link = "AumMacro" })
-- Types:
set_hl(ns_id, "AumType",                { fg = colors.fg_purple_12_dream_vapor,         bg = "NONE",    bold = true })  -- STATE: This color is very good.
set_hl(ns_id, "AumUserType",            { fg = colors.fg_purple_12_dream_vapor,         bg = "NONE",    bold = true })
set_hl(ns_id, "AumLibraryType",         { fg = colors.fg_purple_12_dream_vapor,         bg = "NONE",    bold = true })
set_hl(ns_id, "AumForeignType",         { fg = colors.fg_purple_12_dream_vapor,         bg = "NONE",    bold = true })
set_hl(ns_id, "AumTypeBuiltin",         { fg = colors.fg_purple_17_venetian_night,      bg = "NONE",    bold = true })
set_hl(ns_id, "AumTypeDef",             { fg = colors.fg_purple_12_dream_vapor,         bg = "NONE",    bold = true })
set_hl(ns_id, "AumTypeAlias",           { fg = colors.fg_purple_12_dream_vapor,         bg = "NONE",    bold = true })
set_hl(ns_id, "AumTypeQualifier",       { fg = colors.fg_purple_08_lovecloud,           bg = "NONE",    bold = true })
-- Structures / Classes / Enums:
set_hl(ns_id, "AumStructure",           { fg = colors.fg_purple_15_lenurple,            bg = "NONE",    bold = true })
set_hl(ns_id, "AumClass",               { fg = colors.fg_purple_16_violet_gems,         bg = "NONE",    bold = true })
set_hl(ns_id, "AumEnum",                { link = "AumTitleSec" })
set_hl(ns_id, "AumEnumMember",          { link = "AumTitleTer" })
-- StorageClasses:
set_hl(ns_id, "AumStorageClass",            { link = "AumTypeBuiltin" })    -- STATE: TODO
set_hl(ns_id, "AumStorageClassLifetime",    { link = "AumTypeBuiltin" })    -- STATE: TODO
-- Decorators:
set_hl(ns_id, "AumDecorator",           { link = "AumTitleQua" })
-- Tags
set_hl(ns_id, "AumTagPri",              { link = "AumField" })          -- STATE: TODO: Test
set_hl(ns_id, "AumTagSec",              { link = "AumProperty" })       -- STATE: TODO: Test
set_hl(ns_id, "AumTagTer",              { link = "AumProperty" })       -- STATE: TODO: Test
set_hl(ns_id, "AumTagAttribute",        { link = "AumAttribute" })      -- STATE: TODO: Test
-- Punctuation and Delimiters
set_hl(ns_id, "AumPunctuationPri",      { fg = colors.fg_cyan_01_verdigris,             bg = "NONE" })      -- STATE: Good
set_hl(ns_id, "AumPunctuationSec",      { fg = colors.fg_cyan_02_windswept,             bg = "NONE", bold = true })      -- STATE: Good
set_hl(ns_id, "AumPunctuationTer",      { fg = colors.fg_cyan_03_shimmering_expanse,    bg = "NONE" })      -- STATE: Good
set_hl(ns_id, "AumDelimiter",           { fg = colors.fg_cyan_04_thousand_sons,         bg = "NONE", bold = true })     -- STATE: Good
set_hl(ns_id, "AumParen",               { fg = colors.fg_cyan_05_ocean_eyes,            bg = "NONE" })      -- STATE: TODO: Test
set_hl(ns_id, "AumParens",              { fg = colors.fg_cyan_06_blue_bikini,           bg = "NONE" })      -- STATE: TODO: Test
set_hl(ns_id, "AumBracket",             { fg = colors.fg_cyan_07_libra_morpho,          bg = "NONE" })      -- STATE: TODO: Test
set_hl(ns_id, "AumBrackets",            { fg = colors.fg_cyan_08_ice_effect,            bg = "NONE" })      -- STATE: TODO: Test
set_hl(ns_id, "AumBrace",               { fg = colors.fg_cyan_09_lucea,                 bg = "NONE" })      -- STATE: TODO: Test
set_hl(ns_id, "AumBraces",              { fg = colors.fg_cyan_10_lazy_day,              bg = "NONE" })      -- STATE: TODO: Test
set_hl(ns_id, "AumRainbowBracket1",     { link = "AumPunctuationPri" })
set_hl(ns_id, "AumRainbowBracket2",     { link = "AumPunctuationSec" })
set_hl(ns_id, "AumRainbowBracket3",     { link = "AumPunctuationTer" })
set_hl(ns_id, "AumRainbowBracket4",     { link = "AumDelimiter" })
set_hl(ns_id, "AumRainbowBracket5",     { link = "AumParens" })
set_hl(ns_id, "AumRainbowBracket6",     { link = "AumBrackets" })
set_hl(ns_id, "AumRainbowBracket7",     { link = "AumBracess" })
-- Debug
set_hl(ns_id, "AumDebug",               { fg = colors.fg_yellow_07_neon_light,          bg = "NONE" })

-- #####################################################
-- ##           - Builtin Highlight Groups -          ##
-- #####################################################

-- Cursor
-- NOTE: Can get overwritten by Terminal cursor settings.
set_hl(ns_id, "Cursor",                 { link = "AumCursor" })
set_hl(ns_id, "lCursor",                { link = "AumCursor" })
set_hl(ns_id, "CursorIM",               { link = "AumCursor" })
set_hl(ns_id, "TermCursor",             { link = "AumCursor" })
set_hl(ns_id, "CursorLine",             { link = "AumCursorLine" })
set_hl(ns_id, "CursorColumn",           { link = "AumCursorColumn" })

-- Normal in non-current window:
-- NOTE: Should be same `bg` color as `Normal`, otherwise it looks really bad.
set_hl(ns_id, "NormalNC",               { link = "AumNormalPri" })
-- Normal in floating window:
set_hl(ns_id, "NormalFloat",            { link = "AumNormalPri" })

-- Window: Vertical Split Separator
set_hl(ns_id, "WinBar",                 { fg = colors.fg_red_07_coralette,      bg = "NONE", bold = true })         -- TODO: What and where + config color
set_hl(ns_id, "WinBarNC",               { fg = colors.fg_red_07_coralette,      bg = "NONE", bold = false })        -- TODO: What and where + config color
set_hl(ns_id, "WinSeparator",           { fg = colors.bg_10_prophet_violet,     bg = "NONE" })

-- Floating Windows:
set_hl(ns_id, "FloatBorder",            { link = "AumBorder" })
set_hl(ns_id, "FloatShadow",            { link = "AumNone" })
set_hl(ns_id, "FloatShadowThrough",     { link = "AumNone" })
set_hl(ns_id, "LspInfoBorder",          { link = "AumBorder" })     -- The `:LspInfo` command window.

-- Hidden-like
set_hl(ns_id, "Whitespace",             { link = "AumWhitespace" })
set_hl(ns_id, "NonText",                { link = "AumWhitespace" })
set_hl(ns_id, "Conceal",                { link = "AumConceal" })
set_hl(ns_id, "@conceal",               { link = "AumConceal" })
set_hl(ns_id, "EndOfBuffer",            { link = "AumWhitespace" })
set_hl(ns_id, "Noise",                  { link = "AumPunctuationPri" })

-- Columns
set_hl(ns_id, "SignColumn",             { link = "AumNormalPri" })
set_hl(ns_id, "ColorColumn",            { link = "AumNormalSec" })

-- Search
set_hl(ns_id, "Search",                 { link = "AumSearch" })
set_hl(ns_id, "CurSearch",              { link = "AumCurSearch" })
set_hl(ns_id, "IncSearch",              { link = "AumIncSearch" })

-- Diff
set_hl(ns_id, "DiffText",               { link = "AumNormalTer" })
set_hl(ns_id, "DiffAdd",                { fg = colors.fg_green_01_seductive_thorns })
set_hl(ns_id, "DiffChange",             { fg = colors.fg_blue_02_picnic_sky })
set_hl(ns_id, "DiffDelete",             { fg = colors.fg_red_05_emberglow })

-- Status/Tab-Line      ( STATE: Good | Statusline and Tabline background colors disabled. )
-- NOTE: StatusLineNC should be different from StatusLine
set_hl(ns_id, "StatusLine",             { link = "AumNormalPri" })
set_hl(ns_id, "StatusLineNC",           { fg = colors.bg_05_tristesse,      bg = colors.bg_05_tristesse })
set_hl(ns_id, "TabLine",                { link = "AumNormalPri" })
set_hl(ns_id, "TabLineFill",            { link = "AumNormalPri" })

-- Misc
set_hl(ns_id, "MatchParen",             { fg = colors.fg_purple_26_omagenta, bg = "NONE", bold = true })    -- ( `sentiment.nvim` uses this for paren-pair coloring. )
set_hl(ns_id, "SpecialKey",             { link = "AumSpecial" })
set_hl(ns_id, "Directory",              { link = "AumDirectory" })      -- TODO: Create Aum-group.

-- Text
set_hl(ns_id, "@text",                      { link = "AumNormalPri" })
set_hl(ns_id, "@markup",                    { link = "AumNormalPri" })
set_hl(ns_id, "@markup.strong",             { fg = colors.fg_white_04_azure,                bold = true })
set_hl(ns_id, "@markup.italic",             { fg = colors.fg_white_04_azure,                italic = true })
set_hl(ns_id, "@markup.strikethrough",      { fg = colors.fg_white_07_hint_of_blue,         strikethrough = true })
set_hl(ns_id, "@markup.underline",          { fg = colors.fg_white_06_calm_iridescence,     underline = true })
set_hl(ns_id, "@markup.emphasis",           { fg = colors.fg_white_05_bubbles,              italic = true })            -- This might not exist anymore.
set_hl(ns_id, "@markup.heading",            { link = "AumTitlePri" })
set_hl(ns_id, "@markup.heading.1",          { link = "AumHeading1" })
set_hl(ns_id, "@markup.heading.2",          { link = "AumHeading2" })
set_hl(ns_id, "@markup.heading.3",          { link = "AumHeading3" })
set_hl(ns_id, "@markup.heading.4",          { link = "AumHeading4" })
set_hl(ns_id, "@markup.heading.5",          { link = "AumHeading5" })
set_hl(ns_id, "@markup.heading.6",          { link = "AumHeading6" })
set_hl(ns_id, "@markup.quote",              { link = "AumTypeBuiltin" })
set_hl(ns_id, "@markup.math",               { link = "AumInclude" })
set_hl(ns_id, "@markup.link",               { link = "AumReference" })
set_hl(ns_id, "@markup.link.label",         { link = "AumReference" })
set_hl(ns_id, "@markup.link.url",           { link = "AumReference" })
set_hl(ns_id, "@markup.raw",                { link = "AumTypeBuiltin" })
set_hl(ns_id, "@markup.raw.block",          { link = "AumTypeBuiltin" })
set_hl(ns_id, "@markup.list",               { link = "AumPunctuationPri" })
set_hl(ns_id, "@markup.list.checked",       { link = "AumPunctuationSec" })
set_hl(ns_id, "@markup.list.unchecked",     { link = "AumPunctuationTer" })
set_hl(ns_id, "@markup.environment",        { link = "AumIdentifier" })     -- TODO: Make unique
set_hl(ns_id, "@markup.environment.name",   { link = "AumField" })          -- TODO: Make unique

-- Todo:
set_hl(ns_id, "Todo",                   { link = "AumTodo" })
set_hl(ns_id, "@todo",                  { link = "AumTodo" })
-- Note:
set_hl(ns_id, "@note",                  { link = "AumNote" })
set_hl(ns_id, "@text.note",             { link = "AumNote" })
set_hl(ns_id, "helpNote",               { link = "AumNote" })
-- diff.<add|delete|delta>
set_hl(ns_id, "@diff.plus",             { link = "AumString" })
set_hl(ns_id, "@diff.minus",            { link = "AumOperator" })
set_hl(ns_id, "@diff.delta",            { link = "AumNote" })

-- Comment
set_hl(ns_id, "comment",                { link = "AumComment" })
set_hl(ns_id, "Comment",                { link = "AumComment" })
set_hl(ns_id, "@comment",               { link = "AumComment" })
set_hl(ns_id, "@comment.documentation", { link = "AumStringAlt" })
set_hl(ns_id, "@comment.error",         { link = "AumError" })
set_hl(ns_id, "@comment.warning",       { link = "AumWarning" })
set_hl(ns_id, "@comment.todo",          { link = "AumTodo" })
set_hl(ns_id, "@comment.note",          { link = "AumNote" })

-- String (Probably WIP)
set_hl(ns_id, "@string",                { link = "AumString" })
set_hl(ns_id, "@string.documentation",  { link = "AumStringAlt" })
set_hl(ns_id, "@string.regexp",         { link = "AumPreproc" })
set_hl(ns_id, "@string.escape",         { link = "AumOperator" })
set_hl(ns_id, "@string.special",        { link = "AumBoolean" })
set_hl(ns_id, "@string.special.symbol", { link = "AumInclude" })  -- TODO: Make unique
set_hl(ns_id, "@string.special.path",   { link = "AumInclude" })  -- TODO: Make unique
set_hl(ns_id, "@string.special.url",    { link = "AumReference" })

-- Character
set_hl(ns_id, "@character",             { link = "AumCharacter" })
set_hl(ns_id, "@character.special",     { link = "AumOperator" })

-- Boolean
set_hl(ns_id, "@boolean",               { link = "AumBoolean" })

-- Number
set_hl(ns_id, "@number",                { link = "AumNumber" })
-- Float
set_hl(ns_id, "@number.float",          { link = "AumFloat" })

-- Type
set_hl(ns_id, "@type",                  { link = "AumType" })
set_hl(ns_id, "@type.builtin",          { link = "AumTypeBuiltin" })
set_hl(ns_id, "@type.definition",       { link = "AumTypeDef" })
set_hl(ns_id, "TypeDef",                { link = "AumTypeDef" })

-- Attribute
set_hl(ns_id, "@attribute",             { link = "AumAttribute" })
set_hl(ns_id, "@attribute.builtin",     { link = "AumAttribute" })
-- Property
set_hl(ns_id, "@property",              { link = "AumProperty" })

-- Variable
set_hl(ns_id, "@variable",              { link = "AumVariable" })
-- Variable.Builtin
set_hl(ns_id, "@variable.builtin",      { link = "AumVariableBuiltin" })
-- Variable.Parameter
set_hl(ns_id, "@variable.parameter",            { link = "AumParameter" })
set_hl(ns_id, "@variable.parameter.builtin",    { link = "AumParameter" })
set_hl(ns_id, "Hlargs",                         { link = "AumParameter" })
-- Variable.Member  (Field)
set_hl(ns_id, "@variable.member",       { link = "AumField" })
-- Variable.Global
set_hl(ns_id, "@variable.global",       { link = "AumVariableGlobal" })         -- This might not exist.

-- Constant
set_hl(ns_id, "@constant",              { link = "AumConstant" })
-- Constant.Builtin
set_hl(ns_id, "@constant.builtin",      { link = "AumConstantBuiltin" })
-- Constant.Macro
set_hl(ns_id, "@constant.macro",        { link = "AumConstantMacro" })

-- TypeParameter
set_hl(ns_id, "@typeParameter",         { link = "AumType" })  -- TODO: Make unique.

-- Class
set_hl(ns_id, "@class",                 { link = "AumType" })  -- TODO: Make unique.

-- Enum
set_hl(ns_id, "@enum",                  { link = "AumType" })  -- TODO: Make unique.
set_hl(ns_id, "@enumMember",            { link = "AumConstant" })  -- TODO: Make unique.

-- Event
set_hl(ns_id, "@event",                 { link = "AumIdentifier" })  -- TODO: Make unique.

-- Interface
set_hl(ns_id, "@interface",             { link = "AumIdentifier" })  -- TODO: Make unique.

-- Modifier
set_hl(ns_id, "@modifier",              { link = "AumIdentifier" })  -- TODO: Make unique.

-- Regexp
set_hl(ns_id, "@regexp",                { link = "AumSpecial" })  -- TODO: Make unique.

-- Decorator
set_hl(ns_id, "@decorator",             { link = "AumIdentifier" })  -- TODO: Make unique.

-- Structure
set_hl(ns_id, "struct",                 { link = "AumStructure" })
set_hl(ns_id, "@struct",                { link = "AumStructure" })
set_hl(ns_id, "structure",              { link = "AumStructure" })
set_hl(ns_id, "@structure",             { link = "AumStructure" })

-- Keyword
set_hl(ns_id, "@keyword",                       { link = "AumKeyword" })
set_hl(ns_id, "@keyword.coroutine",             { link = "AumKeywordCoroutine" })
set_hl(ns_id, "@keyword.function",              { link = "AumKeywordFunction" })
set_hl(ns_id, "@keyword.operator",              { link = "AumKeywordOperator" })
set_hl(ns_id, "@keyword.import",                { link = "AumInclude" })
set_hl(ns_id, "@keyword.type",                  { link = "AumKeywordType" })
set_hl(ns_id, "@keyword.modifier",              { link = "AumKeywordModifier" })
set_hl(ns_id, "@keyword.repeat",                { link = "AumRepeat" })
set_hl(ns_id, "@keyword.return",                { link = "AumKeywordReturn" })
set_hl(ns_id, "@keyword.debug",                 { link = "AumDebug" })
set_hl(ns_id, "@keyword.exception",             { link = "AumException" })
set_hl(ns_id, "@keyword.conditional",           { link = "AumKeywordConditional" })
set_hl(ns_id, "@keyword.conditional.ternary",   { link = "AumConditional" })
set_hl(ns_id, "@keyword.directive",             { link = "AumPreproc" })
set_hl(ns_id, "@keyword.directive.define",      { link = "AumDefine" })

-- Punctuation
set_hl(ns_id, "@punctuation.delimiter", { link = "AumDelimiter" })
set_hl(ns_id, "@punctuation.bracket",   { link = "AumPunctuationSec" })
set_hl(ns_id, "@punctuation.special",   { link = "AumPunctuationPri" })

-- Rainbow Brackets
set_hl(ns_id, "rainbowcol1",            { link = "AumRainbowBracket1" })
set_hl(ns_id, "rainbowcol2",            { link = "AumRainbowBracket2" })
set_hl(ns_id, "rainbowcol3",            { link = "AumRainbowBracket3" })
set_hl(ns_id, "rainbowcol4",            { link = "AumRainbowBracket4" })
set_hl(ns_id, "rainbowcol5",            { link = "AumRainbowBracket5" })
set_hl(ns_id, "rainbowcol6",            { link = "AumRainbowBracket6" })
set_hl(ns_id, "rainbowcol7",            { link = "AumRainbowBracket7" })

-- Identifier
set_hl(ns_id, "identifier",             { link = "AumIdentifier" })
set_hl(ns_id, "@identifier",            { link = "AumIdentifier" })

-- Statement
set_hl(ns_id, "statement",              { link = "AumStatement" })
set_hl(ns_id, "@statement",             { link = "AumStatement" })

-- Tag
set_hl(ns_id, "@tag",                   { link = "AumTagPri" })
set_hl(ns_id, "@tag.builtin",           { link = "AumTagPri" })
set_hl(ns_id, "@tag.attribute",         { link = "AumTagAttribute" })
set_hl(ns_id, "@tag.delimiter",         { link = "AumDelimiter" })

-- Function
set_hl(ns_id, "@function",              { link = "AumFunction" })
set_hl(ns_id, "@function.builtin",      { link = "AumFunctionBuiltin" })
set_hl(ns_id, "@function.call",         { link = "AumFunctionCall" })
set_hl(ns_id, "@function.macro",        { link = "AumFunctionMacro" })
set_hl(ns_id, "@function.method",       { link = "AumMethod" })
set_hl(ns_id, "@function.method.call",  { link = "AumMethodCall" })

-- Constructor
set_hl(ns_id, "@constructor",           { link = "AumFunction" })       -- TODO: Maybe uniqueify and set better color.

-- Operator
set_hl(ns_id, "@operator",              { link = "AumOperator" })

-- Module / Namespace
set_hl(ns_id, "@module",                { link = "AumNamespace" })
set_hl(ns_id, "@module.builtin",        { link = "AumNamespace" })
-- Label
set_hl(ns_id, "@label",                 { link = "AumLabel" })
-- PreCondit
set_hl(ns_id, "@precondit",             { link = "AumPreCondit" })
-- Macro
set_hl(ns_id, "@macro",                 { link = "AumMacro" })

-- Titles
set_hl(ns_id, "Title",                  { link = "AumTitlePri" })
set_hl(ns_id, "@title",                 { link = "AumTitlePri" })
set_hl(ns_id, "FloatTitle",             { link = "AumTitleSec" })
set_hl(ns_id, "LspInfoTitle",           { link = "AumTitleTer" })

-- |> Markdown
-- MD => Headings
set_hl(ns_id, "MarkdownH1",                         { link = "AumHeading1" })
set_hl(ns_id, "MarkdownH2",                         { link = "AumHeading2" })
set_hl(ns_id, "MarkdownH3",                         { link = "AumHeading3" })
set_hl(ns_id, "MarkdownH4",                         { link = "AumHeading4" })
set_hl(ns_id, "MarkdownH5",                         { link = "AumHeading5" })
set_hl(ns_id, "MarkdownH6",                         { link = "AumHeading6" })
set_hl(ns_id, "MarkdownH1Delimiter",                { link = "AumSpecial" })
set_hl(ns_id, "MarkdownH2Delimiter",                { link = "AumSpecial" })
set_hl(ns_id, "MarkdownH3Delimiter",                { link = "AumSpecial" })
set_hl(ns_id, "MarkdownH4Delimiter",                { link = "AumSpecial" })
set_hl(ns_id, "MarkdownH5Delimiter",                { link = "AumSpecial" })
set_hl(ns_id, "MarkdownH6Delimiter",                { link = "AumSpecial" })
-- MD => Other
set_hl(ns_id, "@conceal.markdown_inline",           { link = "AumConceal" })
set_hl(ns_id, "@text.literal.markdown_inline",      { link = "AumTypeBuiltin" })
set_hl(ns_id, "@text.reference.markdown_inline",    { link = "AumReference" })
set_hl(ns_id, "@text.todo.unchecked.markdown",      { link = "AumTodo" })
set_hl(ns_id, "@text.todo.checked.markdown",        { link = "AumDone" })

-- Special (TODO)
set_hl(ns_id, "Special",                            { link = "AumSpecial" })
set_hl(ns_id, "@special",                           { link = "AumSpecial" })

-- Warning / Error
set_hl(ns_id, "Warning",                            { link = "AumWarning" })
set_hl(ns_id, "@warning",                           { link = "AumWarning" })
set_hl(ns_id, "WarningMsg",                         { link = "AumWarning" })
set_hl(ns_id, "Error",                              { link = "AumError" })
set_hl(ns_id, "@error",                             { link = "AumError" })
set_hl(ns_id, "ErrorMsg",                           { link = "AumError" })
set_hl(ns_id, "NvimInternalError",                  { link = "AumError" })

-- Diagnostics: Base
set_hl(ns_id, "DiagnosticError",                    { link = "AumError" })
set_hl(ns_id, "DiagnosticWarn",                     { link = "AumWarning" })
set_hl(ns_id, "DiagnosticInfo",                     { link = "AumInfo" })
set_hl(ns_id, "DiagnosticHint",                     { link = "AumHint" })
set_hl(ns_id, "DiagnosticOk",                       { link = "AumOk" })
set_hl(ns_id, "DiagnosticUnnecessary",              { link = "AumIgnore" })
-- This works and the color is fine, but the "unnecessary" detection seems wonky so I'd rather this not get highlighted at all.
-- set_hl(ns_id, "DiagnosticUnnecessary",              { link = "AumNormalDimmed5" })

-- Diagnostics: Virtual Text
set_hl(ns_id, "DiagnosticVirtualTextError",         { link = "AumError" })
set_hl(ns_id, "DiagnosticVirtualTextWarn",          { link = "AumWarning" })
set_hl(ns_id, "DiagnosticVirtualTextInfo",          { link = "AumInfo" })
set_hl(ns_id, "DiagnosticVirtualTextHint",          { link = "AumHint" })
set_hl(ns_id, "DiagnosticVirtualTextOk",            { link = "AumOk" })
-- Diagnostics: Underline
set_hl(ns_id, "DiagnosticUnderlineError",           { sp = colors.fg_red_00_cardinal,           undercurl = true })
set_hl(ns_id, "DiagnosticUnderlineWarn",            { sp = colors.fg_orange_00_ryza_dust,       undercurl = true })
set_hl(ns_id, "DiagnosticUnderlineInfo",            { sp = colors.fg_white_01_seashell,         underline = true })
set_hl(ns_id, "DiagnosticUnderlineHint",            { sp = colors.fg_white_04_azure,            underline = true })
set_hl(ns_id, "DiagnosticUnderlineOk",              { sp = colors.fg_white_00_icy_landscape,    underline = true })
-- Diagnostics: Floating
set_hl(ns_id, "DiagnosticFloatingError",            { link = "AumError" })
set_hl(ns_id, "DiagnosticFloatingWarn",             { link = "AumWarning" })
set_hl(ns_id, "DiagnosticFloatingInfo",             { link = "AumInfo" })
set_hl(ns_id, "DiagnosticFloatingHint",             { link = "AumHint" })
set_hl(ns_id, "DiagnosticFloatingOk",               { link = "AumOk" })
-- Diagnostics: Sign
set_hl(ns_id, "DiagnosticSignError",                { link = "AumError" })
set_hl(ns_id, "DiagnosticSignWarn",                 { link = "AumWarning" })
set_hl(ns_id, "DiagnosticSignInfo",                 { link = "AumInfo" })
set_hl(ns_id, "DiagnosticSignHint",                 { link = "AumHint" })
set_hl(ns_id, "DiagnosticSignOk",                   { link = "AumOk" })

-- Storageclass
set_hl(ns_id, "storageclass",                       { link = "AumStorageClass" })
set_hl(ns_id, "@storageclass",                      { link = "AumStorageClass" })
-- Storageclass.Lifetime
set_hl(ns_id, "storageclass.lifetime",              { link = "AumStorageClassLifetime" })
set_hl(ns_id, "@storageclass.lifetime",             { link = "AumStorageClassLifetime" })

-- Definition
set_hl(ns_id, "@definition",                        { link = "AumError" })  -- TODO: Make unique.
set_hl(ns_id, "@definition.constant",               { link = "AumError" })  -- TODO: Make unique.
set_hl(ns_id, "@definition.function",               { link = "AumError" })  -- TODO: Make unique.
set_hl(ns_id, "@definition.method",                 { link = "AumError" })  -- TODO: Make unique.
set_hl(ns_id, "@definition.var",                    { link = "AumError" })  -- TODO: Make unique.
set_hl(ns_id, "@definition.parameter",              { link = "AumError" })  -- TODO: Make unique.
set_hl(ns_id, "@definition.macro",                  { link = "AumError" })  -- TODO: Make unique.
set_hl(ns_id, "@definition.type",                   { link = "AumError" })  -- TODO: Make unique.
set_hl(ns_id, "@definition.field",                  { link = "AumError" })  -- TODO: Make unique.
set_hl(ns_id, "@definition.enum",                   { link = "AumError" })  -- TODO: Make unique.
set_hl(ns_id, "@definition.namespace",              { link = "AumError" })  -- TODO: Make unique.
set_hl(ns_id, "@definition.import",                 { link = "AumError" })  -- TODO: Make unique.
set_hl(ns_id, "@definition.associated",             { link = "AumError" })  -- TODO: Make unique.

-- Scope
set_hl(ns_id, "@scope",                             { link = "AumSpecial" })  -- TODO: Make unique.

-- Reference
set_hl(ns_id, "@reference",                         { link = "AumReference" })

--=========================================
-- |> - START - Plugin Color Groups     ===
--=========================================

-- |> `lazy.nvim`                                   ( STATE: Okay, could be customized more. )
set_hl(ns_id, "LazyNormal",                         { link = "NormalFloat" })
set_hl(ns_id, "LazyH1",                             { link = "AumTitleSec" })
set_hl(ns_id, "LazyH2",                             { link = "AumTitleTer" })
set_hl(ns_id, "LazyButton",                         { link = "AumBackgroundHL" })
set_hl(ns_id, "LazyButtonActive",                   { link = "AumVisual" })
set_hl(ns_id, "LazyComment",                        { link = "AumComment" })
set_hl(ns_id, "LazyCommit",                         { link = "AumVariableBuiltin" })
set_hl(ns_id, "LazyCommitIssue",                    { link = "AumNumber" })
set_hl(ns_id, "LazyCommitScope",                    { link = "AumNormalTer" })
set_hl(ns_id, "LazyCommitType",                     { link = "AumTitleQui" })
set_hl(ns_id, "LazyDimmed",                         { link = "AumConceal" })
set_hl(ns_id, "LazyDir",                            { link = "AumReference" })
set_hl(ns_id, "LazyNoCond",                         { link = "AumWarning" })
set_hl(ns_id, "LazyProgressDone",                   { link = "AumConstant" })
set_hl(ns_id, "LazyProgressTodo",                   { link = "AumLineNumberActive" })
set_hl(ns_id, "LazyProp",                           { link = "AumConceal" })
set_hl(ns_id, "LazyReasonCmd",                      { link = "AumFunctionCall" })
set_hl(ns_id, "LazyReasonEvent",                    { link = "AumConstant" })
set_hl(ns_id, "LazyReasonFt",                       { link = "AumStringAlt" })
set_hl(ns_id, "LazyReasonImport",                   { link = "AumIdentifier" })
set_hl(ns_id, "LazyReasonKeys",                     { link = "AumStatement" })
set_hl(ns_id, "LazyReasonPlugin",                   { link = "AumSpecial" })
set_hl(ns_id, "LazyReasonRuntime",                  { link = "AumMacro" })
set_hl(ns_id, "LazyReasonSource",                   { link = "AumCharacter" })
set_hl(ns_id, "LazyReasonStart",                    { link = "AumField" })
set_hl(ns_id, "LazySpecial",                        { link = "AumPunctuationPri" })
set_hl(ns_id, "LazyTaskError",                      { link = "ErrorMsg" })
set_hl(ns_id, "LazyTaskOutput",                     { link = "MsgArea" })
set_hl(ns_id, "LazyUrl",                            { link = "AumUnderlined" })
set_hl(ns_id, "LazyValue",                          { link = "AumString" })

-- |> `fidget.nvim`                                 ( STATE: Good )
set_hl(ns_id, "FidgetTitle",                        { link = "AumTitleSec" })
set_hl(ns_id, "FidgetTask",                         { link = "AumNormalDimmed4" })

-- |> `hlchunk.nvim`                                ( STATE: Good )
set_hl(ns_id, "AumIndentGuide",                     { link = "AumWhitespace" })

-- |> `wf.nvim`                                     ( STATE: WIP )
set_hl(ns_id, "WFNormal",                           { link = "AumNormalSec" })
set_hl(ns_id, "WFFloatBorder",                      { link = "AumBorder" })
set_hl(ns_id, "WFFloatBorderFocus",                 { link = "AumBorderFocused" })
set_hl(ns_id, "WFComment",                          { link = "AumComment" })
set_hl(ns_id, "WFWhichRem",                         { link = "AumError" })
set_hl(ns_id, "WFWhichOn",                          { link = "AumWarning" })
set_hl(ns_id, "WFFuzzy",                            { link = "AumMatch" })
set_hl(ns_id, "WFFuzzyPrompt",                      { link = "AumTitleSec" })
set_hl(ns_id, "WFFocus",                            { link = "AumTitleQui" })
set_hl(ns_id, "WFFreeze",                           { link = "AumTitleTer" })
set_hl(ns_id, "WFWhichObjCounter",                  { link = "TelescopePromptCounter" })
set_hl(ns_id, "WFWhichDesc",                        { link = "AumNormalDimmed4" })
set_hl(ns_id, "WFSeparator",                        { link = "AumOperator" })
set_hl(ns_id, "WFGroup",                            { link = "AumError" })
set_hl(ns_id, "WFWhichUnique",                      { link = "AumField" })
set_hl(ns_id, "WFExpandable",                       { link = "AumType" })
set_hl(ns_id, "WFTitleOutput",                      { link = "AumTitleSen" })
set_hl(ns_id, "WFTitleWhich",                       { link = "AumInfo" })
set_hl(ns_id, "WFTitleFuzzy",                       { link = "AumHint" })
set_hl(ns_id, "WFTitleFreeze",                      { link = "AumError" })

-- |> `trouble.nvim`                                ( STATE: Okay, but TODO/WIP )
set_hl(ns_id, "TroubleNormal",                      { link = "AumNormalSec" })
set_hl(ns_id, "TroubleText",                        { link = "AumNormalPri" })
set_hl(ns_id, "TroublePreview",                     { link = "AumException" })
set_hl(ns_id, "TroubleLocation",                    { link = "AumVariable" })
set_hl(ns_id, "TroubleIndent",                      { link = "AumIdentifier" })
set_hl(ns_id, "TroubleCount",                       { link = "AumNumber" })
set_hl(ns_id, "TroubleSource",                      { link = "AumStructure" })
set_hl(ns_id, "TroubleCode",                        { link = "AumParameter" })
set_hl(ns_id, "TroubleFile",                        { link = "AumKeyword" })
set_hl(ns_id, "TroubleFoldIcon",                    { link = "AumComment" })
set_hl(ns_id, "TroubleError",                       { link = "AumError" })
set_hl(ns_id, "TroubleWarning",                     { link = "AumWarning" })
set_hl(ns_id, "TroubleHint",                        { link = "AumString" })
set_hl(ns_id, "TroubleInformation",                 { link = "AumNormalPri" })
set_hl(ns_id, "TroubleTextError",                   { link = "AumError" })
set_hl(ns_id, "TroubleTextWarning",                 { link = "AumWarning" })
set_hl(ns_id, "TroubleTextHint",                    { link = "AumString" })
set_hl(ns_id, "TroubleTextInformation",             { link = "AumNormalPri" })
set_hl(ns_id, "TroubleSignError",                   { link = "AumError" })
set_hl(ns_id, "TroubleSignWarning",                 { link = "AumWarning" })
set_hl(ns_id, "TroubleSignHint",                    { link = "AumString" })
set_hl(ns_id, "TroubleSignInformation",             { link = "AumNormalPri" })
set_hl(ns_id, "TroubleSignOther",                   { link = "AumNormalSec" })

-- |> `rainbow_csv`                                 ( STATE: Quite good. )
set_hl(ns_id, "column0",                            { fg = colors.fg_white_07_hint_of_blue })
set_hl(ns_id, "column1",                            { fg = colors.fg_cyan_04_thousand_sons })
set_hl(ns_id, "column2",                            { fg = colors.fg_purple_07_petal_plush })
set_hl(ns_id, "column3",                            { fg = colors.fg_blue_14_cobalite })
set_hl(ns_id, "column4",                            { fg = colors.fg_red_07_coralette })
set_hl(ns_id, "column5",                            { fg = colors.fg_orange_08_xanthous })
set_hl(ns_id, "column6",                            { fg = colors.fg_green_05_taurus_forest_fern })
set_hl(ns_id, "column7",                            { fg = colors.fg_yellow_04_golden_gate })
set_hl(ns_id, "column8",                            { fg = colors.fg_cyan_12_mint_macaron })
set_hl(ns_id, "column9",                            { fg = colors.fg_purple_17_venetian_night })

-- Pmenu (pum)[Builtin Pop Up Menu, Omnicompletion, Omnifunc]
set_hl(ns_id, "Pmenu",                              { link = "AumPmenu" })      -- `Background` and `Normal` Text Color in `Popup Menu`.
set_hl(ns_id, "PmenuSel",                           { link = "AumMatch" })      -- Does not work for selected in `nvim-cmp`.
set_hl(ns_id, "PmenuSbar",                          { bg = colors.fg_purple_13_bright_ube })    -- Scrollbar: `bg` is basically the `fg` for this.
set_hl(ns_id, "PmenuThumb",                         { link = "PmenuSbar" })     -- Popup Menu Scrollbar: `bg` is basically the `fg` for this.  ( This seems to be the actually visible group. )
set_hl(ns_id, "WildMenu",                           { link = "AumMatch" })     -- Current match in `wildmenu`.

-- Autocompletion => `nvim.cmp`
-- NOTE: The custom groups need to be configured in `nvim-cmp` `setup()` call => `winhighlight` groups.
set_hl(ns_id, "CmpNormal",                          { link = "AumField" })
set_hl(ns_id, "CmpFloatBorder",                     { link = "AumBorder" })
set_hl(ns_id, "CmpCursorLine",                      { link = "AumMatch" })
set_hl(ns_id, "CmpPmenu",                           { link = "AumPmenu" })
set_hl(ns_id, "CmpSearch",                          { link = "Search" })
set_hl(ns_id, "CmpDocNormal",                       { link = "AumNormalPri" })
set_hl(ns_id, "CmpDocFloatBorder",                  { link = "AumBorder" })
set_hl(ns_id, "CmpDocCursorLine",                   { link = "AumCursorLine" })
set_hl(ns_id, "CmpDocComment",                      { link = "AumCommentSpecial" })
set_hl(ns_id, "CmpDocSearch",                       { link = "Search" })
set_hl(ns_id, "CmpDocPmenu",                        { link = "AumPmenu" })
set_hl(ns_id, "CmpItemMenu",                        { fg = colors.fg_purple_11_blossoms_in_spring })    -- TODO
set_hl(ns_id, "CmpItemAbbr",                        { fg = colors.fg_blue_09_periwinkle })              -- TODO
set_hl(ns_id, "CmpItemAbbrDeprecated",              { fg = colors.fg_red_08_cyclamen })                 -- TODO
set_hl(ns_id, "CmpItemAbbrMatch",                   { fg = colors.fg_green_06_poisonous_dart })         -- TODO
set_hl(ns_id, "CmpItemAbbrMatchFuzzy",              { fg = colors.fg_green_08_goddess_of_dawn })        -- TODO
set_hl(ns_id, "CmpItemKind",                        { fg = colors.fg_orange_11_amber })                 -- TODO
set_hl(ns_id, "CmpItemKindDefault",                 { fg = colors.fg_orange_11_amber })                 -- TODO
set_hl(ns_id, "CmpItemKindReference",               { fg = colors.fg_purple_01_myrtle_flower })         -- TODO
set_hl(ns_id, "CmpItemKindFile",                    { fg = colors.fg_blue_01_blue_genie })              -- TODO
set_hl(ns_id, "CmpItemKindColor",                   { fg = colors.fg_red_05_emberglow })                -- TODO
set_hl(ns_id, "CmpItemKindSnippet",                 { fg = colors.fg_purple_12_dream_vapor })           -- TODO
set_hl(ns_id, "CmpItemKindModule",                  { link = "AumInclude" })
set_hl(ns_id, "CmpItemKindEnum",                    { link = "AumEnum" })
set_hl(ns_id, "CmpItemKindClass",                   { link = "AumClass" })
set_hl(ns_id, "CmpItemKindInterface",               { link = "AumClass" })
set_hl(ns_id, "CmpItemKindKeyword",                 { link = "AumKeyword" })
set_hl(ns_id, "CmpItemKindValue",                   { link = "AumNumber" })
set_hl(ns_id, "CmpItemKindUnit",                    { link = "AumField" })
set_hl(ns_id, "CmpItemKindProperty",                { link = "AumProperty" })
set_hl(ns_id, "CmpItemKindVariable",                { link = "AumVariable" })
set_hl(ns_id, "CmpItemKindConstant",                { link = "AumConstant" })
set_hl(ns_id, "CmpItemKindField",                   { link = "AumField" })
set_hl(ns_id, "CmpItemKindEnumMember",              { link = "AumEnumMember" })
set_hl(ns_id, "CmpItemKindConstructor",             { fg = colors.fg_blue_06_kindred })         -- TODO
set_hl(ns_id, "CmpItemKindText",                    { fg = colors.fg_white_05_bubbles })        -- TODO
set_hl(ns_id, "CmpItemKindTypeParemeter",           { fg = colors.fg_orange_11_amber })         -- TODO
set_hl(ns_id, "CmpItemKindOperator",                { link = "AumOperator" })
set_hl(ns_id, "CmpItemKindEvent",                   { fg = colors.fg_blue_08_widowmaker })      -- TODO
set_hl(ns_id, "CmpItemKindStruct",                  { link = "AumStructure" })
set_hl(ns_id, "CmpItemKindMethod",                  { link = "AumMethod" })
set_hl(ns_id, "CmpItemKindFunction",                { link = "AumFunction" })
set_hl(ns_id, "CmpItemKindFolder",                  { link = "Directory" })
set_hl(ns_id, "AumCmpGhostText",                    { link = "AumWhitespace" })                 -- STATE: Good

-- Dressing.nvim (WIP)
set_hl(ns_id, "DressingInputNormal",                { link = "AumNormalQui" })
set_hl(ns_id, "DressingInputNormalFloat",           { link = "AumNormalQui" })
set_hl(ns_id, "DressingInputFloatBorder",           { link = "AumBorder" })
set_hl(ns_id, "DressingInputPmenu",                 { link = "AumPmenu" })
set_hl(ns_id, "DressingInputSearch",                { link = "Search" })
set_hl(ns_id, "DressingInputVisual",                { link = "AumVisual" })
set_hl(ns_id, "DressingBuiltinNormal",              { link = "AumNormalSen" })
set_hl(ns_id, "DressingBuiltinNormalFloat",         { link = "AumNormalSen" })
set_hl(ns_id, "DressingBuiltinFloatBorder",         { link = "AumBorder" })
set_hl(ns_id, "DressingBuiltinPmenu",               { link = "AumPmenu" })
set_hl(ns_id, "DressingBuiltinSearch",              { link = "Search" })
set_hl(ns_id, "DressingBuiltinVisual",              { link = "AumVisual" })

-- Heirline.nvim (Okay)
set_hl(ns_id, "AumBufferline",                      { fg = colors.bg_09_champion_blue,          bg = colors.bg_03_night })
set_hl(ns_id, "AumBufferlineInactive",              { link = "AumBufferline" })
set_hl(ns_id, "AumBufferlineActive",                { fg = colors.fg_white_07_hint_of_blue,     bg = colors.bg_07_dark_knight })
set_hl(ns_id, "AumBufferlineBufferNumber",          { link = "AumMethodCall" })

-- Noice.nvim (Okay, but WIP)
set_hl(ns_id, "NoiceCursor",                        { link = "AumCursor" })
set_hl(ns_id, "AumNoiceMiniNormal",                 { link = "AumNormalSec" })
set_hl(ns_id, "AumNoiceMiniSearch",                 { link = "Search" })
set_hl(ns_id, "AumNoiceMiniCurSearch",              { link = "CurSearch" })
set_hl(ns_id, "AumNoiceMiniIncSearch",              { link = "IncSearch" })
set_hl(ns_id, "NoiceCompletionItemKindDefault",     { link = "CmpItemKindDefault" })
set_hl(ns_id, "NoiceCompletionItemKindFile",        { link = "CmpItemKindFile" })
set_hl(ns_id, "NoiceCompletionItemKindField",       { link = "CmpItemKindField" })
set_hl(ns_id, "NoiceCompletionItemKindEnum",        { link = "CmpItemKindEnum" })
set_hl(ns_id, "NoiceCompletionItemKindEnumMember",  { link = "CmpItemKindEnumMember" })
set_hl(ns_id, "NoiceCompletionItemKindFolder",      { link = "CmpItemKindFolder" })
set_hl(ns_id, "NoiceCompletionItemKindConstant",    { link = "CmpItemKindConstant" })
set_hl(ns_id, "NoiceCompletionItemKindValue",       { link = "CmpItemKindValue" })
set_hl(ns_id, "NoiceCompletionItemKindStruct",      { link = "CmpItemKindStruct" })
set_hl(ns_id, "NoiceCompletionItemKindInterface",   { link = "CmpItemKindInterface" })
set_hl(ns_id, "NoiceCompletionItemKindFunction",    { link = "CmpItemKindFunction" })
set_hl(ns_id, "NoiceCompletionItemKindMethod",      { link = "CmpItemKindMethod" })

-- nvim-notify      ( Okay, but WIP )
set_hl(ns_id, "NotifyERRORBody",        { link = "AumError" })
set_hl(ns_id, "NotifyWARNBody",         { link = "AumWarning" })
set_hl(ns_id, "NotifyINFOBody",         { link = "AumInfo" })
set_hl(ns_id, "NotifyDEBUGBody",        { link = "AumDebug" })
set_hl(ns_id, "NotifyTRACEBody",        { link = "AumDebug" })
set_hl(ns_id, "NotifyERRORTitle",       { link = "AumError" })
set_hl(ns_id, "NotifyWARNTitle",        { link = "AumWarning" })
set_hl(ns_id, "NotifyINFOTitle",        { link = "AumInfo" })
set_hl(ns_id, "NotifyDEBUGTitle",       { link = "AumDebug" })
set_hl(ns_id, "NotifyTRACETitle",       { link = "AumDebug" })
set_hl(ns_id, "NotifyERRORBorder",      { link = "AumBorder" })
set_hl(ns_id, "NotifyWARNBorder",       { link = "AumBorder" })
set_hl(ns_id, "NotifyINFOBorder",       { link = "AumBorder" })
set_hl(ns_id, "NotifyDEBUGBorder",      { link = "AumBorder" })
set_hl(ns_id, "NotifyTRACEBorder",      { link = "AumBorder" })
set_hl(ns_id, "NotifyERRORIcon",        { link = "AumError" })
set_hl(ns_id, "NotifyWARNIcon",         { link = "AumWarning" })
set_hl(ns_id, "NotifyINFOIcon",         { link = "AumInfo" })
set_hl(ns_id, "NotifyDEBUGIcon",        { link = "AumDebug" })
set_hl(ns_id, "NotifyTRACEIcon",        { link = "AumDebug" })

-- Scrollbar.nvim
set_hl(ns_id, "ScrollbarHandle",            { fg = "#241A3E",   bg = "NONE" })  -- `fg`: The scrollbar location indicator. (Handle)
set_hl(ns_id, "ScrollbarCursor",            { link = "AumIgnore" })
set_hl(ns_id, "ScrollbarCursorHandle",      { link = "AumIgnore" })
set_hl(ns_id, "ScrollbarSearch",            { link = "AumMatch" })
set_hl(ns_id, "ScrollbarSearchHandle",      { link = "AumMatch" })
set_hl(ns_id, "ScrollbarError",             { link = "AumError" })
set_hl(ns_id, "ScrollbarErrorHandle",       { link = "AumError" })
set_hl(ns_id, "ScrollbarWarn",              { link = "AumWarning" })
set_hl(ns_id, "ScrollbarWarnHandle",        { link = "AumWarning" })
set_hl(ns_id, "ScrollbarInfo",              { link = "AumInfo" })
set_hl(ns_id, "ScrollbarInfoHandle",        { link = "AumInfo" })
set_hl(ns_id, "ScrollbarHint",              { link = "AumHint" })
set_hl(ns_id, "ScrollbarHintHandle",        { link = "AumHint" })
set_hl(ns_id, "ScrollbarGitAdd",            { link = "AumString" })
set_hl(ns_id, "ScrollbarGitAddHandle",      { link = "AumStringAlt" })
set_hl(ns_id, "ScrollbarGitChange",         { link = "AumCharacter" })
set_hl(ns_id, "ScrollbarGitChangeHandle",   { link = "AumCharacterSpecial" })
set_hl(ns_id, "ScrollbarGitDelete",         { link = "AumOperator" })
set_hl(ns_id, "ScrollbarGitDeleteHandle",   { link = "AumOperator" })
set_hl(ns_id, "ScrollbarMisc",              { fg = "#504080", bg = "NONE" })

-- Scrollview.nvim
set_hl(ns_id, "ScrollView",                 { link = "AumBackgroundQui" })
set_hl(ns_id, "ScrollViewCursor",           { fg = colors.bg_01_darkcrust, bg = colors.bg_05_tristesse })
set_hl(ns_id, "ScrollViewSearch",           { link = "AumSearch" })
set_hl(ns_id, "ScrollViewFolds",            { link = "Folded" })
set_hl(ns_id, "ScrollViewSpell",            { link = "AumError" })
set_hl(ns_id, "ScrollViewMarks",            { link = "AumError" })
set_hl(ns_id, "ScrollViewDiagnosticsError", { link = "AumError" })
set_hl(ns_id, "ScrollViewDiagnosticsWarn",  { link = "AumWarning" })
set_hl(ns_id, "ScrollViewDiagnosticsInfo",  { link = "AumInfo" })
set_hl(ns_id, "ScrollViewDiagnosticsHint",  { link = "AumHint" })
set_hl(ns_id, "ScrollViewConflictsTop",     { link = "AumOperator" })
set_hl(ns_id, "ScrollViewConflictsMiddle",  { link = "AumOperator" })
set_hl(ns_id, "ScrollViewConflictsBottom",  { link = "AumOperator" })
set_hl(ns_id, "ScrollViewLocList",          { link = "AumWarn" })
set_hl(ns_id, "ScrollViewQuickFix",         { link = "AumWarn" })
set_hl(ns_id, "ScrollViewRestricted",       { link = "AumError" })
set_hl(ns_id, "ScrollViewTextWidth",        { link = "AumError" })

-- Leap.nvim        ( Quite good, but little WIP. Labels could be kinda bright magenta maybe, because I avoid that colour otherwise. )
set_hl(ns_id, "LeapMatch",              { link = "Search" })
set_hl(ns_id, "LeapLabelPrimary",       { link = "AumVisual" })
set_hl(ns_id, "LeapLabelSecondary",     { link = "AumVisual" })
set_hl(ns_id, "LeapLabelSelected",      { link = "AumVisual" })
-- set_hl(ns_id, "LeapBackdrop",           {})  -- Not set == Good

-- Telescope.nvim   ( STATE: Quite good )
set_hl(ns_id, "TelescopeNormal",        { link = "AumNormalPri" })      -- Text entered into prompt.
set_hl(ns_id, "TelescopePromptCounter", { link = "AumComment" })        -- Prompt result count.
set_hl(ns_id, "TelescopeMatching",      { link = "AumMatch" })          -- Search match highlight.
set_hl(ns_id, "TelescopeSelection",     { link = "AumBackgroundHL" })   -- Active selection.
set_hl(ns_id, "TelescopePreviewLine",   { link = "AumBackgroundHL" })   -- CursorLine in preview panel.
set_hl(ns_id, "TelescopeTitle",         { link = "AumTitlePri" })
set_hl(ns_id, "TelescopePromptTitle",   { link = "AumTitleSec" })
set_hl(ns_id, "TelescopeResultsTitle",  { link = "AumTitleTer" })
set_hl(ns_id, "TelescopePreviewTitle",  { link = "AumTitleQua" })
set_hl(ns_id, "TelescopeBorder",        { link = "AumBorder" })

-- Inlay Hints       ( STATE: Probably mostly acceptable / Maybe WIP )
set_hl(ns_id, "AumInlayHint",                       { link = "AumConceal" })
set_hl(ns_id, "AumLuaSnipChoiceNodeVirtualText",    { link = "AumSpecial" })
set_hl(ns_id, "LspInlayHint",                       { link = "AumInlayHint" })

-- LineNr
set_hl(ns_id, "LineNr",                 { link = "AumLineNumberActive" })
set_hl(ns_id, "CursorLineNr",           { link = "AumTitleTer" })
set_hl(ns_id, "LineNrAbove",            { link = "AumLineNumberInactive" })  -- For when 'relativenumber' is active.
set_hl(ns_id, "LineNrBelow",            { link = "AumLineNumberInactive" })  -- For when 'relativenumber' is active.

-- Fold
set_hl(ns_id, "Folded",                 { fg = colors.bg_10_prophet_violet,         bg = colors.bg_05_tristesse })
set_hl(ns_id, "@fold",                  { fg = colors.bg_10_prophet_violet,         bg = colors.bg_05_tristesse })
set_hl(ns_id, "FoldColumn",             { fg = colors.bg_10_prophet_violet,         bg = colors.bg_05_tristesse })
set_hl(ns_id, "CursorLineFold",         { fg = colors.fg_white_07_hint_of_blue,     bg = colors.bg_06_dusk,    bold = true,  italic = true })

-- Plugin: nvim-ufo                     ( TODO/WIP )
set_hl(ns_id, "UfoFoldedFg",            { link = "Normal" })                                                                -- Foreground is good as is.
set_hl(ns_id, "UfoVirtualText",         { fg = colors.fg_red_11_cichlid,            bg = colors.bg_05_tristesse })          -- This works.
set_hl(ns_id, "UfoCursorFoldedLine",    { link = "AumCursorLine" })                                                         -- This works.
-- set_hl(ns_id, "UfoFoldedBg",            { fg = colors.fg_red_07_coralette,          bg = colors.fg_red_07_coralette })   -- This is not having any effect.
-- set_hl(ns_id, "UfoFoldedEllipsis",      { fg = colors.fg_red_11_cichlid,            bg = colors.bg_04_monolith })        -- This does nothing. ( When the `nvim-ufo` virt text handler is enabled. )

-- Visual Selection
set_hl(ns_id, "Visual",                 { link = "AumVisual" })
set_hl(ns_id, "VisualNOS",              { link = "AumVisual" })

-- Message
set_hl(ns_id, "ModeMsg",                { link = "Normal" })
set_hl(ns_id, "MoreMsg",                { link = "AumString" })
set_hl(ns_id, "Question",               { link = "AumCharacter" })

-- Spelling
set_hl(ns_id, "SpellBad",               { sp = colors.fg_red_07_coralette,          bg = "NONE",    undercurl = true })
set_hl(ns_id, "SpellCap",               { sp = colors.fg_blue_10_blue_sand,         bg = "NONE",    undercurl = true })
set_hl(ns_id, "SpellRare",              { sp = colors.fg_purple_01_myrtle_flower,   bg = "NONE",    undercurl = true })
set_hl(ns_id, "SpellLocal",             { sp = colors.fg_blue_01_blue_genie,        bg = "NONE",    undercurl = true })
set_hl(ns_id, "spell",                  {})  -- Had some issue with this overwriting string colours. (Empty seems to work fine.)
set_hl(ns_id, "@spell",                 {})  -- Had some issue with this overwriting string colours. (Empty seems to work fine.)

-- => `Headlines.nvim`
set_hl(ns_id, "Headline1",                                          { bg = colors.special_10_noir_fiction })
set_hl(ns_id, "Headline2",                                          { bg = colors.special_11_black_glaze })
set_hl(ns_id, "Headline3",                                          { bg = colors.special_12_inside })
set_hl(ns_id, "Headline4",                                          { bg = colors.special_13_corbeau })
set_hl(ns_id, "Headline5",                                          { bg = colors.special_14_myrtle })
set_hl(ns_id, "Headline6",                                          { bg = colors.special_15_root_brew })
set_hl(ns_id, "CodeBlock",                                          { bg = "#000001" })
set_hl(ns_id, "Dash",                                               { bg = "#000001" })
set_hl(ns_id, "DoubleDash",                                         { bg = "#000001" })
set_hl(ns_id, "Quote",                                              { bg = "#000001" })


-- ###############################################
-- ##           - Polyglot Groups  -            ##
-- ###############################################

-- Added some groups for: `euclidianAce/BetterLua.vim`

-- |> Lua
-- Lua => Operators
set_hl(ns_id, "luaOperator",            { link = "AumOperator" })
set_hl(ns_id, "luaSymbolOperator",      { link = "AumOperator" })
set_hl(ns_id, "luaSymbol",              { link = "AumOperator" })
-- Lua => Primitives
set_hl(ns_id, "luaVarName",             { link = "AumVariable" })
set_hl(ns_id, "luaTable",               { link = "AumField" })
set_hl(ns_id, "luaTableConstructor",    { link = "AumField" })
set_hl(ns_id, "luaNumber",              { link = "AumNumber" })
set_hl(ns_id, "luaString",              { link = "AumString" })
set_hl(ns_id, "luaLongString",          { link = "AumString" })
set_hl(ns_id, "luaCharacter",           { link = "AumCharacter" })
set_hl(ns_id, "luaConstant",            { link = "AumConstant" })
set_hl(ns_id, "luaLocal",               { link = "AumKeywordLet" })
-- Lua => Functions, Keywords, etc...
set_hl(ns_id, "luaFunc",                { link = "AumFunction" })
set_hl(ns_id, "luaFunction",            { link = "AumFunction" })
set_hl(ns_id, "luaFunctionName",        { link = "AumFunctionDef" })
set_hl(ns_id, "luaFunctionSignature",   { link = "AumFunctionDef" })
set_hl(ns_id, "luaFunctionBlock",       { link = "AumFunction" })
set_hl(ns_id, "luaFuncCall",            { link = "AumFunctionCall" })
set_hl(ns_id, "luaFunctionCall",        { link = "AumFunctionCall" })
set_hl(ns_id, "luaFuncKeyword",         { link = "AumKeywordFunction" })
set_hl(ns_id, "luaFuncArgs",            { link = "AumParameter" })
set_hl(ns_id, "luaFunctionArgs",        { link = "AumParameter" })
set_hl(ns_id, "luaFuncArgName",         { link = "AumParameter" })
set_hl(ns_id, "luaFuncSig",             { link = "AumParameter" })
set_hl(ns_id, "luaFuncArgComma",        { link = "AumDelimiter" })
set_hl(ns_id, "luaLocal",               { link = "AumKeyword" })
set_hl(ns_id, "luaBuiltIn",             { link = "AumTypeBuiltin" })        -- TODO: Is this good?
-- Lua => Control Flow
set_hl(ns_id, "luaIfStatement",         { link = "AumConditional" })
set_hl(ns_id, "luaElse",                { link = "AumConditional" })
set_hl(ns_id, "luaIfThen",              { link = "AumConditional" })
set_hl(ns_id, "luaThenEnd",             { link = "AumConditional" })
set_hl(ns_id, "luaFor",                 { link = "AumRepeat" })
set_hl(ns_id, "luaForDo",               { link = "AumRepeat" })
set_hl(ns_id, "luaIn",                  { link = "AumRepeat" })
set_hl(ns_id, "luaDoEnd",               { link = "AumRepeat" })
set_hl(ns_id, "luaReturn",              { link = "AumKeywordReturn" })
-- Lua => Punctuation
set_hl(ns_id, "luaNoise",               { link = "Noise" })
set_hl(ns_id, "luaComma",               { link = "AumPunctuationPri" })
set_hl(ns_id, "luaParen",               { link = "AumPunctuationTer" })
set_hl(ns_id, "luaParens",              { link = "AumPunctuationSec" })
set_hl(ns_id, "luaBraces",              { link = "AumPunctuationSec" })
set_hl(ns_id, "luaBracket",             { link = "AumPunctuationTer" })
set_hl(ns_id, "luaBrackets",            { link = "AumPunctuationTer" })
-- Lua => Emmy
set_hl(ns_id, "luaEmmyKeyword",         { link = "AumPreCondit" })
set_hl(ns_id, "luaEmmyFluff",           { link = "AumComment" })
-- Lua => Other
set_hl(ns_id, "luaComment",             { link = "AumComment" })
set_hl(ns_id, "luaTodo",                { link = "AumTodo" })

-- |> Rust Builtin Groups
set_hl(ns_id, "rust1",                      { link = "AumNormalPri" })
set_hl(ns_id, "rust2",                      { link = "AumNormalPri" })
set_hl(ns_id, "rust3",                      { link = "AumNormalPri" })
set_hl(ns_id, "rust4",                      { link = "AumNormalPri" })
set_hl(ns_id, "rust5",                      { link = "AumNormalPri" })
set_hl(ns_id, "rust6",                      { link = "AumNormalPri" })
set_hl(ns_id, "rust7",                      { link = "AumNormalPri" })
set_hl(ns_id, "rust8",                      { link = "AumNormalPri" })
set_hl(ns_id, "rust9",                      { link = "AumNormalPri" })
set_hl(ns_id, "rust10",                     { link = "AumNormalPri" })
set_hl(ns_id, "rustBoxPlacementBalance",    { link = "AumPunctuationPri" })
set_hl(ns_id, "rustFoldBraces",             { link = "AumPunctuationPri" })
set_hl(ns_id, "rustCommentLineDoc",         { link = "AumCommentSpecial" })
set_hl(ns_id, "rustIdentifier",             { link = "AumIdentifier" })
set_hl(ns_id, "rustKeyword",                { link = "AumKeywordFunction" })
set_hl(ns_id, "rustModPath",                { link = "AumModule" })
set_hl(ns_id, "rustModPathSep",             { link = "AumPunctuationPri" })
set_hl(ns_id, "rustType",                   { link = "AumType" })
set_hl(ns_id, "rustTypeDef",                { link = "AumTypeDef" })
set_hl(ns_id, "rustTrait",                  { link = "AumType" })
set_hl(ns_id, "rustString",                 { link = "AumString" })
set_hl(ns_id, "rustStorage",                { link = "AumKeywordStorage" })
set_hl(ns_id, "rustFuncName",               { link = "AumFunction" })
set_hl(ns_id, "rustFuncCall",               { link = "AumFunctionCall" })
set_hl(ns_id, "rustMacro",                  { link = "AumFunctionMacro" })
set_hl(ns_id, "rustAssert",                 { link = "AumFunctionMacro" })
set_hl(ns_id, "rustStructure",              { link = "AumStructure" })
set_hl(ns_id, "rustOperator",               { link = "AumOperator" })
set_hl(ns_id, "rustSigil",                  { link = "AumOperator" })
set_hl(ns_id, "rustArrowCharacter",         { link = "AumOperator" })
set_hl(ns_id, "rustDecNumber",              { link = "AumNumber" })
set_hl(ns_id, "rustHexNumber",              { link = "AumNumber" })
set_hl(ns_id, "rustLifetime",               { link = "AumStorageClassLifetime" })

-- |> Rust.vim
-- Rust => Operator
set_hl(ns_id, "rsOperator",             { link = "AumOperator" })
set_hl(ns_id, "rsAs",                   { link = "AumKeywordAs" })
-- Rust => Primitives
set_hl(ns_id, "rsNumber",               { link = "AumNumber" })
set_hl(ns_id, "rsFloat",                { link = "AumFloat" })
set_hl(ns_id, "rsString",               { link = "AumString" })
set_hl(ns_id, "rsCharacter",            { link = "AumCharacter" })
set_hl(ns_id, "rsAttribute",            { link = "AumAttribute" })
set_hl(ns_id, "rsField",                { link = "AumField" })
set_hl(ns_id, "rsProperty",             { link = "AumProperty" })
set_hl(ns_id, "rsUse",                  { link = "AumInclude" })
set_hl(ns_id, "rsModule",               { link = "AumModule" })
set_hl(ns_id, "rsNamespace",            { link = "AumNamespace" })
-- Rust => Keywords
set_hl(ns_id, "rsLet",                  { link = "AumKeywordLet" })
set_hl(ns_id, "rsMut",                  { link = "AumKeywordMut" })
set_hl(ns_id, "rsConst",                { link = "AumKeywordConst" })
set_hl(ns_id, "rsFn",                   { link = "AumKeywordFunction" })
set_hl(ns_id, "rsReturn",               { link = "AumKeywordReturn" })
set_hl(ns_id, "rsContinue",             { link = "AumKeywordContinue" })
set_hl(ns_id, "rsBreak",                { link = "AumKeywordBreak" })
set_hl(ns_id, "rsSelfValue",            { link = "AumKeywordSelf" })
set_hl(ns_id, "rsUnsafe",               { link = "AumKeywordUnsafe" })
-- Rust => Control Flow
set_hl(ns_id, "rsIf",                   { link = "AumIf" })
set_hl(ns_id, "rsElseIf",               { link = "AumElseIf" })
set_hl(ns_id, "rsElse",                 { link = "AumElse" })
set_hl(ns_id, "rsMatch",                { link = "AumLabel" })
set_hl(ns_id, "rsRepeat",               { link = "AumRepeat" })
set_hl(ns_id, "rsFor",                  { link = "AumFor" })
set_hl(ns_id, "rsIn",                   { link = "AumIn" })
-- Rust => Declaration / Definitions
set_hl(ns_id, "rsIdentDef",             { link = "AumIdentifierDef" })
set_hl(ns_id, "rsUserIdent",            { link = "AumUserIdent" })
set_hl(ns_id, "rsUnusedIdentDef",       { link = "AumUnusedUserIdent" })
-- Rust => Functions / Methods / Macros
set_hl(ns_id, "rsFuncDef",              { link = "AumFunctionDef" })
set_hl(ns_id, "rsLibraryFunc",          { link = "AumLibraryFunction" })
set_hl(ns_id, "rsMethod",               { link = "AumMethod" })
set_hl(ns_id, "rsUserMethod",           { link = "AumUserMethod" })
set_hl(ns_id, "rsLibraryMethod",        { link = "AumLibraryMethod" })
set_hl(ns_id, "rsMacro",                { link = "AumMacro" })
set_hl(ns_id, "rsUserMacro",            { link = "AumUserMacro" })
set_hl(ns_id, "rsLibraryMacro",         { link = "AumLibraryMacro" })
-- Rust => Types / Structs / Enums / Traits
set_hl(ns_id, "rsType",                 { link = "AumType" })
set_hl(ns_id, "rsTypeDef",              { link = "AumTypeDef" })
set_hl(ns_id, "rsTypeAlias",            { link = "AumTypeAlias" })
set_hl(ns_id, "rsUserType",             { link = "AumUserType" })
set_hl(ns_id, "rsLibraryType",          { link = "AumLibraryType" })
set_hl(ns_id, "rsForeignType",          { link = "AumForeignType" })
-- Rust => Comment
set_hl(ns_id, "rsComment",              { link = "AumComment" })
set_hl(ns_id, "rsDocComment",           { link = "AumCommentSpecial" })
-- Rust => Note / Todo / Fixme
set_hl(ns_id, "rsCommentNote",          { link = "AumNote" })
set_hl(ns_id, "rsCommentDone",          { link = "AumDone" })
set_hl(ns_id, "rsCommentTodo",          { link = "AumTodo" })
set_hl(ns_id, "rsCommentFixme",         { link = "AumFixMe" })
-- Rust => Delimiters                   ( TODO )
set_hl(ns_id, "rsNoise",                { link = "Noise" })
set_hl(ns_id, "rsComma",                { link = "AumDelimiter" })
set_hl(ns_id, "rsParen",                { link = "AumParen" })
set_hl(ns_id, "rsParens",               { link = "AumParens" })
set_hl(ns_id, "rsBracket",              { link = "AumBracket" })
set_hl(ns_id, "rsBrackets",             { link = "AumBrackets" })
set_hl(ns_id, "rsBrace",                { link = "AumBrace" })
set_hl(ns_id, "rsBraces",               { link = "AumBraces" })

-- |> Fish
set_hl(ns_id, "fishKeyword",            { link = "AumKeyword" })
set_hl(ns_id, "fishOperator",           { link = "AumOperator" })
set_hl(ns_id, "fishNot",                { link = "AumOperator" })
set_hl(ns_id, "fishKeywordAndOr",       { link = "AumOperator" })
set_hl(ns_id, "fishSubscript",          { link = "AumNumber" })
set_hl(ns_id, "fishCommand",            { link = "AumFunction" })
set_hl(ns_id, "fishCommandSub",         { link = "AumFunctionBuiltin" })
set_hl(ns_id, "fishParameter",          { link = "AumParameter" })
set_hl(ns_id, "fishOption",             { link = "AumType" })
set_hl(ns_id, "fishVariable",           { link = "AumVariable" })
set_hl(ns_id, "fishInnerVariable",      { link = "AumIdentifier" })
set_hl(ns_id, "fishKeywordIf",          { link = "AumConditional" })
set_hl(ns_id, "fishPipe",               { link = "AumOperator" })
set_hl(ns_id, "fishRedirection",        { link = "AumOperator" })
set_hl(ns_id, "fishRedirectionTarget",  { link = "AumPreproc" })
set_hl(ns_id, "fishBackgroundJob",      { link = "AumOperator" })
set_hl(ns_id, "fishSelectStatement",    { link = "AumStatement" })
set_hl(ns_id, "fishQuote",              { link = "AumString" })
set_hl(ns_id, "fishCharacter",          { link = "AumCharacter" })
set_hl(ns_id, "fishComment",            { link = "AumComment" })
set_hl(ns_id, "fishTodo",               { link = "AumTodo" })

-- |> Markdown
set_hl(ns_id, "lsp_markdown1",          { link = "AumNormalPri" })
set_hl(ns_id, "lsp_markdown2",          { link = "AumNormalPri" })
set_hl(ns_id, "lsp_markdown3",          { link = "AumNormalPri" })
set_hl(ns_id, "lsp_markdown4",          { link = "AumNormalPri" })
set_hl(ns_id, "lsp_markdown5",          { link = "AumNormalPri" })
set_hl(ns_id, "lsp_markdown6",          { link = "AumNormalPri" })
set_hl(ns_id, "lsp_markdown7",          { link = "AumNormalPri" })
set_hl(ns_id, "lsp_markdown8",          { link = "AumNormalPri" })
set_hl(ns_id, "lsp_markdown9",          { link = "AumNormalPri" })
set_hl(ns_id, "lsp_markdown10",         { link = "AumNormalPri" })
set_hl(ns_id, "markdownCode",           { link = "AumTypeBuiltin" })
set_hl(ns_id, "markdownUrl",            { link = "AumUnderlined" })
set_hl(ns_id, "markdownLink",           { link = "AumUnderlined" })
set_hl(ns_id, "markdownLinkText",       { link = "AumReference" })
set_hl(ns_id, "markdownLinkDelimiter",  { link = "AumPunctuationPri" })
set_hl(ns_id, "htmlH1",                 { link = "MarkdownH1" })
set_hl(ns_id, "htmlH2",                 { link = "MarkdownH2" })
set_hl(ns_id, "htmlH3",                 { link = "MarkdownH3" })
set_hl(ns_id, "htmlH4",                 { link = "MarkdownH4" })
set_hl(ns_id, "htmlH5",                 { link = "MarkdownH5" })
set_hl(ns_id, "htmlH6",                 { link = "MarkdownH6" })
set_hl(ns_id, "mkdHeading",             { link = "AumPunctuationTer" })
set_hl(ns_id, "mkdNonListItemBlock",    { link = "AumNormalPri" })
set_hl(ns_id, "mkdListItem",            { link = "AumPunctuationSec" })
set_hl(ns_id, "mkdListItemLine",        { link = "AumNormalPri" })
set_hl(ns_id, "mkdCode",                { link = "AumIdentifier" })
set_hl(ns_id, "mkdCodeDelimiter",       { link = "AumPunctuationSec" })
set_hl(ns_id, "mkdLink",                { link = "AumUnderlined" })
set_hl(ns_id, "markdownLinkTextDelimiter",      { link = "AumPunctuationPri" })


-- #######################################################
-- ##           - Treesitter Highlight Groups -         ##
-- #######################################################

-- |> Treesitter: Rust
set_hl(ns_id, "@comment.rust",                      { link = "AumComment" })
set_hl(ns_id, "@comment.documentation.rust",        { link = "AumCommentSpecial" })
set_hl(ns_id, "@boolean.rust",                      { link = "AumBoolean" })
set_hl(ns_id, "@number.rust",                       { link = "AumNumber" })
set_hl(ns_id, "@number.float.rust",                 { link = "AumFloat" })
set_hl(ns_id, "@operator.rust",                     { link = "AumOperator" })
set_hl(ns_id, "@variable.rust",                     { link = "AumVariable" })
set_hl(ns_id, "@variable.member.rust",              { link = "AumField" })
set_hl(ns_id, "@variable.parameter.rust",           { link = "AumParameter" })
set_hl(ns_id, "@constant.builtin.rust",             { link = "AumConstantBuiltin" })
set_hl(ns_id, "@character.rust",                    { link = "AumCharacter" })
set_hl(ns_id, "@string.rust",                       { link = "AumString" })
set_hl(ns_id, "@string.escape.rust",                { link = "AumCharacterSpecial" })
set_hl(ns_id, "@keyword.rust",                      { link = "AumKeyword" })
set_hl(ns_id, "@keyword.function.rust",             { link = "AumKeywordFunction" })
set_hl(ns_id, "@keyword.conditional.rust",          { link = "AumKeywordConditional" })
set_hl(ns_id, "@keyword.operator.rust",             { link = "AumKeywordOperator" })
set_hl(ns_id, "@keyword.storage.rust",              { link = "AumKeywordStorage" })             -- Probably removed from Treesitter, so can be removed from here, though having it here should not really cause any issues.
set_hl(ns_id, "@keyword.storage.lifetime.rust",     { link = "AumStorageClassLifetime" })       -- Probably removed from Treesitter, so can be removed from here, though having it here should not really cause any issues.
set_hl(ns_id, "@keyword.repeat.rust",               { link = "AumRepeat" })
set_hl(ns_id, "@keyword.coroutine.rust",            { link = "AumKeywordCoroutine" })
set_hl(ns_id, "@keyword.return.rust",               { link = "AumKeywordReturn" })
set_hl(ns_id, "@keyword.modifier.rust",             { link = "AumKeywordStorage" })
set_hl(ns_id, "@function.rust",                     { link = "AumFunction" })
set_hl(ns_id, "@function.call.rust",                { link = "AumFunctionCall" })
set_hl(ns_id, "@function.macro.rust",               { link = "AumFunctionMacro" })
set_hl(ns_id, "@type.rust",                         { link = "AumType" })
set_hl(ns_id, "@type.builtin.rust",                 { link = "AumTypeBuiltin" })
set_hl(ns_id, "@type.qualifier.rust",               { link = "AumTypeQualifier" })      -- Probably removed from Treesitter, so can be removed from here, though having it here should not really cause any issues.
set_hl(ns_id, "@keyword.import.rust",               { link = "AumInclude" })
set_hl(ns_id, "@module.rust",                       { link = "AumModule" })
set_hl(ns_id, "@conditional.rust",                  { link = "AumConditional" })
set_hl(ns_id, "@keyword.conditional.rust",          { link = "AumConditional" })
set_hl(ns_id, "@punctuation.delimiter.rust",        { link = "AumDelimiter" })
set_hl(ns_id, "@punctuation.bracket.rust",          { link = "AumPunctuationSec" })

-- |> Treesitter: Lua       ( TODO )
-- todo


-- ###############################################
-- ##           - Neorg (Treesitter) -          ##
-- ###############################################

-- Conceal
set_hl(ns_id, "@conceal.norg",                          { link = "AumConceal" })

-- Headings
set_hl(ns_id, "@neorg.headings.1.prefix",               { link = "AumHeading1" })
set_hl(ns_id, "@neorg.headings.1.prefix.norg",          { link = "AumHeading1" })
set_hl(ns_id, "@neorg.headings.1.title",                { link = "AumHeading1" })
set_hl(ns_id, "@neorg.headings.1.title.norg",           { link = "AumHeading1" })
set_hl(ns_id, "@neorg.headings.2.prefix",               { link = "AumHeading2" })
set_hl(ns_id, "@neorg.headings.2.prefix.norg",          { link = "AumHeading2" })
set_hl(ns_id, "@neorg.headings.2.title",                { link = "AumHeading2" })
set_hl(ns_id, "@neorg.headings.2.title.norg",           { link = "AumHeading2" })
set_hl(ns_id, "@neorg.headings.3.prefix",               { link = "AumHeading3" })
set_hl(ns_id, "@neorg.headings.3.prefix.norg",          { link = "AumHeading3" })
set_hl(ns_id, "@neorg.headings.3.title",                { link = "AumHeading3" })
set_hl(ns_id, "@neorg.headings.3.title.norg",           { link = "AumHeading3" })
set_hl(ns_id, "@neorg.headings.4.prefix",               { link = "AumHeading4" })
set_hl(ns_id, "@neorg.headings.4.prefix.norg",          { link = "AumHeading4" })
set_hl(ns_id, "@neorg.headings.4.title",                { link = "AumHeading4" })
set_hl(ns_id, "@neorg.headings.4.title.norg",           { link = "AumHeading4" })
set_hl(ns_id, "@neorg.headings.5.prefix",               { link = "AumHeading5" })
set_hl(ns_id, "@neorg.headings.5.prefix.norg",          { link = "AumHeading5" })
set_hl(ns_id, "@neorg.headings.5.title",                { link = "AumHeading5" })
set_hl(ns_id, "@neorg.headings.5.title.norg",           { link = "AumHeading5" })
set_hl(ns_id, "@neorg.headings.6.prefix",               { link = "AumHeading6" })
set_hl(ns_id, "@neorg.headings.6.prefix.norg",          { link = "AumHeading6" })
set_hl(ns_id, "@neorg.headings.6.title",                { link = "AumHeading6" })
set_hl(ns_id, "@neorg.headings.6.title.norg",           { link = "AumHeading6" })

-- Unordered List
set_hl(ns_id, "@neorg.lists.unordered.1.prefix",        { link = "AumPunctuationPri" })
set_hl(ns_id, "@neorg.lists.unordered.1.prefix.norg",   { link = "AumPunctuationPri" })
set_hl(ns_id, "@neorg.lists.unordered.1.content",       { link = "AumNormalPri" })
set_hl(ns_id, "@neorg.lists.unordered.1.content.norg",  { link = "AumNormalPri" })
set_hl(ns_id, "@neorg.lists.unordered.2.prefix",        { link = "AumPunctuationSec" })
set_hl(ns_id, "@neorg.lists.unordered.2.prefix.norg",   { link = "AumPunctuationSec" })
set_hl(ns_id, "@neorg.lists.unordered.2.content",       { link = "AumNormalDimmed1" })
set_hl(ns_id, "@neorg.lists.unordered.2.content.norg",  { link = "AumNormalDimmed1" })
set_hl(ns_id, "@neorg.lists.unordered.3.prefix",        { link = "AumPunctuationSec" })
set_hl(ns_id, "@neorg.lists.unordered.3.prefix.norg",   { link = "AumPunctuationSec" })
set_hl(ns_id, "@neorg.lists.unordered.3.content",       { link = "AumNormalDimmed2" })
set_hl(ns_id, "@neorg.lists.unordered.3.content.norg",  { link = "AumNormalDimmed2" })
set_hl(ns_id, "@neorg.lists.unordered.4.prefix",        { link = "AumPunctuationSec" })
set_hl(ns_id, "@neorg.lists.unordered.4.prefix.norg",   { link = "AumPunctuationSec" })
set_hl(ns_id, "@neorg.lists.unordered.4.content",       { link = "AumNormalDimmed3" })
set_hl(ns_id, "@neorg.lists.unordered.4.content.norg",  { link = "AumNormalDimmed3" })
set_hl(ns_id, "@neorg.lists.unordered.5.prefix",        { link = "AumPunctuationTer" })
set_hl(ns_id, "@neorg.lists.unordered.5.prefix.norg",   { link = "AumPunctuationTer" })
set_hl(ns_id, "@neorg.lists.unordered.5.content",       { link = "AumNormalDimmed4" })
set_hl(ns_id, "@neorg.lists.unordered.5.content.norg",  { link = "AumNormalDimmed4" })
set_hl(ns_id, "@neorg.lists.unordered.6.prefix",        { link = "AumPunctuationTer" })
set_hl(ns_id, "@neorg.lists.unordered.6.prefix.norg",   { link = "AumPunctuationTer" })
set_hl(ns_id, "@neorg.lists.unordered.6.content",       { link = "AumNormalDimmed5" })
set_hl(ns_id, "@neorg.lists.unordered.6.content.norg",  { link = "AumNormalDimmed5" })

-- Ordered List
set_hl(ns_id, "@neorg.lists.ordered.1.prefix.norg",   { link = "AumPunctuationPri" })
set_hl(ns_id, "@neorg.lists.ordered.1.content.norg",  { link = "AumNormalPri" })
set_hl(ns_id, "@neorg.lists.ordered.2.prefix.norg",   { link = "AumPunctuationSec" })
set_hl(ns_id, "@neorg.lists.ordered.2.content.norg",  { link = "AumNormalDimmed1" })
set_hl(ns_id, "@neorg.lists.ordered.3.prefix.norg",   { link = "AumPunctuationSec" })
set_hl(ns_id, "@neorg.lists.ordered.3.content.norg",  { link = "AumNormalDimmed2" })
set_hl(ns_id, "@neorg.lists.ordered.4.prefix.norg",   { link = "AumPunctuationSec" })
set_hl(ns_id, "@neorg.lists.ordered.4.content.norg",  { link = "AumNormalDimmed3" })
set_hl(ns_id, "@neorg.lists.ordered.5.prefix.norg",   { link = "AumPunctuationTer" })
set_hl(ns_id, "@neorg.lists.ordered.5.content.norg",  { link = "AumNormalDimmed4" })
set_hl(ns_id, "@neorg.lists.ordered.6.prefix.norg",   { link = "AumPunctuationTer" })
set_hl(ns_id, "@neorg.lists.ordered.6.content.norg",  { link = "AumNormalDimmed5" })

-- Links
set_hl(ns_id, "@neorg.links.description.norg",                  { link = "AumUnderlined" })
set_hl(ns_id, "@neorg.links.location.url.norg",                 { link = "AumReference" })

-- Inline Comment
set_hl(ns_id, "@neorg.markup.inline_comment",                   { link = "AumComment" })
set_hl(ns_id, "@neorg.markup.inline_comment.norg",              { link = "AumComment" })
set_hl(ns_id, "@neorg.markup.inline_comment.delimiter",         { link = "AumWhitespace" })
set_hl(ns_id, "@neorg.markup.inline_comment.delimiter.norg",    { link = "AumWhitespace" })

-- Verbatim
set_hl(ns_id, "@neorg.markup.verbatim",                         { link = "AumTypeBuiltin" })
set_hl(ns_id, "@neorg.markup.verbatim.norg",                    { link = "AumTypeBuiltin" })

-- Quotes
set_hl(ns_id, "@neorg.quotes.1.prefix",                         { link = "AumCharacter" })
set_hl(ns_id, "@neorg.quotes.1.prefix.norg",                    { link = "AumCharacter" })
set_hl(ns_id, "@neorg.quotes.1.content",                        { link = "AumStringAlt" })
set_hl(ns_id, "@neorg.quotes.1.content.norg",                   { link = "AumStringAlt" })
set_hl(ns_id, "@neorg.quotes.2.prefix",                         { link = "AumCharacter" })
set_hl(ns_id, "@neorg.quotes.2.prefix.norg",                    { link = "AumCharacter" })
set_hl(ns_id, "@neorg.quotes.2.content",                        { link = "AumStringAlt" })
set_hl(ns_id, "@neorg.quotes.2.content.norg",                   { link = "AumStringAlt" })
set_hl(ns_id, "@neorg.quotes.3.prefix",                         { link = "AumCharacter" })
set_hl(ns_id, "@neorg.quotes.3.prefix.norg",                    { link = "AumCharacter" })
set_hl(ns_id, "@neorg.quotes.3.content",                        { link = "AumStringAlt" })
set_hl(ns_id, "@neorg.quotes.3.content.norg",                   { link = "AumStringAlt" })
set_hl(ns_id, "@neorg.quotes.4.prefix",                         { link = "AumCharacter" })
set_hl(ns_id, "@neorg.quotes.4.prefix.norg",                    { link = "AumCharacter" })
set_hl(ns_id, "@neorg.quotes.4.content",                        { link = "AumStringAlt" })
set_hl(ns_id, "@neorg.quotes.4.content.norg",                   { link = "AumStringAlt" })
set_hl(ns_id, "@neorg.quotes.5.prefix",                         { link = "AumCharacter" })
set_hl(ns_id, "@neorg.quotes.5.prefix.norg",                    { link = "AumCharacter" })
set_hl(ns_id, "@neorg.quotes.5.content",                        { link = "AumStringAlt" })
set_hl(ns_id, "@neorg.quotes.5.content.norg",                   { link = "AumStringAlt" })
set_hl(ns_id, "@neorg.quotes.6.prefix",                         { link = "AumCharacter" })
set_hl(ns_id, "@neorg.quotes.6.prefix.norg",                    { link = "AumCharacter" })
set_hl(ns_id, "@neorg.quotes.6.content",                        { link = "AumStringAlt" })
set_hl(ns_id, "@neorg.quotes.6.content.norg",                   { link = "AumStringAlt" })

-- Tags
set_hl(ns_id, "@neorg.tags.ranged_verbatim.name",                   { link = "AumTypeBuiltin" })
set_hl(ns_id, "@neorg.tags.ranged_verbatim.name.norg",              { link = "AumTypeBuiltin" })
set_hl(ns_id, "@neorg.tags.ranged_verbatim.name.word",              { link = "AumKeyword" })
set_hl(ns_id, "@neorg.tags.ranged_verbatim.name.word.norg",         { link = "AumKeyword" })
set_hl(ns_id, "@neorg.tags.ranged_verbatim.parameters.norg",        { link = "AumParameter" })
set_hl(ns_id, "@neorg.tags.ranged_verbatim.parameters.word.norg",   { link = "AumParameter" })

-- Code Block
-- - NOTE: Foreground color has to be empty to allow code blocks to be colored properly.
set_hl(ns_id, "@neorg.tags.ranged_verbatim.code_block",             { bg = "#000001" })


-- ###################################################
-- ##           - LSP Semantic Tokens  -            ##
-- ###################################################

-- NOTE: Big TODO

-- LSP Types
-- |> Comments
set_hl(ns_id, "@lsp.type.comment",                          { link = "AumComment" })
set_hl(ns_id, "@lsp.mod.documentation",                     { link = "AumCommentSpecial" })
set_hl(ns_id, "@lsp.typemod.comment.documentation",         { link = "AumCommentSpecial" })

-- |> Rust Comments
set_hl(ns_id, "@lsp.type.comment.rust",                     { link = "AumComment" })
set_hl(ns_id, "@lsp.mod.documentation.rust",                { link = "AumCommentSpecial" })
set_hl(ns_id, "@lsp.typemod.comment.documentation.rust",    { link = "AumCommentSpecial" })

set_hl(ns_id, "@lsp.type.operator",                         {})         -- This one is probably too inclusive, and would overwrite unique colors.   (Test)
set_hl(ns_id, "@lsp.type.keyword",                          {})         -- This one is probably too inclusive, and would overwrite unique colors.   (Test)

set_hl(ns_id, "@lsp.type.variable",                         {})         -- This one is too inclusive, and would overwrite unique colors. Best to disable.
set_hl(ns_id, "@lsp.type.property",                         {})         -- TODO: Test.
set_hl(ns_id, "@lsp.type.parameter",                        {})         -- TODO: Test.

set_hl(ns_id, "@lsp.type.namespace",                        {})         -- TODO: Test.

set_hl(ns_id, "@lsp.type.type",                             {})         -- TODO: Test.
set_hl(ns_id, "@lsp.type.typeAlias",                        {})         -- TODO: Test.
set_hl(ns_id, "@lsp.type.typeParameter",                    {})         -- TODO: Test.
set_hl(ns_id, "@lsp.type.builtinType",                      {})         -- TODO: Test.

set_hl(ns_id, "@lsp.type.struct",                           {})         -- TODO: Test.
set_hl(ns_id, "@lsp.type.class",                            {})         -- TODO: Test.
set_hl(ns_id, "@lsp.type.interface",                        {})         -- TODO: Test.

set_hl(ns_id, "@lsp.type.enum",                             {})         -- TODO: Test.
set_hl(ns_id, "@lsp.type.enumMember",                       {})         -- TODO: Test.

set_hl(ns_id, "@lsp.type.function",                         {})         -- TODO: Test.
set_hl(ns_id, "@lsp.type.method",                           {})         -- TODO: Test.
set_hl(ns_id, "@lsp.type.macro",                            {})         -- TODO: Test.
set_hl(ns_id, "@lsp.type.decorator",                        {})         -- TODO: Test.

-- LSP Modifiers
set_hl(ns_id, "@lsp.mod.declaration",                       {})

-- LSP Type-modifiers
set_hl(ns_id, "@lsp.typemod.variable.declaration",          {})
set_hl(ns_id, "@lsp.typemod.typeAlias.declaration",         {})

-- End of File

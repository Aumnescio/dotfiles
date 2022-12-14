-- |> AumneChroma.nvim Theme  --=>><⚡START⚡>[

-- Author: Aumnescio

-- Dark and relatively high contrast truecolor theme.
-- Not just 8 or 16 colors. (Current color count: 48)
-- All colors handpicked. No color processing. No generated colors.
-- Written in Lua, as fast as possible. (Source is of "pre-compiled" form.)
-- Easy to configure, or fork. (2 simple raw files.)

-- Manually configured plugins:
-- => Treesitter
-- => Packer.nvim
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
-- => nvim-ts-rainbow

-- TODO: Plugins to config...
-- => FTerm.nvim
-- => Legendary.nvim

-- Help pages:
-- -> ':help nvim_set_hl'
-- -> ':help highlight-groups'

-- Other highlight group tools:
-- -> 'Telescope highlights' (Requires Telescope.nvim) (Can fuzzy search highlight group names, also shows the color.)
-- -> ':so $VIMRUNTIME/syntax/hitest.vim' (Built in, but takes a while. Very large list of highlight groups.)

-- === |> - Helper vars - <| ===
local set_hl = vim.api.nvim_set_hl  -- Like vimscript 'highlight / hi'.
local ns_id = 0                     -- Global highlight. (Namespace)

-- === |> - Core Colors (Theme) - <| ===
local colors = require("aumnechroma.colors")

-- === |> - Core Groups (Link Groups) - <| ===

-- 'Normal' needs to be defined first.  (Important) [Otherwise background color will break.]
-- => This one ("NONE") might work better with transparent background,
set_hl(ns_id, "Normal",                 { fg = colors.text, bg = "NONE" })                      -- STATE: 9.8/10  -- Good
-- => but if terminal backgrounds matches darkcrust color, it's still transparent if set to darkcrust.
-- set_hl(ns_id, "Normal",                 { fg = colors.text, bg = colors.darkcrust })            -- STATE: 9.8/10  -- Good
-- set_hl(ns_id, "Normal",                 { fg = colors.text, bg = colors.crust })                -- STATE: 9.3/10

-- Cursor
set_hl(ns_id, "AumCursor",              { fg = colors.night, bg = colors.cursor })              -- STATE: 9.2/10
set_hl(ns_id, "AumCursorLine",          { bg = colors.night })                                  -- STATE: 8.6/10
set_hl(ns_id, "AumCursorColumn",        { bg = colors.night })                                  -- STATE: 8.6/10

-- Base things
set_hl(ns_id, "AumNone",                { fg = "NONE", bg = "NONE" })                           -- STATE: 10/10
set_hl(ns_id, "AumNormalPri",           { fg = colors.text })                                   -- STATE: 9.3/10
set_hl(ns_id, "AumNormalSec",           { fg = colors.heaven })                                 -- STATE: 9.3/10
set_hl(ns_id, "AumNormalTer",           { fg = colors.hail })                                   -- STATE: 9.5/10
set_hl(ns_id, "AumTitle",               { fg = colors.rosewater })                              -- STATE: 9.2/10 ?
set_hl(ns_id, "AumWhitespace",          { fg = colors.ghost })                                  -- STATE: 7.2/10
-- set_hl(ns_id, "AumVisual",              { bg = colors.alloy })                                  -- STATE: 8.8/10 (Plain and simple)
set_hl(ns_id, "AumVisual",              { fg = colors.rouge, bg = colors.dusk, bold = true, italic = true, underline = true })  -- STATE: 9.3/10 (Bit fancy, maybe not for everyone.)
set_hl(ns_id, "AumPmenu",               { link = "AumNormalTer" })                              -- STATE: 9.5/10
set_hl(ns_id, "AumBorderBase",          { fg = colors.plum })                                   -- STATE: 9.6/10
set_hl(ns_id, "AumMatch",               { fg = colors.amber, underline = true })                -- STATE: 9.7/10
set_hl(ns_id, "AumLineNumberActive",    { fg = colors.hail })                                   -- STATE: 9.0/10
set_hl(ns_id, "AumLineNumberInactive",  { fg = colors.comment })                                -- STATE: 9.0/10

-- Diagnostics
set_hl(ns_id, "AumWarning",             { fg = colors.peach })                                  -- STATE: 9.0/10
set_hl(ns_id, "AumError",               { fg = colors.crimson })                                -- STATE: 9.0/10

-- Code text objects
set_hl(ns_id, "AumStringBase",          { fg = colors.sage })                                   -- STATE: 9.8/10
set_hl(ns_id, "AumCharacterBase",       { fg = colors.moss })                                   -- STATE: 9.7/10
set_hl(ns_id, "AumNumberBase",          { fg = colors.coral })                                  -- STATE: 8.9/10
set_hl(ns_id, "AumBooleanBase",         { fg = colors.orange, bold = true })                    -- STATE: 9.9/10
set_hl(ns_id, "AumOperatorBase",        { fg = colors.red })                                    -- STATE: 9.9/10
set_hl(ns_id, "AumConditionalBase",     { fg = colors.magenta, italic = true })                 -- STATE: ?
set_hl(ns_id, "AumRepeatBase",          { fg = colors.cobalt, italic = true, bold = true })     -- STATE: ?
set_hl(ns_id, "AumKeywordBase",         { fg = colors.mauve, bold = true })                     -- STATE: 9.2/10
set_hl(ns_id, "AumKeywordOperator",     { fg = colors.rose, bold = true })                      -- STATE: 8.8/10
set_hl(ns_id, "AumKeywordFunction",     { fg = colors.plum, italic = true, bold = true })       -- STATE: 9.0/10
set_hl(ns_id, "AumKeywordReturn",       { fg = colors.lilac, bold = true })                     -- STATE: 9.0/10
set_hl(ns_id, "AumVariableBase",        { fg = colors.hail })                                   -- STATE: 9.8/10
set_hl(ns_id, "AumVariableBuiltin",     { fg = colors.hail, bold = true })                      -- STATE: 9.4/10
set_hl(ns_id, "AumIdentifierBase",      { fg = colors.pink })                                   -- STATE: ?
set_hl(ns_id, "AumStatementBase",       { fg = colors.green })                                  -- STATE: ?
set_hl(ns_id, "AumExceptionBase",       { fg = colors.rouge })                                  -- STATE: ?
set_hl(ns_id, "AumConstantBase",        { fg = colors.rosewater, bold = true })                 -- STATE: WIP
set_hl(ns_id, "AumFieldBase",           { fg = colors.azure, bold = false })                    -- STATE: 9.9/10
set_hl(ns_id, "AumPropertyBase",        { fg = colors.blue })                                   -- STATE: 9.0/10
set_hl(ns_id, "AumTypeBase",            { fg = colors.sea, bold = true })                       -- STATE: 9.0/10
set_hl(ns_id, "AumTypeBuiltin",         { fg = colors.sea, bold = false })                      -- STATE: 9.0/10
set_hl(ns_id, "AumStructureBase",       { fg = colors.yellow })                                 -- STATE: ?
set_hl(ns_id, "AumFunctionBase",        { fg = colors.marigold, bold = true })                  -- STATE: 9.3/10
set_hl(ns_id, "AumFunctionCall",        { fg = colors.valencia })                               -- STATE: 8.8/10
set_hl(ns_id, "AumFunctionMacro",       { fg = colors.rosy })                                   -- STATE: 8.2/10
-- set_hl(ns_id, "AumParameterBase",       { fg = colors.amber })                                  -- STATE: 9.2/10 (Good, but now the same as AumMatch)
set_hl(ns_id, "AumParameterBase",       { fg = colors.apricot })                                -- STATE: 9.0/10 (Testing)
set_hl(ns_id, "AumPreprocBase",         { fg = colors.titian })                                 -- STATE: 8.2/10
set_hl(ns_id, "AumIncludeBase",         { fg = colors.flamingo })                               -- STATE: 9.0/10
set_hl(ns_id, "AumNamespaceBase",       { fg = colors.lavender })                               -- STATE: ?
set_hl(ns_id, "AumTagPri",              { fg = colors.plum })                                   -- STATE: 9.0/10
set_hl(ns_id, "AumTagSec",              { fg = colors.mauve })                                  -- STATE: 8.8/10
set_hl(ns_id, "AumTagAttributeBase",    { link = "AumFieldBase" })                              -- STATE: ? (TODO)
set_hl(ns_id, "AumPunctuationPri",      { fg = colors.sky })    -- Delimiters                   -- STATE: 9.2/10
set_hl(ns_id, "AumPunctuationSec",      { fg = colors.ceru })   -- Brackets                     -- STATE: 9.0/10'ish
set_hl(ns_id, "AumPunctuationTer",      { fg = colors.teal })   -- Constructors                 -- STATE: 9.0/10'ish
set_hl(ns_id, "AumRainbowBracket1",     { fg = colors.cyan })                                   -- STATE: ?
set_hl(ns_id, "AumRainbowBracket2",     { fg = colors.ceru })                                   -- STATE: ?
set_hl(ns_id, "AumRainbowBracket3",     { fg = colors.sky })                                    -- STATE: ?
set_hl(ns_id, "AumRainbowBracket4",     { fg = colors.teal })                                   -- STATE: ?
set_hl(ns_id, "AumRainbowBracket5",     { fg = colors.cyan })                                   -- STATE: ?
set_hl(ns_id, "AumRainbowBracket6",     { fg = colors.ceru })                                   -- STATE: ?
set_hl(ns_id, "AumRainbowBracket7",     { fg = colors.sky })                                    -- STATE: ?
set_hl(ns_id, "AumSpecial",             { fg = colors.titian })                                 -- STATE: 8.8/10
-- set_hl(ns_id, "AumReference",           { fg = colors.lilac })                                  -- STATE: 9.1/10 (Not sure, looks weak in html)
set_hl(ns_id, "AumReference",           { fg = colors.linkblue })                               -- STATE: 9.3/10
set_hl(ns_id, "AumCommentBase",         { fg = colors.comment })                                -- STATE: 9.8/10

-- Cursor
set_hl(ns_id, "Cursor",                 { link = "AumCursor" })
set_hl(ns_id, "TermCursor",             { link = "AumCursor" })
set_hl(ns_id, "CursorLine",             { link = "AumCursorLine" })
set_hl(ns_id, "CursorColumn",           { link = "AumCursorColumn" })
-- NOTE: Can get overwritten by Terminal cursor settings.

-- NonText
set_hl(ns_id, "NonText",                { link = "AumWhitespace" })
set_hl(ns_id, "Whitespace",             { link = "AumWhitespace" })
set_hl(ns_id, "None",                   { link = "AumNormalPri" })
set_hl(ns_id, "@none",                  { link = "AumNormalPri" })
set_hl(ns_id, "NormalNC",               { link = "AumNormalPri" })
set_hl(ns_id, "SignColumn",             { link = "AumNormalPri" })
set_hl(ns_id, "ColorColumn",            { link = "AumNormalSec" })

-- Text
set_hl(ns_id, "text",                   { link = "AumNormalTer" })  -- Or Pri
set_hl(ns_id, "@text",                  { link = "AumNormalTer" })  -- Or Pri
set_hl(ns_id, "text.strong",            { fg = colors.hail, bold = true })
set_hl(ns_id, "@text.strong",           { fg = colors.hail, bold = true })
set_hl(ns_id, "text.emphasis",          { fg = colors.heaven, italic = true })
set_hl(ns_id, "@text.emphasis",         { fg = colors.heaven, italic = true })
set_hl(ns_id, "text.underline",         { fg = colors.heaven, underline = true })
set_hl(ns_id, "@text.underline",        { fg = colors.heaven, underline = true })
set_hl(ns_id, "text.strikethrough",     { fg = colors.heaven, strikethrough = true })
set_hl(ns_id, "@text.strikethrough",    { fg = colors.heaven, strikethrough = true })
set_hl(ns_id, "text.title",             { link = "AumTitle" })
set_hl(ns_id, "@text.title",            { link = "AumTitle" })
set_hl(ns_id, "text.literal",           { link = "AumTypeBuiltin" })
set_hl(ns_id, "@text.literal",          { link = "AumTypeBuiltin" })
set_hl(ns_id, "text.math",              { link = "AumIncludeBase" })
set_hl(ns_id, "@text.math",             { link = "AumIncludeBase" })
set_hl(ns_id, "text.uri",               { link = "AumReference" })
set_hl(ns_id, "@text.uri",              { link = "AumReference" })
set_hl(ns_id, "text.reference",         { link = "AumReference" })
set_hl(ns_id, "@text.reference",        { link = "AumReference" })
set_hl(ns_id, "text.environment",       { link = "AumIdentifierBase" })     -- TODO: Make unique
set_hl(ns_id, "@text.environment",      { link = "AumIdentifierBase" })     -- TODO: Make unique
set_hl(ns_id, "text.environment.name",  { link = "AumFieldBase" })          -- TODO: Make unique
set_hl(ns_id, "@text.environment.name", { link = "AumFieldBase" })          -- TODO: Make unique
set_hl(ns_id, "text.todo",              { bg = colors.yellow, fg = colors.night })  -- TODO: Create AumGroup for this and make all todo use the AumTodo.
set_hl(ns_id, "@text.todo",             { bg = colors.yellow, fg = colors.night })  -- TODO: Create AumGroup for this and make all todo use the AumTodo.
set_hl(ns_id, "text.note",              { bg = colors.yellow, fg = colors.night })  -- TODO: Create AumGroup for this and make all note use the AumNote.
set_hl(ns_id, "@text.note",             { bg = colors.yellow, fg = colors.night })  -- TODO: Create AumGroup for this and make all note use the AumNote.
set_hl(ns_id, "text.warning",           { link = "AumWarning" })
set_hl(ns_id, "@text.warning",          { link = "AumWarning" })
set_hl(ns_id, "text.danger",            { link = "AumError" })
set_hl(ns_id, "@text.danger",           { link = "AumError" })
-- Text.Diff.<Add|Delete>
set_hl(ns_id, "@text.diff.add",         { link = "AumStringBase" })
set_hl(ns_id, "@text.diff.delete",      { link = "AumOperatorBase" })

-- Floating windows
set_hl(ns_id, "NormalFloat",            { link = "AumNormalPri" })
set_hl(ns_id, "FloatBorder",            { link = "AumBorderBase" })
set_hl(ns_id, "FloatShadow",            { link = "AumNone" })
set_hl(ns_id, "FloatShadowThrough",     { link = "AumNone" })

-- Comment
set_hl(ns_id, "comment",                { link = "AumCommentBase" })
set_hl(ns_id, "@comment",               { link = "AumCommentBase" })

-- String (Probably WIP)
set_hl(ns_id, "string",                 { link = "AumStringBase" })
set_hl(ns_id, "@string",                { link = "AumStringBase" })
set_hl(ns_id, "string.escape",          { link = "AumOperatorBase" })
set_hl(ns_id, "@string.escape",         { link = "AumOperatorBase" })
set_hl(ns_id, "string.regex",           { link = "AumPreprocBase" })
set_hl(ns_id, "@string.regex",          { link = "AumPreprocBase" })
set_hl(ns_id, "string.special",         { link = "AumBooleanBase" })
set_hl(ns_id, "@string.special",        { link = "AumBooleanBase" })

-- Character
set_hl(ns_id, "character",              { link = "AumCharacterBase" })
set_hl(ns_id, "@character",             { link = "AumCharacterBase" })
-- Character.special
set_hl(ns_id, "character.special",      { link = "AumOperatorBase" })
set_hl(ns_id, "@character.special",     { link = "AumOperatorBase" })

-- Number
set_hl(ns_id, "number",                 { link = "AumNumberBase" })
set_hl(ns_id, "@number",                { link = "AumNumberBase" })
-- Float
set_hl(ns_id, "float",                  { link = "AumNumberBase" })  -- TODO: Could be made unique
set_hl(ns_id, "@float",                 { link = "AumNumberBase" })  -- TODO: Could be made unique

-- Boolean
set_hl(ns_id, "boolean",                { link = "AumBooleanBase" })
set_hl(ns_id, "@boolean",               { link = "AumBooleanBase" })

-- Variable
set_hl(ns_id, "variable",               { link = "AumVariableBase" })
set_hl(ns_id, "@variable",              { link = "AumVariableBase" })
-- Variable.Builtin
set_hl(ns_id, "variable.builtin",       { link = "AumVariableBuiltin" })
set_hl(ns_id, "@variable.builtin",      { link = "AumVariableBuiltin" })
-- Variable.Global
set_hl(ns_id, "variable.global",        { link = "AumVariableBase" })  -- TODO: Could be made unique.
set_hl(ns_id, "@variable.global",       { link = "AumVariableBase" })  -- TODO: Could be made unique.

-- Constant
set_hl(ns_id, "constant",               { link = "AumConstantBase" })
set_hl(ns_id, "@constant",              { link = "AumConstantBase" })
-- Constant.Builtin
set_hl(ns_id, "constant.builtin",       { link = "AumConstantBase" })  -- TODO: Could be made unique.
set_hl(ns_id, "@constant.builtin",      { link = "AumConstantBase" })  -- TODO: Could be made unique.
-- Constant.Macro
set_hl(ns_id, "constant.macro",         { link = "AumConstantBase" })  -- TODO: Could be made unique.
set_hl(ns_id, "@constant.macro",        { link = "AumConstantBase" })  -- TODO: Could be made unique.

-- Field
set_hl(ns_id, "field",                  { link = "AumFieldBase" })
set_hl(ns_id, "@field",                 { link = "AumFieldBase" })

-- Property
set_hl(ns_id, "property",               { link = "AumPropertyBase" })
set_hl(ns_id, "@property",              { link = "AumPropertyBase" })

-- Attribute
set_hl(ns_id, "attribute",              { link = "AumTagAttributeBase" })  -- TODO: Make unique.
set_hl(ns_id, "@attribute",             { link = "AumTagAttributeBase" })  -- TODO: Make unique.

-- Type
set_hl(ns_id, "type",                   { link = "AumTypeBase" })
set_hl(ns_id, "@type",                  { link = "AumTypeBase" })
set_hl(ns_id, "type.builtin",           { link = "AumTypeBuiltin" })
set_hl(ns_id, "@type.builtin",          { link = "AumTypeBuiltin" })
set_hl(ns_id, "type.definition",        { link = "AumTypeBase" })  -- TODO: Make unique.
set_hl(ns_id, "@type.definition",       { link = "AumTypeBase" })  -- TODO: Make unique.
set_hl(ns_id, "type.qualifier",         { link = "AumTypeBase" })  -- TODO: Make unique.
set_hl(ns_id, "@type.qualifier",        { link = "AumTypeBase" })  -- TODO: Make unique.
set_hl(ns_id, "TypeDef",                { link = "AumTypeBase" })  -- TODO: Make unique.

-- TypeParameter
set_hl(ns_id, "@typeParameter",         { link = "AumTypeBase" })  -- TODO: Make unique.

-- Class
set_hl(ns_id, "@class",                 { link = "AumTypeBase" })  -- TODO: Make unique.

-- Enum
set_hl(ns_id, "@enum",                  { link = "AumTypeBase" })  -- TODO: Make unique.
set_hl(ns_id, "@enumMember",            { link = "AumConstantBase" })  -- TODO: Make unique.

-- Event
set_hl(ns_id, "@event",                 { link = "AumIdentifierBase" })  -- TODO: Make unique.

-- Interface
set_hl(ns_id, "@interface",             { link = "AumIdentifierBase" })  -- TODO: Make unique.

-- Modifier
set_hl(ns_id, "@modifier",              { link = "AumIdentifierBase" })  -- TODO: Make unique.

-- Regexp
set_hl(ns_id, "@regexp",                { link = "AumSpecial" })  -- TODO: Make unique.

-- Decorator
set_hl(ns_id, "@decorator",             { link = "AumIdentifierBase" })  -- TODO: Make unique.

-- Structure
set_hl(ns_id, "struct",                 { link = "AumStructureBase" })
set_hl(ns_id, "@struct",                { link = "AumStructureBase" })
set_hl(ns_id, "structure",              { link = "AumStructureBase" })
set_hl(ns_id, "@structure",             { link = "AumStructureBase" })

-- Operator
set_hl(ns_id, "operator",               { link = "AumOperatorBase" })
set_hl(ns_id, "@operator",              { link = "AumOperatorBase" })

-- Keyword
set_hl(ns_id, "keyword",                { link = "AumKeywordBase" })
set_hl(ns_id, "@keyword",               { link = "AumKeywordBase" })
-- Keyword.Operator
set_hl(ns_id, "keyword.operator",       { link = "AumKeywordOperator" })
set_hl(ns_id, "@keyword.operator",      { link = "AumKeywordOperator" })
-- Keyword.Return
set_hl(ns_id, "keyword.return",         { link = "AumKeywordReturn" })
set_hl(ns_id, "@keyword.return",        { link = "AumKeywordReturn" })
-- Keyword.Function
set_hl(ns_id, "keyword.function",       { link = "AumKeywordFunction" })
set_hl(ns_id, "@keyword.function",      { link = "AumKeywordFunction" })

-- Identifier
set_hl(ns_id, "identifier",             { link = "AumIdentifierBase" })
set_hl(ns_id, "@identifier",            { link = "AumIdentifierBase" })

-- Statement
set_hl(ns_id, "statement",              { link = "AumStatementBase" })
set_hl(ns_id, "@statement",             { link = "AumStatementBase" })

-- Exception
set_hl(ns_id, "exception",              { link = "AumExceptionBase" })
set_hl(ns_id, "@exception",             { link = "AumExceptionBase" })

-- Tag
set_hl(ns_id, "tag",                    { link = "AumTagPri" })
set_hl(ns_id, "@tag",                   { link = "AumTagPri" })
set_hl(ns_id, "_tag",                   { link = "AumTagSec" })
set_hl(ns_id, "@_tag",                  { link = "AumTagSec" })
-- Tag.Attribute
set_hl(ns_id, "tag.attribute",          { link = "AumTagAttributeBase" })
set_hl(ns_id, "@tag.attribute",         { link = "AumTagAttributeBase" })
set_hl(ns_id, "_tag.attribute",         { link = "AumTagAttributeBase" })
set_hl(ns_id, "@_tag.attribute",        { link = "AumTagAttributeBase" })
-- Tag.Delimiter
set_hl(ns_id, "tag.delimiter",          { link = "AumPunctuationPri" })
set_hl(ns_id, "@tag.delimiter",         { link = "AumPunctuationPri" })
set_hl(ns_id, "_tag.delimiter",         { link = "AumPunctuationPri" })
set_hl(ns_id, "@_tag.delimiter",        { link = "AumPunctuationPri" })

-- Punctuation.Delimiter
set_hl(ns_id, "delimiter",              { link = "AumPunctuationPri" })
set_hl(ns_id, "@delimiter",             { link = "AumPunctuationPri" })
set_hl(ns_id, "punctuation.delimiter",  { link = "AumPunctuationPri" })
set_hl(ns_id, "@punctuation.delimiter", { link = "AumPunctuationPri" })
-- Punctuation.Bracket
set_hl(ns_id, "punctuation.bracket",    { link = "AumPunctuationSec" })
set_hl(ns_id, "@punctuation.bracket",   { link = "AumPunctuationSec" })
-- Punctuation.Special
set_hl(ns_id, "punctuation.special",    { link = "AumPunctuationPri" })  -- Could be more unique, but is fine.
set_hl(ns_id, "@punctuation.special",   { link = "AumPunctuationPri" })  -- Could be more unique, but is fine.
-- Rainbow Brackets
set_hl(ns_id, "rainbowcol1",            { link = "AumRainbowBracket1" })
set_hl(ns_id, "rainbowcol2",            { link = "AumRainbowBracket2" })
set_hl(ns_id, "rainbowcol3",            { link = "AumRainbowBracket3" })
set_hl(ns_id, "rainbowcol4",            { link = "AumRainbowBracket4" })
set_hl(ns_id, "rainbowcol5",            { link = "AumRainbowBracket5" })
set_hl(ns_id, "rainbowcol6",            { link = "AumRainbowBracket6" })
set_hl(ns_id, "rainbowcol7",            { link = "AumRainbowBracket7" })

-- Constructor
set_hl(ns_id, "constructor",            { link = "AumPunctuationTer" })
set_hl(ns_id, "@constructor",           { link = "AumPunctuationTer" })

-- Function
set_hl(ns_id, "function",               { link = "AumFunctionBase" })
set_hl(ns_id, "@function",              { link = "AumFunctionBase" })
-- Function.Call
set_hl(ns_id, "function.call",          { link = "AumFunctionCall" })
set_hl(ns_id, "@function.call",         { link = "AumFunctionCall" })
-- Function.Macro
set_hl(ns_id, "function.macro",         { link = "AumFunctionMacro" })
set_hl(ns_id, "@function.macro",        { link = "AumFunctionMacro" })
-- Function.Builtin
set_hl(ns_id, "function.builtin",       { link = "AumTypeBuiltin" })  -- TODO: Create unique group
set_hl(ns_id, "@function.builtin",      { link = "AumTypeBuiltin" })  -- TODO: Create unique group

-- Method
set_hl(ns_id, "method",                 { link = "AumFunctionBase" })  -- TODO: Make unique
set_hl(ns_id, "@method",                { link = "AumFunctionBase" })  -- TODO: Make unique
-- Method
set_hl(ns_id, "method.call",            { link = "AumFunctionCall" })  -- TODO: Make unique
set_hl(ns_id, "@method.call",           { link = "AumFunctionCall" })  -- TODO: Make unique

-- Parameter
set_hl(ns_id, "parameter",              { link = "AumParameterBase" })
set_hl(ns_id, "@parameter",             { link = "AumParameterBase" })
set_hl(ns_id, "Hlargs",                 { link = "AumParameterBase" })

-- Conditional
set_hl(ns_id, "conditional",            { link = "AumConditionalBase" })
set_hl(ns_id, "@conditional",           { link = "AumConditionalBase" })

-- Repeat / Loop
set_hl(ns_id, "repeat",                 { link = "AumRepeatBase" })
set_hl(ns_id, "@repeat",                { link = "AumRepeatBase" })

-- PreProc (TODO: Target more specific groups and set better colors.)
set_hl(ns_id, "preproc",                { link = "AumPreprocBase" })
set_hl(ns_id, "@preproc",               { link = "AumPreprocBase" })

-- Define
set_hl(ns_id, "define",                 { link = "AumPreprocBase" })  -- TODO: Make unique
set_hl(ns_id, "@define",                { link = "AumPreprocBase" })  -- TODO: Make unique

-- Include
set_hl(ns_id, "include",                { link = "AumIncludeBase" })
set_hl(ns_id, "@include",               { link = "AumIncludeBase" })

-- Namespace
set_hl(ns_id, "namespace",              { link = "AumNamespaceBase" })
set_hl(ns_id, "@namespace",             { link = "AumNamespaceBase" })

-- Symbol
set_hl(ns_id, "symbol",                 { link = "AumIncludeBase" })  -- TODO: Make unique
set_hl(ns_id, "@symbol",                { link = "AumIncludeBase" })  -- TODO: Make unique

-- Titles   (STATE: Okay)
set_hl(ns_id, "Title",                  { link = "AumTitle" })
set_hl(ns_id, "@title",                 { link = "AumTitle" })
set_hl(ns_id, "FloatTitle",             { link = "AumTitle" })
set_hl(ns_id, "LspInfoTitle",           { link = "AumTitle" })
-- -- Markdown Headings   (STATE: Okay)
set_hl(ns_id, "MarkdownH1",             { link = "AumTitle" })
set_hl(ns_id, "MarkdownH2",             { fg = colors.mauve })
set_hl(ns_id, "MarkdownH3",             { fg = colors.blue })
set_hl(ns_id, "MarkdownH4",             { fg = colors.yellow })
set_hl(ns_id, "MarkdownH5",             { fg = colors.peach })
set_hl(ns_id, "MarkdownH6",             { fg = colors.sky })

-- Label (TODO)
set_hl(ns_id, "Label",                  { link = "AumTitle" })
set_hl(ns_id, "@label",                 { link = "AumTitle" })

-- Special (TODO)
set_hl(ns_id, "Special",                { link = "AumBooleanBase" })
set_hl(ns_id, "@special",               { link = "AumBooleanBase" })

-- Search
set_hl(ns_id, "Search",                 { fg = colors.night, bg = colors.amber, bold = true })
set_hl(ns_id, "CurSearch",              { fg = colors.night, bg = colors.rouge, bold = true, italic = true })
set_hl(ns_id, "IncSearch",              { fg = colors.night, bg = colors.yellow, bold = true, italic = true })

-- Diagnostics
set_hl(ns_id, "DiagnosticInfo",                     { link = "AumLineNumberActive" })
set_hl(ns_id, "DiagnosticHint",                     { fg = colors.peach, sp = colors.peach, underline = true })
set_hl(ns_id, "Error",                              { link = "AumError" })
set_hl(ns_id, "@error",                             { link = "AumError" })
set_hl(ns_id, "NvimInternalError",                  { link = "AumError" })
set_hl(ns_id, "ErrorMsg",                           { link = "AumError" })
set_hl(ns_id, "DiagnosticError",                    { link = "AumError" })
set_hl(ns_id, "DiagnosticVirtualTextError",         { link = "AumError" })
set_hl(ns_id, "Warning",                            { link = "AumWarning" })
set_hl(ns_id, "WarningMsg",                         { link = "AumWarning" })
set_hl(ns_id, "DiagnosticWarn",                     { link = "AumWarning" })
set_hl(ns_id, "DiagnosticVirtualTextWarn",          { link = "AumWarning" })
set_hl(ns_id, "DiagnosticUnderlineError",           { fg = colors.text, sp = colors.crimson, underline = true })
set_hl(ns_id, "DiagnosticUnderlineWarn",            { fg = colors.text, sp = colors.orange, underline = true })
set_hl(ns_id, "DiagnosticUnderlineInfo",            { fg = colors.text, sp = colors.cyan, underline = true })
set_hl(ns_id, "DiagnosticUnderlineHint",            { fg = colors.text, sp = colors.hail, underline = true })

-- Storageclass
set_hl(ns_id, "storageclass",                       { link = "AumKeywordBase" })  -- TODO: Make unique. (Some bright'ish purple'ish color.)
set_hl(ns_id, "@storageclass",                      { link = "AumKeywordBase" })  -- TODO: Make unique. (Some bright'ish purple'ish color.)
-- Storageclass.Lifetime
set_hl(ns_id, "storageclass.lifetime",              { link = "AumCharacterBase" })  -- TODO: Make unique.
set_hl(ns_id, "@storageclass.lifetime",             { link = "AumCharacterBase" })  -- TODO: Make unique.

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

-- Trouble.nvim (Okay, but TODO/WIP)
set_hl(ns_id, "TroubleNormal",                      { link = "AumNormalSec" })
set_hl(ns_id, "TroubleText",                        { link = "AumNormalPri" })
set_hl(ns_id, "TroublePreview",                     { link = "AumExceptionBase" })
set_hl(ns_id, "TroubleLocation",                    { link = "AumVariableBase" })
set_hl(ns_id, "TroubleIndent",                      { link = "AumIdentifierBase" })
set_hl(ns_id, "TroubleCount",                       { link = "AumNumberBase" })
set_hl(ns_id, "TroubleSource",                      { link = "AumStructureBase" })
set_hl(ns_id, "TroubleCode",                        { link = "AumParameterBase" })
set_hl(ns_id, "TroubleFile",                        { link = "AumKeywordBase" })
set_hl(ns_id, "TroubleFoldIcon",                    { link = "AumCommentBase" })
set_hl(ns_id, "TroubleError",                       { link = "AumError" })
set_hl(ns_id, "TroubleWarning",                     { link = "AumWarning" })
set_hl(ns_id, "TroubleHint",                        { link = "AumStringBase" })
set_hl(ns_id, "TroubleInformation",                 { link = "AumNormalPri" })
set_hl(ns_id, "TroubleTextError",                   { link = "AumError" })
set_hl(ns_id, "TroubleTextWarning",                 { link = "AumWarning" })
set_hl(ns_id, "TroubleTextHint",                    { link = "AumStringBase" })
set_hl(ns_id, "TroubleTextInformation",             { link = "AumNormalPri" })
set_hl(ns_id, "TroubleSignError",                   { link = "AumError" })
set_hl(ns_id, "TroubleSignWarning",                 { link = "AumWarning" })
set_hl(ns_id, "TroubleSignHint",                    { link = "AumStringBase" })
set_hl(ns_id, "TroubleSignInformation",             { link = "AumNormalPri" })
set_hl(ns_id, "TroubleSignOther",                   { link = "AumNormalSec" })

-- Nvim.cmp (Okay, but TODO/WIP)
-- NOTE: The custom groups need to be configured in nvim-cmp setup => winhighlight groups.
-- START: Custom Groups
set_hl(ns_id, "CmpNormal",                          { link = "AumFieldBase" })      -- STATE: Good
set_hl(ns_id, "CmpFloatBorder",                     { link = "AumBorderBase" })     -- STATE: Good
set_hl(ns_id, "CmpCursorLine",                      { link = "AumMatch" })          -- STATE: Good
set_hl(ns_id, "CmpPmenu",                           { link = "AumPmenu" })          -- STATE: Might not do anything.
set_hl(ns_id, "CmpSearch",                          { link = "Search" })            -- STATE: Might not do anything.

set_hl(ns_id, "CmpDocNormal",                       { link = "AumNormalTer" })      -- STATE: Good
set_hl(ns_id, "CmpDocFloatBorder",                  { link = "AumBorderBase" })     -- STATE: Good
set_hl(ns_id, "CmpDocCursorLine",                   { link = "AumCursorLine" })     -- STATE: Good
set_hl(ns_id, "CmpDocComment",                      { fg = colors.sea })            -- STATE: Good
set_hl(ns_id, "CmpDocSearch",                       { link = "Search" })            -- STATE: Good
set_hl(ns_id, "CmpDocPmenu",                        { link = "AumPmenu" })          -- STATE: Might not do anything.
-- END: Custom Groups

set_hl(ns_id, "CmpItemMenu",                        { fg = colors.plum })
set_hl(ns_id, "CmpItemAbbr",                        { fg = colors.blue })
set_hl(ns_id, "CmpItemAbbrDeprecated",              { fg = colors.sage })
set_hl(ns_id, "CmpItemAbbrMatch",                   { fg = colors.cyan })
set_hl(ns_id, "CmpItemAbbrMatchFuzzy",              { fg = colors.flamingo })
set_hl(ns_id, "CmpItemKind",                        { fg = colors.amber })
set_hl(ns_id, "CmpItemKindDefault",                 { fg = colors.amber })
set_hl(ns_id, "CmpItemKindReference",               { fg = colors.plum })
set_hl(ns_id, "CmpItemKindFile",                    { fg = colors.text })
set_hl(ns_id, "CmpItemKindColor",                   { fg = colors.red })
set_hl(ns_id, "CmpItemKindSnippet",                 { fg = colors.mauve })
set_hl(ns_id, "CmpItemKindEnum",                    { link = "AumStructureBase" })
set_hl(ns_id, "CmpItemKindValue",                   { link = "AumNumberBase" })
set_hl(ns_id, "CmpItemKindUnit",                    { link = "AumFieldBase" })
set_hl(ns_id, "CmpItemKindProperty",                { link = "AumPropertyBase" })
set_hl(ns_id, "CmpItemKindModule",                  { link = "AumIncludeBase" })
set_hl(ns_id, "CmpItemKindInterface",               { link = "AumIdentifierBase" })
set_hl(ns_id, "CmpItemKindClass",                   { link = "AumNamespaceBase" })
set_hl(ns_id, "CmpItemKindVariable",                { link = "AumVariableBase" })
set_hl(ns_id, "CmpItemKindKeyword",                 { link = "AumKeywordBase" })
set_hl(ns_id, "CmpItemKindEnumMember",              { link = "AumFieldBase" })
set_hl(ns_id, "CmpItemKindConstant",                { link = "AumConstantBase" })
set_hl(ns_id, "CmpItemKindField",                   { link = "AumFieldBase" })
set_hl(ns_id, "CmpItemKindConstructor",             { fg = colors.cyan })
set_hl(ns_id, "CmpItemKindText",                    { fg = colors.hail })
set_hl(ns_id, "CmpItemKindTypeParemeter",           { fg = colors.amber })
set_hl(ns_id, "CmpItemKindOperator",                { link = "AumOperatorBase" })
set_hl(ns_id, "CmpItemKindEvent",                   { fg = colors.blue })
set_hl(ns_id, "CmpItemKindStruct",                  { link = "AumStructureBase" })
set_hl(ns_id, "CmpItemKindMethod",                  { link = "AumFunctionBase" })
set_hl(ns_id, "CmpItemKindFunction",                { link = "AumFunctionBase" })
set_hl(ns_id, "CmpItemKindFolder",                  { fg = colors.sea })

-- Dressing.nvim
set_hl(ns_id, "DressingInputNormal",                { fg = colors.red, bg = colors.alloy })     -- Testing and WIP.
set_hl(ns_id, "DressingInputNormalFloat",           { fg = colors.red, bg = colors.alloy })     -- Testing and WIP.
set_hl(ns_id, "DressingInputFloatBorder",           { link = "AumBorderBase" })                 -- Testing and WIP.
set_hl(ns_id, "DressingInputPmenu",                 { link = "AumPmenu" })                      -- Testing and WIP.
set_hl(ns_id, "DressingInputSearch",                { link = "Search" })                        -- Testing and WIP.
set_hl(ns_id, "DressingInputVisual",                { link = "AumVisual" })                     -- Testing and WIP.
set_hl(ns_id, "DressingBuiltinNormal",              { fg = colors.red, bg = colors.alloy })     -- Testing and WIP.
set_hl(ns_id, "DressingBuiltinNormalFloat",         { fg = colors.red, bg = colors.alloy })     -- Testing and WIP.
set_hl(ns_id, "DressingBuiltinFloatBorder",         { link = "AumBorderBase" })                 -- Testing and WIP.
set_hl(ns_id, "DressingBuiltinPmenu",               { link = "AumPmenu" })                      -- Testing and WIP.
set_hl(ns_id, "DressingBuiltinSearch",              { link = "Search" })                        -- Testing and WIP.
set_hl(ns_id, "DressingBuiltinVisual",              { link = "AumVisual" })                     -- Testing and WIP.

-- Noice.nvim (Okay, but WIP)
set_hl(ns_id, "NoiceCursor",                        { link = "AumCursor" })
set_hl(ns_id, "NoiceMini",                          { bg = "NONE", fg = colors.text })  -- This doesn't really feel like it works.
set_hl(ns_id, "NoiceCompletionItemKindDefault",     { link = "CmpItemKind" })
set_hl(ns_id, "NoiceCompletionItemKindFile",        { link = "CmpItemKindFile" })
set_hl(ns_id, "NoiceCompletionItemKindField",       { link = "CmpItemKindField" })
set_hl(ns_id, "NoiceCompletionItemKindEnum",        { link = "CmpItemKindEnum" })
set_hl(ns_id, "NoiceCompletionItemKindEnumMember",  { link = "CmpItemKindEnumMember" })
set_hl(ns_id, "NoiceCompletionItemKindFolder",      { link = "CmpItemKindFolder" })
set_hl(ns_id, "NoiceCompletionItemKindConstant",    { link = "CmpItemKindConstant" })
set_hl(ns_id, "NoiceCompletionItemKindValue",       { link = "CmpItemKindValue" })
set_hl(ns_id, "NoiceCompletionItemKindStruct",      { link = "CmpItemKindStruct" })
set_hl(ns_id, "NoiceCompletionItemKindInterface",   { link = "CmpItemKindInterface" })
set_hl(ns_id, "NoiceCompletionItemKindMethod",      { link = "CmpItemKindFunction" })
set_hl(ns_id, "NoiceCompletionItemKindFunction",    { link = "CmpItemKindFunction" })

-- nvim-notify (Okay, but WIP)
set_hl(ns_id, "NotifyERRORBody",        { link = "Normal" })
set_hl(ns_id, "NotifyWARNBody",         { link = "Normal" })
set_hl(ns_id, "NotifyINFOBody",         { link = "Normal" })
set_hl(ns_id, "NotifyDEBUGBody",        { link = "Normal" })
set_hl(ns_id, "NotifyTRACEBody",        { link = "Normal" })
set_hl(ns_id, "NotifyERRORTitle",       { fg = "#F70067" })
set_hl(ns_id, "NotifyWARNTitle",        { fg = "#F79000" })
set_hl(ns_id, "NotifyINFOTitle",        { fg = "#A9FF68" })
set_hl(ns_id, "NotifyDEBUGTitle",       { fg = "#8B8B8B" })
set_hl(ns_id, "NotifyTRACETitle",       { fg = "#D484FF" })
set_hl(ns_id, "NotifyERRORBorder",      { fg = "#8A1F2F" })
set_hl(ns_id, "NotifyWARNBorder",       { fg = "#79491D" })
set_hl(ns_id, "NotifyINFOBorder",       { fg = "#4F6752" })
set_hl(ns_id, "NotifyDEBUGBorder",      { fg = "#8B8B8B" })
set_hl(ns_id, "NotifyTRACEBorder",      { fg = "#4F3552" })
set_hl(ns_id, "NotifyERRORIcon",        { fg = "#F70067" })
set_hl(ns_id, "NotifyWARNIcon",         { fg = "#F79000" })
set_hl(ns_id, "NotifyINFOIcon",         { fg = "#A9FF68" })
set_hl(ns_id, "NotifyDEBUGIcon",        { fg = "#8B8B8B" })
set_hl(ns_id, "NotifyTRACEIcon",        { fg = "#D484FF" })

-- Leap.nvim (Quite good, but little WIP. Labels could be kinda bright magenta maybe, because I avoid that colour otherwise.)
set_hl(ns_id, "LeapMatch",              { link = "Search" })
set_hl(ns_id, "LeapLabelPrimary",       { fg = colors.magenta, bold = true, underline = true })
set_hl(ns_id, "LeapLabelSecondary",     { fg = colors.blue, bold = true, underline = true })
set_hl(ns_id, "LeapLabelSelected",      { fg = colors.coral, bold = true, underline = true })
-- set_hl(ns_id, "LeapBackdrop",           {})  -- Not set == Good

-- Telescope.nvim   (STATE: Okay, but WIP)
set_hl(ns_id, "TelescopeNormal",        { link = "AumNormalTer" })      -- Text entered into prompt.        -- STATE: 9.5/10
set_hl(ns_id, "TelescopePromptCounter", { link = "AumCommentBase" })    -- Prompt result count.             -- STATE: 9.5/10
set_hl(ns_id, "TelescopeMatching",      { link = "AumMatch" })          -- Search match highlight.          -- STATE: 9.5/10
set_hl(ns_id, "TelescopeSelection",     { bg = "#1B082D" })             -- Active selection.                -- STATE: 9.5/10
set_hl(ns_id, "TelescopePreviewLine",   { bg = "#1B082D" })             -- CursorLine in preview panel.     -- STATE: 9.5/10
set_hl(ns_id, "TelescopeTitle",         { link = "AumTitle" })                                              -- STATE: 9.2/10
set_hl(ns_id, "TelescopePromptTitle",   { link = "AumTitle" })                                              -- STATE: 9.2/10
set_hl(ns_id, "TelescopeResultsTitle",  { link = "AumTitle" })                                              -- STATE: 9.2/10
set_hl(ns_id, "TelescopePreviewTitle",  { link = "AumTitle" })                                              -- STATE: 9.2/10
set_hl(ns_id, "TelescopeBorder",        { link = "AumBorderBase" })     -- Border.                          -- STATE: 9.6/10

-- Nvim-Ufo     (STATE: WIP)
set_hl(ns_id, "UfoFoldedBg",            { bg = colors.remnant })                        -- Fine, I think.
-- set_hl(ns_id, "UfoFoldedFg",            { fg = colors.hail })                           -- Does not really do anything.
-- set_hl(ns_id, "UfoPreviewSbar",         { bg = colors.alloy, fg = colors.pink })        -- Dunno what this is.
-- set_hl(ns_id, "UfoPreviewThumb",        { bg = colors.sky, fg = colors.oldrosy })       -- Dunno what this is.
-- set_hl(ns_id, "UfoPreviewWinBar",       { bg = colors.ceru, fg = colors.lilac })        -- Dunno what this is.
-- set_hl(ns_id, "UfoPreviewCursorline",   { link = "AumCursorLine" })                     -- Dunno what this is. Should be fine though.
-- set_hl(ns_id, "UfoFoldedEllipsis",      { bg = colors.remnant, fg = colors.mauve })     -- Does not really feel like it works.

-- Misc UI
set_hl(ns_id, "MatchParen",             { link = "AumMatch" })
set_hl(ns_id, "StatusLine",             { link = "AumNormalPri" })
set_hl(ns_id, "StatusLineNC",           { fg = colors.crust, bg = colors.crust })  -- NOTE: If this is the same color as StatusLine, vim places carets ('^') in statusbar.
set_hl(ns_id, "TabLine",                { link = "AumNormalPri" })
set_hl(ns_id, "TabLineFill",            { link = "AumNormalPri" })
set_hl(ns_id, "SpecialKey",             { fg = colors.snow })  -- TODO
set_hl(ns_id, "Directory",              { fg = colors.sea })  -- TODO
set_hl(ns_id, "Conceal",                { link = "AumSpecial" })
set_hl(ns_id, "@conceal",               { link = "AumSpecial" })

-- LineNr
set_hl(ns_id, "LineNr",                 { link = "AumLineNumberActive" })
set_hl(ns_id, "CursorLineNr",           { fg = colors.snow })
set_hl(ns_id, "LineNrAbove",            { link = "AumLineNumberInactive" })  -- For when 'relativenumber' is active.
set_hl(ns_id, "LineNrBelow",            { link = "AumLineNumberInactive" })  -- For when 'relativenumber' is active.

-- Fold (TODO)
set_hl(ns_id, "Folded",                 { link = "UfoFoldedBg"  })
set_hl(ns_id, "@fold",                  { link = "UfoFoldedBg" })
set_hl(ns_id, "FoldColumn",             { link = "AumCommentBase" })
set_hl(ns_id, "CursorLineFold",         { link = "AumCommentBase" })

-- Diff
set_hl(ns_id, "DiffAdd",                { link = "AumStringBase" })
set_hl(ns_id, "DiffChange",             { link = "AumFieldBase" })
set_hl(ns_id, "DiffDelete",             { link = "AumOperatorBase" })
set_hl(ns_id, "DiffText",               { link = "AumCommentBase" })

-- Visual Selection
set_hl(ns_id, "Visual",                 { link = "AumVisual" })
set_hl(ns_id, "VisualNOS",              { link = "AumVisual" })

-- Pmenu (Pop up menu)
set_hl(ns_id, "Pmenu",                  { link = "AumPmenu" })                      -- Background and normal text color in popup menu.
set_hl(ns_id, "PmenuSel",               { bg = colors.red, fg = colors.amber })     -- Does not work for selected in nvim-cmp.
set_hl(ns_id, "PmenuSbar",              { bg = colors.plum })                       -- Scrollbar.
set_hl(ns_id, "PmenuThumb",             { bg = colors.plum })                       -- Scrollbar. (Apparently)
set_hl(ns_id, "WildMenu",               { bg = colors.night, fg = colors.red })     -- Not quite sure what this is.
-- NOTE: Popup menu selection uses `Visual` highlight group.

-- Message
set_hl(ns_id, "ModeMsg",                { link = "Normal" })
set_hl(ns_id, "MoreMsg",                { link = "AumStringBase" })
set_hl(ns_id, "Question",               { link = "AumCharacterBase" })

-- Spelling
set_hl(ns_id, "SpellBad",               { sp = colors.red, undercurl = true })
set_hl(ns_id, "SpellCap",               { sp = colors.blue, undercurl = true })
set_hl(ns_id, "SpellRare",              { sp = colors.mauve, undercurl = true })
set_hl(ns_id, "SpellLocal",             { sp = colors.cyan, undercurl = true })
set_hl(ns_id, "spell",                  {})  -- Had some issue with this overwriting string colours. (Empty seems to work fine.)
set_hl(ns_id, "@spell",                 {})  -- Had some issue with this overwriting string colours. (Empty seems to work fine.)

-- TODO
set_hl(ns_id, "Todo",                   { bg = colors.yellow, fg = colors.night })
set_hl(ns_id, "helpNote",               { bg = colors.yellow, fg = colors.night })

-- |> AumneChroma.nvim Theme  --=>><⚡END⚡>]

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
set_hl(ns_id, "Normal",                 { fg = colors.text, bg = "NONE" })                      -- STATE: 9.8/10
-- set_hl(ns_id, "Normal",                 { fg = colors.text, bg = colors.crust })                -- STATE: 9.3/10
-- set_hl(ns_id, "Normal",                 { fg = colors.text, bg = colors.darkcrust })            -- STATE: 9.8/10

-- Cursor
set_hl(ns_id, "AumCursor",              { fg = colors.night, bg = colors.cursor })              -- STATE: 9.2/10
set_hl(ns_id, "AumCursorLine",          { bg = colors.night })                                   -- STATE: 8.6/10
set_hl(ns_id, "AumCursorColumn",        { bg = colors.night })                                   -- STATE: 8.6/10

-- Base things
set_hl(ns_id, "AumNormalPri",           { fg = colors.text })                                   -- STATE: 9.3/10
set_hl(ns_id, "AumNormalSec",           { fg = colors.heaven })                                 -- STATE: 9.3/10
set_hl(ns_id, "AumNormalTer",           { fg = colors.hail })                                   -- STATE: 9.5/10
set_hl(ns_id, "AumTitle",               { fg = colors.rosewater })                              -- STATE: 9.2/10 ?
set_hl(ns_id, "AumWhitespace",          { fg = colors.ghost })                                  -- STATE: 7.2/10
set_hl(ns_id, "AumVisual",              { bg = colors.alloy })                                  -- STATE: 9.0/10
set_hl(ns_id, "AumPmenu",               { link = "AumNormalTer" })                              -- STATE: 9.5/10
set_hl(ns_id, "AumBorderBase",          { fg = colors.plum })                                   -- STATE: 9.6/10
set_hl(ns_id, "AumMatch",               { fg = colors.apricot })                                -- STATE: 9.6/10
set_hl(ns_id, "AumLineNumberActive",    { fg = colors.hail })                                   -- STATE: 9.0/10
set_hl(ns_id, "AumLineNumberInactive",  { fg = colors.comment })                                -- STATE: 9.0/10

-- Diagnostics
set_hl(ns_id, "AumWarning",             { fg = colors.peach })                                  -- STATE: 8.5/10 ?
set_hl(ns_id, "AumError",               { fg = colors.crimson })                                -- STATE: 8.3/10 ?

-- Code text objects
set_hl(ns_id, "AumStringBase",          { fg = colors.sage })                                   -- STATE: 9.8/10
set_hl(ns_id, "AumCharacterBase",       { fg = colors.moss })                                   -- STATE: 9.7/10
set_hl(ns_id, "AumNumberBase",          { fg = colors.coral })                                  -- STATE: 8.9/10
set_hl(ns_id, "AumBooleanBase",         { fg = colors.orange, bold = true })                    -- STATE: 9.9/10
set_hl(ns_id, "AumOperatorBase",        { fg = colors.red })                                    -- STATE: 9.9/10
set_hl(ns_id, "AumConditionalBase",     { fg = colors.magenta, italic = true })                 -- STATE: ?
set_hl(ns_id, "AumRepeatBase",          { fg = colors.cobalt, italic = true, bold = true })     -- STATE: ?
set_hl(ns_id, "AumKeywordBase",         { fg = colors.mauve })                                  -- STATE: 9.2/10 ?
set_hl(ns_id, "AumKeywordOperator",     { fg = colors.rose, bold = true })                      -- STATE: 8.8/10 ?
set_hl(ns_id, "AumKeywordFunction",     { fg = colors.plum, italic = true, bold = true })       -- STATE: ?
set_hl(ns_id, "AumKeywordReturn",       { fg = colors.lilac })                                  -- STATE: ?
set_hl(ns_id, "AumVariableBase",        { fg = colors.hail })                                   -- STATE: 9.8/10
set_hl(ns_id, "AumIdentifierBase",      { fg = colors.pink })                                   -- STATE: ?
set_hl(ns_id, "AumStatementBase",       { fg = colors.green })                                  -- STATE: ?
set_hl(ns_id, "AumExceptionBase",       { fg = colors.rouge })                                  -- STATE: ?
set_hl(ns_id, "AumConstantBase",        { fg = colors.cyan, bold = true })                      -- STATE: WIP
set_hl(ns_id, "AumFieldBase",           { fg = colors.azure })                                  -- STATE: 9.9/10
set_hl(ns_id, "AumPropertyBase",        { fg = colors.blue })                                   -- STATE: 9.0/10
set_hl(ns_id, "AumTypeBase",            { fg = colors.sea })                                    -- STATE: ?
set_hl(ns_id, "AumStructureBase",       { fg = colors.yellow })                                 -- STATE: ?
set_hl(ns_id, "AumFunctionBase",        { fg = colors.marigold })                               -- STATE: ?
set_hl(ns_id, "AumFunctionCall",        { fg = colors.valencia })                               -- STATE: ?
set_hl(ns_id, "AumFunctionMacro",       { fg = colors.rosy })                                   -- STATE: ?
set_hl(ns_id, "AumParameterBase",       { fg = colors.amber })                                  -- STATE: 9.0/10 (Expect that too close to other yellows and oranges maybe.)
set_hl(ns_id, "AumPreprocBase",         { fg = colors.titian })                                 -- STATE: 8.2/10 ?
set_hl(ns_id, "AumIncludeBase",         { fg = colors.flamingo })                               -- STATE: 9.0/10
set_hl(ns_id, "AumNamespaceBase",       { fg = colors.lavender })                               -- STATE: ?
set_hl(ns_id, "AumTagBase",             { fg = colors.plum })                                   -- STATE: ? (TODO)
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

-- Floating windows
set_hl(ns_id, "NormalFloat",            { link = "AumNormalPri" })
set_hl(ns_id, "FloatBorder",            { link = "AumBorderBase" })
set_hl(ns_id, "FloatShadow",            { bg = "NONE", fg = "NONE" })
set_hl(ns_id, "FloatShadowThrough",     { bg = "NONE", fg = "NONE" })

-- Comment
set_hl(ns_id, "comment",                { link = "AumCommentBase" })
set_hl(ns_id, "@comment",               { link = "AumCommentBase" })

-- String
set_hl(ns_id, "string",                 { link = "AumStringBase" })
set_hl(ns_id, "@string",                { link = "AumStringBase" })
set_hl(ns_id, "string.escape",          { link = "AumOperatorBase" })
set_hl(ns_id, "@string.escape",         { link = "AumOperatorBase" })

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
set_hl(ns_id, "float",                  { link = "AumNumberBase" })
set_hl(ns_id, "@float",                 { link = "AumNumberBase" })

-- Boolean
set_hl(ns_id, "boolean",                { link = "AumBooleanBase" })
set_hl(ns_id, "@boolean",               { link = "AumBooleanBase" })

-- Variable
set_hl(ns_id, "variable",               { link = "AumVariableBase" })
set_hl(ns_id, "@variable",              { link = "AumVariableBase" })

-- Constant
set_hl(ns_id, "constant",               { link = "AumConstantBase" })
set_hl(ns_id, "@constant",              { link = "AumConstantBase" })

-- Field
set_hl(ns_id, "field",                  { link = "AumFieldBase" })
set_hl(ns_id, "@field",                 { link = "AumFieldBase" })

-- Property
set_hl(ns_id, "property",               { link = "AumPropertyBase" })
set_hl(ns_id, "@property",              { link = "AumPropertyBase" })

-- Type
set_hl(ns_id, "type",                   { link = "AumTypeBase" })
set_hl(ns_id, "@type",                  { link = "AumTypeBase" })
set_hl(ns_id, "TypeDef",                { link = "AumTypeBase" })  -- TODO: Make unique.

-- Structure
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
set_hl(ns_id, "tag",                    { link = "AumTagBase" })
set_hl(ns_id, "@tag",                   { link = "AumTagBase" })
-- Tag.Attribute
set_hl(ns_id, "tag.attribute",          { link = "AumTagAttributeBase" })
set_hl(ns_id, "@tag.attribute",         { link = "AumTagAttributeBase" })

-- Punctuation.Delimiter
set_hl(ns_id, "delimiter",              { link = "AumPunctuationPri" })
set_hl(ns_id, "@delimiter",             { link = "AumPunctuationPri" })
set_hl(ns_id, "punctuation.delimiter",  { link = "AumPunctuationPri" })
set_hl(ns_id, "@punctuation.delimiter", { link = "AumPunctuationPri" })
-- Punctuation.Bracket
set_hl(ns_id, "punctuation.bracket",    { link = "AumPunctuationSec" })
set_hl(ns_id, "@punctuation.bracket",   { link = "AumPunctuationSec" })
-- Punctuation.Special
set_hl(ns_id, "punctuation.special",    { link = "AumPunctuationPri" })
set_hl(ns_id, "@punctuation.special",   { link = "AumPunctuationPri" })
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

-- Include
set_hl(ns_id, "include",                { link = "AumIncludeBase" })
set_hl(ns_id, "@include",               { link = "AumIncludeBase" })

-- Namespace
set_hl(ns_id, "namespace",              { link = "AumNamespaceBase" })
set_hl(ns_id, "@namespace",             { link = "AumNamespaceBase" })

-- Titles   (STATE: Okay)
set_hl(ns_id, "Title",                  { link = "AumTitle" })
set_hl(ns_id, "@title",                 { link = "AumTitle" })
set_hl(ns_id, "text.title",             { link = "AumTitle" })
set_hl(ns_id, "@text.title",            { link = "AumTitle" })
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
set_hl(ns_id, "Label",                  { link = "AumNormalPri" })
set_hl(ns_id, "@label",                 { link = "AumNormalPri" })

-- Special (TODO)
set_hl(ns_id, "Special",                { link = "AumBooleanBase" })
set_hl(ns_id, "@special",               { link = "AumBooleanBase" })

-- Search
set_hl(ns_id, "Search",                 { fg = colors.night, bg = colors.orange, bold = true })
set_hl(ns_id, "CurSearch",              { fg = colors.night, bg = colors.rouge, bold = true, italic = true })
set_hl(ns_id, "IncSearch",              { fg = colors.night, bg = colors.yellow, bold = true, italic = true })

-- Diagnostics
set_hl(ns_id, "DiagnosticInfo",                     { link = "AumLineNumberActive" })
set_hl(ns_id, "DiagnosticHint",                     { fg = colors.peach, sp = colors.peach, underline = true })
set_hl(ns_id, "Error",                              { link = "AumError" })
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
set_hl(ns_id, "TelescopeSelection",     { link = "AumCursorLine" })     -- Active selection.                -- STATE: 9.5/10
set_hl(ns_id, "TelescopePreviewLine",   { link = "AumCursorLine" })     -- CursorLine in preview panel.     -- STATE: 9.5/10
set_hl(ns_id, "TelescopeTitle",         { link = "AumTitle" })                                              -- STATE: 9.2/10
set_hl(ns_id, "TelescopePromptTitle",   { link = "AumTitle" })                                              -- STATE: 9.2/10
set_hl(ns_id, "TelescopeResultsTitle",  { link = "AumTitle" })                                              -- STATE: 9.2/10
set_hl(ns_id, "TelescopePreviewTitle",  { link = "AumTitle" })                                              -- STATE: 9.2/10
set_hl(ns_id, "TelescopeBorder",        { link = "AumBorderBase" })     -- Border.                          -- STATE: 9.6/10

-- Misc UI
set_hl(ns_id, "MatchParen",             { link = "AumMatch" })
set_hl(ns_id, "StatusLine",             { link = "AumNormalPri" })
set_hl(ns_id, "StatusLineNC",           { fg = colors.crust, bg = colors.crust })  -- NOTE: If this is the same color as StatusLine, vim places carets ('^') in statusbar.
set_hl(ns_id, "TabLine",                { link = "AumNormalPri" })
set_hl(ns_id, "TabLineFill",            { link = "AumNormalPri" })
set_hl(ns_id, "SpecialKey",             { fg = colors.snow })  -- TODO
set_hl(ns_id, "Directory",              { fg = colors.sea })  -- TODO
set_hl(ns_id, "Conceal",                { link = "AumStringBase" })

-- LineNr
set_hl(ns_id, "LineNr",                 { link = "AumLineNumberActive" })
set_hl(ns_id, "CursorLineNr",           { fg = colors.snow })
set_hl(ns_id, "LineNrAbove",            { link = "AumLineNumberInactive" })  -- For when 'relativenumber' is active.
set_hl(ns_id, "LineNrBelow",            { link = "AumLineNumberInactive" })  -- For when 'relativenumber' is active.

-- Fold (TODO)
set_hl(ns_id, "Folded",                 { link = "AumCommentBase" })
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

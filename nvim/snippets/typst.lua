local luasnip               = require("luasnip")

local snippet               = luasnip.snippet                                   -- For defining a new snippet.
local snippet_node          = luasnip.snippet_node
local indent_snippet_node   = luasnip.indent_snippet_node

local text                  = luasnip.text_node                                 -- For text nodes.
local insert                = luasnip.insert_node                               -- For insert nodes.    ( This inserts text and enters select mode with the text selected. )
local func                  = luasnip.function_node                             -- For func nodes.
local choice                = luasnip.choice_node                               -- For choice nodes.        ( TODO: How to open the choices in nvim-cmp properly? )
local dyn                   = luasnip.dynamic_node                              -- For dynamic nodes.
local restore               = luasnip.restore_node                              -- For restore nodes.

local events                = require("luasnip.util.events")
local ai                    = require("luasnip.nodes.absolute_indexer")

local extras                = require("luasnip.extras")
local rep                   = extras.rep                                        -- For repeating the contents of a tabstop.
local lambda                = extras.lambda
local partial               = extras.partial
local match                 = extras.match
local nonempty              = extras.nonempty
local dyn_lambda            = extras.dynamic_lambda

local fmt                   = require("luasnip.extras.fmt").fmt                 -- For format-strings.
local fmta                  = require("luasnip.extras.fmt").fmta
local conds                 = require("luasnip.extras.expand_conditions")
local postfix               = require("luasnip.extras.postfix").postfix
local types                 = require("luasnip.util.types")
local parse                 = require("luasnip.util.parser").parse_snippet

return {
    snippet({ trig = "boilerplate", name = "Typst Base Boilerplate", dscr = "Snippet for Typst Base Boilerplate"},
        fmt(
            [[
                // ================================
                // SECTION: Settings => START   ===
                // ================================

                #set text(
                    font: "JetBrains Mono",
                    size: 11pt,
                )

                #set page(
                    paper: "a4",
                    margin: (x: 1.6cm, y: 1.8cm),
                    numbering: "1",
                )

                #set par(
                    justify: true,
                    leading: 0.6em,
                )

                #set heading(
                    numbering: "1.",
                    outlined: true,
                )
                // ================================
                // SECTION: Settings => END     ===
                // ================================

                // Title
                #align(center, text(17pt)[
                    *Title*
                ])

                // Author
                #align(center, text(12pt)[
                    Herbert Salin
                ])

                // ================================
                // SECTION: Content => START    ===
                // ================================

                = Section 1 Title

                    Words.{}


                // ================================
                // SECTION: Content => END      ===
                // ================================

                // End of File
            ]],
            {
                insert(0),
            }
        )
    ),
    snippet({ trig = "#image", name = "Typst Function: `image()`", dscr = "Snippet for the Typst Function: `image()`"},
        fmt(
            [[
                #figure(
                    image("./images/{}.png", width: {}%),
                    caption: [
                        {}
                    ]
                )
            ]],
            {
                insert(1, "<file-name>"),
                insert(2, "66"),
                insert(3, "<caption>"),
            }
        )
    ),
    snippet({ trig = "link", name = "Typst Function: `link()`", dscr = "Snippet for the Typst Function: `link()`"},
        fmt(
            [[
                #link("{}")[#underline("{}")]
            ]],
            {
                insert(1, "<url>"),
                insert(0, "<display-text>"),
            }
        )
    ),
}

-- End of File

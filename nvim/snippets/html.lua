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
    snippet({ trig = "header", name = "HTML Element: `header`", dscr = "Snippet for the HTML Element: `header`"},
        fmt(
            [[<header class="primary-header">{}</header>]],
            {
                insert(1)
            }
        )
    ),
    snippet({ trig = "nav_simple", name = "HTML Element: `nav`", dscr = "Snippet for the HTML Element: `nav`"},
        fmt(
            [[
                <nav class="primary-navigation">
                    <ul class="nav-item-list" role="list">
                        <li><a href="#" class="nav-item">{}</a></li>
                    </ul>
                </nav>
            ]],
            {
                insert(1, "About")
            }
        )
    ),
    snippet({ trig = "main", name = "HTML Element: `main`", dscr = "Snippet for the HTML Element: `main`"},
        fmt(
            [[<main id="main-content">{}</main>]],
            {
                insert(1)
            }
        )
    ),
    snippet({ trig = "footer", name = "HTML Element: `footer`", dscr = "Snippet for the HTML Element: `footer`"},
        fmt(
            [[<footer class="{}">{}</footer>]],
            {
                insert(1, "primary-footer"),
                insert(2)
            }
        )
    ),
    snippet({ trig = "form", name = "HTML Element: `form`", dscr = "Snippet for the HTML Element: `form`"},
        fmt([[<form name="{}" action="{}" method="{}" onsubmit="{}">{}</form>]],
            {
                insert(1, "form"),
                insert(2),
                insert(3, "GET"),
                insert(4, "return false"),
                insert(5)
            }
        )
    ),
    snippet({ trig = "input_text_field", name = "HTML Element: `input` (Type: `text`)", dscr = "Snippet for the HTML Element: `input`"},
        fmt([[
                <label for="{}">{}</label>
                <input type="text" name="{}" id="{}" maxlength="{}">
            ]],
            {
                insert(1),
                insert(2, "label"),
                rep(1),
                rep(1),
                insert(0, "128")
            }
        )
    ),
    snippet({ trig = "button", name = "HTML Element: `button`", dscr = "Snippet for the HTML Element: `button`"},
        fmt([[<button class="{}" name="{}" type="button" onclick="{}">{}</button>]],
            {
                insert(1, "button"),
                insert(2, "button"),
                insert(3),
                insert(0),
            }
        )
    ),
    snippet({ trig = "style_tags", name = "HTML Tags: `style`", dscr = "Snippet for the HTML Tags: `style`"},
        fmt([[
            <style>
                {}
            </style>
            ]],
            {
                insert(0)
            }
        )
    ),
    snippet({ trig = "space_non_breaking", name = "HTML Entity: `&nbsp;`", dscr = "Snippet for the HTML Entity: `non-breaking-space`"},
        fmt([[
                &nbsp;{}
            ]],
            {
                insert(0)
            }
        )
    ),

}

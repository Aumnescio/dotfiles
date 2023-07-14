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

luasnip.filetype_extend("php", { "html" })

return {
    snippet({ trig = "<?php", name = "PHP Block", dscr = "PHP Snippet for `echo`."},
        fmt(
            [[
                <?php
                    {}
            ]],
            {
                insert(0, 'echo "todo";')
            }
        )
    ),
    snippet({ trig = "letvar", name = "Declare new variable", dscr = "PHP Snippet for declaring a variable."},
        fmt(
            [[
                ${} = {};
            ]],
            {
                insert(1),
                insert(0)
            }
        )
    ),
    snippet({ trig = "echo", name = "Echo", dscr = "PHP Snippet for `echo`."},
        fmt(
            [[
                echo "{}";
            ]],
            {
                insert(0)
            }
        )
    ),
    snippet({ trig = "echo_var", name = "Echo Variable", dscr = "PHP Snippet for `echo`."},
        fmt(
            [[
                echo {};
            ]],
            {
                insert(0)
            }
        )
    ),
    snippet({ trig = "foreach", name = "PHP ForEach", dscr = "PHP Snippet for `foreach` loop."},
        fmt(
            [[
                foreach (${} as ${} => ${}) {{
                    {}
                }}
            ]],
            {
                insert(1, "iterable"),
                insert(2, "key"),
                insert(3, "value"),
                insert(0, "todo()")
            }
        )
    ),
}

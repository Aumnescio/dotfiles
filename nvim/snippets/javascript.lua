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
    snippet({ trig = "letvar", name = "Declare new variable.", dscr = "JS/TS Snippet for declaring new variable."},
        fmt(
            [[let {} = {};]],
            {
                insert(1, "variable_name"),
                insert(0)
            }
        )
    ),
    snippet({ trig = "import_from", name = "import", dscr = "JS/TS Snippet for `import {} from {}`"},
        fmt(
            [[import {{ {} }} from {}]],
            {
                insert(1),
                insert(0)
            }
        )
    ),
    snippet({ trig = "log_print", name = "Log to Console", dscr = "JS/TS Snippet for `console.log()`"},
        fmt(
            [[console.log({})]],
            {
                insert(0)
            }
        )
    ),
    snippet({ trig = "fetch", name = "Fetch Function", dscr = "JS/TS Snippet for `fetch()`"},
        fmt(
            [[
                fetch({}, {{
                    "method": "POST",
                }})
                    .then(response => {{
                        return response.text();
                    }})
                    .then(response_text => {{
                        {}
                    }})
            ]],
            {
                insert(1, [["example.php"]]),
                insert(0, [[console.log(response_text);]])
            }
        )
    ),
    snippet({ trig = "get_element_by_id", name = "getElementById", dscr = "JS/TS Snippet for `getElementById()`"},
        fmt(
            [[document.getElementById("{}")]],
            {
                insert(0, "id")
            }
        )
    ),
}

-- End of File

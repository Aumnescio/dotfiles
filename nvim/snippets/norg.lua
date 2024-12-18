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
    snippet({ trig = "date", name = "Insert Date", dscr = "Snippet for inserting the current date."},
        fmt(
            [[
                {}
            ]],
            {
                partial(os.date, "`%d/%m/%Y`")
            }
        )
    ),
    snippet({ trig = "time_now", name = "Insert current time", dscr = "Snippet for inserting the current time."},
        fmt(
            [[
                {}
            ]],
            {
                partial(os.date, "`%H:%M`")
            }
        )
    ),
    snippet({ trig = "schedule-day", name = "Daily Schedule", dscr = "Snippet Daily Schedule."},
        fmt(
            [[
                *** {}
                **** `03:00 - 05:00`
                     todo

                **** `05:00 - 07:00`
                     todo

                **** `07:00 - 09:00`
                     todo

                **** `09:00 - 11:00`
                     todo

                **** `11:00 - 13:00`
                     todo

                **** `13:00 - 15:00`
                     todo

                **** `15:00 - 17:00`
                     todo
                {}
            ]],
            {
                partial(os.date, "`%d/%m/%Y`"),
                insert(0)
            }
        )
    ),
}

-- End of File

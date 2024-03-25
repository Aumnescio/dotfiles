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
local fmta                  = require("luasnip.extras.fmt").fmta                -- For format-strings, with named slots.
local conds                 = require("luasnip.extras.expand_conditions")
local postfix               = require("luasnip.extras.postfix").postfix
local types                 = require("luasnip.util.types")
local parse                 = require("luasnip.util.parser").parse_snippet

-- NOTE:    Don't quite love having all the HTML and CSS snippets in Svelte files,
--          because they are not context sensitive, and they also
--          have some compatibility issues.
-- luasnip.filetype_extend("svelte", { "html" })
-- luasnip.filetype_extend("svelte", { "css" })
luasnip.filetype_extend("svelte", { "typescript" })

return {
    snippet({ trig = "component", name = "Svelte `component`", dscr = "Svelte Snippet for a `component` tag."},
        fmt(
            [[
                <{} />
            ]],
            {
                insert(0)
            }
        )
    ),
    snippet({ trig = "if", name = "Svelte Block: `if`", dscr = "Svelte Snippet for an `if` block."},
        fmt(
            [[
                {{#if {}}}
                    {}
                {{/if}}
            ]],
            {
                insert(1, "condition"),
                insert(0, "html")
            }
        )
    ),
    snippet({ trig = "else", name = "Svelte Block: `else`", dscr = "Svelte Snippet for an `else` block."},
        fmt(
            [[
                {{:else}}
                    {}
            ]],
            {
                insert(0, "html"),
            }
        )
    ),
    snippet({ trig = "elseif", name = "Svelte Block: `elseif`", dscr = "Svelte Snippet for an `elseif` block."},
        fmt(
            [[
                {{:else if {}}}
                    {}
            ]],
            {
                insert(1, "condition"),
                insert(0, "html"),
            }
        )
    ),
    snippet({ trig = "for_each_loop", name = "Svelte Block: `each`", dscr = "Svelte Snippet for an `each` block."},
        fmt(
            [[
                {{#each {} as {}}}
                    {}
                {{/each}}
            ]],
            {
                insert(1, "iterable"),
                insert(2, "item"),
                insert(0, "html"),
            }
        )
    ),
}

-- End of File

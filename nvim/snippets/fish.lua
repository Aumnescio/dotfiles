local luasnip               = require("luasnip")

local snippet               = luasnip.snippet                                   -- For defining a new snippet.
local snippet_node          = luasnip.snippet_node
local indent_snippet_node   = luasnip.indent_snippet_node

local text                  = luasnip.text_node                                 -- For text nodes.
local insert                = luasnip.insert_node                               -- For insert nodes.        ( This inserts text and enters select mode with the text selected. )
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

local replace_capitalized = function(index)
    return func(function(arg)
        local str = arg[1][1]
        return (str:gsub("^%l", string.upper))       -- This seems to work, not sure if there are issues with it.
    end, { index })
end

-- WIP/Testing
local filename_without_ext = function()
    return func(function()
        -- `:t` -> `tail` -> last path component only
        -- `:r` -> without extension
        return vim.fn.expand("%:t:r")
    end)
end

return {
    snippet({ trig = "shebang", name = "Fish shebang", dscr = "Fish shebang"},
        fmt(
            [[
                #!/usr/bin/env fish{}
            ]],
            {
                insert(0),
            }
        )
    ),
}

-- End of File

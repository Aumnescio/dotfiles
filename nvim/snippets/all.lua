-- TODO: Experiment with this.

local luasnip = require("luasnip")

local snippet = luasnip.snippet                                         -- For defining a new snippet.
local snippet_node = luasnip.snippet_node
local indent_snippet_node = luasnip.indent_snippet_node

local text = luasnip.text_node                                          -- For text nodes.
local insert = luasnip.insert_node                                      -- For insert nodes.
local func = luasnip.function_node                                      -- For func nodes.
local choice = luasnip.choice_node                                      -- For choice nodes.
local dyn = luasnip.dynamic_node                                        -- For dynamic nodes.
local restore = luasnip.restore_node                                    -- For restore nodes.

local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")

local extras = require("luasnip.extras")
local rep = extras.rep                                                  -- For repeating the contents of a tabstop.
local lambda = extras.lambda
local partial = extras.partial
local match = extras.match
local nonempty = extras.nonempty
local dyn_lambda = extras.dynamic_lambda

local fmt = require("luasnip.extras.fmt").fmt                           -- For format-strings.
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet

return {
    -- Snippet Description: `Snippet for testing if these snippets work.`   ( They do work. )
    -- snippet(
    -- --     "testsnip",  -- Entry Name      ( The text you need to write to activate the snippet. )
    --     fmt(
    -- --         "let thing = {} // ({})",
    -- --         { insert(1),    rep(1) }
    --     )
    -- ),
}

local luasnip = require("luasnip")

local snippet = luasnip.snippet
local snippet_node = luasnip.snippet_node
local indent_snippet_node = luasnip.indent_snippet_node

local text = luasnip.text_node
local insert = luasnip.insert_node
local func = luasnip.function_node
local choice = luasnip.choice_node
local dyn = luasnip.dynamic_node
local restore = luasnip.restore_node

local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")

local extras = require("luasnip.extras")
local rep = extras.rep
local lambda = extras.lambda
local partial = extras.partial
local match = extras.match
local nonempty = extras.nonempty
local dyn_lambda = extras.dynamic_lambda

local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet

return {
    -- Snippet for: Test
    snippet("testsnip", fmt("local {} = {}", { insert(1), rep(1) })),
}

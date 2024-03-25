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
    snippet({ trig = "create_table", name = "SQL `CREATE TABLE`", dscr = "SQL Snippet for `CREATE TABLE`."},
        fmt(
            [[
                CREATE TABLE {} (
                    {}
                );
            ]],
            {
                insert(1, "table_name"),
                insert(0, "field")
            }
        )
    ),
    snippet({ trig = "drop_table", name = "SQL `DROP TABLE`", dscr = "SQL Snippet for `DROP TABLE`."},
        fmt(
            [[
                DROP TABLE IF EXISTS {};
            ]],
            {
                insert(0, "table_name")
            }
        )
    ),
    snippet({ trig = "alter_table_add_column", name = "SQL `ALTER TABLE table ADD COLUMN column`", dscr = "SQL Snippet for `ALTER TABLE table ADD COLUMN column`."},
        fmt(
            [[
                ALTER TABLE {} ADD COLUMN {};
            ]],
            {
                insert(1, "table_name"),
                insert(0, "column")
            }
        )
    ),
    snippet({ trig = "alter_table_drop_column", name = "SQL `ALTER TABLE table DROP COLUMN column`", dscr = "SQL Snippet for `ALTER TABLE table DROP COLUMN column`."},
        fmt(
            [[
                ALTER TABLE {} DROP COLUMN {};
            ]],
            {
                insert(1, "table_name"),
                insert(0, "column_name")
            }
        )
    ),
    snippet({ trig = "alter_table_alter_column", name = "SQL `ALTER TABLE table ALTER column`", dscr = "SQL Snippet for `ALTER TABLE table ALTER column`."},
        fmt(
            [[
                ALTER TABLE {} ALTER {};
            ]],
            {
                insert(1, "table_name"),
                insert(0, "column")
            }
        )
    ),
    snippet({ trig = "select_star_from", name = "SQL `SELECT * FROM table`", dscr = "SQL Snippet for `SELECT * FROM table`."},
        fmt(
            [[
                SELECT * FROM {};
            ]],
            {
                insert(0, "table_name")
            }
        )
    ),
    snippet({ trig = "insert_into_value", name = "SQL `INSERT INTO table VALUES`", dscr = "SQL Snippet for `INSERT INTO table VALUES`."},
        fmt(
            [[
                INSERT INTO {} VALUES({});
            ]],
            {
                insert(1, "table (field, field)"),
                insert(0, "values")
            }
        )
    ),
    snippet({ trig = "update_table_row", name = "SQL `UPDATE`", dscr = "SQL Snippet for `UPDATE`."},
        fmt(
            [[
                UPDATE {} SET {} WHERE {};
            ]],
            {
                insert(1, "table_name"),
                insert(2, "field = value"),
                insert(0, "condition")
            }
        )
    ),
    snippet({ trig = "delete_from_table", name = "SQL `DELETE FROM table`", dscr = "SQL Snippet for `DELETE FROM table`."},
        fmt(
            [[
                DELETE FROM {} WHERE {};
            ]],
            {
                insert(1, "table_name"),
                insert(0, "condition")
            }
        )
    ),
}

-- End of File

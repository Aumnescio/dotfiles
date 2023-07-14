-- TODO:    Create a good dynamic snippet for every CSS Property.
-- NOTE:    The errors that LuaSnip gives when the snippet format has a mistake in it, are not useful... Hmm.

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
    --===========================================
    --=== -     Simple CSS Properties       - ===
    --===========================================
    snippet({ trig = "color", name = "CSS Property: `color`", dscr = "Snippet for the CSS Property: `color`"},
        fmt(
            "color: {};",
            {
                insert(1, "<color>")
            }
        )
    ),
    snippet({ trig = "back_ground", name = "CSS Property: `background`", dscr = "Snippet for the CSS Property: `background`"},
        fmt(
            "background: {};",
            {
                insert(1, "<color>")
            }
        )
    ),
    snippet({ trig = "back_ground_color", name = "CSS Property: `background-color`", dscr = "Snippet for the CSS Property: `background-color`"},
        fmt(
            "background-color: {};",
            {
                insert(1, "<color>")
            }
        )
    ),

    --=======================================
    --=== -     CSS Color Functions     - ===
    --=======================================
    snippet({ trig = "lch()", name = "CSS Function: `lch()`", dscr = "Snippet for the CSS Color Function: `lch()`"},
        fmt(
            "lch({})",
            {
                insert(1)
            }
        )
    ),
    snippet({ trig = "rgb()", name = "CSS Function: `rgb()`", dscr = "Snippet for the CSS Color Function: `rgb()`"},
        fmt(
            "rgb({})",
            {
                insert(1)
            }
        )
    ),
    snippet({ trig = "hsl()", name = "CSS Function: `hsl()`", dscr = "Snippet for the CSS Color Function: `hsl()`"},
        fmt(
            "hsl({})",
            {
                insert(1)
            }
        )
    ),

    --===============================
    --=== -     `display`    - ===
    --===============================
    snippet({ trig = "display", name = "CSS Property: `display`", dscr = "Dynamic choice snippet for the CSS Property: `display`"},
        fmt(
            "display: {};",
            {
                choice(1, {
                    snippet_node(nil, { insert(1)                   }),
                    snippet_node(nil, { text("block")               }),
                    snippet_node(nil, { text("inline")              }),
                    snippet_node(nil, { text("flex")                }),
                    snippet_node(nil, { text("grid")                }),
                    snippet_node(nil, { text("flow-root")           }),
                    snippet_node(nil, { text("inline-block")        }),
                    snippet_node(nil, { text("inline-flex")         }),
                    snippet_node(nil, { text("inline-grid")         }),
                    snippet_node(nil, { text("inline flow")         }),
                    snippet_node(nil, { text("inline flow-root")    }),
                    snippet_node(nil, { text("block flow")          }),
                    snippet_node(nil, { text("block flex")          }),
                    snippet_node(nil, { text("block grid")          }),
                    snippet_node(nil, { text("block flow-root")     }),
                    snippet_node(nil, { text("table-row")           }),
                    snippet_node(nil, { text("list-item")           }),
                    snippet_node(nil, { text("contents")            }),
                    snippet_node(nil, { text("none")                }),
                    snippet_node(nil, { text("inherit")             }),
                    snippet_node(nil, { text("initial")             }),
                    snippet_node(nil, { text("revert")              }),
                    snippet_node(nil, { text("revert-layer")        }),
                    snippet_node(nil, { text("unset")               }),
                })
            }
        )
    ),
    snippet({ trig = "display_none", name = "CSS: `display: none;`", dscr = "Snippet for the CSS Property and Value: `display: none;`"},
        fmt(
            [[
                display: none;
                {}
            ]],
            {
                insert(1)
            }
        )
    ),
    snippet({ trig = "display_block", name = "CSS: `display: block;`", dscr = "Snippet for the CSS Property and Value: `display: block;`"},
        fmt(
            [[
                display: block;
                {}
            ]],
            {
                insert(1)
            }
        )
    ),
    snippet({ trig = "display_flex", name = "CSS: `display: flex;`", dscr = "Snippet for the CSS Property and Value: `display: flex;`"},
        fmt(
            [[
                display: flex;
                {}
            ]],
            {
                insert(1)
            }
        )
    ),
    snippet({ trig = "display_grid", name = "CSS: `display: grid;`", dscr = "Snippet for the CSS Property and Value: `display: grid;`"},
        fmt(
            [[
                display: grid;
                {}
            ]],
            {
                insert(1)
            }
        )
    ),
    snippet({ trig = "display_inline_block", name = "CSS: `display: inline-block;`", dscr = "Snippet for the CSS Property and Value: `display: inline-block;`"},
        fmt(
            [[
                display: inline-block;
                {}
            ]],
            {
                insert(1)
            }
        )
    ),
    snippet({ trig = "display_inline_flex", name = "CSS: `display: inline-flex;`", dscr = "Snippet for the CSS Property and Value: `display: inline-flex;`"},
        fmt(
            [[
                display: inline-flex;
                {}
            ]],
            {
                insert(1)
            }
        )
    ),
    snippet({ trig = "display_inline_grid", name = "CSS: `display: inline-grid;`", dscr = "Snippet for the CSS Property and Value: `display: inline-grid;`"},
        fmt(
            [[
                display: inline-grid;
                {}
            ]],
            {
                insert(1)
            }
        )
    ),

    --===============================
    --=== -     Other / TODO    - ===
    --===============================
    snippet({ trig = "font_family", name = "CSS Property: `font-family`", dscr = "Dynamic choice snippet for the CSS Property: `font-family`"},
        fmt(
            "font-family: {} {};",
            {
                insert(1),
                choice(2, {
                    -- snippet_node(nil, { text('"'), insert(1, "<font-name>"), text('"')  }),
                    snippet_node(nil, { insert(2)               }),
                    snippet_node(nil, { text("serif")           }),
                    snippet_node(nil, { text("sans-serif")      }),
                    snippet_node(nil, { text("monospace")       }),
                    snippet_node(nil, { text("cursive")         }),
                    snippet_node(nil, { text("fantasy")         }),
                    snippet_node(nil, { text("system-ui")       }),
                    snippet_node(nil, { text("emoji")           }),
                    snippet_node(nil, { text("math")            }),
                })
            }
        )
    ),
    snippet({ trig = "text_align", name = "CSS Property: `text-align`", dscr = "Dynamic choice snippet for the CSS Property: `text-align`"},
        fmt(
            "text-align: {};",
            {
                choice(1, {
                    snippet_node(nil, { insert(1)               }),
                    snippet_node(nil, { text("center")           }),
                    snippet_node(nil, { text("start")           }),
                    snippet_node(nil, { text("end")             }),
                    snippet_node(nil, { text("left")            }),
                    snippet_node(nil, { text("right")           }),
                    snippet_node(nil, { text("justify")         }),
                    snippet_node(nil, { text("justify-all")     }),
                    snippet_node(nil, { text("match-parent")    }),
                    snippet_node(nil, { text('"'), insert(1, '<align-character>'), text('" '), insert(1, "<optional-keyword-value>") }),
                })
            }  -- NOTE: This brace can't have a trailing comma.
        )
    ),
    snippet({ trig = "justify_content", name = "CSS Property: `justify-content`", dscr = "Dynamic choice snippet for the CSS Property: `justify-content`"},
        fmt(
            "justify-content: {};",
            {
                choice(1, {
                    snippet_node(nil, { insert(1)               }),
                    snippet_node(nil, { text("normal")          }),
                    snippet_node(nil, { text("center")          }),
                    snippet_node(nil, { text("safe center")     }),
                    snippet_node(nil, { text("unsafe center")   }),
                    snippet_node(nil, { text("start")           }),
                    snippet_node(nil, { text("end")             }),
                    snippet_node(nil, { text("flex-start")      }),
                    snippet_node(nil, { text("flex-end")        }),
                    snippet_node(nil, { text("left")            }),
                    snippet_node(nil, { text("right")           }),
                    snippet_node(nil, { text("space-between")   }),
                    snippet_node(nil, { text("space-around")    }),
                    snippet_node(nil, { text("space-evenly")    }),
                    snippet_node(nil, { text("stretch")         }),
                })
            }
        )
    ),
    snippet({ trig = "center_justify-content_center", name = "CSS: `justify-content: center;`", dscr = "Snippet for the CSS Property and Value: `justify-content: center;`"},
        fmt(
            [[
                justify-content: center;
                {}
            ]],
            {
                insert(1)
            }
        )
    ),
    snippet({ trig = "space_justify-content_space_between", name = "CSS: `justify-content: space-between;`", dscr = "Snippet for the CSS Property and Value: `justify-content: space-between;`"},
        fmt(
            [[
                justify-content: space-between;
                {}
            ]],
            {
                insert(1)
            }
        )
    ),
    snippet({ trig = "space_justify-content_space_evenly", name = "CSS: `justify-content: space-evenly;`", dscr = "Snippet for the CSS Property and Value: `justify-content: space-evenly;`"},
        fmt(
            [[
                justify-content: space-evenly;
                {}
            ]],
            {
                insert(1)
            }
        )
    ),
    snippet({ trig = "space_justify-content_space_around", name = "CSS: `justify-content: space-around;`", dscr = "Snippet for the CSS Property and Value: `justify-content: space-around;`"},
        fmt(
            [[
                justify-content: space-around;
                {}
            ]],
            {
                insert(1)
            }
        )
    ),
    snippet({ trig = "vertical-align", name = "CSS Property: `vertical-align`", dscr = "Dynamic choice snippet for the CSS Property: `vertical-align`"},
        fmt(
            "vertical-align: {};",
            {
                choice(1, {
                    snippet_node(nil, { insert(1, "<value>")    }),
                    snippet_node(nil, { text("baseline")        }),
                    snippet_node(nil, { text("sub")             }),
                    snippet_node(nil, { text("super")           }),
                    snippet_node(nil, { text("text-top")        }),
                    snippet_node(nil, { text("text-bottom")     }),
                    snippet_node(nil, { text("middle")          }),
                    snippet_node(nil, { text("top")             }),
                    snippet_node(nil, { text("bottom")          }),
                })
            }
        )
    ),
    snippet({ trig = "text_transform", name = "CSS Property: `text-transform`", dscr = "Dynamic choice snippet for the CSS Property: `text-transform`"},
        fmt(
            "text-transform: {};",
            {
                choice(1, {
                    snippet_node(nil, { insert(1, "none")       }),
                    snippet_node(nil, { text("capitalize")      }),
                    snippet_node(nil, { text("uppercase")       }),
                    snippet_node(nil, { text("lowercase")       }),
                    snippet_node(nil, { text("full-width")      }),
                    snippet_node(nil, { text("full-size-kana")  }),
                })
            }
        )
    ),
    snippet({ trig = "text_shadow", name = "CSS Property: `text-shadow`", dscr = "Snippet for the CSS Property: `text-shadow`"},
        fmt(
            "text-shadow: {};",
            {
                insert(1, "<color> <offset-x> <offset-y> <blur-radius>")
            }
        )
    ),
    snippet({ trig = "text_decoration", name = "CSS Property: `text-decoration`", dscr = "Snippet for the CSS Property: `text-decoration`"},
        fmt(
            "text-decoration: {};",
            {
                insert(1, "<style> <thickness> <color> <line>")
            }
        )
    ),
    snippet({ trig = "text_decoration_color", name = "CSS Property: `text-decoration-color`", dscr = "Snippet for the CSS Property: `text-decoration-color`"},
        fmt(
            "text-decoration-color: {};",
            {
                insert(1, "<color>")
            }
        )
    ),
    snippet({ trig = "text_decoration_thickness", name = "CSS Property: `text-decoration-thickness`", dscr = "Snippet for the CSS Property: `text-decoration-thickness`"},
        fmt(
            "text-decoration-thickness: {};",
            {
                insert(1, "<value>")
            }
        )
    ),
    snippet({ trig = "text_decoration_line", name = "CSS Property: `text-decoration-line`", dscr = "Dynamic choice snippet for the CSS Property: `text-decoration-line`"},
        fmt(
            "text-decoration-line: {};",
            {
                choice(1, {
                    snippet_node(nil, { insert(1, "none")       }),
                    snippet_node(nil, { text("underline")       }),
                    snippet_node(nil, { text("overline")        }),
                    snippet_node(nil, { text("line-through")    }),
                    snippet_node(nil, { text("blink")           }),
                })
            }
        )
    ),
    snippet({ trig = "text_decoration_style", name = "CSS Property: `text-decoration-style`", dscr = "Dynamic choice snippet for the CSS Property: `text-decoration-style`"},
        fmt(
            "text-decoration-style: {};",
            {
                choice(1, {
                    snippet_node(nil, { insert(1, "solid")  }),
                    snippet_node(nil, { text("double")      }),
                    snippet_node(nil, { text("dotted")      }),
                    snippet_node(nil, { text("dashed")      }),
                    snippet_node(nil, { text("wavy")        }),
                })
            }
        )
    ),
    snippet({ trig = "word_spacing", name = "CSS Property: `word-spacing`", dscr = "Snippet for the CSS Property: `word-spacing`"},
        fmt(
            "word-spacing: {};",
            {
                insert(1, "<value>")
            }
        )
    ),
    snippet({ trig = "letter_spacing", name = "CSS Property: `letter-spacing`", dscr = "Snippet for the CSS Property: `letter-spacing`"},
        fmt(
            "letter-spacing: {};",
            {
                insert(1, "<value>")
            }
        )
    ),
    snippet({ trig = "width", name = "CSS Property: `width`", dscr = "Snippet for the CSS Property: `width`"},
        fmt(
            "width: {};",
            {
                insert(1, "<value>")
            }
        )
    ),
    snippet({ trig = "min_width", name = "CSS Property: `min-width`", dscr = "Snippet for the CSS Property: `min-width`"},
        fmt(
            "min-width: {};",
            {
                insert(1, "<value>")
            }
        )
    ),
    snippet({ trig = "max_width", name = "CSS Property: `max-width`", dscr = "Snippet for the CSS Property: `max-width`"},
        fmt(
            "max-width: {};",
            {
                insert(1, "<value>")
            }
        )
    ),
    snippet({ trig = "height", name = "CSS Property: `height`", dscr = "Snippet for the CSS Property: `height`"},
        fmt(
            "height: {};",
            {
                insert(1, "<value>")
            }
        )
    ),
    snippet({ trig = "min_height", name = "CSS Property: `min-height`", dscr = "Snippet for the CSS Property: `min-height`"},
        fmt(
            "min-height: {};",
            {
                insert(1, "<value>")
            }
        )
    ),
    snippet({ trig = "max_height", name = "CSS Property: `max-height`", dscr = "Snippet for the CSS Property: `max-height`"},
        fmt(
            "max-height: {};",
            {
                insert(1, "<value>")
            }
        )
    ),
    snippet({ trig = "padding", name = "CSS Property: `padding`", dscr = "Snippet for the CSS Property: `padding`"},
        fmt(
            "padding: {};",
            {
                insert(1, "<value>")
            }
        )
    ),
    snippet({ trig = "border", name = "CSS Property: `border`", dscr = "Snippet for the CSS Property: `border`"},
        fmt(
            "border: {};",
            {
                insert(1, "<width> <style> <color>")
            }
        )
    ),
    snippet({ trig = "border_width", name = "CSS Property: `border-width`", dscr = "Snippet for the CSS Property: `border-width`"},
        fmt(
            "border-width: {};",
            {
                insert(1, "<value>")
            }
        )
    ),
    snippet({ trig = "border_top", name = "CSS Property: `border-top`", dscr = "Snippet for the CSS Property: `border-top`"},
        fmt(
            "border-top: {};",
            {
                insert(1, "<value>")
            }
        )
    ),
    snippet({ trig = "border_bottom", name = "CSS Property: `border-bottom`", dscr = "Snippet for the CSS Property: `border-bottom`"},
        fmt(
            "border-bottom: {};",
            {
                insert(1, "<value>")
            }
        )
    ),
    snippet({ trig = "border_left", name = "CSS Property: `border-left`", dscr = "Snippet for the CSS Property: `border-left`"},
        fmt(
            "border-left: {};",
            {
                insert(1, "<value>")
            }
        )
    ),
    snippet({ trig = "border_right", name = "CSS Property: `border-right`", dscr = "Snippet for the CSS Property: `border-right`"},
        fmt(
            "border-right: {};",
            {
                insert(1, "<value>")
            }
        )
    ),
    snippet({ trig = "border_style", name = "CSS Property: `border-style`", dscr = "Snippet for the CSS Property: `border-style`"},
        fmt(
            "border-style: {};",
            {
                insert(1, "<value>")
            }
        )
    ),
    snippet({ trig = "border_color", name = "CSS Property: `border-color`", dscr = "Snippet for the CSS Property: `border-color`"},
        fmt(
            "border-color: {};",
            {
                insert(1, "<value>")
            }
        )
    ),
    -- |> NOTE: The CSS Language Server provides acceptable completion for the margin properties.
    -- snippet({ trig = "margin", name = "CSS Property: `margin`", dscr = "Snippet for the CSS Property: `margin`"},
    --     fmt(
    --         "margin: {};",
    --         {
    --             insert(1, "<value>")
    --         }
    --     )
    -- ),
    -- snippet({ trig = "margin_top", name = "CSS Property: `margin-top`", dscr = "Snippet for the CSS Property: `margin-top`"},
    --     fmt(
    --         "margin-top: {};",
    --         {
    --             insert(1, "<value>")
    --         }
    --     )
    -- ),
    -- snippet({ trig = "margin_bottom", name = "CSS Property: `margin-bottom`", dscr = "Snippet for the CSS Property: `margin-bottom`"},
    --     fmt(
    --         "margin-bottom: {};",
    --         {
    --             insert(1, "<value>")
    --         }
    --     )
    -- ),
    -- snippet({ trig = "margin_left", name = "CSS Property: `margin-left`", dscr = "Snippet for the CSS Property: `margin-left`"},
    --     fmt(
    --         "margin-left: {};",
    --         {
    --             insert(1, "<value>")
    --         }
    --     )
    -- ),
    -- snippet({ trig = "margin_right", name = "CSS Property: `margin-right`", dscr = "Snippet for the CSS Property: `margin-right`"},
    --     fmt(
    --         "margin-right: {};",
    --         {
    --             insert(1, "<value>")
    --         }
    --     )
    -- ),
    snippet({ trig = "comment_heading", name = "comment-heading", dscr = "Snippet for a CSS section comment."},
        fmt(
            "/* === {} === */",
            {
                insert(1)
            }
        )
    ),
}

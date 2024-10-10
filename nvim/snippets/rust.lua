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
    snippet({ trig = "for_in_match", name = "Rust `For..In..Match`", dscr = "Rust `for..in..match`."},
        fmt(
            [[
                for {} in {} {{
                    match {} {{
                        Ok({}) => {},
                        Err(error) => {},
                    }}
                }}
            ]],
            {
                insert(1, "i"),
                insert(2, "iterator"),
                rep(1),
                rep(1),
                insert(3),
                insert(0)
            }
        )
    ),
    snippet({ trig = "or", name = "Rust logical `or`.", dscr = "Rust logical `or`."},
        fmt(
            [[
                || {}
            ]],
            {
                insert(0),
            }
        )
    ),
    snippet({ trig = "and", name = "Rust logical `and`.", dscr = "Rust logical `and`."},
        fmt(
            [[
                && {}
            ]],
            {
                insert(0),
            }
        )
    ),
    snippet({ trig = "modulo", name = "Rust module operator.", dscr = "Rust module operator."},
        fmt(
            [[
                % {}
            ]],
            {
                insert(0),
            }
        )
    ),
    snippet({ trig = "use_instant", name = "Rust: use std::time::Instant", dscr = "Rust Snippet: use std::time::Instant"},
        fmt(
            [[
                use std::time::Instant;{}
            ]],
            {
                insert(0),
            }
        )
    ),
    snippet({ trig = "use_hashmap", name = "Rust: use HashMap", dscr = "Rust: use std::collections::HashMap"},
        fmt(
            [[
                use std::collections::HashMap;{}
            ]],
            {
                insert(0),
            }
        )
    ),
    snippet({ trig = "use_hashset", name = "Rust: use HashSet", dscr = "Rust: use std::collections::HashSet"},
        fmt(
            [[
                use std::collections::HashSet;{}
            ]],
            {
                insert(0),
            }
        )
    ),
    snippet({ trig = "use_btreemap", name = "Rust: use BTreeMap", dscr = "Rust: use std::collections::BTreeMap"},
        fmt(
            [[
                use std::collections::BTreeMap;{}
            ]],
            {
                insert(0),
            }
        )
    ),
    snippet({ trig = "box_dyn", name = "Rust: Box<dyn Thing>", dscr = "Rust: Box<dyn Thing>"},
        fmt(
            [[
                Box<dyn {}>
            ]],
            {
                insert(0),
            }
        )
    ),
    snippet({ trig = "box_new", name = "Rust: Box::new()", dscr = "Rust: Box::new()"},
        fmt(
            [[
                Box::new({})
            ]],
            {
                insert(0),
            }
        )
    ),
    snippet({ trig = "vec_box_dyn", name = "Rust: Vec<Box<dyn Thing>>", dscr = "Rust: Vec<Box<dyn Thing>>"},
        fmt(
            [[
                Vec<Box<dyn {}>>
            ]],
            {
                insert(0),
            }
        )
    ),
    snippet({ trig = "print_no_nl", name = "Rust: print!()", dscr = "Rust: print!()"},
        fmt(
            [[
                print!("{}");
            ]],
            {
                insert(0),
            }
        )
    ),
    snippet({ trig = "print_var_no_nl", name = "Rust: print!('{var}')", dscr = "Rust: print!('{var}')"},
        fmt(
            [[
                print!("{{}}", {});
            ]],
            {
                insert(0),
            }
        )
    ),
    snippet({ trig = "print", name = "Rust: println!('{var}')", dscr = "Rust: println!('{var}')"},
        fmt(
            [[
                println!("{}");
            ]],
            {
                insert(0, "text"),
            }
        )
    ),
    snippet({ trig = "print_var", name = "Rust: println!('{var}')", dscr = "Rust: println!('{var}')"},
        fmt(
            [[
                println!("{{}}", {});
            ]],
            {
                insert(0, "var"),
            }
        )
    ),
    snippet({ trig = "match_enum", name = "Rust: match enum", dscr = "Rust: match enum"},
        fmt(
            [[
                match {} {{
                    {} => {},
                    _other => {},
                }};
            ]],
            {
                insert(1, "enum"),
                insert(2, "variant"),
                insert(3, "action"),
                insert(0, "()"),
            }
        )
    ),
    snippet({ trig = "match_option_unwrap", name = "Rust: `match` Option<T>", dscr = "Rust Snippet: `match` on an option and unwrap the value if `Some(value)`."},
        fmt(
            [[
                match {} {{
                    Some({}) => {},
                    None => {},
                }}{}
            ]],
            {
                insert(1, "optional"),
                insert(2, "value"),
                rep(2),
                insert(3, "()"),
                insert(0),
            }
        )
    ),
    snippet({ trig = "match_result_unwrap", name = "Rust: `match` on a Result<T>", dscr = "Rust Snippet: `match` on a Result<T>"},
        fmt(
            [[
                match {} {{
                    Ok({}) => {},
                    Err(error) => panic!("Error: {{}}", error),
                }}{}
            ]],
            {
                insert(1, "result"),
                insert(2, "value"),
                rep(2),
                insert(0),
            }
        )
    ),
    snippet({ trig = "anyhow_result", name = "Rust: anyhow::Result<>", dscr = "Rust Snippet: anyhow::Result<>"},
        fmt(
            [[
                anyhow::Result<{}>
            ]],
            {
                insert(0),
            }
        )
    ),
    snippet({ trig = "let", name = "Rust: declare variable", dscr = "Rust: declare variable"},
        fmt(
            [[
                let {} = {}
            ]],
            {
                insert(1, "<var-name>"),
                insert(0),
            }
        )
    ),
    snippet({ trig = "if_let", name = "Rust: if let", dscr = "Rust Snippet: if let"},
        fmt(
            [[
                if let {} = {} {{
                    {}
                }}
            ]],
            {
                insert(1),
                insert(2),
                insert(0),
            }
        )
    ),
    snippet({ trig = "if_let_some", name = "Rust: if let Some()", dscr = "Rust Snippet: if let Some()"},
        fmt(
            [[
                if let Some({}) = {} {{
                    {}
                }}
            ]],
            {
                insert(1),
                insert(2),
                insert(0),
            }
        )
    ),
    snippet({ trig = "fn_trait", name = "Rust: Trait function which returns `()`.", dscr = "Rust Snippet: Trait function which returns `()`."},
        fmt(
            [[
                fn {}({});
            ]],
            {
                insert(1, "name"),
                insert(0),
            }
        )
    ),
    snippet({ trig = "fn_trait_return", name = "Rust: Trait function which returns something.", dscr = "Rust Snippet: Trait function which returns something."},
        fmt(
            [[
                fn {}({}) -> {};
            ]],
            {
                insert(1, "name"),
                insert(2),
                insert(0, "Type"),
            }
        )
    ),
    snippet({ trig = "fn_void", name = "Rust: function which returns `()`.", dscr = "Rust: function which returns `()`."},
        fmt(
            [[
                fn {}({}) {{
                    {}
                }}
            ]],
            {
                insert(1, "name"),
                insert(2),
                insert(0, "todo!()"),
            }
        )
    ),
    snippet({ trig = "fn_return", name = "Rust: function which returns something.", dscr = "Rust Snippet: function which returns something."},
        fmt(
            [[
                fn {}({}) -> {} {{
                    {}
                }}
            ]],
            {
                insert(1, "name"),
                insert(2),
                insert(3, "Type"),
                insert(0, "todo!()"),
            }
        )
    ),
    snippet({ trig = "struct", name = "Rust: struct", dscr = "Rust Snippet: struct <name> {}"},
        fmt(
            [[
                struct {} {{
                    {},
                }}
            ]],
            {
                insert(1, "name"),
                insert(0, "field: Type"),
            }
        )
    ),
    snippet({ trig = "enum", name = "Rust: enum", dscr = "Rust Snippet: enum <name> {}"},
        fmt(
            [[
                enum {} {{
                    {},
                }}
            ]],
            {
                insert(1, "name"),
                insert(0, "Variant"),
            }
        )
    ),
    snippet({ trig = "string_from", name = "Rust: Create a `String` from a `&str`.", dscr = "Rust: Create a `String` from a `&str`."},
        fmt(
            [[
                String::from("{}"){}
            ]],
            {
                insert(1, "text"),
                insert(0),
            }
        )
    ),
    snippet({ trig = "string_new", name = "Rust: Create a new `String`.", dscr = "Rust: Create a new `String`."},
        fmt(
            [[
                String::new(){}
            ]],
            {
                insert(0),
            }
        )
    ),
    snippet({ trig = "vec", name = "Rust: vec![]", dscr = "Rust Snippet: vec![]"},
        fmt(
            [[
                vec![{}]
            ]],
            {
                insert(0),
            }
        )
    ),
    snippet({ trig = "vecnew", name = "Rust: Vec::new()", dscr = "Rust: Vec::new()"},
        fmt(
            [[
                Vec::new(){}
            ]],
            {
                insert(0),
            }
        )
    ),
    snippet({ trig = "vec_of_type", name = "Vec<T>", dscr = "Rust Snippet: Vec<T>"},
        fmt(
            [[
                Vec<{}>{}
            ]],
            {
                insert(1, "T"),
                insert(0),
            }
        )
    ),
    snippet({ trig = "todo", name = "todo!()", dscr = "Rust Snippet: todo!()"},
        fmt(
            [[
                todo!(){}
            ]],
            {
                insert(0),
            }
        )
    ),
    snippet({ trig = "parameter", name = "Rust Parameter", dscr = "Rust Snippet: name: Name"},
        fmt(
            [[
                {}: {}
            ]],
            {
                insert(1),
                replace_capitalized(1),
            }
        )
    ),
    snippet({ trig = "instant_now", name = "Rust: let Instant", dscr = "Rust Snippet: let Instant"},
        fmt(
            [[
                let {} = Instant::now();
            ]],
            {
                insert(0, "instant"),
            }
        )
    ),
    snippet({ trig = "impl_display", name = "Rust: impl std::fmt::Display", dscr = "Rust Snippet: impl std::fmt::Display"},
        fmt(
            [[
                impl std::fmt::Display for {} {{
                    fn fmt(&self, formatter: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {{
                        write!(formatter, "{{{}}}", arg)
                    }}
                }}
            ]],
            {
                insert(1, "Name"),
                insert(0),
            }
        )
    ),
    snippet({ trig = "let_string_from_text", name = "Rust: let var = String::from('text')", dscr = "Rust Snippet: let var = String::from('text')"},
        fmt(
            [[
                let {} = String::from("{}");
            ]],
            {
                insert(1, "something"),
                insert(0, "text"),
            }
        )
    ),
    snippet({ trig = "let_string_from_var", name = "Rust: let var = String::from()", dscr = "Rust Snippet: let var = String::from()"},
        fmt(
            [[
                let {} = String::from({});
            ]],
            {
                insert(1, "something"),
                insert(0, "var"),
            }
        )
    ),
    snippet({ trig = "option_of", name = "Rust: Option<T>", dscr = "Rust Snippet: Option<T>"},
        fmt(
            [[
                Option<{}>{}
            ]],
            {
                insert(1, "type"),
                insert(0),
            }
        )
    ),
    snippet({ trig = "result_of", name = "Rust: Result<T>", dscr = "Rust Snippet: Result<T>"},
        fmt(
            [[
                Result<{}, {}>{}
            ]],
            {
                insert(1, "oktype"),
                insert(2, "errtype"),
                insert(0),
            }
        )
    ),
    snippet({ trig = "file_reader", name = "Rust: BufReader over File", dscr = "Rust Snippet: BufReader over File"},
        fmt(
            [[
                let {} = std::io::BufReader::new(
                    std::fs::File::open(path_to_target_file)
                        .context("Failed to open the target file.")?
                );
            ]],
            {
                insert(0, "buf_reader"),
            }
        )
    ),
    snippet({ trig = "module_doc", name = "Rust: Module Documentation", dscr = "Rust Snippet: Module Documentation"},
        fmt(
            [[
                //! # Module: `{}`
                //! {}
            ]],
            {
                filename_without_ext(),
                insert(1),
            }
        )
    ),
    snippet({ trig = "modules_section", name = "Rust: Modules Section", dscr = "Rust Snippet: Modules Section"},
        fmt(
            [[
                // === Modules - START ===
                //
                pub mod {};
                //
                // === Modules - END ===
            ]],
            {
                insert(0),
            }
        )
    ),
    snippet({ trig = "crate_import_section", name = "Rust: Crate Import Section", dscr = "Rust Snippet: Crate Import Section"},
        fmt(
            [[
                // === Crate Imports - START ===
                //
                // `{}`
                use crate::{};
                //
                // === Crate Imports - END ===
            ]],
            {
                rep(1),
                insert(1),
            }
        )
    ),
    snippet({ trig = "dependencies_section", name = "Rust: Dependencies Section", dscr = "Rust Snippet: Dependencies Section"},
        fmt(
            [[
                // === External Dependencies - START ===
                //
                // `{}`
                use {};
                //
                // === External Dependencies - END ===
            ]],
            {
                rep(1),
                insert(1),
            }
        )
    ),
    snippet({ trig = "skipfmt", name = "Rust: `rustfmt::skip`", dscr = "Rust Snippet: `rustfmt::skip`"},
        fmt(
            [[
                #[rustfmt::skip]{}
            ]],
            {
                insert(0),
            }
        )
    ),
    snippet({ trig = "closure", name = "Rust: `closure`", dscr = "Rust Snippet: `closure`"},
        fmt(
            [[
                |{}| {{ {} }}{}
            ]],
            {
                insert(1, "arg"),
                insert(2, "<function-body>"),
                insert(0),
            }
        )
    ),
}

-- End of File

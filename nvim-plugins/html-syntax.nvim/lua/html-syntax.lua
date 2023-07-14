-- Help:
--  - `:syntax list`
--  - `:help :syn-define`
--  - `:help :syn-match`
--  - `:help :syn-region`
--  - `:help :syn-start`
--  - `:help :syn-end`
--  - `:help :syn-skip`
--  - `:help :syn-matchgroup`
--  - `:help :syn-ext-match`
--  - `:help :syntax`

-- Init Module
local Module = {}

-- Alias
local syn = vim.api.nvim_cmd

--             -- MatchType | HL-Group-Name --
--                ^^^^^^^^^   ^^^^^^^^^^^^^
-- syn({ args = { "keyword", "AumWhitespace",
--      Keyword     Keyword     => Keywords to highlight using the designated highlight-group.
--     ^^^^^^^^^  ^^^^^^^^^^^^
--     "keyword", "other_word",
-- }})
--
-- |> Core functionality
function Module.create_html_matchgroups()

    -- |> Alternative syntax definition syntax. ( Do some performance testing I guess.. later. )
    --  - Right now, I have no idea if there is any performance difference
    --    between `vim.cmd()` and `vim.api.nvim_cmd()`.
    -- vim.cmd([[
    --     syntax keyword AumMatch html thing thing thing
    -- ]])

    -- |> `Root` Elements
    syn({ cmd = "syntax", args = { "keyword", "HtmlNvimRootElements", "contained",
        [[ html base head body ]]
    }}, {})

    -- |> `Metadata` Elements
    syn({ cmd = "syntax", args = { "keyword", "HtmlNvimMetaElements", "contained",
        [[ title meta link style ]]
    }}, {})

    -- |> `Content Sectioning` Elements
    syn({ cmd = "syntax", args = { "keyword", "HtmlNvimSectioningElements", "contained",
        [[ main nav header footer section address article aside h1 h2 h3 h4 h5 h6 hgroup ]]
    }}, {})

    -- |> `Text Content` Elements
    syn({ cmd = "syntax", args = { "keyword", "HtmlNvimTextContentElements", "contained",
        [[ div p hr pre dd dl dt li ol ul figure figcaption menu blockquote ]]
    }}, {})

    -- |> `Inline Text Semantics` Elements
    syn({ cmd = "syntax", args = { "keyword", "HtmlNvimInlineTextSemanticsElements", "contained",
        [[ a abbr b bdi bdo br cite code data dfn em i kbd mark q rp rt ruby s small span strong sub sup time u var wbr ]]
    }}, {})

    -- |> `Image and Multimedia` Elements
    syn({ cmd = "syntax", args = { "keyword", "HtmlNvimMultimediaElements", "contained",
        [[ area audio img map track video ]]
    }}, {})

    -- |> `Embedded Content` Elements
    syn({ cmd = "syntax", args = { "keyword", "HtmlNvimEmbeddedContentElements", "contained",
        [[ embed iframe object picture portal source ]]
    }}, {})

    -- |> `SVG and MathML` Elements
    syn({ cmd = "syntax", args = { "keyword", "HtmlNvimSVGMathMLElements", "contained",
        [[ svg math ]]
    }}, {})

    -- |> `Scripting` Elements
    syn({ cmd = "syntax", args = { "keyword", "HtmlNvimScriptingElements", "contained",
        [[ script noscript canvas ]]
    }}, {})

    -- |> `Demarcating Edits` Elements
    syn({ cmd = "syntax", args = { "keyword", "HtmlNvimDemarcatingElements", "contained",
        [[ del ins ]]
    }}, {})

    -- |> `Table Content` Elements
    syn({ cmd = "syntax", args = { "keyword", "HtmlNvimTableContentElements", "contained",
        [[ table thead tbody ftoot caption tr th td col colgroup ]]
    }}, {})

    -- |> `Forms` Elements
    syn({ cmd = "syntax", args = { "keyword", "HtmlNvimFormsElements", "contained",
        [[ form label button input datalist fieldset legend meter ]],
        [[ option optgroup output progress select textarea ]],
    }}, {})

    -- |> `Interactive` Elements
    syn({ cmd = "syntax", args = { "keyword", "HtmlNvimInteractiveElements", "contained",
        [[ details dialog summary ]]
    }}, {})

    -- |> `Web Components` Elements
    syn({ cmd = "syntax", args = { "keyword", "HtmlNvimWebComponentsElements", "contained",
        [[ slot template ]]
    }}, {})

    -- |> `Obsolete and Deprecated` Elements
    syn({ cmd = "syntax", args = { "keyword", "HtmlNvimObsoleteAndDeprecatedElements", "contained",
        [[ acronym applet bgsound big blink center <content> dir font frame framset image keygen marquee menuitem ]],
        [[ nobr noembed noframes param plaintext rb rtc spacer strike tt xmp ]],
    }}, {})

end

-- Setup Function
function Module.setup(opts)
    -- print("Loaded `html-syntax.lua`.")

    -- |> Set matchgroups directly on load.
    --  - Could not get this to work. Presumably because of load-order issues.
    -- Module.create_html_matchgroups()

    -- |> Set matchgroups in `autocmd`.
    local html_syntax_augroup = vim.api.nvim_create_augroup("HtmlSyntaxAugroup", { clear = true })
    vim.api.nvim_create_autocmd("UIEnter", {
        pattern = { '*.html' },
        callback = function()
            Module.create_html_matchgroups()
        end,
        group = html_syntax_augroup,
    })
end

-- Can be called to set default highlight groups.
-- If the groups are defined in a user's theme, this does not need to be called.
function Module.add_basic_highlight_groups()
    -- |> Aliases
    local set_hl = vim.api.nvim_set_hl  -- Like vimscript 'highlight / hi'.
    local ns_id = 0                     -- Global highlight. (Namespace)

    -- |> Set Base Highlights
    set_hl(ns_id, "HtmlNvimRootElements",                   { link = "Warning" })
    set_hl(ns_id, "HtmlNvimMetaElements",                   { link = "Warning" })
    set_hl(ns_id, "HtmlNvimSectioningElements",             { link = "Warning" })
    set_hl(ns_id, "HtmlNvimTextContentElements",            { link = "Warning" })
    set_hl(ns_id, "HtmlNvimInlineTextSemanticsElements",    { link = "Warning" })
    set_hl(ns_id, "HtmlNvimMultimediaElements",             { link = "Warning" })
    set_hl(ns_id, "HtmlNvimEmbeddedContentElements",        { link = "Warning" })
    set_hl(ns_id, "HtmlNvimSVGMathMLElements",              { link = "Warning" })
    set_hl(ns_id, "HtmlNvimScriptingElements",              { link = "Warning" })
    set_hl(ns_id, "HtmlNvimDemarcatingElements",            { link = "Warning" })
    set_hl(ns_id, "HtmlNvimTableContentElements",           { link = "Warning" })
    set_hl(ns_id, "HtmlNvimFormsElements",                  { link = "Warning" })
    set_hl(ns_id, "HtmlNvimInteractiveElements",            { link = "Warning" })
    set_hl(ns_id, "HtmlNvimWebComponentsElements",          { link = "Warning" })
    set_hl(ns_id, "HtmlNvimObsoleteAndDeprecatedElements",  { link = "Error" })
end


-- Return
return Module


-- End of File

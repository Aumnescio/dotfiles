local Module = {}

-- NOTE: This is quite scuffed, but still better than the defaults.
-- And I got this goddamn thing to actually work!!
-- Just need to figure out the algorithm.
Module.GetAumTypstIndent = function(line_number)
    local line = vim.fn.getline(line_number)
    local line_stripped = string.gsub(line, "%s+", "")  -- Remove leading spaces.
    local first_char = string.sub(line_stripped, 1, 1)  -- Lua is `1` indexed..

    if
        -- Not quite sure how to write this in a shorter way in Lua. Ex: `n1 | n2 | n3`
        first_char == '=' or            -- For headings
        first_char == '#' or            -- For #set and friends
        first_char == ')' or            -- For closing code scopes
        first_char == ']' or            -- For closing code scopes
        first_char == '}' or            -- For closing code scopes
        first_char == '/'               -- For comments
    then
        return 0
    else
        return 1 * vim.fn.shiftwidth()
    end
end

function Module.setup()
    vim.api.nvim_create_autocmd("FileType", {
        pattern = { "typst" },
        callback = function()
            -- This `indentexpr` function is defined in the `autoload` directory.
            -- It is based on the above indentation function.
            vim.bo.indentexpr = "typstindent#GetAumTypstIndent(v:lnum)"

            -- Add automatiq re-indentation after `#`, `/` and `=`.
            --  - For #set, comments, and headings.
            vim.bo.indentkeys = vim.bo.indentkeys .. ',0#,0/,0='
        end
    })
end

return Module

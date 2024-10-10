-- Define your search terms and associated regex patterns.
local search_terms = {
    { term = "struct",  regex = [[^(?!.*//)(?!.*/\*.*\*\/)(?:\s*//[^\n]*)?\s*(?:pub(?:\s*\([^)]*\))?\s+)?struct\s+([A-Za-z_]\w*)(\s*<[^>]*>)?]] },
    { term = "fn",      regex = [[^(?!.*//)(?!.*/\*.*\*\/)(?:\s*//[^\n]*)?\s*(?:pub(?:\s*\([^)]*\))?\s+)?(?:async\s+)?fn\s+([A-Za-z_]\w*)(\s*<[^>]*>)?]] },
    { term = "enum",    regex = [[^(?!.*//)(?!.*/\*.*\*\/)(?:\s*//[^\n]*)?\s*(?:pub(?:\s*\([^)]*\))?\s+)?enum\s+([A-Za-z_]\w*)(\s*<[^>]*>)?]] },
    { term = "trait",   regex = [[^(?!.*//)(?!.*/\*.*\*\/)(?:\s*//[^\n]*)?\s*(?:pub(?:\s*\([^)]*\))?\s+)?trait\s+([A-Za-z_]\w*)(\s*<[^>]*>)?]] },
    { term = "mod",     regex = [[^(?!.*//)(?!.*/\*.*\*\/)(?:\s*//[^\n]*)?\s*(?:pub\s+)?mod\s+[A-Za-z_]\w*]] },
    { term = "type",    regex = [[^(?!.*//)(?!.*/\*.*\*\/)(?:\s*//[^\n]*)?\s*(?:pub(?:\s*\([^)]*\))?\s+)?type\s+([A-Za-z_]\w*)(\s*<[^>]*>)?]] },
    { term = "const",   regex = [[^(?!.*//)(?!.*/\*.*\*\/)(?:\s*//[^\n]*)?\s*(?:pub\s+)?const\s+[A-Za-z_]\w*]] },
    { term = "static",  regex = [[^(?!.*//)(?!.*/\*.*\*\/)(?:\s*//[^\n]*)?\s*(?:pub\s+)?static\s+[A-Za-z_]\w*]] },
    { term = "macro",   regex = [[^(?!.*//)(?!.*/\*.*\*\/)(?:\s*//[^\n]*)?\s*macro_rules!\s+[A-Za-z_]\w*]] },
    { term = "impl",    regex = [[^(?!.*//)(?!.*/\*.*\*\/)(?:\s*//[^\n]*)?\s*impl(?:\s*<[^>]*>)?\s+([A-Za-z_]\w*)(?:\s*<[^>]*>)?(?:\s+for\s+([A-Za-z_]\w*))?]] },
    { term = "derive",  regex = "#%[derive%(([^)]+)%)%]" },
    { term = "attr",    regex = "#%[[^%]]+%]" },
    { term = "union",   regex = [[^(?!.*//)(?!.*/\*.*\*\/)(?:\s*//[^\n]*)?\s*(?:pub\s+)?union\s+[A-Za-z_]\w*]] },
    { term = "unsafe",  regex = [[^(?!.*//)(?!.*/\*.*\*\/)(?:\s*//[^\n]*)?\s*unsafe\s*\{]] },
}

-- Function to show `fzf` popup and run `Rg` with the chosen regex.
function RustFzfRg()
    -- Create a table of search terms (for display)
    local choices = {}

    -- Fill `choices` with `search_terms.term`'s.
    for _, item in ipairs(search_terms) do
        table.insert(choices, item.term)
    end

    -- Use `fzf#run` to show the `fzf` popup.
    vim.fn['fzf#run']({
        source = choices,

        sink = function(choice)
            -- Find the selected search term's regex.
            for _, item in ipairs(search_terms) do
                if item.term == choice then
                    -- Use `Rg` with the selected regex pattern.
                    vim.cmd('Rg ' .. item.regex)
                    break
                end
            end
        end,

        options = '--prompt="Select Search Term: "'
    })
end

-- Binding to call the function.
require("legendary").keymaps({
    { "<Space>rzg",   "<Cmd>lua RustFzfRg()<CR>",     description = "[Aum/fzf/rg]: Search for Rust constructs.",    mode = "n",   opts = { noremap = true, silent = true } },
})

-- End of File

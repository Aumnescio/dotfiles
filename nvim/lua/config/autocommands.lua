-- |> Set scroll distance for `<C-u>` and `<C-d>`:
--  - I suspect that this isn't working well.
-- vim.api.nvim_create_autocmd("VimEnter,WinNew,WinEnter,WinResized,BufNew,BufEnterPost,BufWinEnter,VimResized", {
--     pattern = "*",
--     callback = function()
--         vim.wo.scroll = 3
--     end,
-- })

-- |> Highlight when yanking / copying.     ( NOTE: This seems to work better when it's not in a `augroup`. )
vim.api.nvim_create_autocmd("TextYankPost", {
    command = [[
        silent! lua vim.highlight.on_yank({
            higroup = 'AumYankHighlight',
            timeout = 180,
            on_visual = false,
        })
    ]]      -- `on_visual` seems to cause lingering highlights sometimes, so it's disabled.
})

-- |> Fix conceal in help files.
local help_conceal_aumgroup = vim.api.nvim_create_augroup("MyHelpConceal", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "help" },
    command = 'lua vim.wo.concealcursor = ""',
    group = help_conceal_aumgroup
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "help" },
    command = 'lua vim.wo.conceallevel = 0',
    group = help_conceal_aumgroup
})

-- |> Enable (Or disable) full conceal in Markdown, LaTeX, and Org files.
local writer_aumgroup = vim.api.nvim_create_augroup("MyMarkdownConceal", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.md", "*.tex", "*.org", "*.norg", "*.typ" },
    command = "lua vim.wo.conceallevel = 2",  -- Set to 0 to always show conceal characters. ( 2 or 3 to always conceal. )
    group = writer_aumgroup
})

-- |> Enable hard line breaks in Markdown, LaTeX, and Org files.
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.md", "*.tex", "*.org", "*.norg", "*.typ" },
    command = "lua vim.bo.textwidth = 84",
    group = writer_aumgroup
})

-- Testing formatprg for `typ` files.
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.md", "*.tex", "*.org", "*.norg", "*.typ" },
    command = "lua vim.opt.formatprg = \"fmt --width 84\"",
    group = writer_aumgroup
})

-- |> Some indent fixing thing, maybe.
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.md", "*.tex" },
    command = 'lua vim.opt.indentexpr = ""',
    group = writer_aumgroup
})

-- |> Some indent fixing thing, maybe, for `C#`. (C-Sharp)
-- NOTE: This really does not want to work.
-- vim.api.nvim_create_autocmd("BufEnter", {
--     pattern = { "*.cs" },
--     -- command = 'lua vim.opt.indentexpr = ""',
--     command = 'lua vim.opt.indentexpr = "nvim_treesitter#indent()"',  -- This does not seem to be working. I'm not even sure if this is a thing.
--     group = writer_aumgroup
-- })

-- |> `norg` filetype detection, because Neorg does not provide it before it is loaded.
-- vim.api.nvim_create_autocmd("BufRead,BufNewFile", {
--     pattern = { "*.norg" },
--     callback = function()
--         vim.bo.filetype = "norg"
--     end,
-- })

-- |> Lazy-load Neorg.           ( Neorg does not conceal properly when normally lazy-loaded.  )
--  - This is getting outdated. But there are so many problems with Neorg.
-- vim.api.nvim_create_autocmd("Filetype", {
--     pattern = { "norg" },
--     callback = function()
--         if not require("lazy.core.config").plugins["neorg"]._.loaded then
--             vim.api.nvim_cmd({ cmd = "StartNeorg" }, {})
--
--             -- Fix concealer not activating:
--             vim.api.nvim_cmd({ cmd = "Neorg", args = { "toggle-concealer" } }, {})
--             vim.api.nvim_cmd({ cmd = "Neorg", args = { "toggle-concealer" } }, {})
--
--             -- Autoindent on `-`.   ( List Items )
--             --  - NOTE: For some reason the `append()` method is not working here.
--             --  - NOTE: Even if the key is manually appended, the indenting functionality is wrong.
--             -- vim.bo.indentkeys:append('-')
--         end
--     end,
-- })

-- |> Treesitter Folding for some filetypes: `norg`
--  - NOTE: The fold expression increases Neorg startuptime by at least about 10-25%.
--  - I do not like these a lot, but they are generally better than nothing.
--  - NOTE: Using `nvim-ufo`, so don't want these active.
-- vim.api.nvim_create_autocmd("Filetype", {
--     pattern = { "norg" },
--     callback = function()
--         vim.wo.foldmethod   = "expr"
--         vim.wo.foldexpr     = "nvim_treesitter#foldexpr()"
--         vim.wo.foldenable   = true
--     end,
-- })

-- TS Folding for Rust. ( Not great, but fine'ish. )
-- vim.api.nvim_create_autocmd("Filetype", {
--     pattern = { "rust" },
--     callback = function()
--         vim.wo.foldmethod   = "expr"
--         vim.wo.foldexpr     = "nvim_treesitter#foldexpr()"
--         vim.wo.foldenable   = true
--     end,
-- })

-- Enable `list` and `line numbers` in Rust files.
vim.api.nvim_create_autocmd("Filetype", {
    pattern = { "rust" },
    callback = function()
        vim.api.nvim_cmd({ cmd = "set", args = { "list" }}, {})
        vim.api.nvim_cmd({ cmd = "set", args = { "nu" }}, {})
    end,
})

-- |> Search Highlight AutoCommands         ( Good, but can potentially cause lag. ( The highlight, not so much the autocmd itself. ) )
local search_hl_aumgroup = vim.api.nvim_create_augroup("MySearchHL", { clear = true })
vim.api.nvim_create_autocmd("CmdlineEnter", {
    pattern = {'/', '\\?'},
    command = "set hlsearch",
    group = search_hl_aumgroup
})
vim.api.nvim_create_autocmd("CmdlineLeave", {
    pattern = {'/', '\\?'},
    command = "set nohlsearch",
    group = search_hl_aumgroup
})

-- |> Formatoptions.    ( STATE: Good | Setting `formatoptions` in an `autocmd` works well. )
local formatopt_aumgroup = vim.api.nvim_create_augroup("MyFormatOpts", { clear = true })
vim.api.nvim_create_autocmd("BufEnter",{
    pattern = { "*" },
    command = "set fo-=r fo-=o",
    group = formatopt_aumgroup
})

-- |> Assembly Syntax (Asm)
local asmsyntax_aumgroup = vim.api.nvim_create_augroup("MyAsmSyntax", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { '*.asm' },
    command = "lua vim.bo.filetype = 'nasm'",
    group = asmsyntax_aumgroup
})

-- Autocommands to change "commentstring" for specific filetypes. (TODO: Create lua version.)
-- |> Use "//" instead of "/* */" for 'C' and 'cpp' files.
vim.cmd([[
augroup set-commentstring-ag
autocmd!
    autocmd BufEnter *.c :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
    autocmd BufFilePost *.c :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s")

    autocmd BufEnter *.cpp :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
    autocmd BufFilePost *.cpp :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s")

    autocmd BufEnter *.h :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
    autocmd BufFilePost *.h :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s")

    autocmd BufEnter *.hpp :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
    autocmd BufFilePost *.hpp :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s")

    autocmd BufEnter *.svelte :lua vim.api.nvim_buf_set_option(0, "commentstring", "<!-- %s -->")
    autocmd BufFilePost *.svelte :lua vim.api.nvim_buf_set_option(0, "commentstring", "<!-- %s -->")

    autocmd BufEnter *.fish :lua vim.api.nvim_buf_set_option(0, "commentstring", "# %s")
    autocmd BufFilePost *.fish :lua vim.api.nvim_buf_set_option(0, "commentstring", "# %s")

    autocmd BufEnter *.conf :lua vim.api.nvim_buf_set_option(0, "commentstring", "# %s")
    autocmd BufFilePost *.conf :lua vim.api.nvim_buf_set_option(0, "commentstring", "# %s")

    autocmd BufEnter *.typ :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
    autocmd BufFilePost *.typ :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
augroup END
]])

-- START => Trailing Whitespace Highlighting
local function AumHighlightTrailingWhitespace()
    vim.api.nvim_cmd({ cmd = "match", args = { "AumTrailingWhitespace", [[/\s\+$/]] }}, {})
end

local function AumDisableTrailingWhitespaceHighlight()
    vim.api.nvim_cmd({ cmd = "match" }, {})
    -- vim.api.nvim_cmd({ cmd = "call", args = { "clearmatches()" }}, {})  -- Alternative way to clear matches, I guess.
end

-- |> Autocommands to toggle trailing whitespace highlighting.
--  - NOTE: Suspecting that these cause issues with folding. (Apparently not...)
--  - TODO: Could still find better way to clear whitespace.
local syntax_matching_aumgroup = vim.api.nvim_create_augroup("MyTrailingWhitespaceHighlight", { clear = true })
vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function()
        AumHighlightTrailingWhitespace()
    end,
    group = syntax_matching_aumgroup
})
vim.api.nvim_create_autocmd("InsertEnter", {
    callback = function()
        AumDisableTrailingWhitespaceHighlight()
    end,
    group = syntax_matching_aumgroup
})
-- END => Trailing Whitespace Highlighting

-- |> Set tabstop/shiftwidth to `2` in HTML files.
--  - NOTE: Really just awkward to use because the snippet files don't follow this indentation.
--  - I'm fine with tabstops of `4`.
-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = { "html" },
--     callback = function()
--         vim.bo.tabstop      = 2
--         vim.bo.softtabstop  = 2
--         vim.bo.shiftwidth   = 2
--     end,
-- })

-- |> If indent opts are not being set properly.
--  - This successfully forces `autoindent` and `smartindent` values, but is not quite fixing my indent issues.
-- local autoindent_aumgroup = vim.api.nvim_create_augroup("MyAutoIndent", { clear = true })
-- vim.api.nvim_create_autocmd("BufEnter", {
--     pattern = { '*' },
--     callback = function()
--         vim.bo.autoindent   = true
--         vim.bo.smartindent  = true
--     end,
--     group = autoindent_aumgroup
-- })

-- Filetype detection for Slint files.
local slint_ftdetect_aumgroup = vim.api.nvim_create_augroup("MySlintFtdetect", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { '*.slint' },
    callback = function()
        vim.cmd("set filetype=slint")
        vim.cmd("setlocal comments=://")
        vim.cmd("setlocal commentstring=//\\ %s")
    end,
    group = slint_ftdetect_aumgroup
})

-- `rusty-tags` things
local rusty_tags_aumgroup = vim.api.nvim_create_augroup("MyRustyTags", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead" }, {
    pattern = { '*.rs' },
    callback = function()
        vim.api.nvim_cmd({ cmd = "setlocal", args = { "tags=./rusty-tags.vi;/" }}, {})

        -- NOTE: The Rust Source clutters too much and is not really useful.
        -- vim.api.nvim_cmd({ cmd = "setlocal", args = { "tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi" }}, {})
    end,
    group = rusty_tags_aumgroup
})

-- Testing nuking Treesitter highlighting for lua files.
--  - NOTE: This works. I would like for the builtin disable functions to work though, too.
--  - NOTE: However, lua highlighting is quite sad without Treesitter. (Though performance is 5000x of Treesitter.)
--  - NOTE: Added: `euclidianAce/BetterLua.vim` for use with this.
local lua_treesitter_highlight_aumgroup = vim.api.nvim_create_augroup("AumLuaTreesitterHighlightDisable", { clear = true })
vim.api.nvim_create_autocmd("BufRead", {
    pattern = { '*.lua' },
    callback = function()
        vim.treesitter.stop()
    end,
    group = lua_treesitter_highlight_aumgroup
})

-- `get_rust_analyzer_client_id`
local function get_rust_analyzer_client_id()
    local lsp_clients = vim.lsp.get_clients()

    if lsp_clients == nil then
        return
    end

    for _, client in ipairs(lsp_clients) do
        if client.name == "rust-analyzer" then
            return true, client.id
        end
    end

    return false, 0
end

-- |> LSP: `Rustaceanvim` and `Rust-Analyzer` attaching to buffers.
-- TODO: Test if this works.
local rustanceanvim_lsp_aumgroup = vim.api.nvim_create_augroup("RustaceanvimLspAumGroup", { clear = true })
vim.api.nvim_create_autocmd("BufRead", {
    pattern = { '*.rs' },
    callback = function()
        -- Get the current `bufnr`. (Not sure if this works, but looks like it does.)
        local bufnr = vim.fn.bufnr()
        -- local found_rust_analyzer = false
        -- local rust_analyzer_id = 0

        -- |> Get the `rust-analyzer` LS client ID.  (Early exit if can't find it.)
        local found_rust_analyzer, rust_analyzer_id = get_rust_analyzer_client_id()

        if not found_rust_analyzer then
            return
        end


        -- |> Early exit if client is already attached to the buffer.
        local is_attached_already = vim.lsp.buf_is_attached(bufnr, rust_analyzer_id)

        if is_attached_already then
            return
        end


        -- |> Otherwise, attach `rust-analyzer` client to the buffer.
        local success = vim.lsp.buf_attach_client(bufnr, rust_analyzer_id)

        if success then
            print("Attached `rust-analyzer` to buffer.")
        else
            print("Failed to attach `rust-analyzer` to buffer.")
        end
    end,
    group = rustanceanvim_lsp_aumgroup
})

-- End of File

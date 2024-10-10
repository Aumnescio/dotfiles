-- File:        `ftdetect/typst.lua`

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = { "*.typ" },
    callback = function()
        vim.bo.filetype = "typst"
        vim.opt.formatprg = "fmt --width 84"
    end,
})

-- End of File

-- |> Global toggle values for installed plugins.

local M = {}

M.plugin_state_table = {
    -- Plugin Manager
    lazy_enabled                            = true,         -- Can't disable lazy with this... (TODO?)

    -- Themes
    aumnechroma_enabled                     = true,
    catppuccin_enabled                      = false,

    -- Treesitter
    nvim_treesitter_enabled                 = true,
    nvim_treesitter_textobjects_enabled     = true,
    nvim_context_vt_enabled                 = true,

    -- LSP
    nvim_lspconfig_enabled                  = true,
    lspkind_nvim_enabled                    = true,

    -- LSP Helper
    langserver_prefs_enabled                = true,
    nvim_lsp_endhints_enabled               = true,
    rustaceanvim_enabled                    = true,
    typescript_tools_enabled                = true,
    ccls_enabled                            = true,
    slint_langserver_setup_enabled          = true,
    godot_langserver_setup_enabled          = true,
    fidget_enabled                          = true,
    neoconf_enabled                         = false,
    neodev_enabled                          = false,

    -- Debugging
    nvim_dap_enabled                        = false,
    nvim_dap_ui_enabled                     = false,

    -- Autocompletion
    nvim_cmp_enabled                        = true,        -- `false` will almost certainly disable the cmp extensions below as well.
    cmp_nvim_lsp_enabled                    = true,
    cmp_luasnip_enabled                     = true,
    cmp_luasnip_choice_enabled              = true,
    cmp_cmdline_enabled                     = true,
    cmp_path_enabled                        = true,
    cmp_fuzzy_buffer_enabled                = true,

    -- Snippets
    luasnip_enabled                         = true,

    -- Keys/Bindings Util
    legendary_enabled                       = true,
    key_analyzer_enabled                    = false,

    -- Fuzzy Finding / Search
    fzf_enabled                             = true,
    fzfvim_enabled                          = true,
    fuzzy_enabled                           = true,
    telescope_enabled                       = true,
    telescope_ui_select_enabled             = true,
    telescope_fzf_native_enabled            = true,

    -- UI Util
    nui_enabled                             = true,
    dressing_enabled                        = true,
    -- nvim_nio_enabled                        = true,         -- NOTE: Apparently lazy automatically pulls this in and activates it. Not really within my control. (nvim-neotest/nvim-nio)

    -- UI Element
    heirline_enabled                        = true,
    trouble_enabled                         = true,
    nvim_web_devicons_enabled               = true,
    git_blame_enabled                       = false,

    -- Folding
    nvim_ufo_enabled                        = true,

    -- Syntax Highlighting
    sentiment_enabled                       = true,
    hlchunk_enabled                         = false,
    betterlua_enabled                       = false,

    -- Keybinding improvements / additions
    nvim_spider_enabled                     = true,
    moveline_enabled                        = true,
    vi_viz_enabled                          = false,
    vim_visual_multi_enabled                = false,

    -- Scrolling Improvement
    scrolleof_enabled                       = true,

    -- Undo
    undotree_enabled                        = true,

    -- Misc Utils
    plenary_enabled                         = true,
    pathlib_enabled                         = true,
    lua_utils_enabled                       = true,
    promise_async_enabled                   = true,
    sqlite_enabled                          = true,
    live_command_enabled                    = true,
    auto_trim_nearby_whitespace_enabled     = true,
    urlview_enabled                         = true,
    vim_eunuch_enabled                      = true,
    vim_repeat_enabled                      = true,
    mini_enabled                            = true,
}

M.create_globals = function()
    local global = vim.g

    global.aum_plugin_lazy_enabled                          = M.plugin_state_table.lazy_enabled
    global.aum_plugin_aumnechroma_enabled                   = M.plugin_state_table.aumnechroma_enabled
    global.aum_plugin_catppuccin_enabled                    = M.plugin_state_table.catppuccin_enabled
    global.aum_plugin_auto_trim_nearby_whitespace_enabled   = M.plugin_state_table.auto_trim_nearby_whitespace_enabled
    global.aum_plugin_betterlua_enabled                     = M.plugin_state_table.betterlua_enabled
    global.aum_plugin_cmp_cmdline_enabled                   = M.plugin_state_table.cmp_cmdline_enabled
    global.aum_plugin_cmp_fuzzy_buffer_enabled              = M.plugin_state_table.cmp_fuzzy_buffer_enabled
    global.aum_plugin_cmp_luasnip_choice_enabled            = M.plugin_state_table.cmp_luasnip_choice_enabled
    global.aum_plugin_cmp_nvim_lsp_enabled                  = M.plugin_state_table.cmp_nvim_lsp_enabled
    global.aum_plugin_cmp_path_enabled                      = M.plugin_state_table.cmp_path_enabled
    global.aum_plugin_cmp_luasnip_enabled                   = M.plugin_state_table.cmp_luasnip_enabled
    global.aum_plugin_dressing_enabled                      = M.plugin_state_table.dressing_enabled
    global.aum_plugin_fuzzy_enabled                         = M.plugin_state_table.fuzzy_enabled
    global.aum_plugin_fzf_enabled                           = M.plugin_state_table.fzf_enabled
    global.aum_plugin_fzfvim_enabled                        = M.plugin_state_table.fzfvim_enabled
    global.aum_plugin_heirline_enabled                      = M.plugin_state_table.heirline_enabled
    global.aum_plugin_legendary_enabled                     = M.plugin_state_table.legendary_enabled
    global.aum_plugin_live_command_enabled                  = M.plugin_state_table.live_command_enabled
    global.aum_plugin_nvim_lspconfig_enabled                = M.plugin_state_table.nvim_lspconfig_enabled
    global.aum_plugin_lspkind_nvim_enabled                  = M.plugin_state_table.lspkind_nvim_enabled
    global.aum_plugin_lua_utils_enabled                     = M.plugin_state_table.lua_utils_enabled
    global.aum_plugin_luasnip_enabled                       = M.plugin_state_table.luasnip_enabled
    global.aum_plugin_mini_enabled                          = M.plugin_state_table.mini_enabled
    global.aum_plugin_moveline_enabled                      = M.plugin_state_table.moveline_enabled
    global.aum_plugin_nvim_cmp_enabled                      = M.plugin_state_table.nvim_cmp_enabled
    -- global.aum_plugin_nvim_nio_enabled                      = M.plugin_state_table.nvim_nio_enabled
    global.aum_plugin_nui_enabled                           = M.plugin_state_table.nui_enabled
    global.aum_plugin_nvim_spider_enabled                   = M.plugin_state_table.nvim_spider_enabled
    global.aum_plugin_nvim_treesitter_enabled               = M.plugin_state_table.nvim_treesitter_enabled
    global.aum_plugin_nvim_treesitter_textobjects_enabled   = M.plugin_state_table.nvim_treesitter_textobjects_enabled
    global.aum_plugin_nvim_context_vt_enabled               = M.plugin_state_table.nvim_context_vt_enabled
    global.aum_plugin_nvim_ufo_enabled                      = M.plugin_state_table.nvim_ufo_enabled
    global.aum_plugin_nvim_web_devicons_enabled             = M.plugin_state_table.nvim_web_devicons_enabled
    global.aum_plugin_pathlib_enabled                       = M.plugin_state_table.pathlib_enabled
    global.aum_plugin_plenary_enabled                       = M.plugin_state_table.plenary_enabled
    global.aum_plugin_promise_async_enabled                 = M.plugin_state_table.promise_async_enabled
    global.aum_plugin_scrolleof_enabled                     = M.plugin_state_table.scrolleof_enabled
    global.aum_plugin_sentiment_enabled                     = M.plugin_state_table.sentiment_enabled
    global.aum_plugin_sqlite_enabled                        = M.plugin_state_table.sqlite_enabled
    global.aum_plugin_telescope_enabled                     = M.plugin_state_table.telescope_enabled
    global.aum_plugin_telescope_ui_select_enabled           = M.plugin_state_table.telescope_ui_select_enabled
    global.aum_plugin_telescope_fzf_native_enabled          = M.plugin_state_table.telescope_fzf_native_enabled
    global.aum_plugin_undotree_enabled                      = M.plugin_state_table.undotree_enabled
    global.aum_plugin_vim_eunuch_enabled                    = M.plugin_state_table.vim_eunuch_enabled
    global.aum_plugin_vim_repeat_enabled                    = M.plugin_state_table.vim_repeat_enabled

    global.aum_plugin_key_analyzer_enabled                  = M.plugin_state_table.key_analyzer_enabled
    global.aum_plugin_langserver_prefs_enabled              = M.plugin_state_table.langserver_prefs_enabled
    global.aum_plugin_nvim_lsp_endhints_enabled             = M.plugin_state_table.nvim_lsp_endhints_enabled
    global.aum_plugin_rustaceanvim_enabled                  = M.plugin_state_table.rustaceanvim_enabled
    global.aum_plugin_typescript_tools_enabled              = M.plugin_state_table.typescript_tools_enabled
    global.aum_plugin_ccls_enabled                          = M.plugin_state_table.ccls_enabled
    global.aum_plugin_slint_langserver_setup_enabled        = M.plugin_state_table.slint_langserver_setup_enabled
    global.aum_plugin_godot_langserver_setup_enabled        = M.plugin_state_table.godot_langserver_setup_enabled
    global.aum_plugin_fidget_enabled                        = M.plugin_state_table.fidget_enabled
    global.aum_plugin_hlchunk_enabled                       = M.plugin_state_table.hlchunk_enabled

    global.aum_plugin_neoconf_enabled                       = M.plugin_state_table.neoconf_enabled
    global.aum_plugin_neodev_enabled                        = M.plugin_state_table.neodev_enabled

    global.aum_plugin_nvim_dap_enabled                      = M.plugin_state_table.nvim_dap_enabled
    global.aum_plugin_nvim_dap_ui_enabled                   = M.plugin_state_table.nvim_dap_ui_enabled

    global.aum_plugin_trouble_enabled                       = M.plugin_state_table.trouble_enabled
    global.aum_plugin_vi_viz_enabled                        = M.plugin_state_table.vi_viz_enabled
    global.aum_plugin_vim_visual_multi_enabled              = M.plugin_state_table.vim_visual_multi_enabled
    global.aum_plugin_urlview_enabled                       = M.plugin_state_table.urlview_enabled

    global.aum_plugin_git_blame_enabled                     = M.plugin_state_table.git_blame_enabled
end

return M

-- End of File

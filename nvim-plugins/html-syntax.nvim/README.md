# HTML-Syntax.lua

Provides HTML Syntax Matchgroups for Neovim, written in Lua.
Can be easily lazy-loaded with `lazy.nvim`.


## Lazy-loading

- This plugin does not provide it's own lazy-loading to avoid any issues with `lazy.nvim`.
    - Lazy-loading can be easily accomplished by using `ft = "html"` in the `lazy.nvim`
    plugin spec config.

## Usage in other filetypes

- NOTE: The HTML Syntax Matchgroups can be loaded into any buffer or filetype.
    - If this is desired, more filetypes can be added to the `lazy.nvim` plugin spec config.

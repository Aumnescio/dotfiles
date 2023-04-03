# Aumnescio's Config Files

## Neovim Theme Install

![Image of Colorscheme](https://user-images.githubusercontent.com/100923931/229387916-100e19f3-a352-4afa-acde-ba089b5afa7f.png)

Relevant files:

- ./nvim/colors/aumnechroma-theme.lua
- ./nvim/lua/aumnechroma/colors.lua

If you want to use the Aumnechroma theme, you can copy the files into:

- ~/.config/nvim/colors/aumnechroma-theme.lua
- ~/.config/nvim/lua/aumnechroma/colors.lua

Then just call:

```lua
vim.api.nvim_cmd({ cmd = "colorscheme", args = { "aumnechroma-theme" }}, {})
```

Or for vimscript:

```vim
colorscheme aumnechroma-theme
```

All the config for the theme is easily handled inside the source files.

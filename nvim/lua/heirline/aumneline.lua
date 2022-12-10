-- === |> - Heirline / Aumneline - <| ===

-- Fully custom and very easy to configure.

-- |> Colors
local colors = require("aumnechroma.colors")

-- |> Helpers
local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

-- |> Status Line components

-- START => Empty Space
local Space = {
    provider = "   ",
}

local Align = {
    provider = "%=",
}

-- END => Empty Space

-- START => ViModeIndicator
local ViModeIndicator = {
    -- Get current ViMode. This information will be required by the provider
    -- and the highlight functions, so we compute it only once per component
    -- evaluation and store it as a component attribute.
    init = function(self)
        self.mode = vim.fn.mode(1)  -- Help: ':help mode()'

        -- Execute this only once. This is required if you want the ViMode
        -- component to be updated on operator pending mode.
        if not self.once then
            vim.api.nvim_create_autocmd("ModeChanged", {
                pattern = "*:*o",
                command = "redrawstatus"
            })
            self.once = true
        end
    end,

    -- Now we define some dictionaries to map the output of `mode()` to the
    -- corresponding string and color. We can put these into `static` to compute
    -- them at initialisation time.
    static = {
        mode_names = {  -- Change the strings if you like it vvvvverbose!
            n = "N",
            no = "N?",
            nov = "N?",
            noV = "N?",
            ["no\22"] = "N?",
            niI = "Ni",
            niR = "Nr",
            niV = "Nv",
            nt = "Nt",
            v = "V",
            vs = "Vs",
            V = "V_",
            Vs = "Vs",
            ["\22"] = "^V",
            ["\22s"] = "^V",
            s = "S",
            S = "S_",
            ["\19"] = "^S",
            i = "I",
            ic = "Ic",
            ix = "Ix",
            R = "R",
            Rc = "Rc",
            Rx = "Rx",
            Rv = "Rv",
            Rvc = "Rv",
            Rvx = "Rv",
            c = "C",
            cv = "Ex",
            r = "...",
            rm = "M",
            ["r?"] = "?",
            ["!"] = "!",
            t = "T",
        },
        mode_colors = {
            n = colors.mauve,
            i = colors.green,
            v = colors.amber,
            V = colors.orange,
            ["\22"] = colors.cyan,
            c = colors.cyan,
            s = colors.magenta,
            S = colors.magenta,
            ["\19"] = colors.magenta,
            R = colors.red,
            r = colors.red,
            ["!"] = colors.rose,
            t = colors.rose,
        }
    },

    -- We can now access the value of `mode()` that, by now, would have been
    -- computed by `init()` and use it to index our strings dictionary.
    -- note how `static` fields become just regular attributes once the
    -- component is instantiated.
    -- To be extra meticulous, we can also add some vim statusline syntax to
    -- control the padding and make sure our string is always at least 2
    -- characters long. Plus a nice Icon.
    provider = function(self)
        return " %2("..self.mode_names[self.mode].."%)"
    end,

    -- Same goes for the highlight. Now the foreground will change according to the current mode.
    hl = function(self)
        local mode = self.mode:sub(1, 1)  -- Get only the first mode character.
        return { fg = self.mode_colors[mode], bold = true }
    end,

    -- Re-evaluate the component only on ModeChanged event!
    -- This is not required in any way, but it's there, and it's a small
    -- performance improvement.
    update = {
        "ModeChanged",
    },
}
-- END => ViModeIndicator

-- START => FileNameBlock
local FileNameBlock = {
    -- Let's first set up some attributes needed by this component and it's children
    init = function(self)
        self.filename = vim.api.nvim_buf_get_name(0)
    end,
}

local FileIcon = {
    init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ":e")
        self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
    end,

    provider = function(self)
        return self.icon and (self.icon .. " ")
    end,

    hl = function(self)
        return { fg = self.icon_color }
    end
}

local FileName = {
    provider = function(self)
        -- First, trim the pattern relative to the current directory. For other
        -- options, see `:help filename-modifers`.
        local filename = vim.fn.fnamemodify(self.filename, ":.")
        if filename == "" then return "[No Name]" end
        -- Now, if the filename would occupy more than 1/4th of the available
        -- space, we trim the file path to its initials.
        if not conditions.width_percent_below(#filename, 0.25) then
            filename = vim.fn.pathshorten(filename)
        end
        return filename
    end,

    hl = { fg = colors.heaven },
}

local FileFlags = {
    {
        condition = function()
            return vim.bo.modified
        end,

        provider = "[+]",
        hl = { fg = colors.green },
    },

    {
        condition = function()
            return not vim.bo.modifiable or vim.bo.readonly
        end,

        provider = "",
        hl = { fg = colors.amber },
    },
}

local FileNameModifier = {
    hl = function()
        if vim.bo.modified then
            -- use `force` because we need to override the child's hl foreground
            return { fg = colors.cyan, bold = true, force=true }
        end
    end,
}

-- Add the children to our FileNameBlock component
FileNameBlock = utils.insert(FileNameBlock,
    FileIcon,
    utils.insert(FileNameModifier, FileName),  -- A new table where FileName is a child of FileNameModifier.
    unpack(FileFlags),  -- A small optimisation, since their parent does nothing.
    { provider = '%<'}  -- This means that the statusline is cut here when there's not enough space.
)
-- END => FileNameBlock

-- START => Extra File Info
local FileType = {
    provider = function()
        return string.upper(vim.bo.filetype)
    end,

    hl = { fg = colors.hail },
}

-- local FileEncoding = {
--     provider = function()
--         local enc = (vim.bo.fenc ~= '' and vim.bo.fenc) or vim.o.enc -- :h 'enc'
--         return enc ~= 'utf-8' and enc:upper()
--     end,
-- }

-- local FileFormat = {
--     provider = function()
--         local fmt = vim.bo.fileformat
--         return fmt ~= 'unix' and fmt:upper()
--     end,
-- }
-- END => Extra File Info

-- START => Searchcount
local SearchCount = {
    provider = function()
        local mode = vim.fn.mode()
        if mode == 'c' then
            return 'N/A'
        end

        local last_search = vim.fn.getreg('/')
        if not last_search or last_search == '' then
            return ''
        end

        local searchcount = vim.fn.searchcount({ maxcount = 99 })  -- NOTE: Too high `maxcount` can cause major lag.
        return 'Search: ' .. searchcount.current .. '/' .. searchcount.total
    end,

    hl = { fg = colors.blue },
}
-- END => Searchcount
-- START => TimeClock
local TimeClock = {
    provider = function()
        return '  ' .. vim.fn.strftime("%H:%M")
    end,

    hl = { fg = colors.mauve },
}
-- END => TimeClock

-- START => StatuslineMessage
local StatuslineMessage= {
    provider = function()
        if require("noice").api.status.mode.has() then
            return require("noice").api.status.mode.get()
        else
            return ''
        end
    end,

    hl = { fg = colors.plum },
}
-- END => StatuslineMessage

-- START => LSP Diagnostics
-- TODO
-- END => LSP Diagnostics

-- === |> - StatusLine combined - <| ===
local StatusLine = {
    Space, ViModeIndicator, Space, FileNameBlock, Space, Align,
    StatuslineMessage, Align,
    SearchCount, Space, FileType, Space, TimeClock, Space
}

-- |> WinBar components

-- === |> - WinBar combined - <| ===
-- local WinBar = {}

-- |> TabLine components

-- === |> - TabLine combined - <| ===
-- local TabLine = {}

-- Setup.
require("heirline").setup(StatusLine)

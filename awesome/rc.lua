-- If LuaRocks is installed, make sure that
-- packages installed through it are found (e.g. lgi).
-- If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Aum TODO-List:
--  - Hide the top bar by default.
--  - Also Customize and Theme things, including the Bar.
--  - Learn all sorts of things.

-- |> Standard awesome library
local gears = require("gears")  -- What does this contain?
local awful = require("awful")  -- What does this contain?
require("awful.autofocus")  -- Makes it so that closing a window brings some window into focus. (I guess I want this?)

-- |> Widget and layout library
local wibox = require("wibox") -- What is this?

-- |>Theme handling library
local beautiful = require("beautiful") -- This contains some theme related things.

-- |> Notification library
local naughty = require("naughty") -- What is this? (Notification library, apparently.)
local menubar = require("menubar") -- What is this?
local hotkeys_popup = require("awful.hotkeys_popup") -- This is the Hotkey Popup (Super + Shift + s)
local my_hotkeys = hotkeys_popup.widget.new({ width = 1920, height = 1080 })

-- |> Enable hotkeys help widget for VIM and other apps,
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys") -- What does this do?

-- |> Load Debian menu entries
local debian = require("debian.menu") -- What is this?
local has_fdo, freedesktop = pcall(require, "freedesktop") -- What is this?

-- |> Error handling
-- Check if awesome encountered an error during startup,
-- and fell back to another config.
-- => This code will only ever execute for the fallback config.
if awesome.startup_errors then
    naughty.notify({
        preset = naughty.config.presets.critical,
        title = "Oops, there were errors during startup!",
        text = awesome.startup_errors,
    })
end

-- |> Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function(err)
        -- Make sure we don't go into an endless error loop
        if in_error then
            return
        end
        in_error = true

        naughty.notify({
            preset = naughty.config.presets.critical,
            title = "Oops, an error happened!",
            text = tostring(err),
        })
        in_error = false
    end)
end

-- |> START => Variable Definitions
-- |> Theme: Defines colors, icons, font, and wallpapers.
beautiful.init("~/.config/awesome/theme.lua")

-- |> This is used later as the default terminal and editor to run.
-- STATE: These seem somewhat ok as is.
terminal = "x-terminal-emulator" -- Do I wanna change this?
editor = os.getenv("EDITOR") or "editor" -- Do I wanna change this?
editor_cmd = terminal .. " -e " .. editor -- Do I wanna change this?

modkey = "Mod4" -- Default modkey: "Super" (STATE: Good)

-- |> Layouts
awful.layout.layouts = {
    awful.layout.suit.tile,  -- In this I can scale the Windows with mouse.
    awful.layout.suit.floating,  -- Need this for like working with Unreal, because Tiling causes some awkwardness.
    -- TODO: Figure out which bind swaps layout, customize it maybe.
    -- awful.layout.suit.spiral,
    -- awful.layout.suit.fair,
    -- awful.layout.suit.max,
    -- awful.layout.suit.max.fullscreen,
    -- awful.layout.suit.magnifier,

    -- Remove the commented ones later, once I understand these better,
    -- and know which ones I like.
    -- awful.layout.suit.spiral.dwindle,
    -- awful.layout.suit.tile.left,
    -- awful.layout.suit.tile.bottom,
    -- awful.layout.suit.tile.top,
    -- awful.layout.suit.fair.horizontal,
    -- awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}

-- |> Menu
-- NOTE: These entries and commands seem to populate into the Right Click Menu / Main Menu.
myawesomemenu = {
    {
        "Hotkeys",
        function()
            my_hotkeys:show_help(nil, awful.screen.focused())
        end,
    },
    { "Manual", terminal .. " -e man awesome" },
    { "Edit Config", editor_cmd .. " " .. awesome.conffile },
    { "Restart", awesome.restart },
    {
        "Quit",
        function()
            awesome.quit()
        end,
    },
}

-- |> Menu Entry: Awesome
local menu_awesome = { "Awesome", myawesomemenu, beautiful.awesome_icon }
-- |> Menu Entry: Open Terminal
local menu_terminal = { "Open Terminal", terminal }

-- |> What is this?
if has_fdo then
    mymainmenu = freedesktop.menu.build({
        before = { menu_awesome },
        after = { menu_terminal },
    })
else
    mymainmenu = awful.menu({
        items = {
            menu_awesome,
            { "Debian", debian.menu.Debian_menu.Debian },
            menu_terminal,
        },
    })
end

-- |> These seem to be the Icon and Menu in the Top Left Corner of the Wibar / TopBarPanelThing.
-- NOTE: I don't necessarily want these. TODO: Customize and/or remove.
mylauncher = awful.widget.launcher({
    image = beautiful.awesome_icon,
    menu = mymainmenu,
})

-- |> Menubar Configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it.

-- |> Keyboard Map Indicator and Switcher. (Widget in TopBar / Wibar)
mykeyboardlayout = awful.widget.keyboardlayout()

-- |> Wibar
-- Create a textclock widget
mytextclock = wibox.widget.textclock()

-- |> Create a wibox for each screen and add it.
-- |> What is this?
local taglist_buttons = gears.table.join(
    awful.button({}, 1, function(t)
        t:view_only()
    end),

    awful.button({ modkey }, 1, function(t)
        if client.focus then
            client.focus:move_to_tag(t)
        end
    end),

    awful.button({}, 3, awful.tag.viewtoggle),

    awful.button({ modkey }, 3, function(t)
        if client.focus then
            client.focus:toggle_tag(t)
        end
    end),

    awful.button({}, 4, function(t)
        awful.tag.viewnext(t.screen)
    end),

    awful.button({}, 5, function(t)
        awful.tag.viewprev(t.screen)
    end)
)

-- |> What is this?
local tasklist_buttons = gears.table.join(
    awful.button({}, 1, function(active_window)
        if active_window == client.focus then
            active_window.minimized = true
        else
            active_window:emit_signal("request::activate", "tasklist", { raise = true })
        end
    end),

    awful.button({}, 3, function()
        awful.menu.client_list({ theme = { width = 250 } })
    end),

    awful.button({}, 4, function()
        awful.client.focus.byidx(1)
    end),

    awful.button({}, 5, function()
        awful.client.focus.byidx(-1)
    end)
)

-- |> Wallpaper setting function.
local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If Wallpaper is a function, call it with the Screen.
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- |> Re-set `Wallpaper` when a screen's resolution changes.
screen.connect_signal("property::geometry", set_wallpaper)

-- |> This seems to setup things for each screen.
awful.screen.connect_for_each_screen(function(current_screen)
    -- Wallpaper.
    set_wallpaper(current_screen)

    -- Each `Screen` has its own `Tag Table`.
    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, current_screen, awful.layout.layouts[1])

    -- Create a `PromptBox` for each screen.
    current_screen.mypromptbox = awful.widget.prompt()

    -- Create an `Imagebox Widget` which will contain
    -- an `icon` indicating which `layout` we're using.
    -- We need one layoutbox per screen.
    current_screen.mylayoutbox = awful.widget.layoutbox(current_screen)
    current_screen.mylayoutbox:buttons(gears.table.join(
        awful.button({}, 1, function()
            awful.layout.inc(1)
        end),

        awful.button({}, 3, function()
            awful.layout.inc(-1)
        end),

        awful.button({}, 4, function()
            awful.layout.inc(1)
        end),

        awful.button({}, 5, function()
            awful.layout.inc(-1)
        end)
    ))

    -- Create a `Taglist Widget`.
    current_screen.mytaglist = awful.widget.taglist({
        screen = current_screen,
        filter = awful.widget.taglist.filter.all,
        buttons = taglist_buttons,
    })

    -- Create a `Tasklist Widget`.
    current_screen.mytasklist = awful.widget.tasklist({
        screen = current_screen,
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons,
    })

    -- Create the `Wibox`. (This is apparently the top bar on each screen.)
    -- NOTE: I suppose this is quite configurable.
    --  - I might want to be able to toggle it on and off.
    current_screen.mywibox = awful.wibar({
        position = "top",
        screen = current_screen,
    })

    -- Add `Widgets` to the `Wibox`.
    current_screen.mywibox:setup({
        layout = wibox.layout.align.horizontal,

        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            mylauncher,
            current_screen.mytaglist,
            current_screen.mypromptbox,
        },

        current_screen.mytasklist, -- Middle widget

        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            mykeyboardlayout,
            wibox.widget.systray(),
            mytextclock,
            current_screen.mylayoutbox,
        },
    })
end)

-- |> Mouse Bindings
root.buttons(gears.table.join(
    awful.button({}, 3, function()
        mymainmenu:toggle()
    end),
    awful.button({}, 4, awful.tag.viewnext),
    awful.button({}, 5, awful.tag.viewprev)
))

-- TODO: Configure very heavily.
-- Things to bind:
--  - Swapping layout
--  - Moving window left
--  - Moving window right
--  - Moving window up
--  - Moving window down
--  - Moving window to left screen
--  - Moving window to right screen
--  - Moving window to above screen (No screen above atm.)
--  - Moving window to below screen (No screen below atm.)
--  - Create new terminal
--  - Rofi bindings, call the scripts. (There is a number of them.)
--  - Maybe a toggle for the top bar.
--  - Moving to next / previous workspace/tag. [DONE]
--  - Move to specific workspace/tag. [TODO => Rebind the number keys, or maybe get used to them.]
--
-- |> Key Bindings / Key Mappings / Keyboard Shortcuts / Keys:
globalkeys = gears.table.join(
    -- Key:         Super + Shift + s
    -- Action:      Show Hotkey Popup (Help).
    -- NOTE:        Now it is a function. Default is not.
    awful.key({ modkey, "Shift" }, "s", function()
        my_hotkeys:show_help()
    end, { description = "Show Hotkey Popup (Help)", group = "awesome" }),

    -- Key:         Super + Shift + Ctrl + h
    -- Action:      Swap to Next Tag on All Screens.
    awful.key({ modkey, "Shift", "Control" }, "h", function()
        for s in screen do
            awful.tag.viewnext(s)
        end
    end, { description = "View Next Tag on All Screens", group = "Workspace/Tag" }),

    -- Key:         Super + Shift + Ctrl + t
    -- Action:      Swap to Previous Tag on All Screens.
    awful.key({ modkey, "Shift", "Control" }, "t", function()
        for s in screen do
            awful.tag.viewprev(s)
        end
    end, { description = "View Previous Tag on All Screens", group = "Workspace/Tag" }),

    -- Key:         Super + Shift + Ctrl + s
    -- Action:      Swap keyboard layout to US.                     (STATE: Good)
    -- NOTE:        I just kind of would like if these were a toggle instead of having 2 keybindings for swapping layout.
    awful.key({ modkey, "Shift", "Control" }, "s", function()
        awful.spawn("setxkbmap us")
    end, { description = 'Set keyboard_layout_lang to "us"', group = "awesome" }),
    
    -- Key:         Super + Ctrl + s
    -- Action:      Swap keyboard layout to Fin.                    (STATE: Good)
    awful.key({ modkey, "Control" }, "s", function()
        awful.spawn("setxkbmap fi")
    end, { description = 'Set keyboard_layout_lang to "fi"', group = "awesome" }),

    -- Key:         Super + Shift + h
    -- Action:      View Next Workspace/Tag.                        (STATE: Good)
    -- NOTE:        NOT a Function.
    awful.key({ modkey, "Shift" }, "h",
        awful.tag.viewnext,
        { description = "View Next Workspace/Tag", group = "Workspace/Tag" }
    ),

    -- Key:         Super + Shift + t
    -- Action:      View Previous Workspace/Tag.                    (STATE: Good)
    -- NOTE:        NOT a Function.
    awful.key({ modkey, "Shift" }, "t",
        awful.tag.viewprev,
        { description = "View Previous Workspace/Tag", group = "Workspace/Tag" }
    ),

    -- Key:         Super + <Escape>
    -- Action:      Go back in workspace/tag history.                   (STATE: Good)
    -- NOTE:        NOT a Function.
    awful.key({ modkey }, "Escape",
        awful.tag.history.restore,
        { description = "Go back in workspace/tag history", group = "Workspace/Tag" }
    ),

    -- Key:         Super + b
    -- Action:      Focus Next Window in Layout.                        (STATE: Good)
    -- NOTE:        This is supposed to be a Function.
    awful.key({ modkey }, "b", function()
        awful.client.focus.byidx(1)
    end, { description = "Focus Next Window in Layout", group = "Window/Client" }),

    -- Key:         Super + Shift + b
    -- Action:      Focus Previous Window in Layout.                    (STATE: Good)
    -- NOTE:        This is supposed to be a Function.
    awful.key({ modkey, "Shift" }, "b", function()
        awful.client.focus.byidx(-1)
    end, { description = "Focus Previous Window in Layout", group = "Window/Client" }),

    -- Key:         Super + w
    -- Action:      Show Main Menu. (Right click menu)
    -- NOTE:        This is supposed to be a Function.
    awful.key({ modkey }, "w", function()
        mymainmenu:show()
    end, { description = "Show Main Menu", group = "awesome" }),

    -- |> START => Layout manipulation
    -- Key:         Super + Shift + n
    -- Action:      Swap with Next Window in Layout.                    (STATE: Okay)
    -- NOTE:        This is supposed to be a Function.
    awful.key({ modkey, "Shift" }, "n", function()
        awful.client.swap.byidx(1)
    end, { description = "Swap with Next Window in Layout", group = "Window/Client" }),

    -- Key:         Super + Shift + o
    -- Action:      Swap with Previous Window in Layout.                (STATE: Okay)
    -- NOTE:        This is supposed to be a Function.
    awful.key({ modkey, "Shift" }, "o", function()
        awful.client.swap.byidx(-1)
    end, { description = "Swap with Previous Window in Layout", group = "Window/Client" }),

    -- Key:         Super + h
    -- Action:      Focus Next Screen.                                  (STATE: Okay)
    -- NOTE:        This is supposed to be a Function.
    awful.key({ modkey }, "h", function()
        awful.screen.focus_relative(1)
    end, { description = "Focus Next Screen", group = "screen" }),

    -- Key:         Super + t
    -- Action:      Focus Previous Screen.                              (STATE: Okay)
    -- NOTE:        This is supposed to be a Function.
    awful.key({ modkey }, "t", function()
        awful.screen.focus_relative(-1)
    end, { description = "Focus Previous Screen", group = "screen" }),

    -- Key:         Super + u
    -- Action:      Jump to Urgent Window/Client. (Whatever that means...)
    -- NOTE:        NOT a Function.
    awful.key({ modkey }, "u",
        awful.client.urgent.jumpto,
        { description = "Jump to Urgent Window/Client", group = "Window/Client" }
    ),

    -- Key:         Super + Tab
    -- Action:      Focus Previous Window on Screen.                    (STATE: Kind of bad.)
    -- NOTE:        Does not feel like it works cross screen. Only on single screen, maybe.
    -- TODO:        Make better, like alt tab functionality'ish.
    -- NOTE:        This is supposed to be a Function.
    awful.key({ modkey }, "Tab", function()
        awful.client.focus.history.previous()
        if client.focus then
            client.focus:raise()
        end
    end, { description = "Focus Previous Window on Screen", group = "Window/Client" }),
    -- |> END => Layout manipulation

    -- |> START => Standard program
    -- Key:         Super + <Enter>/<CR>/<Return>
    -- Action:      Open new Terminal.                                  (STATE: Okay)
    -- NOTE:        This is supposed to be a Function.
    awful.key({ modkey }, "Return", function()
        awful.spawn(terminal)
    end, { description = "Open new Terminal", group = "launcher" }),

    -- Key:         Super + Ctrl + r
    -- Action:      Reload Awesome. (Very soft restart)                 (STATE: Okay)
    -- NOTE:        NOT a Function. (But could it be?)
    awful.key({ modkey, "Control" }, "r", awesome.restart, { description = "Reload Awesome", group = "awesome" }),

    -- Key:         Super + Shift + Ctrl + q
    -- Action:      Quit Awesome.                                       (STATE: Meh)
    -- NOTE:        NOT a Function. (But could it be?)
    awful.key({ modkey, "Shift", "Control" }, "q", awesome.quit, { description = "Quit Awesome", group = "awesome" }),

    -- NOTE:        Supposed to be a function
    -- awful.key({ modkey }, "l", function()
    -- 	   awful.tag.incmwfact(0.05)
    -- end, { description = "increase master width factor", group = "layout" }),

    -- NOTE:        Supposed to be a function
    -- awful.key({ modkey }, "h", function()
    --     awful.tag.incmwfact(-0.05)
    -- end, { description = "decrease master width factor", group = "layout" }),

    -- NOTE:        Supposed to be a function
    -- awful.key({ modkey, "Shift" }, "h", function()
    --     awful.tag.incnmaster(1, nil, true)
    -- end, { description = "increase the number of master clients", group = "layout" }),

    -- NOTE:        Supposed to be a function
    -- awful.key({ modkey, "Shift" }, "l", function()
    -- 	   awful.tag.incnmaster(-1, nil, true)
    -- end, { description = "decrease the number of master clients", group = "layout" }),

    -- Key:         Super + Ctrl + h
    -- Action:      Increase the Number of Columns in Layout.           (STATE: WIP)
    -- NOTE:        Supposed to be a function
    -- awful.key({ modkey, "Control" }, "h", function()
    -- 	   awful.tag.incncol(1, nil, true)
    -- end, { description = "Increase the Number of Columns in Layout", group = "layout" }),

    -- Key:         Super + Ctrl + l
    -- Action:      Decrease the Number of Columns in Layout.           (STATE: WIP)
    -- NOTE:        Supposed to be a function
    -- awful.key({ modkey, "Control" }, "l", function()
    -- 	   awful.tag.incncol(-1, nil, true)
    -- end, { description = "Decrease the Number of Columns in Layout", group = "layout" }),

    -- Key:         Super + <Space>
    -- Action:      Focus Next Window in Layout.                        (STATE: Okay?)
    -- NOTE:        Supposed to be a function
    awful.key({ modkey }, "space",
        awful.layout.inc(1),
        { description = "Focus Next Window in Layout", group = "layout" }
    ),

    -- Key:         Super + Shift + <Space>
    -- Action:      Focus Previous Window in Layout.                    (STATE: Okay?)
    -- NOTE:        Supposed to be a function
    awful.key({ modkey, "Shift" }, "space",
        awful.layout.inc(-1),
        { description = "Focus Previous Window in Layout", group = "layout" }
    ),

    -- Key:         Super + Ctrl + n
    -- Action:      Restore Minimized Window.                           (STATE: Okay?)
    awful.key({ modkey, "Control" }, "n", function()
        local window = awful.client.restore()
        -- Focus Restored Client
        if window then
            window:emit_signal("request::activate", "key.unminimize", { raise = true })
        end
    end, { description = "Restore Minimized Window", group = "Window/Client" }),

    -- Key:         Super + r
    -- Action:      Activate Run Prompt.                                (STATE: Okay)
    -- NOTE:        Supposed to be a function
    awful.key({ modkey }, "r", function()
        awful.screen.focused().mypromptbox:run()
    end, { description = "Activate Run Prompt", group = "launcher" }),

    -- Key:         Super + x
    -- Action:      Activate Lua Execute Prompt.                        (STATE: Okay)
    -- NOTE:        Supposed to be a function
    awful.key({ modkey }, "x", function()
        awful.prompt.run({
            prompt = "Run Lua code: ",
            textbox = awful.screen.focused().mypromptbox.widget,
            exe_callback = awful.util.eval,
            history_path = awful.util.get_cache_dir() .. "/history_eval",
        })
    end, { description = "Activate Lua Execute Prompt", group = "awesome" }),

    -- |> Menubar: Some sort of Menu / Run Prompt.
    -- NOTE: It's not horrible, but maybe I rather use Rofi? Not sure which is more performant or stuff.
    -- Key:         Super + p
    -- Action:      Activate Run Prompt / MenuBar.                      (STATE: Okay)
    -- NOTE:        Supposed to be a function
    awful.key({ modkey }, "p", function()
        menubar.show()
    end, { description = "Activate Run Prompt / MenuBar", group = "launcher" })
)

-- |> Window / Client management keys / mappings.
-- STATE: Good
clientkeys = gears.table.join(
    -- Key:         Super + f
    -- Action:      Toggle "Fullscreen" State.                          (STATE: Good)
    -- NOTE:        Supposed to be a function
    awful.key({ modkey }, "f", function(active_window)
        active_window.fullscreen = not active_window.fullscreen
        active_window:raise()
    end, { description = 'Toggle "Fullscreen" State', group = "Window/Client" }),

    -- Key:         Super + q
    -- Action:      Kill / Close Active Window.                         (STATE: Okay)
    -- NOTE:        Supposed to be a function
    awful.key({ modkey }, "q", function(active_window)
        active_window:kill()
    end, { description = "Kill Active Window", group = "Window/Client" }),

    -- Key:         Super + Ctrl + <Space>
    -- Action:      Toggle "Floating" State.                            (STATE: Okay'ish)
    -- NOTE:        NOT a Function.
    awful.key({ modkey, "Control" }, "space",
        awful.client.floating.toggle,
        { description = 'Toggle "Floating" State', group = "Window/Client" }
    ),

    -- Key:         Super + Ctrl + <Enter>/<CR>/<Return>
    -- Action:      Move Active Window to Master Position in Layout.    (STATE: Okay)
    -- NOTE:        Supposed to be a function
    awful.key({ modkey, "Control" }, "Return", function(active_window)
        active_window:swap(awful.client.getmaster())
    end, { description = "Move Active Window to Master Position in Layout", group = "Window/Client" }),

    -- Key:         Super + l
    -- Action:      Cycle Active Window to Next Screen.                 (STATE: Good)
    -- NOTE:        Supposed to be a function
    awful.key({ modkey }, "l", function(active_window)
        active_window:move_to_screen()
    end, { description = "Cycle Active Window to Next Screen", group = "Window/Client" }),

    -- Key:         Super + Ctrl + Shift + t
    -- Action:      Toggle "Always on Top" state.                       (STATE: Good)
    -- NOTE:        Supposed to be a function
    awful.key({ modkey, "Control", "Shift" }, "t", function(active_window)
        active_window.ontop = not active_window.ontop
    end, { description = 'Toggle "Always on Top" State', group = "Window/Client" }),

    -- Key:         Super + Shift + m
    -- Action:      Minimize Active Window.                             (STATE: Good)
    -- NOTE:        Supposed to be a function
    awful.key({ modkey, "Shift" }, "m", function(active_window)
        -- The client currently has the input focus, so it cannot be
        -- minimized, since minimized clients can't have the focus. (What the heck does this comment mean?)
        active_window.minimized = true
    end, { description = "Minimize Active Window", group = "Window/Client" }),

    -- Key:         Super + m
    -- Action:      Toggle "Maximize" State.                             (STATE: Good)
    -- NOTE:        Supposed to be a function
    awful.key({ modkey }, "m", function(active_window)
        active_window.maximized = not active_window.maximized
        active_window:raise()
    end, { description = 'Toggle "Maximize" State', group = "Window/Client" }),

    -- Key:         Super + Ctrl + m
    -- Action:      Toggle "Vertical Maximize" State.                   (STATE: Good)
    -- NOTE:        Supposed to be a function
    awful.key({ modkey, "Control" }, "m", function(active_window)
        active_window.maximized_vertical = not active_window.maximized_vertical
        active_window:raise()
    end, { description = 'Toggle "Vertical Maximize" State', group = "Window/Client" }),

    -- Key:         Super + Ctrl + Shift + m
    -- Action:      Toggle "Horizontal Maximize" State.                 (STATE: Good)
    -- NOTE:        Supposed to be a function
    awful.key({ modkey, "Control", "Shift" }, "m", function(active_window)
        active_window.maximized_horizontal = not active_window.maximized_horizontal
        active_window:raise()
    end, { description = 'Toggle "Horizontal Maximize" State', group = "Window/Client" })
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(
        globalkeys,

        -- View Tag only.
        awful.key({ modkey }, "#" .. i + 9, function()
            local screen = awful.screen.focused()
            local tag = screen.tags[i]
            if tag then
                tag:view_only()
            end
        end, { description = "view tag #" .. i, group = "Workspace/Tag" }),

        -- Toggle Tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9, function()
            local screen = awful.screen.focused()
            local tag = screen.tags[i]
            if tag then
                awful.tag.viewtoggle(tag)
            end
        end, { description = "toggle tag #" .. i, group = "Workspace/Tag" }),

        -- Move Client to Tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9, function()
            if client.focus then
                local tag = client.focus.screen.tags[i]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end, { description = "move focused client to tag #" .. i, group = "Workspace/Tag" }),

        -- Toggle Tag on Focused Client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9, function()
            if client.focus then
                local tag = client.focus.screen.tags[i]
                if tag then
                    client.focus:toggle_tag(tag)
                end
            end
        end, { description = "toggle focused client on tag #" .. i, group = "Workspace/Tag" })
    )
end

clientbuttons = gears.table.join(
    awful.button({}, 1, function(c)
        c:emit_signal("request::activate", "mouse_click", { raise = true })
    end),
    awful.button({ modkey }, 1, function(c)
        c:emit_signal("request::activate", "mouse_click", { raise = true })
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function(c)
        c:emit_signal("request::activate", "mouse_click", { raise = true })
        awful.mouse.client.resize(c)
    end)
)

-- |> Set keys.
root.keys(globalkeys)

-- |> Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    {
        rule = {},
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = clientkeys,
            buttons = clientbuttons,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap + awful.placement.no_offscreen,
        },
    },

    -- Floating clients.
    {
        rule_any = {
            instance = {
                "DTA", -- Firefox addon DownThemAll.
                "copyq", -- Includes session name in class.
                "pinentry",
            },
            class = {
                "Arandr",
                "Blueman-manager",
                "Gpick",
                "Kruler",
                "MessageWin", -- kalarm.
                "Sxiv",
                "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
                "Wpa_gui",
                "veromix",
                "xtightvncviewer",
            },

            -- Note that the name property shown in xprop might be set slightly after creation of the client
            -- and the name shown there might not match defined rules here.
            name = {
                "Event Tester", -- xev.
            },
            role = {
                "AlarmWindow", -- Thunderbird's calendar.
                "ConfigManager", -- Thunderbird's about:config.
                "pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
            },
        },
        properties = { floating = true },
    },

    -- Add `Titlebars` to Normal Clients (Windows) and Dialogs.
    -- {
    --     rule_any = {
    --         type = { "normal", "dialog" }
    --     },
    --     properties = { titlebars_enabled = true }
    -- },

    -- Set Firefox to always map on the tag named "2" on screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { screen = 1, tag = "2" } },
}

-- |> Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c)
    -- Set the Windows at the Slave,
    -- i.e. put it at the end of others instead of setting it Master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- |> Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- Buttons for the Titlebar.
    local buttons = gears.table.join(
        awful.button({}, 1, function()
            c:emit_signal("request::activate", "titlebar", { raise = true })
            awful.mouse.client.move(c)
        end),

        awful.button({}, 3, function()
            c:emit_signal("request::activate", "titlebar", { raise = true })
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c):setup({
        {   -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout = wibox.layout.fixed.horizontal,
        },

        {   -- Middle
            {   -- Title
                align = "center",
                widget = awful.titlebar.widget.titlewidget(c),
            },
            buttons = buttons,
            layout = wibox.layout.flex.horizontal,
        },

        {   -- Right
            awful.titlebar.widget.floatingbutton(c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton(c),
            awful.titlebar.widget.ontopbutton(c),
            awful.titlebar.widget.closebutton(c),
            layout = wibox.layout.fixed.horizontal(),
        },

        layout = wibox.layout.align.horizontal,
    })
end)

-- START => Simple Signal Events:
-- |> Window Focus follows (Mouse-)Cursor. (Too aggressive, so disabled.)
-- client.connect_signal("mouse::enter", function(window)
--     window:emit_signal("request::activate", "mouse_enter", { raise = false })
-- end)

local last_focus

-- |> Set Border Color when Focused.
client.connect_signal("focus", function(window)
    last_focus = nil
    window.border_color = beautiful.border_focus
end)

-- |> Set Border Color when Unfocused.
client.connect_signal("unfocus", function(window)
    last_focus = window
    window.border_color = beautiful.border_normal
end)

-- Trying to fix some sort of autofocus thing.
client.connect_signal("unmanage", function(window)
    if last_focus == window and window.transient_for then
        client.focus = window.transient_for
        window.transient_for:raise()
    end
end)
-- END => Simple Signal Events

-- |> START => Aum's Custom Things
-- NOTE: Placing these in `.xprofile` does not work well enough, or at all.

-- |> Run xrandr script to Setup Monitors.
-- STATE: This should work. (Though it might not)
awful.spawn.with_shell("/home/aum/.screenlayout/arandrsetup.sh")

-- |> Set keyboard layout.
-- |> Set keyboard repeat rate.
-- |> Restore alsa.
-- |> Start sxhkd.
-- |> Start mpd.
-- |> Start xbanish.
-- |> Start picom.
-- STATE: This should work. (Though it might not.)
awful.spawn.with_shell("/home/aum/.config/awesome/autorun.sh")

-- TODO:
--  - Create binding to toggle picom. (Kill / Start)

-- NOTE:
--  - Other things to maybe start here:
--      - Alsamixer thing, probably. [TODO]
--      - sxkhd [DONE, Maybe]
--      - A compositor? [DONE, Maybe]

-- END => Config    (NOTE: Default config is 600'ish lines.)

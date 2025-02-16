--- __      __      _
--- \ \    / /__ __| |_ ___ _ _ _ __
---  \ \/\/ / -_)_ /  _/ -_) '_| '  \
---   \_/\_/\___/__|\__\___|_| |_|_|_|
---
--- wezterm.lua - personal configuration

local wezterm = require 'wezterm'
local action = wezterm.action
local act = wezterm.action

local config = {}
if wezterm.config_builder then
    config = wezterm.config_builder()
end

config = {
    -- fonts
    font_size = 14,
    line_height = 1.2,
    font = wezterm.font("FiraCode Nerd Font"),

    -- config
    automatically_reload_config = true,
    enable_tab_bar = false,
    enable_scroll_bar = true,
    window_close_confirmation = "NeverPrompt",
    window_decorations = "RESIZE",
    default_cursor_style = "BlinkingBar",

    -- colors
    color_scheme = "Tokyo Night (Gogh)",
    window_background_opacity = 0.9,
    text_background_opacity = 0.9,

    -- keys
    keys = {
        { mods = "OPT",     key = "LeftArrow",  action = action.SendKey({ mods = "ALT", key = "b" }) },
        { mods = "OPT",     key = "RightArrow", action = action.SendKey({ mods = "ALT", key = "f" }) },
        { mods = "CMD",     key = "LeftArrow",  action = action.SendKey({ mods = "CTRL", key = "a" }) },
        { mods = "CMD",     key = "RightArrow", action = action.SendKey({ mods = "CTRL", key = "e" }) },
        { mods = "CMD",     key = "Backspace",  action = action.SendKey({ mods = "CTRL", key = "u" }) },
        { mods = 'CMD|ALT', key = 'LeftArrow',  action = act.ActivateTabRelative(-1) },
        { mods = 'CMD|ALT', key = 'RightArrow', action = act.ActivateTabRelative(1) },
    }
}

local bind = function(mods, key, action)
    table.insert(config.keys, {
        key = key,
        mods = mods,
        action = action,
    })
end

bind('CMD', 'k', act.Multiple {
    act.ClearScrollback 'ScrollbackAndViewport',
    act.SendKey { key = 'L', mods = 'CTRL' },
})

return config

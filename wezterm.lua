--- __      __      _
--- \ \    / /__ __| |_ ___ _ _ _ __
---  \ \/\/ / -_)_ /  _/ -_) '_| '  \
---   \_/\_/\___/__|\__\___|_| |_|_|_|
---
--- wezterm.lua - personal configuration

local wezterm = require 'wezterm'
local act = wezterm.action

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- Font settings
config.font_size = 14
config.line_height = 1.2
config.font = wezterm.font("FiraCode Nerd Font")

-- Visual appearance
config.color_scheme = "Tokyo Night"
config.window_background_opacity = 0.9
config.text_background_opacity = 0.9
config.window_decorations = "TITLE | RESIZE"

-- Window behavior
config.automatically_reload_config = true
config.enable_tab_bar = false
config.enable_scroll_bar = true
config.window_close_confirmation = "NeverPrompt"
config.default_cursor_style = "BlinkingBar"
config.animation_fps = 60

-- macOS-specific optimizations
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=1' }
config.native_macos_fullscreen_mode = true
config.window_padding = { left = 2, right = 2, top = 2, bottom = 0 }

-- Key bindings configuration
config.keys = {
    -- Emacs-style navigation
    { mods = "OPT",      key = "LeftArrow",  action = act.SendKey({ mods = "ALT", key = "b" }) },
    { mods = "OPT",      key = "RightArrow", action = act.SendKey({ mods = "ALT", key = "f" }) },
    { mods = "CMD",      key = "LeftArrow",  action = act.SendKey({ mods = "CTRL", key = "a" }) },
    { mods = "CMD",      key = "RightArrow", action = act.SendKey({ mods = "CTRL", key = "e" }) },
    { mods = "CMD",      key = "Backspace",  action = act.SendKey({ mods = "CTRL", key = "u" }) },
    { mods = 'CMD|ALT',  key = 'LeftArrow',  action = act.ActivateTabRelative(-1) },
    { mods = 'CMD|ALT',  key = 'RightArrow', action = act.ActivateTabRelative(1) },

    -- Pane management
    { mods = "CMD|OPT",  key = "LeftArrow",  action = act.SplitPane { direction = "Left", size = { Percent = 50 } } },
    { mods = "CMD|OPT",  key = "RightArrow", action = act.SplitPane { direction = "Right", size = { Percent = 50 } } },
    { mods = "CMD|OPT",  key = "UpArrow",    action = act.SplitPane { direction = "Up", size = { Percent = 50 } } },
    { mods = "CMD|OPT",  key = "DownArrow",  action = act.SplitPane { direction = "Down", size = { Percent = 50 } } },

    -- Pane navigation
    { mods = "CMD|CTRL", key = "LeftArrow",  action = act.ActivatePaneDirection("Left") },
    { mods = "CMD|CTRL", key = "RightArrow", action = act.ActivatePaneDirection("Right") },
    { mods = "CMD|CTRL", key = "UpArrow",    action = act.ActivatePaneDirection("Up") },
    { mods = "CMD|CTRL", key = "DownArrow",  action = act.ActivatePaneDirection("Down") },

    -- Close current pane (CMD + OPT + W)
    { mods = "CMD|OPT",  key = "W",          action = act.CloseCurrentPane { confirm = false } },

    -- Clear scrollback
    {
        mods = "CMD",
        key = "K",
        action = act.Multiple {
            act.ClearScrollback("ScrollbackAndViewport"),
            act.SendKey { key = "L", mods = "CTRL" }
        }
    }
}

return config

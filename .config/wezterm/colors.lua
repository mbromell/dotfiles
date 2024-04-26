local wezterm = require 'wezterm'
local module = {}

local light = "Catppuccin Latte"
local dark = "Catppuccin Mocha"

function module.apply(config)
    -- Auto change light or dark mode depending on system config
    -- https://wezfurlong.org/wezterm/config/lua/window/get_appearance.html
    wezterm.on('window-config-reloaded', function(window, pane)
        local overrides = window:get_config_overrides() or {}
        local appearance = window:get_appearance()
        if appearance:find 'Light' then
            overrides.color_scheme = light
            -- set_colors(overrides, light)
        else
            overrides.color_scheme = dark
            -- set_colors(overrides, dark)
        end
        window:set_config_overrides(overrides)
    end)
end

return module

local wezterm = require("wezterm")
local M = {}

M.dark = "Catppuccin Macchiato"
M.light = "Catppuccin Latte"

function M.scheme_name(appearance)
  if appearance:find("Dark") then
    return M.dark
  else
    return M.light
  end
end

function M.set_colors(window, pane)
  local overrides = window:get_config_overrides() or {}
  local scheme_name = M.scheme_name(window:get_appearance())
  local scheme = wezterm.color.get_builtin_schemes()[scheme_name]

  if window:get_appearance():find("Dark") then
    overrides.colors = {
      tab_bar = {
        active_tab = {
          fg_color = wezterm.color.parse(scheme.brights[5]):lighten(0.2),
          bg_color = wezterm.color.parse(scheme.brights[5]):darken(0.6):desaturate(0.5),
        },
        inactive_tab = {
          fg_color = scheme.foreground,
          bg_color = scheme.tab_bar.background,
        },
      },
    }
  else
    overrides.colors = {
      tab_bar = {
        active_tab = {
          fg_color = wezterm.color.parse(scheme.brights[5]):darken(0.6),
          bg_color = wezterm.color.parse(scheme.brights[5]):lighten(0.5):desaturate(0.5),
        },
        inactive_tab = {
          fg_color = scheme.foreground,
          bg_color = scheme.tab_bar.background,
        },
      },
    }
  end

  if overrides.color_scheme ~= scheme_name then
    overrides.color_scheme = scheme_name
  end

  window:set_config_overrides(overrides)
end

function M.apply(config)
  -- Using dark theme by default
  config.color_scheme = M.dark

  -- Auto change light or dark mode depending on system config
  -- https://wezfurlong.org/wezterm/config/lua/window/get_appearance.html
  wezterm.on("window-config-reloaded", function(window, pane)
    M.set_colors(window, pane)
  end)
end

return M

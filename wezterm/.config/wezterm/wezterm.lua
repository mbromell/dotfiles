local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Text
config.font = wezterm.font_with_fallback({ "Brosevka Nerd Font", "JetBrains Nerd Font" })
config.font_size = 16
config.line_height = 1

-- Window stuff
config.window_padding = {
  left = 0,
  right = 0,
  top = "0.5cell",
  bottom = "0.5cell",
}
config.enable_tab_bar = true
config.enable_scroll_bar = false
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = false
config.tab_max_width = 32
config.switch_to_last_active_tab_when_closing_tab = true

-- Plugins
wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")

require("events").apply(config)
-- require("status").apply(config)
require("keymap").apply(config)
require("colors").apply(config)
require("windows").apply(config)

return config

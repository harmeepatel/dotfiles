local wezterm = require('wezterm')
local tmux_startup = require('tmux').run_tmux_on_startup

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.initial_cols = 512
config.initial_rows = 512

config.audible_bell = "Disabled"
config.scrollback_lines = 5120

config.disable_default_key_bindings = true
config.keys = require('keymaps')

config.colors = {
    background = "#000",
}
config.color_scheme = 'Catppuccin Mocha'

config.font = wezterm.font_with_fallback {
    'JetBrainsMono Nerd Font',
    'CaskadiaCove Nerd Font',
}
config.harfbuzz_features = { 'calt=0' }
config.font_size = 20.0

config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}
config.window_background_opacity = 0.75
config.window_decorations = "RESIZE"
config.macos_window_background_blur = 16
config.enable_tab_bar = false

config = tmux_startup(config)

-- debug key maps
config.debug_key_events = true

return config

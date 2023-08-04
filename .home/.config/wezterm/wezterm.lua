local wezterm = require 'wezterm'
local maps = require 'keymaps'
local tmux_startup = require 'tmux'.run_tmux_on_startup

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.initial_cols = 512
config.initial_rows = 512

config.audible_bell = "Disabled"
config.enable_tab_bar = false
config.scrollback_lines = 5120

config.disable_default_key_bindings = true
config.keys = maps

config.colors = {
    background = "#080808",
}
config.color_scheme = 'Catppuccin Mocha'

config.font = wezterm.font_with_fallback {
    'JetBrainsMono Nerd Font',
    'CaskadiaCove Nerd Font',
}
config.font_size = 15
config.freetype_load_target = "Light"

config.window_background_opacity = 0.5
config.window_decorations = "RESIZE"
config.macos_window_background_blur = 32

config = tmux_startup(config)

return config

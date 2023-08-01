local wezterm = require 'wezterm'
local maps = require 'keymaps'

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.initial_cols = 512
config.initial_rows = 512

config.audible_bell = "Disabled"
config.enable_tab_bar = false

config.disable_default_key_bindings = true
config.keys = maps

config.colors = {
    background = "black",
}
config.color_scheme = 'Gruvbox dark, hard (base16)'

config.font = wezterm.font_with_fallback {
    'JetBrainsMono Nerd Font',
    'CaskadiaCove Nerd Font',
}
config.font_size = 15

config.window_background_opacity = 0.5
config.window_decorations = "RESIZE"
config.macos_window_background_blur = 32

config.default_prog = { '/usr/local/Cellar/tmux/3.3a_2/bin/tmux' }

return config

local wezterm = require 'wezterm'
local maps = require 'keymaps'

return {
    initial_rows = 128,
    initial_cols = 512,

    audible_bell = "Disabled",
    enable_tab_bar = false,

    disable_default_key_bindings = true,
    keys = maps,

    colors = {
        background = "black",
    },
    color_scheme = 'Gruvbox dark, hard (base16)',

    font = wezterm.font_with_fallback {
        'JetBrainsMono Nerd Font',
        'CaskadiaCove Nerd Font',
    },
    font_size = 15,

    window_background_opacity = 0.5,
    window_decorations = "RESIZE",
    macos_window_background_blur = 32,
}

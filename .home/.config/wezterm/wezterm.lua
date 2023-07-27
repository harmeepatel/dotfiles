local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.enable_tab_bar = false
config.color_scheme = 'Gruvbox dark, hard (base16)'
config.font = wezterm.font_with_fallback {
    'JetBrainsMono Nerd Font',
    'CaskadiaCove Nerd Font',
}
config.window_background_opacity = 0.5
config.macos_window_background_blur = 16

^B,^B$^Bs^Bp^Bn^B%^B"^Bx^Bd^Bc^Bz^B1^B2^B3^B4^B5^B6^B7^B8^B9
-- key_bindings:
--     # rename
--     - { key: Comma, mods: Command, chars: "\x02\x2c" }
--     - { key: Comma, mods: Command|Shift, chars: "\x02\x24" }
--
--     # Switch to last tmux session
--     - { key: L, mods: Command, chars: "\x02\x73" }
--
--     # Change to the previous tmux window
--     - { key: LBracket, mods: Command|Shift, chars: "\x02\x70" }
--     # Change to the next tmux window
--     - { key: RBracket, mods: Command|Shift, chars: "\x02\x6e" }
--
--     # Split the current pane into two, left and right
--     - { key: N, mods: Command|Shift, chars: "\x02\x25" }
--     # Split the current pane into two, top and bottom.
--     - { key: N, mods: Command, chars: "\x02\x22" }
--
--     # Kill the current tmux pane (and window if last pane)
--     - { key: W, mods: Command, chars: "\x02\x78" }
--     # Detach the current tmux client
--     - { key: Q, mods: Control, chars: "\x02\x64" }
--
--     # Create a new tmux window
--     - { key: T, mods: Command, chars: "\x02\x63" }
--     # Break the current tmux pane out of the tmux window
--     # - { key: T, mods: Command|Shift, chars: "\x02\x21" }
--
--     # Toggle the zoom state of the current tmux pane
--     - { key: Z, mods: Command, chars: "\x02\x7a" }
--
--     # Select window 1-9
--     - { key: Key1, mods: Command, chars: "\x02\x31" }
--     - { key: Key2, mods: Command, chars: "\x02\x32" }
--     - { key: Key3, mods: Command, chars: "\x02\x33" }
--     - { key: Key4, mods: Command, chars: "\x02\x34" }
--     - { key: Key5, mods: Command, chars: "\x02\x35" }
--     - { key: Key6, mods: Command, chars: "\x02\x36" }
--     - { key: Key7, mods: Command, chars: "\x02\x37" }
--     - { key: Key8, mods: Command, chars: "\x02\x38" }
--     - { key: Key9, mods: Command, chars: "\x02\x39" }

-- config.keys = {
-- {
--     key = 'a',
--     mods = 'LEADER|CTRL',
--     action = wezterm.action.SendKey { key = 'a', mods = 'CTRL' },
--   },
-- }

return config


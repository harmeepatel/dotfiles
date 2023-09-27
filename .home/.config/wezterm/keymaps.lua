local act = require 'wezterm'.action

return {

    -- wezterm: quit
    {
        key = 'q',
        mods = 'CMD',
        action = act.QuitApplication
    },

    -- wezterm: close window
    {
        key = 'w',
        mods = 'CMD|SHIFT',
        action = act.CloseCurrentTab { confirm = true },
    },

    -- wezterm: paste
    {
        key = 'v',
        mods = 'CMD',
        action = act.PasteFrom('Clipboard')
    },

    -- tmux: rename tab
    {
        key = ',',
        mods = 'CMD',
        action = act.Multiple {
            act.SendKey { key = 'b', mods = 'CTRL' },
            act.SendKey { key = ',' },
        },
    },

    -- tmux: rename session
    {
        key = ",",
        mods = 'CMD|OPT',
        action = act.Multiple {
            act.SendKey { key = 'b', mods = 'CTRL' },
            act.SendKey { key = '$' },
        },
    },

    -- tmux: open split shell to right
    {
        key = 'n',
        mods = 'CMD',
        action = act.Multiple {
            act.SendKey { key = 'phys:b', mods = 'CTRL' },
            act.SendKey { key = '%' },
        },
    },

    -- tmux: open split shell to bottom
    {
        key = 'n',
        mods = 'CMD|SHIFT',
        action = act.Multiple {
            act.SendKey { key = 'phys:b', mods = 'CTRL' },
            act.SendKey { key = '"' },
        },
    },

    -- tmux: switch sessions
    {
        key = 'l',
        mods = 'CMD',
        action = act.Multiple {
            act.SendKey { key = 'phys:b', mods = 'CTRL' },
            act.SendKey { key = 's' },
        },
    },

    -- tmux: previous tab
    {
        key = '{',
        mods = 'CMD|SHIFT',
        action = act.Multiple {
            act.SendKey { key = 'phys:b', mods = 'CTRL' },
            act.SendKey { key = 'p' },
        },
    },

    -- tmux: next tab
    {
        key = '}',
        mods = 'CMD|SHIFT',
        action = act.Multiple {
            act.SendKey { key = 'phys:b', mods = 'CTRL' },
            act.SendKey { key = 'n' },
        },
    },

    -- tmux: close tab
    {
        key = 'w',
        mods = 'CMD',
        action = act.Multiple {
            act.SendKey { key = 'phys:b', mods = 'CTRL' },
            act.SendKey { key = 'x' },
        },
    },

    -- tmux: new tab
    {
        key = 't',
        mods = 'CMD',
        action = act.Multiple {
            act.SendKey { key = 'phys:b', mods = 'CTRL' },
            act.SendKey { key = 'c' },
        },
    },
}

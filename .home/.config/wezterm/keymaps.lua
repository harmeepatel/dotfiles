local act = require 'wezterm'.action

local M = {}

M = {

    -- quit wezterm
    {
        key = 'q',
        mods = 'CMD',
        action = act.QuitApplication
    },

    -- close wezterm window
    {
        key = 'q',
        mods = 'CTRL|SHIFT',
        action = act.CloseCurrentTab { confirm = true },
    },

    -- rename tmux tab
    {
        key = ',',
        mods = 'CMD',
        action = act.Multiple {
            act.SendKey { key = 'phys:b', mods = 'CTRL' },
            act.SendKey { key = ',' },
        },
    },

    -- rename tmux session
    {
        key = ",",
        mods = 'CMD|SHIFT',
        action = act.Multiple {
            act.SendKey { key = 'phys:b', mods = 'CTRL' },
            act.SendKey { key = '$' },
        },
    },

    -- open split shell to right
    {
        key = 'n',
        mods = 'CMD',
        action = act.Multiple {
            act.SendKey { key = 'phys:b', mods = 'CTRL' },
            act.SendKey { key = '%' },
        },
    },

    -- open split shell to bottom
    {
        key = 'n',
        mods = 'CMD|SHIFT',
        action = act.Multiple {
            act.SendKey { key = 'phys:b', mods = 'CTRL' },
            act.SendKey { key = '"' },
        },
    },

    -- switch tmux sessions
    {
        key = 'l',
        mods = 'CMD',
        action = act.Multiple {
            act.SendKey { key = 'phys:b', mods = 'CTRL' },
            act.SendKey { key = 's' },
        },
    },

    -- previous tmux tab
    {
        key = '{',
        mods = 'CMD|SHIFT',
        action = act.Multiple {
            act.SendKey { key = 'phys:b', mods = 'CTRL' },
            act.SendKey { key = 'p' },
        },
    },

    -- next tmux tab
    {
        key = '}',
        mods = 'CMD|SHIFT',
        action = act.Multiple {
            act.SendKey { key = 'phys:b', mods = 'CTRL' },
            act.SendKey { key = 'n' },
        },
    },

    -- close tmux tab
    {
        key = 'w',
        mods = 'CMD',
        action = act.Multiple {
            act.SendKey { key = 'phys:b', mods = 'CTRL' },
            act.SendKey { key = 'x' },
        },
    },

    -- new tmux tab
    {
        key = 't',
        mods = 'CMD',
        action = act.Multiple {
            act.SendKey { key = 'phys:b', mods = 'CTRL' },
            act.SendKey { key = 'c' },
        },
    },
}

return M

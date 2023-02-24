local one_monokai = {
    fg = "#abb2bf",
    green = "#98c379",
    yellow = "#e5c07b",
    purple = "#c678dd",
    orange = "#d19a66",
    peanut = "#f6d5a4",
    red = "#e06c75",
    aqua = "#61afef",
    darkblue = "#282c34",
    dark_red = "#f75f5f",
}

local vi_mode_colors = {
    NORMAL = "green",
    OP = "green",
    INSERT = "yellow",
    VISUAL = "purple",
    BLOCK = "dark_red",
    REPLACE = "red",
    COMMAND = "aqua",
}

local c = {
    small_gap = {
        provider = "  ",
    },
    large_gap = {
        provider = "   ",
    },
    window_number = {
        provider = function()
            return '| ' .. tostring(vim.api.nvim_win_get_number(0)) .. ' |'
        end,
    },
    fileinfo = {
        provider = {
            name = "file_info",
            opts = {
                type = "relative-short",
            },
        },
        hl = {
            fg = "orange",
        },
    },
    gitDiffAdded = {
        provider = "git_diff_added",
        hl = {
            fg = "green",
        },
    },
    gitDiffRemoved = {
        provider = "git_diff_removed",
        hl = {
            fg = "red",
        },
    },
    gitDiffChanged = {
        provider = "git_diff_changed",
        hl = {
            fg = "fg",
        },
    },
    diagnostic_errors = {
        provider = "diagnostic_errors",
        hhl = {
            fg = "red",
        },
    },
    diagnostic_warnings = {
        provider = "diagnostic_warnings",
        hl = {
            fg = "yellow",
        },
    },
    diagnostic_hints = {
        provider = "diagnostic_hints",
        hl = {
            fg = "aqua",
        },
    },
    diagnostic_info = {
        provider = "diagnostic_info",
    },
    lsp_client_names = {
        provider = "lsp_client_names",
    },
    file_type = {
        provider = {
            name = "file_type",
            opts = {
                filetype_icon = true,
                case = "titlecase",
            },
        },
    },
    file_encoding = {
        provider = "file_encoding",
    },
    position = {
        provider = "position",
    },
    line_percentage = {
        provider = "line_percentage",
    },
}

local active = {
    left = {
        c.large_gap,
        c.fileinfo,
        c.large_gap,
        c.gitDiffAdded,
        c.gitDiffRemoved,
        c.gitDiffChanged,
        c.large_gap,
        c.diagnostic_errors,
        c.diagnostic_warnings,
        c.diagnostic_info,
        c.diagnostic_hints,
    },
    middle = {
    },
    right = {
        c.lsp_client_names,
        c.small_gap,
        c.file_type,
        c.small_gap,
        c.file_encoding,
        c.small_gap,
        c.position,
        c.small_gap,
        c.line_percentage,
        c.large_gap,
    }
}

local inactive = {
    left = {
        c.large_gap,
        c.fileinfo,
        c.large_gap,
        c.window_number,
    },
    middle = {
    },
    right = {
        c.file_type,
        c.large_gap,
    }
}

local components = {
    active = {
        active.left,
        active.middle,
        active.right,
    },
    inactive = {
        inactive.left,
        inactive.middle,
        inactive.right,
    },
}

local opts = {
    components = components,
    theme = one_monokai,
    vi_mode_colors = vi_mode_colors,
}

return {
    "feline-nvim/feline.nvim",
    opts = opts
}

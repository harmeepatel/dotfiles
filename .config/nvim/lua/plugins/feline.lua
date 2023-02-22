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
    window_number = {
        provider = function()
            return tostring(#vim.api.nvim_list_wins())
        end,
        left_sep = "block",
        right_sep = "block",
    },
    gitBranch = {
        provider = "git_branch",
        left_sep = "block",
        right_sep = "block",
    },
    gitDiffAdded = {
        provider = "git_diff_added",
        hl = {
            fg = "green",
        },
        right_sep = "block",
    },
    gitDiffRemoved = {
        provider = "git_diff_removed",
        hl = {
            fg = "red",
        },
        right_sep = "block",
    },
    gitDiffChanged = {
        provider = "git_diff_changed",
        hl = {
            fg = "fg",
        },
        left_sep = "block",
        right_sep = "block",
    },
    separator = {
        provider = "",
    },
    fileinfo = {
        provider = {
            name = "file_info",
            opts = {
                type = "relative-short",
            },
        },
        left_sep = " ",
        right_sep = " ",
    },
    diagnostic_errors = {
        provider = "diagnostic_errors",
        hl = {
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
        left_sep = "block",
        right_sep = "block",
    },
    file_type = {
        provider = {
            name = "file_type",
            opts = {
                filetype_icon = true,
                case = "titlecase",
            },
        },
        left_sep = "block",
        right_sep = "block",
    },
    file_encoding = {
        provider = "file_encoding",
        left_sep = "block",
        right_sep = "block",
    },
    position = {
        provider = "position",
        left_sep = "block",
        right_sep = "block",
    },
    line_percentage = {
        provider = "line_percentage",
        left_sep = "block",
        right_sep = "block",
    },
}

local active = {
    left = {
        c.gitBranch,
        c.gitDiffAdded,
        c.gitDiffRemoved,
        c.gitDiffChanged,
        c.separator,
        c.diagnostic_errors,
        c.diagnostic_warnings,
        c.diagnostic_info,
        c.diagnostic_hints,
    },
    middle = {
        c.fileinfo,
    },
    right = {
        c.lsp_client_names,
        c.file_type,
        c.file_encoding,
        c.position,
        c.line_percentage
    }
}

local inactive = {
    left = {
        c.gitBranch,
        c.separator,
    },
    middle = {
        c.fileinfo,
    },
    right = {
        c.file_type,
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

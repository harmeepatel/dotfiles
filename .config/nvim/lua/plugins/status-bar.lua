local colors = {
    -- bg       = "#202328",
    inactive = "646464",
    fg       = "#121212",
    white    = "#b4b4b4",
    yellow   = "#e5c07b",
    cyan     = "#037aa8",
    green    = "#98c379",
    orange   = "#d19a66",
    magenta  = "#c678dd",
    blue     = "#51afef",
    red      = "#e06c75",
}
local config = {
    options = {
        component_separators = '',
        section_separators = '',
        theme = {
            normal = { c = { fg = colors.fg, bg = colors.bg } },
            inactive = { c = { fg = colors.fg, bg = colors.bg } },
        },
    },
    sections = {
        lualine_a = {
            {
                'filetype',
                colored = true,
                icon_only = true,
            },
            {
                'filename',
                color = { fg = colors.blue, gui = 'bold' },
            },
        },
        lualine_b = {
        },
        lualine_c = {
            {
                'diff',
                symbols = { added = ' ', modified = '柳', removed = ' ' },
                diff_color = {
                    added = { fg = colors.green },
                    modified = { fg = colors.orange },
                    removed = { fg = colors.red },
                },
            },
            {
                'diagnostics',
                sources = { 'nvim_diagnostic' },
                symbols = { error = ' ', warn = ' ', info = ' ' },
                diagnostics_color = {
                    color_error = { fg = colors.red },
                    color_warn = { fg = colors.yellow },
                    color_info = { fg = colors.cyan },
                },
            },

        },
        lualine_x = {
            {
                -- Lsp server name .
                function()
                    local msg = 'No Active Lsp'
                    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                    local clients = vim.lsp.get_active_clients()
                    if next(clients) == nil then
                        return msg
                    end
                    for _, client in ipairs(clients) do
                        local filetypes = client.config.filetypes
                        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                            return client.name
                        end
                    end
                    return msg
                end,
                icon = ' ',
                color = { fg = colors.cyan, gui = 'bold' },
            }

        },
        lualine_y = {
            {
                'progress',
                color = { fg = colors.white, gui = 'bold' },
            }
        },
        lualine_z = {
            {
                'location',
                color = { fg = colors.white, gui = 'bold' },
            }
        }
    },
    inactive_sections = {
        lualine_a = {
        },
        lualine_b = {
        },
        lualine_c = {
            {
                'filename',
                color = { fg = colors.inactive, gui = 'bold' },
            },
            {
                function()
                    return '| ' .. tostring(vim.api.nvim_win_get_number(0)) .. ' |'
                end,
                color = { fg = colors.inactive, gui = 'bold' },
            }
        },
        lualine_x = {
            {
                'filetype',
                color = { fg = colors.inactive, gui = 'bold' },
            }
        },
        lualine_y = {},
        lualine_z = {},
    },
}


return {
    -- "feline-nvim/feline.nvim",
    "nvim-lualine/lualine.nvim",
    config = config,
}

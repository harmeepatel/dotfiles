local colors = {
    bg       = "#222222",
    in_bg    = "#080808",
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
            inactive = { c = { fg = colors.fg, bg = '' } },
        },
    },
    sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
            {
                'filetype',
                colored = true,
                icon_only = true,
            },
            {
                'filename',
                color = { fg = colors.blue, gui = 'bold' },
            },
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
                    error = { fg = colors.red },
                    warn = { fg = colors.yellow },
                    info = { fg = colors.cyan },
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
            },
            {
                'location',
                color = { fg = colors.white, gui = 'bold' },
            },
            {
                'progress',
                color = { fg = colors.white, gui = 'bold' },
            },
        },
        lualine_y = {},
        lualine_z = {}
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

-- -- Custom status_line
-- local function workspace_diag(bufnr, severity)
--     local di_num = #vim.diagnostic.get(0, { severity = severity })
--
--     local insert_leave = vim.api.nvim_create_augroup("ChangeDiagnostic", { clear = true })
--     vim.api.nvim_create_autocmd("InsertLeave", {
--         callback = function()
--             di_num = #vim.diagnostic.get(0, { severity = severity })
--         end,
--         group = insert_leave,
--         -- callback = function()
--         --     print(string.format('event fired: s'))
--         -- end,
--     })
--
--     return di_num
-- end
--
-- local function status_line()
--     local file_name = "%f"
--     local buf_nr = vim.api.nvim_win_get_number(0)
--     local formated_buf_num = '[' .. tostring(buf_nr) .. ']'
--     local modified = "%-m"
--     local file_type = "%y"
--     local right_align = "%="
--     local line_no = "%10([%l/%L%)]"
--     local pct_thru_file = "%5p%%"
--     local e = workspace_diag(buf_nr, vim.diagnostic.severity.ERROR)
--     local w = workspace_diag(buf_nr, vim.diagnostic.severity.WARN)
--     local i = workspace_diag(buf_nr, vim.diagnostic.severity.INFO)
--     local h = workspace_diag(buf_nr, vim.diagnostic.severity.HINT)
--
--     return string.format(
--         "    e:%s w:%s i:%s h:%s        %s %s %s %s%s%s%s",
--         e, w, i, h,
--         file_name,
--         formated_buf_num,
--         modified,
--         file_type,
--         right_align,
--         line_no,
--         pct_thru_file
--     )
-- end
--
-- vim.opt.statusline = status_line()
--
-- return {}

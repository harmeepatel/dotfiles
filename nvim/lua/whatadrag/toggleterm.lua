local status_ok, toggleterm = pcall(require, 'toggleterm')

if not status_ok then
    vim.notify('404: toggleterm')
    return
end

local asr = 4
local length = 40

toggleterm.setup {
    -- size can be a number or function which is passed the current terminal
    -- size = function(term)
    --     if term.direction == "horizontal" then
    --         return 15
    --     elseif term.direction == "vertical" then
    --         return vim.o.columns * 0.1
    --     end
    -- end,
    size = 24,
    hide_numbers = false, -- hide the number column in toggleterm buffers
    shade_filetypes = {},
    highlights = {
        -- highlights which map to a highlight group name and a table of it's values
        -- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
        Normal = {
            guibg = '#000',
        },
        NormalFloat = {
            link = 'Normal'
        },
        FloatBorder = {
            guifg = '#fa2',
            guibg = '#000',
        },
    },
    shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
    shading_factor = '1', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
    start_in_insert = true,
    insert_mappings = true, -- whether or not the open mapping applies in insert mode
    terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
    persist_size = true,
    direction = 'horizontal',
    close_on_exit = true, -- close the terminal window when the process exits
    shell = vim.o.shell, -- change the default shell
    -- This field is only relevant if direction is set to 'float'
    float_opts = {
        -- The border key is *almost* the same as 'nvim_open_win'
        -- see :h nvim_open_win for details on borders however
        -- the 'curved' border is a custom border type
        -- not natively supported but implemented in this plugin.
        border = 'rounded',
        width = math.floor(length * asr),
        height = length,
        winblend = 3,
    }
}

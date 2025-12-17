local WhatadragGroup = vim.api.nvim_create_augroup('whatadrag', { clear = true })

vim.api.nvim_create_autocmd({ 'TextYankPost' }, {
    desc = 'Highlight when yanking (copying) text',
    group = WhatadragGroup,
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- templ {
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
    desc = 'adding templ as a file format',
    group = WhatadragGroup,
    pattern = { '*.templ' },
    callback = vim.lsp.buf.format
})

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
    desc = 'running templ generate on save',
    group = WhatadragGroup,
    pattern = { '*.templ' },
    callback = function()
        vim.cmd(":silent !templ generate")
    end
})

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = '*.templ',
    callback = function()
        vim.cmd("TSBufEnable highlight")
    end,
})
-- }

-- BufEnter {
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    command = "setlocal formatoptions-=cro",
})
-- }

-- minify js {
local utils = require("whatadrag.core.utils")
local MinifyJsGroup = 0;

function StartMinJs()
    local minifyJsGroup = vim.api.nvim_create_augroup('minifyjs', { clear = true })
    MinifyJsGroup = minifyJsGroup
    vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
        desc = 'minify js/ts and save files in the same location on save',
        group = minifyJsGroup,
        pattern = { '*.js', '*.ts' },
        callback = function()
            local curr_file = vim.api.nvim_buf_get_name(0)
            local extension = utils.Get_file_extension(curr_file)
            local file_name = utils.Get_file_name_without_extension(curr_file)
            if string.gmatch(curr_file, ".min.js$") then
                StopMinJs()
                print("not minifying this")
                return
            end
            vim.cmd(":silent !uglifyjs " ..
                curr_file .. " -o " ..
                file_name .. ".min" .. extension ..
                " -c -m --toplevel --module --mangle-props domprops"
            )
        end
    })
end

function StopMinJs()
    if MinifyJsGroup == 0 then
        print("Start Minifying with :lua StartMinJs()")
    end
    vim.api.nvim_del_augroup_by_id(MinifyJsGroup)
end

-- }

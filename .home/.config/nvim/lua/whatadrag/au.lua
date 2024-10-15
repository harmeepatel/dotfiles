vim.api.nvim_create_autocmd({ 'TextYankPost' }, {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- no commenting new line
vim.cmd([[autocmd BufEnter * set formatoptions-=o]])

local WhatadragGroup = vim.api.nvim_create_augroup('whatadrag', { clear = true })

-- templ
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
    end
})

-- minify js
local utils = require("whatadrag.utils")
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

-- attach-lsp
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
    callback = function(event)
        -- Enable completion triggered by <c-x><c-o>
        local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func,
                { buffer = event.buf, desc = 'LSP: ' .. desc }
            )
        end

        vim.bo[event.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
        map('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
        map('gr', vim.lsp.buf.references, '[G]oto [R]efrences')
        map('<leader>gt', vim.lsp.buf.type_definition, '[G]oto [T]ype definition')
        map('<leader>rn', vim.lsp.buf.rename, '[R]e[N]ame variables and function names')
        map('K', vim.lsp.buf.hover, 'hover info')
        -- map('<C-k>', vim.lsp.buf.signature_help, 'signature help') -- NOTE: conflicting with :cprev
        map('<leader>=', function() vim.lsp.buf.format({ async = true }) end, 'format file')
        -- map('<space>wa', vim.lsp.buf.add_workspace_folder, '')
        -- map('<space>wr', vim.lsp.buf.remove_workspace_folder, '')
        -- map('<space>wl', function()
        --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, '')
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, { desc = 'LSP: [C]ode [A]ctions' })
    end,
})

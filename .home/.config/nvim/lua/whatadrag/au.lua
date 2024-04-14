vim.api.nvim_create_autocmd({ 'TextYankPost' }, {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- no commenting new line
vim.cmd([[autocmd BufEnter * set formatoptions-=o]])

local custom_grp = vim.api.nvim_create_augroup('custom', { clear = true })

-- templ
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
    desc = 'adding templ as a file format',
    group = custom_grp,
    pattern = { '*.templ' },
    callback = vim.lsp.buf.format
})

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
    desc = 'running templ generate on save',
    group = custom_grp,
    pattern = { '*.templ' },
    callback = function()
        vim.cmd(":silent !templ generate")
    end
})

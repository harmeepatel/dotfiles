# tips and tricks

### autocmds

This is useful for templ:

```lua
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
    desc = 'adding templ as a file format',
    group = custom_grp,
    pattern = { '*.templ' },
    callback = vim.lsp.buf.format
})
```

```lua
vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
    desc = 'running templ generate on save',
    group = custom_grp,
    pattern = { '*.templ' },
    callback = function()
        vim.cmd(":silent !templ generate")
    end
})
```

# tips and tricks

## Templ

#### To use [templ](https://templ.guide/) templating for Go with neovim, these will be useful.

This one adds templ as a fileformat recognized by the lsp for templ
```lua
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
    desc = 'adding templ as a file format',
    group = custom_grp,
    pattern = { '*.templ' },
    callback = vim.lsp.buf.format
})
```

This is to run `templ generate` after the buffer is written to the file. It helps to not
running that command every time you make a change to *.templ* file. Makes hot realoding easier.
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

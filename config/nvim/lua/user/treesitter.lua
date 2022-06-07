local status_ok, treesitter = pcall(require, 'nvim-treesitter.configs')

if not status_ok then
  vim.notify("treesitter not found!")
  return
end

-- nvim-treesitter
-- vim.keymap.set('n', '<leader>ge', ':NvimTreeToggle<CR>')
-- vim.keymap.set('n', '<leader>r', ':NvimTreeRefresh<CR>')
-- vim.keymap.set('n', '<leader>n', ':NvimTreeFindFile<CR>')



treesitter.setup({
    -- A list of parser names, or "all"
    ensure_installed = { 'cpp', 'python', 'java', 'dockerfile', 'go', 'gomod', 'http', 'javascript', 'typescript', 'tsx', 'css', 'graphql', 'json', 'json5', 'markdown', 'php', 'query', 'svelte', 'todotxt', 'yaml'},

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = true,

    -- List of parsers to ignore installing (for "all")
    ignore_install = {},

    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
        -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
        -- the name of the parser
        -- list of language that will be disabled
        --disable = {},

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true
    },

})

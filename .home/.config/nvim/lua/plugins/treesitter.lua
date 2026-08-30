vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
})

local ensureInstalled = {
    "astro", "bash", "css", "dockerfile", "go", "html",
    "javascript", "json", "json5", "lua", "markdown_inline",
    "markdown", "python", "rust", "scss", "sql", "templ",
    "toml", "tsx", "typescript", "vim", "vimdoc", "zig", "dart",
}

require("nvim-treesitter").setup({})

-- Schedule parser checks to background after startup complete
vim.schedule(function()
    local alreadyInstalled = require("nvim-treesitter.config").get_installed()
    local parsersToInstall = vim.iter(ensureInstalled)
        :filter(function(parser) return not vim.tbl_contains(alreadyInstalled, parser) end)
        :totable()

    if #parsersToInstall > 0 then
        require("nvim-treesitter").install(parsersToInstall)
    end
end)

local function attach_treesitter(buf)
    if not vim.api.nvim_buf_is_valid(buf) then return end
    local ft = vim.bo[buf].filetype
    if ft == "" or ft:match("^Telescope") then return end

    pcall(vim.treesitter.start, buf)
    pcall(function()
        vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end)
end

vim.api.nvim_create_autocmd({ "FileType", "BufWinEnter" }, {
    group = vim.g.group,
    callback = function(args)
        attach_treesitter(args.buf)
    end,
})

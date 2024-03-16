local config = function()
    local ibl = require("ibl")

    ibl.setup({
        exclude = {
            filetypes = {
                "rust",
                "typescript",
                "javascript",
                "lua",
                "go",
                "c",
                "cpp",
            }
        },
        indent = {
            -- '▏'
            -- '▎'
            -- '▍'
            char = { '│' }
        },
    })
end

return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = config,
}

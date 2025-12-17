return {
    "lukas-reineke/indent-blankline.nvim",
    event = { 'BufReadPre', 'BufNewFile' },
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {
        indent = {
            -- '▏'
            -- '▎'
            -- '▍'
            char = { '│' }
        },
        scope = {
            exclude = {
                language = {
                    "rust",
                    "typescript",
                    "javascript",
                    "lua",
                    "go",
                    "c",
                    "cpp",
                    "zig",
                }
            }
        },
    },
}

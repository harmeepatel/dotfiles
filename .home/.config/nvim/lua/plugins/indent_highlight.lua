local opts = {
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
    }
}
return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = opts,
}

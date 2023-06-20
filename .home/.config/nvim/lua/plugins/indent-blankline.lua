local opts = {
    show_current_context = true,
    filetype = {
        "astro",
        "html",
        "xml",
        "json",
        "yaml",
    },
}
return { "lukas-reineke/indent-blankline.nvim", opts = opts }

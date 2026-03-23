vim.pack.add({
    { src = "https://github.com/numToStr/Comment.nvim" },
})

require("comment").setup({
    padding = true,
    sticky = true,
    toggler = {
        line = "<leader>/",
        block = "cb",
    },
    opleader = {
        line = "<leader>/",
        block = "cb",
    },
    extra = {
        above = "cO",
        below = "co",
        eol = "cA",
    },
    mappings = {
        basic = true,
        extra = true,
        extended = false,
    },
})

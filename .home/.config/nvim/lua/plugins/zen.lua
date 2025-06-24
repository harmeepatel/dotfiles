return {
    "folke/zen-mode.nvim",
    opts =
    {
        plugins = {
            options = {
                enabled = true,
                ruler = true,
                showcmd = true,
                laststatus = 1,
            },
        },
    },
    on_open = function()
        require('lualine').hide({
            unhide = true,
        })
    end,
    lazy = true,
}

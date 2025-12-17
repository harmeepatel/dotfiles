return {
    "jiaoshijie/undotree",
    config = true,
    keys = { -- load the plugin only when using it's keybinding:
        { "<F3>", "<cmd>lua require('undotree').toggle()<cr>" },
    },
}

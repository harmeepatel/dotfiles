return {
    "SidOfc/mkdx", -- markdown editing
    ft = { "md", "mdx" },
    event = { "BufReadPre", "BufNewFile" },
    lazy = true,
}

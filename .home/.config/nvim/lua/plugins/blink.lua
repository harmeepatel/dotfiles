local border_style = "rounded"

return {
    "saghen/blink.cmp",
    dependencies = {
        "moyiz/blink-emoji.nvim",
        "L3MON4D3/LuaSnip"
    },

    version = "1.*",

    opts = {
        keymap = { preset = "default" },
        appearance = {
            nerd_font_variant = "mono"
        },
        completion = {
            menu = { border = border_style },
            documentation = {
                window = { border = border_style },
                auto_show = true,
            },
        },
        signature = { window = { border = "single" } },
        sources = {
            default = { "lsp", "path", "snippets", "buffer", "emoji" },
            providers = {
                lsp = {
                    name = "lsp",
                    enabled = true,
                    module = "blink.cmp.sources.lsp",
                    fallbacks = { "snippets", "buffer" },
                    score_offset = 90,
                },
                snippets = {
                    name = "snippets",
                    enabled = true,
                    max_items = 15,
                    min_keyword_length = 2,
                    module = "blink.cmp.sources.snippets",
                    score_offset = 85,
                },
                -- dadbod = {
                --     name = "Dadbod",
                --     module = "vim_dadbod_completion.blink",
                --     min_keyword_length = 2,
                --     score_offset = 85, -- the higher the number, the higher the priority
                -- },
                path = {
                    name = "Path",
                    module = "blink.cmp.sources.path",
                    fallbacks = { "snippets", "buffer" },
                    opts = {
                        trailing_slash = false,
                        label_trailing_slash = true,
                        get_cwd = function(context)
                            return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
                        end,
                        show_hidden_files_by_default = true,
                    },
                    score_offset = 35,
                },
                buffer = {
                    name = "Buffer",
                    enabled = true,
                    max_items = 3,
                    module = "blink.cmp.sources.buffer",
                    min_keyword_length = 2,
                    score_offset = 25,
                },
                emoji = {
                    module = "blink-emoji",
                    name = "Emoji",
                    opts = {
                        insert = true, -- Insert emoji (default) or complete its name
                        ---@type string|table|fun():table
                        trigger = function()
                            return { ":" }
                        end,
                    },
                    -- should_show_items = function()
                    --     return vim.tbl_contains(
                    --     -- Enable emoji completion only for git commits and markdown.
                    --     -- By default, enabled for all file-types.
                    --         { "gitcommit", "markdown" },
                    --         vim.o.filetype
                    --     )
                    -- end,
                    score_offset = 15, -- Tune by preference
                },
            },
        },
        cmdline = {
            enabled = true,
        },
        fuzzy = { implementation = "prefer_rust_with_warning" },
        snippets = {
            preset = "luasnip", -- Choose LuaSnip as the snippet engine
        }
    },
    opts_extend = { "sources.default" },
    lazy = true,
}

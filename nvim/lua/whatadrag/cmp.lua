-- Setup nvim-cmp.
local cmp_status_ok, cmp = pcall(require, "cmp")
local lspk_status_ok, lspkind = pcall(require, "lspkind")

local icons = require "user.icons"
local kind_icons = icons.kind

if not cmp_status_ok or not lspk_status_ok then
    vim.notify("cmp not found!")
    return
end

local ELLIPSIS_CHAR = '…'
local MAX_LABEL_WIDTH = 30
local MIN_LABEL_WIDTH = 20


cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.                                   Have this just enable it when needed
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        -- { name = 'vsnip' }, -- For vsnip users.
        { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }, {
        { name = 'buffer', keyword_length = 5 },
    }),
    formatting = {

        format = lspkind.cmp_format({
            with_text = true,
            mode = 'symbol_text', -- show only symbol annotations
            maxwidth = 64, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            menu = {
                nvim_lsp = "[LSP]",
                nvim_lua = "[Nvim]",
                luasnip = "[LuaSnip]",
                buffer = "[Buffer]",
                path = "[Path]",
                emoji = "[Emoji]",
            },

            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function(entry, vim_item)
                local label = vim_item.abbr
                local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)

                if truncated_label ~= label then
                    vim_item.abbr = truncated_label .. ELLIPSIS_CHAR
                elseif string.len(label) < MIN_LABEL_WIDTH then
                    local padding = string.rep(' ', MIN_LABEL_WIDTH - string.len(label))
                    vim_item.abbr = label .. padding
                end

                if entry.source.name == "cmp_tabnine" then
                    vim_item.kind = icons.misc.Robot
                end

                return vim_item
            end
        })

        -- fields = { "kind", "abbr", "menu" },
        -- format = function(entry, vim_item)
        --     local label = vim_item.abbr
        --     local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)
        --     if truncated_label ~= label then
        --         vim_item.abbr = truncated_label .. ELLIPSIS_CHAR
        --     elseif string.len(label) < MIN_LABEL_WIDTH then
        --         local padding = string.rep(' ', MIN_LABEL_WIDTH - string.len(label))
        --         vim_item.abbr = label .. padding
        --     end
        --
        --     -- Kind icons
        --     vim_item.kind = string.format("%s %s",  kind_icons[vim_item.kind], vim_item.kind)
        --
        --     if entry.source.name == "cmp_tabnine" then
        --         vim_item.kind = icons.misc.Robot
        --     end
        --
        --     vim_item.menu = ({
        --         nvim_lsp = "[LSP]",
        --         nvim_lua = "[Nvim]",
        --         luasnip = "[LuaSnip]",
        --         buffer = "[Buffer]",
        --         path = "[Path]",
        --         emoji = "[Emoji]",
        --
        --         -- nvim_lsp = "",
        --         -- nvim_lua = "",
        --         -- luasnip = "",
        --         -- buffer = "",
        --         -- path = "",
        --         -- emoji = "",
        --     })[entry.source.name]
        --     return vim_item
        -- end,
    },
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = require 'user.lsp.lsp-list'.servers

for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup {
        capabilities = capabilities
    }
end

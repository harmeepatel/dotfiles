local cmp_ok, cmp = pcall(require, 'cmp')
local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')
local lspkind_ok, lspkind = pcall(require, 'lspkind')

if not cmp_ok then
    vim.notify('404: nvim-cmp')
    return
end
if not lspconfig_ok then
    vim.notify('404: lspconfig (from nvim-cmp)')
    return
end
if not lspkind_ok then
    vim.notify('404: lspkind')
    return
end


cmp.setup({
    window = {
        completion = {
            completeopt = 'menu,menuone,noinsert',
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
            col_offset = -3,
            side_padding = 0,
        },
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lua' },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'buffer', keyword_length = 5 },
    }),
    formatting = {
        fields = { "kind", "abbr", "menu" },
        -- format = function(entry, vim_item)
        --     local kind = lspkind.cmp_format({
        --         mode = "symbol_text",
        --         maxwidth = 50,
        --         menu = {
        --             buffer = '[buf]',
        --             nvim_lsp = '[LSP]',
        --             nvim_lua = '[lua]',
        --             path = '[path]',
        --             luasnip = '[snip]',
        --         }
        --     })(entry, vim_item)
        --
        --     local strings = vim.split(kind.kind, "%s", { trimempty = true })
        --     kind.kind = " " .. strings[1] .. " "
        --     kind.menu = "    (" .. strings[2] .. ")"
        --
        --     return kind
        -- end,
        -- format = lspkind.cmp_format({
        --     with_text = true,
        --     mode = 'symbol_text',
        --     menu = {
        --         buffer = '[buf]',
        --         nvim_lsp = '[LSP]',
        --         nvim_lua = '[lua]',
        --         path = '[path]',
        --         luasnip = '[snip]',
        --     }
        -- })
    },
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        local status_ok, luasnips = pcall(require, 'luasinp')
        if not status_ok then
            vim.notify("404: luasnip")
            return
        end
        luasnips.lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
local servers = require('whatadrag.lsp.settings.servers').servers

for _, server in ipairs(servers) do
    lspconfig[server].setup {
        capabilities = capabilities
    }
end

-- vim.cmd[[
--     " gray
--     highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
--     " blue
--     highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
--     highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
--     " light blue
--     highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
--     highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
--     highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
--     " pink
--     highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
--     highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
--     " front
--     highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
--     highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
--     highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
-- ]]

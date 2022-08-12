local status_ok, lspconfig = pcall(require, 'lspconfig')

if not status_ok then
    vim.notify('404: lspconfig (from lsp_config)')
    return
end

local sumneko_binary_path = vim.fn.exepath('lua-language-server')
local sumneko_root_path = vim.fn.fnamemodify(sumneko_binary_path, ':h:h:h')

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lspconfig.sumneko_lua.setup {
    cmd = {sumneko_binary_path, "-E", sumneko_root_path .. "/main.lua"};
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
          path = runtime_path,
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {'vim', 'use'},
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
}

local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")

if not status_ok then
  vim.notify("nivm-lsp-installer not found!")
  return
end

local servers = require 'user.lsps'.servers

lsp_installer.setup({
    ensure_installed = servers, -- ensure these servers are always installed
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

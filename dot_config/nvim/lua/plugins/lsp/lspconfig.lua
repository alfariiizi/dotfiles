-- General LSPconfig

return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      -- ignore the warning
      servers = {
        -- This will be automatically installed with mason and loaded with lspconfig
        pyright = {},
        -- julials = {},
        cssls = {},
      },
    },
  },
}

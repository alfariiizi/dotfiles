return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")

      mason.setup({})

      -- All LSP is must be listed on here
      -- mason-lspconfig is the bridge between mason and lspconfig
      mason_lspconfig.setup({
        ensure_installed = {
          "julials",
          "prismals",
        },
      })
    end,
  },
}

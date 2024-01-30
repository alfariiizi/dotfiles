return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- auto completion for lsp
    { "antosha417/nvim-lsp-file-operations", config = true }, -- auto update import function that has been renamed
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local capabilities = cmp_nvim_lsp.default_capabilities()

    ---- CUSTOMIZING KEYMAP ----
    -- local keymap = vim.keymap
    -- local opts = { noremap = true, silent = true }

    local on_attach = function(client, bufnr)
      -- opts.buffer = bufnr
      ---- Set keybinds ----
      -- opts.desc = "Show LSP references"
      -- keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
      -- opts.desc = "Go to declaration"
      -- keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    end

    --- Configure LSP ---
    lspconfig["julials"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    lspconfig["prismals"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
  end,
}

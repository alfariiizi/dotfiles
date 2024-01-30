return {
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "julia" })
      end
    end,
  },

  -- Mason (ensure_installed for non LSP)
  -- {
  --   "williamboman/mason.nvim",
  --   opts = function(_, opts)
  --     opts.ensure_installed = opts.ensure_installed or {}
  --     vim.list_extend(opts.ensure_installed, { "julials" })
  --   end,
  -- },

  -- Mason LSP (ensure_installed for LSP)
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "julials" })
    end,
  },
  -- {
  --   "kdheepak/JuliaFormatter.vim",
  -- },

  -- {
  --   "nvimtools/none-ls.nvim",
  --   dependencies = { "kdheepak/JuliaFormatter.vim" },
  --   opts = function(_, opts)
  --     local formatter = require("juliaformatter").null_ls()
  --     -- print(vim.inspect(opts)) -- <-- How I can see the output of this?
  --     table.insert(opts.sources, formatter)
  --   end,
  -- },

  -- Lspconfig
  {
    "neovim/nvim-lspconfig",
    -- dependencies = { "kdheepak/JuliaFormatter.vim" },
    opts = {
      servers = {
        julials = {
          julia_env_path = "~/.julia/environments/v1.9",
        },
        -- efm = {},
        -- efm = {
        --   init_options = { documentFormatting = true },
        --   filetypes = { "julia" },
        --   settings = {
        --     rootMarkers = { ".git/" },
        --     languages = {
        --       -- julia = { require("juliaformatter").efm_config },
        --       julia = {
        --         formatCommand = "julia --sysimage=/home/alfarizi/.local/share/nvim/lazy/JuliaFormatter.vim/scripts/juliaformatter.so --project=/home/alfarizi/.local/share/nvim/lazy/JuliaFormatter.vim/ --startup-file=no --color=no -e 'using JuliaFormatter; print(format_text(String(read(stdin))))'",
        --         formatStdin = true,
        --       },
        --     },
        --   },
        -- },
      },
    },
    -- config = function()
    --   local efm = require('lspconfig.server_configurations.efm')
    -- end
  },
}

-- formatCommand = "julia --sysimage=/home/alfarizi/.local/share/nvim/lazy/JuliaFormatter.vim/scripts/juliaformatter.so --project=/home/alfarizi/.local/share/nvim/lazy/JuliaFormatter.vim/ --startup-file=no --color=no -e 'using JuliaFormatter; print(format_text(String(read(stdin))))'",
-- formatStdin = true

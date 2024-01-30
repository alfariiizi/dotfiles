-- formatter source: https://github.com/fsouza/prettierd

return {
  -- mason
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "prettierd") -- put your formatter here
    end,
  },

  -- none-ls
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = opts.sources or {}
      table.insert(opts.sources, nls.builtins.formatting.prettierd) -- put your formatter here
    end,
  },
}

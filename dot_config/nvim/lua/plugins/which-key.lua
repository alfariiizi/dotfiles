-- got this solution from: https://github.com/LazyVim/LazyVim/discussions/1427

return {
  "folke/which-key.nvim",
  opts = function(_, opts)
    opts.defaults["<leader>w"] = nil
    opts.defaults["<leader>W"] = { name = "+windows" }
    opts.defaults["<leader>l"] = { name = "+lazy" }
    return opts
  end,
}

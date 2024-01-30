return {
  "dccsillag/magma-nvim",
  keys = {
    -- Normal Mode
    { "<localleader>mi", "<cmd>MagmaInit<cr>", desc = "Init Magma" },
    { "<localleader>me", "<cmd>MagmaEvaluateOperator<cr>", desc = "Evaluate", expr = true, silent = true },
    { "<localleader>ml", "<cmd>MagmaEvaluateLine<cr>", desc = "Evaluate Line" },
    { "<localleader>mr", "<cmd>MagmaReevaluateCell<cr>", desc = "Re-evaluate" },
    { "<localleader>md", "<cmd>MagmaDelete<cr>", desc = "Delete Magma" },

    -- Visual Mode
    { "<localleader>me", "<cmd>MagmaEvaluateVisual<cr>", mode = "v", desc = "Evaluate" },
  },
  config = function()
    vim.g.magma_automatically_open_output = true
    vim.g.magma_image_provider = "ueberzug"
  end,
}

return {
  -- Git flog: A fast, beautiful, and powerful git branch viewer for vim.
  -- Ref: https://github.com/rbong/vim-flog
  {
    "rbong/vim-flog",
    dependencies = {
      "tpope/vim-fugitive",
    },
    lazy = true,
    cmd = { "Flog", "Flogsplit", "Floggit" },
    keys = {
      { "<leader>gv", "<cmd>Flog<cr>", desc = "Git view log" },
    },
  },
}

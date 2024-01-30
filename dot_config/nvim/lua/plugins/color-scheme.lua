return {
  -- Github
  { "projekt0n/github-nvim-theme", name = "github" },

  -- Kanagawa
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    config = function()
      -- Sidebar, ref: <space>sf -> neo-tree-highlights
      -- k
      vim.cmd([[highlight NeoTreeNormal guibg=#18181c]]) -- Sidebar color on cursor focus
      vim.cmd([[highlight NeoTreeNormalNC guibg=#18181c]]) -- Sidebar color on cursor not focus
    end,
  },

  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- Nyoom
  { "nyoom-engineering/nyoom.nvim", name = "Nyoom Theme" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
}

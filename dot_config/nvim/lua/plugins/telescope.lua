-- got this solution from:
-- - https://github.com/LazyVim/LazyVim/discussions/809
-- - https://www.lazyvim.org/plugins/editor#telescopenvim-optional
-- - https://www.reddit.com/r/neovim/comments/wbbmqu/can_i_show_dot_files_results_using_telescope_find/ ==> https://github.com/skbolton/titan/blob/fc4088ede017589104d3301a6c70b51762783887/nvim/nvim/lua/fuzzy.lua#L13

return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      mappings = {
        i = {
          -- navigate between selection
          ["<A-j>"] = "move_selection_next",
          ["<A-k>"] = "move_selection_previous",
        },
      },
      -- file_ignore_patterns = {
      -- "node_modules",
      -- "build",
      -- "dist",
      -- "yarn.lock",
      -- },
    },
    pickers = {
      find_files = {
        find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
        hidden = true,
      },
    },
  },
  -- keys = {
  -- {
  --   "<leader>ff",
  --   function()
  --     require("telescope.builtin").find_files({ hidden = true })
  --   end,
  --   desc = "Find Files (root dir)",
  -- },
  -- {
  --   "<leader><space>",
  --   function()
  --     require("telescope.builtin").find_files({ hidden = true, only_cwd = true })
  --   end,
  --   desc = "Find Files (cwd)",
  -- },
  -- },
}

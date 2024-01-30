-- Configurations when using vscode-neovim.
-- I got this from https://github.com/cgjosephlee/dotfiles/blob/master/.config/nvim/lua/plugins/vscode.lua
-- Modified from https://github.com/LazyVim/LazyVim/raw/main/lua/lazyvim/plugins/extras/vscode.lua

if not vim.g.vscode then
  return {}
end

local enabled = {
  "flit.nvim",
  "lazy.nvim",
  "leap.nvim",
  -- "mini.ai",
  -- "mini.animate",
  -- "mini.comment",
  -- "mini.pairs",
  -- "mini.surround",
  "nvim-treesitter",
  "nvim-treesitter-textobjects",
  "nvim-ts-context-commentstring",
  "vim-repeat",
  "LazyVim",
}

local Config = require("lazy.core.config")
Config.options.checker.enabled = false
Config.options.change_detection.enabled = false
Config.options.defaults.cond = function(plugin)
  return vim.tbl_contains(enabled, plugin.name) or plugin.vscode
end

local vscode = require("vscode-neovim")
-- Add some vscode specific keymaps
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimKeymaps",
  callback = function()
    -- vim.api.nvim_set_keymap(
    --   "n",
    --   "<Space>",
    --   '<Cmd>call VSCodeNotify("whichkey.show")<CR>',
    --   { silent = true, noremap = true }
    -- )
    vim.keymap.set("n", "<space>", function()
      vscode.call("whichkey.show")
    end, { silent = true, noremap = true })
    vim.keymap.set("n", "<leader>w", function()
      vscode.call("workbench.action.files.save")
    end)
    vim.keymap.set("n", "<leader>q", function()
      vscode.call("workbench.action.closeActiveEditor")
    end)
    vim.keymap.del({ "n", "i", "v" }, "<C-/>") -- use vscode comment
    vim.keymap.set("n", "<leader><space>", "<cmd>Find<cr>")

    -- from
    vim.keymap.set("n", "H", function()
      require("vscode-neovim").call("workbench.action.previousEditor")
    end)
    vim.keymap.set("n", "L", function()
      require("vscode-neovim").call("workbench.action.nextEditor")
    end)
    vim.keymap.set({ "n", "x" }, "<leader>ca", function()
      require("vscode-neovim").call("editor.action.quickFix")
    end)
    vim.keymap.set({ "n", "x" }, "<leader>cr", function()
      require("vscode-neovim").call("editor.action.rename")
    end)
    vim.keymap.set("n", "<leader>cf", function()
      require("vscode-neovim").call("editor.action.formatDocument")
    end)
    vim.keymap.set("n", "<leader>co", function()
      require("vscode-neovim").call("editor.action.organizeImports")
    end)
  end,
})

return {
  {
    "LazyVim/LazyVim",
    config = function(_, opts)
      opts = opts or {}
      -- disable the colorscheme
      opts.colorscheme = function() end
      require("lazyvim").setup(opts)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = { enable = false },
      rainbow = { enable = false },
    },
  },
}

-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.winbar = "%=%m %f"
opt.autochdir = true

-- for see the vim only for cwd
-- from: https://github.com/LazyVim/LazyVim/discussions/2150#discussioncomment-7787591
vim.g.root_spec = { ".git", "cwd" }

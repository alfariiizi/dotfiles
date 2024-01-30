-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

if vim.g.vscode then
  return {}
end

local del = vim.keymap.del
local map = vim.keymap.set
local Util = require("lazyvim.util")

-- Deleting keymap for move-up and move-down
-- Because this keymap is used by cmp.nvim
del("n", "<A-j>")
del("n", "<A-k>")
del("i", "<A-j>")
del("i", "<A-k>")
del("v", "<A-j>")
del("v", "<A-k>")

-- Windows
del("n", "<leader>ww")
del("n", "<leader>wd")
del("n", "<leader>w-")
del("n", "<leader>w|")
map("n", "<leader>Ww", "<C-W>p", { desc = "Other window", remap = true })
map("n", "<leader>Wd", "<C-W>c", { desc = "Delete window", remap = true })
map("n", "<leader>W-", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>W|", "<C-W>v", { desc = "Split window right", remap = true })

-- Quit
map("n", "<leader>qa", "<cmd>qa<cr>", { desc = "Quit all" })
map("n", "<leader>qq", "<cmd>q<cr>", { desc = "Quit Current" })

-- Lazy
del("n", "<leader>l") -- for lazy
del("n", "<leader>L") -- for lazy changelog
map("n", "<leader>ll", "<cmd>Lazy<cr>", { desc = "Lazy" })
map("n", "<leader>le", "<cmd>LazyExtras<cr>", { desc = "Lazy Extras" })
map("n", "<leader>lc", function()
  Util.news.changelog()
end, { desc = "LazyVim Changelog" })

-- Navigate in the layout
del("n", "<C-h>")
del("n", "<C-j>")
del("n", "<C-k>")
del("n", "<C-l>")
map("n", "<C-H>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-J>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-K>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-L>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Misc
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save current file", noremap = true, silent = true })

-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- This code creates an auto-command that triggers on the VimEnter event, which occurs after entering Neovim. It gets the path of the current file (%:p:h), checks if it's not empty, and then sets the current directory to this path using nvim_set_current_dir
-- Ref: ChatGPT4 (Grimoire Model)
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    local current_path = vim.fn.expand("%:p:h")
    if current_path ~= "" then
      vim.api.nvim_set_current_dir(current_path)
    end
  end,
})

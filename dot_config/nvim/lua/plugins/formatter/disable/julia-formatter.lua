-- formatter source: https://github.com/kdheepak/JuliaFormatter.vim

return {
  -- mason
  -- {
  --   "williamboman/mason.nvim",
  --   opts = function(_, opts)
  --     table.insert(opts.ensure_installed, "prettier")
  --   end,
  -- },

  {
    "kdheepak/JuliaFormatter.vim",
    -- config = function()
    --   local formatter = require("juliaformatter")
    --   formatter.null_ls()
    -- end,
  },

  -- none-ls
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "kdheepak/JuliaFormatter.vim" },
    opts = function(_, opts)
      -- local formatter = require("juliaformatter").null_ls()
      local nls = require("null-ls")
      table.insert(opts.sources, {
        name = "juliaformatter",
        method = "NULL_LS_FORMATTING",
        filetypes = { "julia" }, -- specify the filetypes
        generator = nls.generator({
          args = {
            "--project=/home/alfarizi/.local/share/nvim/lazy/JuliaFormatter.vim/",
            "--startup-file=no",
            "--color=no",
            "-e",
            "'using JuliaFormatter; format(\"$FILENAME\")'",
          },
          command = "julia",
          to_stdin = false,
        }),
        -- generator = nls.generator({
        --   command = "myformatter", -- replace with the actual command
        --   args = { "--some-flag" }, -- replace with actual arguments
        --   to_stdin = true,
        -- }),
      })
    end,
  },
}

--   _opts = {
--     args = { "--project=/home/alfarizi/.local/share/nvim/lazy/JuliaFormatter.vim/", "--startup-file=no", "--color=no", "-e", "'using JuliaFormatter; format(\"$FILENAME\")'" },
--     command = "julia",
--     to_stdin = false
--   },
--   filetypes = { "julia" },
--   meta = {},
--   method = "NULL_LS_FORMATTING",
--   name = "julia",
--   with = <function 1>,
--   <metatable> = {
--     __index = <function 2>
--   }
-- }

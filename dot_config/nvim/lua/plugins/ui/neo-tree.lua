return {
  "nvim-neo-tree/neo-tree.nvim",
  config = function(_)
    local command = require("neo-tree.command")
    command.execute({
      position = "right",
    })
    -- local components = require('neo-tree.sources.filesystem.components')
    -- components.current_filter(config, node, state)
  end,
}

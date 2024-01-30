-- Got this from: https://github.com/rcarriga/nvim-notify/issues/233
-- To get good animation, reads: https://github.com/rcarriga/nvim-notify/issues/124

return {
  "rcarriga/nvim-notify",
  opts = {
    -- relative = "editor",
    timeout = 3000,
    render = "compact",
    stages = "fade",
    top_down = false,
  },
}

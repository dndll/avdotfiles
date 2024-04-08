return {
  "rcarriga/nvim-notify",
  opts = function(_, opts)
    opts.max_height = function() return math.floor(vim.o.lines * 0.50) end
    opts.max_width = function() return math.floor(vim.o.columns * 0.20) end
    opts.level = "warn"
    opts.top_down = false
    opts.render = "wrapped-compact"
  end,
  config = function(...) require "astronvim.plugins.configs.notify"(...) end,
}

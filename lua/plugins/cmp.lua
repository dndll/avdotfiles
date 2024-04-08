return { -- override nvim-cmp plugin
  "hrsh7th/nvim-cmp",
  dependencies = {
    "tzachar/cmp-ai",
    "hrsh7th/cmp-emoji", -- add cmp source as dependency of cmp
  },
  -- override the options table that is used in the `require("cmp").setup()` call
  opts = function(_, opts)
    -- opts parameter is the default options table
    -- the function is lazy loaded so cmp is able to be required
    local cmp = require("cmp")
    opts.sources = cmp.config.sources({
      { name = "nvim_lsp", priority = 1000 },
      { name = "cmp_ai", priority = 9000 },
      { name = "luasnip", priority = 750 },
      { name = "buffer", priority = 500 },
      { name = "path", priority = 250 },
    })
    opts.mapping = {
      ['<C-x>'] = cmp.mapping(
        cmp.mapping.complete({
          config = {
            sources = cmp.config.sources({
              { name = 'cmp_ai' },
            }),
          },
        }),
        { 'i' }
      ),
    }
    -- modify the mapping part of the table
    --opts.mapping["<C-x>"] = cmp.mapping.select_next_item()
  end,
}

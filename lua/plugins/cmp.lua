return { -- override nvim-cmp plugin
  "hrsh7th/nvim-cmp",
  dependencies = {
    "tzachar/cmp-ai",
    "lukas-reineke/cmp-rg",
    "lukas-reineke/cmp-under-comparator",
    "onsails/lspkind.nvim",
  },
  -- override the options table that is used in the `require("cmp").setup()` call
  opts = function(_, opts)
    -- opts parameter is the default options table
    -- the function is lazy loaded so cmp is able to be required
    local cmp = require("cmp")
    opts.sources = cmp.config.sources({
      { name = "nvim_lsp", priority = 1000, keyword_length = 3 },
      { name = "cmp-dap", priority = 1000 },
      { name = "luasnip", priority = 750, keyword_length = 2 },
      { name = "cmdline", priority = 550 },
      {
        name = "buffer",
        priority = 500,
        keyword_length = 5,
        option = {
          get_bufnrs = function()
            return vim.api.nvim_list_bufs()
          end,
        },
      },
      { name = "rg", priority = 500 },
      { name = "path", priority = 250 },
      { name = "cmp_ai", 100 },
    })
    opts.performance = {
      debounce = 200,
    }
    opts.mapping['<C-x>'] = cmp.mapping(
      cmp.mapping.complete({
        config = {
          sources = cmp.config.sources({
            { name = 'cmp_ai' },
          }),
        },
      }),
      { 'i' }
    )
    local luasnip = require "luasnip"
  	local has_words_before = function()
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end
    opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" })
    opts.mapping["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" })

    local lspkind = require("lspkind")
    opts.formatting = {
      format = function(entry, vim_item)
        -- if you have lspkind installed, you can use it like
        -- in the following line:
        vim_item.kind = lspkind.symbolic(vim_item.kind, { mode = 'symbol' })
        vim_item.menu = opts.mapping[entry.source.name]
        if entry.source.name == 'cmp_ai' then
          local detail = (entry.completion_item.labelDetails or {}).detail
          vim_item.kind = ''
          if detail and detail:find('.*%%.*') then
            vim_item.kind = vim_item.kind .. ' ' .. detail
          end

          if (entry.completion_item.data or {}).multiline then
            vim_item.kind = vim_item.kind .. ' ' .. '[ML]'
          end
        end
        local maxwidth = 80
        vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
        return vim_item
      end,
    }

    local compare = require('cmp.config.compare')
    opts.sorting = {
      priority_weight = 2,
      comparators = {
        require('cmp_ai.compare'),
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.score,
        cmp.config.compare.recently_used,
        require "cmp-under-comparator".under,
        cmp.config.compare.kind,
        cmp.config.compare.sort_text,
        cmp.config.compare.length,
        cmp.config.compare.order,
      },
    }
    -- opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
    --     if cmp.visible() then
    --       cmp.select_next_item()
    --     elseif vim.snippet and vim.snippet.jumpable(1) then
    --       vim.schedule(function() vim.snippet.jump(1) end)
    --     elseif has_words_before() then
    --       cmp.complete()
    --     else
    --       fallback()
    --     end
    --   end, { "i", "s" }),
--
    -- modify the mapping part of the table
    --opts.mapping["<C-x>"] = cmp.mapping.select_next_item()
  end,
}

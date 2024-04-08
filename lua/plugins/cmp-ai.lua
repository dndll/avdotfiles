---@type LazySpec
return {
  "tzachar/cmp-ai",
  event = "BufEnter",
  ---@type AstroUIOpts
  config = function()
    local cmp_ai = require('cmp_ai.config')

    cmp_ai:setup({
      max_lines = 1000,
      provider = 'OpenAI', -- or bard or olama
      provider_options = {
        model = 'gpt-4-turbo'
      },
      notify = true,
      notify_callback = function(msg)
        require('notify').notify(msg, vim.log.levels.INFO, {
          title = 'OpenAI',
          render = 'compact',
        })
      end,
      run_on_every_keystroke = true,
      ignored_file_types = {
        -- default is not to ignore
        -- uncomment to ignore in lua:
        -- lua = true
      },
    })
  end
    -- config = function()
    --   vim.keymap.set("i", "<C-g>", function() return vim.api.nvim_call_function("codeium#Accept", {}) end, { expr = true })
    -- end
    -- vim.keymap.set("i", "<c-;>", function() return vim.fn["codeium#CycleCompletions"](1) end, { expr = true })
    -- vim.keymap.set("i", "<c-,>", function() return vim.fn["codeium#CycleCompletions"](-1) end, { expr = true })
    -- vim.keymap.set("i", "<c-x>", function() return vim.fn["codeium#Clear"]() end, { expr = true })
    -- vim.keymap.set("n", "<leader>;", function()
    --   if vim.g.codeium_enabled == true then
    --     vim.cmd "CodeiumDisable"
    --   else
    --     vim.cmd "CodeiumEnable"
    --   end
    -- end, { noremap = true, desc = "Toggle Codeium active" })
}


  -- max_lines = 100,
  -- provider = 'Ollama',
  -- provider_options = {
  --   model = 'codellama:7b-code',
  -- },
